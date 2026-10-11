#!/usr/bin/env bash
# stage 6（本地版）：判定 PASSED/BLOCKED 并回传状态。
set -euo pipefail

REVIEW_LOG_PREFIX='review-status'
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
load_local_env

workdir="${LOCAL_RUN_DIR:-$PROJECT_DIR/.run}"
source "$workdir/meta/context.env"

stream_file="$workdir/logs/claude.stream.json"
report_file="$workdir/output/report.md"
json_report_file="$repo_dir/${CLAUDE_REPORT_JSON_RELATIVE_PATH:-.code-review/code-review-report-json.json}"
merged_json_file="$repo_dir/${CLAUDE_MERGED_JSON_RELATIVE_PATH:-.code-review/code-review-merged.json}"
sql_response_file="$repo_dir/.code-review/sql/sql-check-response.json"
payload_file="$workdir/output/review-status-payload.json"
response_file="$workdir/output/review-status-response.json"

[[ -s "$json_report_file" ]] || { log "Structured JSON report is missing: $json_report_file"; exit 1; }

# 由结构化 JSON 拼装 markdown 审查报告（统计 + 问题 + 评估结论）。
bash "$LIB_DIR/build-report.sh" "$json_report_file" "$report_file"

[[ -s "$report_file" ]] || { log 'AI review report is empty'; exit 1; }

# 评估结论由脚本按规则得出：存在 Blocker 或 Critical 即为「否」。
merge_decision="$(sed -nE 's/^是否可合并[[:space:]]*(：|:)[[:space:]]*//p' "$report_file" | tail -n 1 | xargs)"

# SQL 检查结果：从 SQL 检查接口响应中读取严重级别。
sql_severity=''
if [[ -s "$sql_response_file" ]]; then
  sql_severity="$(jq -r '.sql_severity // .severity // empty' "$sql_response_file" 2>/dev/null | xargs)"
fi
# bash 3.2 兼容：不用 ${var,,}，改用 tr 转小写
sql_severity_lc="$(printf '%s' "$sql_severity" | tr '[:upper:]' '[:lower:]')"

status='PASSED'
if [[ "$merge_decision" == 否* || "$sql_severity_lc" == 'critical' ]]; then
  status='BLOCKED'
fi

api_get "/projects/$PROJECT_ID/merge_requests/$MR_IID" > "$workdir/meta/mr_before_status.json"
latest_sha="$(jq -r '.sha // .diff_refs.head_sha // empty' "$workdir/meta/mr_before_status.json")"

if [[ "$latest_sha" != "$event_sha" ]]; then
  log "MR updated during review, skip reporting and closing: event=$event_sha latest=$latest_sha"
  exit 0
fi

# resultDetail：一句话说明阻塞来源（代码审查 / SQL 检查）。
code_blocked='false'
if [[ "$merge_decision" == 否* ]]; then
  code_blocked='true'
fi

# SQL 仅看接口返回的 severity 是否为 critical。
sql_blocked='false'
if [[ "$sql_severity_lc" == 'critical' ]]; then
  sql_blocked='true'
fi

if [[ "$code_blocked" == 'true' && "$sql_blocked" == 'true' ]]; then
  result_detail='代码审查和 SQL 检查均存在阻塞问题'
elif [[ "$code_blocked" == 'true' ]]; then
  result_detail='代码审查存在阻塞问题'
elif [[ "$sql_blocked" == 'true' ]]; then
  result_detail='SQL 检查存在阻塞问题'
else
  result_detail='无阻塞问题'
fi
git_url="$(printf '%s' "$repo_url" | xargs)"

note_file="$workdir/output/gitlab-note.md"
bash "$LIB_DIR/build-note.sh" "$report_file" "$note_file"

mr_url="$(resolve_mr_url "$workdir/meta/mr_before_status.json" "$project_path")"

jq -n \
  --arg gitUrl "$git_url" \
  --arg branch "$source_branch" \
  --arg mrIid "$MR_IID" \
  --arg sourceSha "$event_sha" \
  --arg status "$status" \
  --arg resultDetail "$result_detail" \
  --arg mrUrl "$mr_url" \
  --argjson codeReviewReport "$(cat "$merged_json_file")" \
  '{
    gitUrl: $gitUrl,
    branch: $branch,
    mrIid: $mrIid,
    sourceSha: $sourceSha,
    status: $status,
    resultDetail: $resultDetail,
    mrUrl: $mrUrl,
    codeReviewReport: $codeReviewReport,
    source: "ai-code-review"
  }' > "$payload_file"

if [[ -z "${CODE_REVIEW_STATUS_API_URL:-}" ]]; then
  log 'CODE_REVIEW_STATUS_API_URL is empty, skip status reporting'
elif curl --fail --silent --show-error \
  --request POST \
  --header 'Content-Type: application/json' \
  --data-binary "@$payload_file" \
  "$CODE_REVIEW_STATUS_API_URL" > "$response_file"; then
  log "Reported status=$status sourceSha=$event_sha"
else
  log "Status reporting failed, continue pipeline: status=$status sourceSha=$event_sha"
fi
