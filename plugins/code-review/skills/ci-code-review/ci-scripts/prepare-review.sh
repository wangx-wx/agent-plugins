#!/usr/bin/env bash
# stage 1+2（本地版）：映射事件、校验、clone 源码分支、生成 context.env。
set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
load_local_env

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
    git clone --branch "$source_branch" "$repo_url" "$repo_dir"

  log "Fetching target branch: $target_branch"
  GIT_ASKPASS="$workdir/git-askpass.sh" \
    GIT_TERMINAL_PROMPT=0 \
    git -C "$repo_dir" fetch origin "$target_branch:refs/remotes/origin/$target_branch"
}

project_allowed() {
  local project_id="$1"
  local whitelist=",${REVIEW_PROJECT_WHITELIST// /},"
  [[ "$whitelist" == *",$project_id,"* ]]
}

skip_review() {
  local reason="$1"
  mkdir -p "$workdir/meta"
  printf '%s\n' "$reason" > "$workdir/meta/skip-reason.txt"
  touch "$workdir/skip"
  log "$reason"
}

[[ -n "${GITLAB_API_URL:-}" ]] || { log "GITLAB_API_URL is empty"; exit 1; }
[[ -n "${GITLAB_TOKEN:-}" ]] || { log "GITLAB_TOKEN is empty"; exit 1; }
[[ -n "${PROJECT_ID:-}" ]] || { log "PROJECT_ID is empty"; exit 1; }
[[ -n "${MR_IID:-}" ]] || { log "MR_IID is empty"; exit 1; }

workdir="${LOCAL_RUN_DIR:-$PROJECT_DIR/.run}"
LOCAL_BUILD_TAG="${LOCAL_BUILD_TAG:-local-$(date +%Y%m%d-%H%M%S)}"
safe_build_tag="${LOCAL_BUILD_TAG//[^A-Za-z0-9_.-]/_}"
runtime_dir="$workdir/runtime/$safe_build_tag"
runtime_repo_dir="$runtime_dir/repo"

[[ -n "$safe_build_tag" ]] || { log "LOCAL_BUILD_TAG is empty"; exit 1; }

rm -rf "$workdir/meta" "$workdir/logs" "$workdir/output" "$runtime_dir"
mkdir -p "$workdir/meta" "$workdir/logs" "$workdir/output"
mkdir -p "$runtime_dir"

[[ "${TARGET_BRANCH:-}" == "${RELEASE_BRANCH:-release}" ]] || {
  skip_review "Skip target branch: ${TARGET_BRANCH:-unknown}, expected: ${RELEASE_BRANCH:-release}"
  exit 0
}

if [[ -z "${REVIEW_PROJECT_WHITELIST:-}" ]]; then
  log "REVIEW_PROJECT_WHITELIST is empty"
  exit 1
fi

project_allowed "$PROJECT_ID" || {
  skip_review "Project $PROJECT_ID is not in REVIEW_PROJECT_WHITELIST"
  exit 0
}

log "Review project=$PROJECT_ID mr=$MR_IID"

api_get "/projects/$PROJECT_ID" > "$workdir/meta/project.json"
api_get "/projects/$PROJECT_ID/merge_requests/$MR_IID" > "$workdir/meta/mr.json"

project_path="$(jq -r '.path_with_namespace // empty' "$workdir/meta/project.json")"
repo_url="$(jq -r '.http_url_to_repo // empty' "$workdir/meta/project.json")"
repo_url="${repo_url:-${REPO_HTTP_URL:-}}"
current_sha="$(jq -r '.sha // .diff_refs.head_sha // empty' "$workdir/meta/mr.json")"
event_sha="${COMMIT_SHA:-$current_sha}"
source_branch="$(jq -r '.source_branch // empty' "$workdir/meta/mr.json")"
# 本地测试：允许用 SOURCE_BRANCH 显式覆盖
source_branch="${SOURCE_BRANCH:-$source_branch}"
target_branch="$(jq -r '.target_branch // empty' "$workdir/meta/mr.json")"
target_branch="${TARGET_BRANCH:-$target_branch}"
review_base_branch="${REVIEW_BASE_BRANCH:-release}"

[[ -n "$project_path" ]] || { log "Cannot determine project path"; exit 1; }
[[ -n "$repo_url" ]] || { log "Cannot determine repository clone URL"; exit 1; }
[[ -n "$event_sha" ]] || { log "Cannot determine MR commit sha"; exit 1; }
[[ -n "$source_branch" ]] || { log "source_branch is empty"; exit 1; }

[[ "$target_branch" == "${RELEASE_BRANCH:-release}" ]] || {
  skip_review "Skip current MR target branch: ${target_branch:-unknown}, expected: ${RELEASE_BRANCH:-release}"
  exit 0
}

[[ "$current_sha" == "$event_sha" ]] || {
  skip_review "Skip outdated event: event=$event_sha current=$current_sha"
  exit 0
}

marker="<!-- claude-review project=$PROJECT_ID mr=$MR_IID sha=$event_sha -->"

api_get "/projects/$PROJECT_ID/merge_requests/$MR_IID/notes?per_page=100" > "$workdir/meta/notes.json"

jq -e --arg marker "$marker" 'any(.[]; (.body // "") | contains($marker))' "$workdir/meta/notes.json" >/dev/null && {
  skip_review "Already reviewed commit $event_sha"
  exit 0
}

repo_dir="$runtime_repo_dir"
clone_source_branch "$repo_dir" "$repo_url" "$source_branch" "$review_base_branch"

{
  printf 'project_path=%q\n' "$project_path"
  printf 'event_sha=%q\n' "$event_sha"
  printf 'source_branch=%q\n' "$source_branch"
  printf 'target_branch=%q\n' "$target_branch"
  printf 'repo_url=%q\n' "$repo_url"
  printf 'review_base_branch=%q\n' "$review_base_branch"
  printf 'marker=%q\n' "$marker"
  printf 'runtime_dir=%q\n' "$runtime_dir"
  printf 'repo_dir=%q\n' "$repo_dir"
} > "$workdir/meta/context.env"
log "Review context prepared at $workdir"
log "Claude runtime prepared at $runtime_dir"
