#!/usr/bin/env bash
# stage 5（本地版）：调用 SQL 检查接口。
set -u -o pipefail

REVIEW_LOG_PREFIX='sql-check'
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
load_local_env

workdir="${LOCAL_RUN_DIR:-$PROJECT_DIR/.run}"
source "$workdir/meta/context.env"

sql_dir="$repo_dir/.code-review/sql"
result_file="$sql_dir/sql-extraction-result.json"
response_file="$sql_dir/sql-check-response.json"
error_log="$sql_dir/error.log"

if [[ ! -s "$result_file" ]] || jq -e '(.items? // (if type == "array" then . else [] end)) | length == 0' "$result_file" >/dev/null 2>&1; then
  log "SQL extraction result is empty, skip SQL check request"
elif ! curl --fail --silent --show-error \
  --connect-timeout 10 \
  --max-time "${SQL_CHECK_TIMEOUT_SECONDS:-1200}" \
  --request POST \
  --header "Authorization: Bearer $SQL_CHECK_API_TOKEN" \
  --header 'Content-Type: application/json' \
  --data-binary "@$result_file" \
  "$SQL_CHECK_API_URL" > "$response_file"; then
  printf 'SQL check HTTP request failed\n' >> "$error_log"
elif [[ ! -s "$response_file" ]]; then
  printf 'SQL check HTTP response is empty\n' >> "$error_log"
fi
# 本地不做响应体校验：接口返回结构可能变化（如多个数据库实例），
# 只判断请求是否成功、响应是否非空，具体内容原样透传。

if [[ -s "$response_file" ]]; then
  log "SQL check response:"
  cat "$response_file"
fi

if [[ -s "$error_log" ]]; then
  log "SQL check error log:"
  cat "$error_log" >&2
fi
