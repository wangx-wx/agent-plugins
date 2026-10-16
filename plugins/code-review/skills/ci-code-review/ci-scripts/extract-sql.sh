#!/usr/bin/env bash
# stage 5：抽取 MyBatis 变更 SQL。
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

if [[ -s "$error_log" ]]; then
  log "SQL extraction error log:"
  cat "$error_log" >&2
fi
