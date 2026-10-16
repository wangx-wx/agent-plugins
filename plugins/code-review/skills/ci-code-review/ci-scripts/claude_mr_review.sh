#!/usr/bin/env bash
set -euo pipefail

log() {
  printf '[claude-review] %s\n' "$*"
}

require_command() {
  command -v "$1" >/dev/null 2>&1 || {
    log "Missing required command: $1"
    exit 1
  }
}

api_get() {
  curl --fail --silent --show-error \
    --header "PRIVATE-TOKEN: $GITLAB_TOKEN" \
    "$GITLAB_API_URL$1"
}

post_note() {
  local note_file="$1"

  curl --fail --silent --show-error \
    --request POST \
    --header "PRIVATE-TOKEN: $GITLAB_TOKEN" \
    --data-urlencode "body@$note_file" \
    "$GITLAB_API_URL/projects/$PROJECT_ID/merge_requests/$MR_IID/notes" >/dev/null
}

clone_source_branch() {
  local repo_dir="$1"
  local repo_url="$2"
  local source_branch="$3"
  local target_branch="$4"

  cat > "$workdir/git-askpass.sh" <<'EOF'
#!/usr/bin/env sh
case "$1" in
  *Username*) printf '%s\n' 'oauth2' ;;
  *Password*) printf '%s\n' "$GITLAB_TOKEN" ;;
  *) printf '%s\n' "$GITLAB_TOKEN" ;;
esac
EOF
  chmod 700 "$workdir/git-askpass.sh"

  log "Cloning source branch: $source_branch"
  GIT_ASKPASS="$workdir/git-askpass.sh" \
    GIT_TERMINAL_PROMPT=0 \
    git clone --depth 1 --branch "$source_branch" "$repo_url" "$repo_dir"

  GIT_ASKPASS="$workdir/git-askpass.sh" \
    GIT_TERMINAL_PROMPT=0 \
    git -C "$repo_dir" fetch --depth 1 origin "$target_branch:refs/remotes/origin/$target_branch" >/dev/null 2>&1 || {
      log "Target branch $target_branch fetch skipped"
    }
}

require_command curl
require_command git
require_command jq
require_command claude
require_command timeout

[[ -n "${GITLAB_API_URL:-}" ]] || {
  log "GITLAB_API_URL is empty"
  exit 1
}

[[ "${OBJECT_KIND:-merge_request}" == "merge_request" ]] || {
  log "Skip event kind: ${OBJECT_KIND:-unknown}"
  exit 0
}

case "${MR_ACTION:-update}" in
  open|reopen|update|merge|MERGE)
    ;;
  *)
    log "Skip MR action: ${MR_ACTION:-unknown}"
    exit 0
    ;;
esac

[[ -n "${PROJECT_ID:-}" ]] || {
  log "PROJECT_ID is empty"
  exit 1
}

[[ -n "${MR_IID:-}" ]] || {
  log "MR_IID is empty"
  exit 1
}

jq -e --arg id "$PROJECT_ID" '.[$id].enabled == true' review-projects.json >/dev/null || {
  log "Project $PROJECT_ID is not enabled"
  exit 0
}

release_branch="${RELEASE_BRANCH:-release}"

[[ "${TARGET_BRANCH:-}" == "$release_branch" ]] || {
  log "Skip target branch: ${TARGET_BRANCH:-unknown}, expected: $release_branch"
  exit 0
}

workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT

log "Review project=$PROJECT_ID mr=$MR_IID action=${MR_ACTION:-unknown}"

api_get "/projects/$PROJECT_ID" > "$workdir/project.json"
api_get "/projects/$PROJECT_ID/merge_requests/$MR_IID" > "$workdir/mr.json"

current_sha="$(jq -r '.sha // .diff_refs.head_sha // empty' "$workdir/mr.json")"
event_sha="${COMMIT_SHA:-$current_sha}"
project_path="$(jq -r '.path_with_namespace // empty' "$workdir/project.json")"
repo_url="$(jq -r '.http_url_to_repo // empty' "$workdir/project.json")"
source_branch="$(jq -r '.source_branch // empty' "$workdir/mr.json")"
target_branch="$(jq -r '.target_branch // empty' "$workdir/mr.json")"

[[ "$target_branch" == "$release_branch" ]] || {
  log "Skip current MR target branch: ${target_branch:-unknown}, expected: $release_branch"
  exit 0
}

[[ -n "$event_sha" ]] || {
  log "Cannot determine MR commit sha"
  exit 1
}

[[ -n "$project_path" ]] || {
  log "Cannot determine project path"
  exit 1
}

[[ -n "$repo_url" ]] || {
  log "Cannot determine repository clone URL"
  exit 1
}

[[ -n "$source_branch" ]] || {
  log "source_branch is empty"
  exit 1
}

[[ "$current_sha" == "$event_sha" ]] || {
  log "Skip outdated event: event=$event_sha current=$current_sha"
  exit 0
}

marker="<!-- claude-review project=$PROJECT_ID mr=$MR_IID sha=$event_sha -->"

api_get "/projects/$PROJECT_ID/merge_requests/$MR_IID/notes?per_page=100" > "$workdir/notes.json"

jq -e --arg marker "$marker" 'any(.[]; (.body // "") | contains($marker))' "$workdir/notes.json" >/dev/null && {
  log "Already reviewed commit $event_sha"
  exit 0
}

prompt_file="$(jq -r --arg id "$PROJECT_ID" '.[$id].prompt // "prompts/default.md"' review-projects.json)"

[[ -f "$prompt_file" ]] || {
  log "Prompt file not found: $prompt_file"
  exit 1
}

repo_dir="$workdir/repo"
clone_source_branch "$repo_dir" "$repo_url" "$source_branch" "$target_branch"

{
  cat "$prompt_file"
  printf '\n\n'
  printf 'MR 信息：\n'
  printf -- '- Project ID: %s\n' "$PROJECT_ID"
  printf -- '- Project Path: %s\n' "$project_path"
  printf -- '- MR IID: %s\n' "$MR_IID"
  printf -- '- MR URL: %s\n' "${MR_URL:-unknown}"
  printf -- '- Source Branch: %s\n' "$source_branch"
  printf -- '- Target Branch: %s\n' "$target_branch"
  printf -- '- Commit: %s\n' "$event_sha"
  printf -- '- Repository Workdir: %s\n' "$repo_dir"
  printf '\n源码已经拉取到当前工作目录，当前 checkout 为 MR 源分支；release 分支已 fetch 为 origin/%s。\n' "$target_branch"
  printf '请直接读取当前分支代码进行分析，可用只读 git 命令对比 origin/%s，不要依赖 GitLab diff 文本。\n' "$target_branch"
} > "$workdir/prompt.md"

log "Calling Claude Code"
claude_timeout_seconds="${CLAUDE_TIMEOUT_SECONDS:-1200}"
set +e
(
  cd "$repo_dir"
  timeout "$claude_timeout_seconds" claude --bare --permission-mode bypassPermissions --add-dir "$repo_dir" -p < "$workdir/prompt.md" \
    > >(tee "$workdir/report.md") \
    2> >(tee "$workdir/claude.err" >&2)
)
status="$?"
set -e
if [[ "$status" -ne 0 ]]; then
  log "Claude Code failed with exit code $status"
  if [[ -s "$workdir/claude.err" ]]; then
    sed -n '1,120p' "$workdir/claude.err" >&2
  fi
  exit "$status"
fi

[[ -s "$workdir/report.md" ]] || {
  log "Claude returned empty report"
  exit 1
}

api_get "/projects/$PROJECT_ID/merge_requests/$MR_IID" > "$workdir/mr_after.json"
latest_sha="$(jq -r '.sha // .diff_refs.head_sha // empty' "$workdir/mr_after.json")"

[[ "$latest_sha" == "$event_sha" ]] || {
  log "MR updated during review, skip posting old report: event=$event_sha latest=$latest_sha"
  exit 0
}

{
  echo "$marker"
  echo
  echo "## Claude Code Review"
  echo
  echo "- Commit: \`$event_sha\`"
  echo "- Jenkins: ${BUILD_URL:-unknown}"
  echo
  cat "$workdir/report.md"
} > "$workdir/note.md"

post_note "$workdir/note.md"
log "Review posted to MR !$MR_IID"
