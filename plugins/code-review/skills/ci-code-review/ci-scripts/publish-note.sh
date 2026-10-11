#!/usr/bin/env bash
# stage 7（本地版）：把审查报告回写到 MR 讨论区。
set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
load_local_env

workdir="${LOCAL_RUN_DIR:-$PROJECT_DIR/.run}"
stream_file="$workdir/logs/claude.stream.json"
report_file="$workdir/output/report.md"
note_file="$workdir/output/gitlab-note.md"

[[ -s "$stream_file" ]] || {
  log "Claude stream file is empty: $stream_file"
  exit 1
}

source "$workdir/meta/context.env"
json_report_file="$repo_dir/${CLAUDE_REPORT_JSON_RELATIVE_PATH:-.code-review/code-review-report-json.json}"
sql_dir="$repo_dir/.code-review/sql"
sql_result_file="$sql_dir/sql-extraction-result.json"
sql_response_file="$sql_dir/sql-check-response.json"
sql_error_log="$sql_dir/error.log"
p3c_report_file="$repo_dir/.code-review/p3c-report.json"
p3c_error_log="$repo_dir/.code-review/p3c-error.log"

if [[ -s "$report_file" ]]; then
  # stage 6 已生成（或单独跑本 stage 时已存在），沿用它，避免覆盖。
  log "Using prepared report: $report_file"
elif [[ -s "$json_report_file" ]]; then
  bash "$LIB_DIR/build-report.sh" "$json_report_file" "$report_file"
else
  log "Structured JSON report is missing: $json_report_file"
  exit 1
fi

[[ -s "$report_file" ]] || {
  log "Claude returned empty report"
  exit 1
}

api_get "/projects/$PROJECT_ID/merge_requests/$MR_IID" > "$workdir/meta/mr_after.json"
latest_sha="$(jq -r '.sha // .diff_refs.head_sha // empty' "$workdir/meta/mr_after.json")"

[[ "$latest_sha" == "$event_sha" ]] || {
  log "MR updated during review, skip posting old report: event=$event_sha latest=$latest_sha"
  exit 0
}

bash "$LIB_DIR/build-note.sh" "$report_file" "$note_file"

post_note "$note_file"

mkdir -p "$workdir/output"
cp "$report_file" "$workdir/output/claude-review-report.md"
# gitlab-note.md 本就在 output/ 下（$note_file），无需再拷贝。
cp "$stream_file" "$workdir/output/claude-stream.json"

if [[ -f "$p3c_report_file" ]]; then
  cp "$p3c_report_file" "$workdir/output/p3c-report.json"
fi
if [[ -f "$p3c_error_log" ]]; then
  cp "$p3c_error_log" "$workdir/output/p3c-error.log"
fi
if [[ -f "$sql_result_file" ]]; then
  cp "$sql_result_file" "$workdir/output/sql-extraction-result.json"
fi
if [[ -f "$sql_response_file" ]]; then
  cp "$sql_response_file" "$workdir/output/sql-check-response.json"
fi
if [[ -f "$sql_error_log" ]]; then
  cp "$sql_error_log" "$workdir/output/sql-error.log"
fi

log "Review posted to MR !$MR_IID"
