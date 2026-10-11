#!/usr/bin/env bash
# stage 4（本地版）：抽取 MyBatis 变更 SQL。
set -u -o pipefail

REVIEW_LOG_PREFIX='sql-check'
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
load_local_env

workdir="${LOCAL_RUN_DIR:-$PROJECT_DIR/.run}"
source "$workdir/meta/context.env"

sql_dir="$repo_dir/.code-review/sql"
result_file="$sql_dir/sql-extraction-result.json"
error_log="$sql_dir/error.log"

mkdir -p "$sql_dir"
rm -f "$result_file" "$error_log" "$sql_dir/sql-check-response.json"

if [[ -z "${SQL_EXTRACTION_SCRIPT_PATH:-}" ]]; then
  printf 'SQL_EXTRACTION_SCRIPT_PATH is not configured\n' > "$error_log"
elif [[ ! -f "$SQL_EXTRACTION_SCRIPT_PATH" ]]; then
  printf 'SQL_EXTRACTION_SCRIPT_PATH not found: %s\n' "$SQL_EXTRACTION_SCRIPT_PATH" > "$error_log"
elif ! node "$SQL_EXTRACTION_SCRIPT_PATH" \
    --repo-path "$repo_dir" \
    --source "$source_branch" \
    --target "origin/$review_base_branch" \
    --output "$result_file"; then
  [[ -s "$error_log" ]] || printf 'SQL extraction command failed\n' > "$error_log"
fi

# 本地测试：抽取脚本按仓库 remote 匹配数据源，本地仓库地址匹配不到，
# 这里把请求体中的 gitlabUrl 覆盖为固定值，便于联调 SQL 检查接口。
if [[ -n "${SQL_OVERRIDE_GITLAB_URL:-}" && -s "$result_file" ]]; then
  tmp_json="$(mktemp)"
  if jq --arg u "$SQL_OVERRIDE_GITLAB_URL" '.gitlabUrl = $u' "$result_file" > "$tmp_json" 2>/dev/null; then
    mv "$tmp_json" "$result_file"
    log "Overrode gitlabUrl to $SQL_OVERRIDE_GITLAB_URL"
  else
    rm -f "$tmp_json"
  fi
fi

if [[ -s "$error_log" ]]; then
  log "SQL extraction error log:"
  cat "$error_log" >&2
fi
