#!/usr/bin/env bash
# stage 8（本地版）：BLOCKED 时发送邮件并关闭 MR。
# 注意：本脚本会真实关闭 MR 并发邮件。若只想验证流程，请设置 LOCAL_DRY_RUN=1。
set -euo pipefail

REVIEW_LOG_PREFIX='review-notify'
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
load_local_env

dry_run="${LOCAL_DRY_RUN:-0}"

close_merge_request() {
  if [[ "$dry_run" == "1" ]]; then
    log "[dry-run] would close MR !$MR_IID"
    return 0
  fi
  curl --fail-with-body --silent --show-error \
    --request PUT \
    --header "PRIVATE-TOKEN: $GITLAB_TOKEN" \
    --data-urlencode 'state_event=close' \
    "$GITLAB_API_URL/projects/$PROJECT_ID/merge_requests/$MR_IID"
}

send_blocking_email() {
  local recipient="$1"
  local mr_url="$2"
  local subject="$3"
  local sql_severity="$4"
  local sql_report_url="$5"
  local payload_file="$workdir/output/code-review-email-payload.json"
  local response_file="$workdir/output/code-review-email-response.json"

  if [[ -z "${CODE_REVIEW_EMAIL_API_URL:-}" ]]; then
    log 'CODE_REVIEW_EMAIL_API_URL is empty, skip blocking email'
    return 0
  fi

  if [[ -z "$recipient" ]]; then
    log 'Last commit author email is empty, skip blocking email'
    return 0
  fi

  if ! jq -n \
    --arg subject "$subject" \
    --arg mrUrl "$mr_url" \
    --arg recipient "$recipient" \
    --arg sqlSeverity "$sql_severity" \
    --arg sqlUrl "$sql_report_url" \
    --arg quote '"' \
    '
      ($mrUrl | @html) as $safeMrUrl |
      ($sqlUrl | @html) as $safeSqlUrl |
      {
        participantAppId: "LEYAOYAO",
        source: "code-review",
        channelMessages: [
          {
            channelType: "EMAIL",
            group: "default",
            subject: $subject,
            content: (
              "<p>Code Review 检测到本次 MR 存在代码或 SQL 阻塞问题，详细内容和修改建议已回写到 MR 讨论区，请及时查看并处理。</p>" +
              (if (($sqlSeverity | ascii_downcase) == "critical") then
                 "<p>SQL 审查发现阻塞问题（严重等级：" + ($sqlSeverity | @html) + "），请查看 SQL 审查报告：" +
                 "<a href=" + $quote + $safeSqlUrl + $quote + ">点击查看 SQL 审查报告</a></p>"
               else "" end) +
              "<p>由于存在阻塞问题，本次合并请求将被关闭。请修复问题后重新打开并发起审查。</p>" +
              "<p><a href=" + $quote + $safeMrUrl + $quote + ">点击查看 MR 讨论</a></p>" +
              "<p style=" + $quote + "color:#888;font-size:12px;" + $quote + ">此邮件由 Code Review 服务自动发送，请勿直接回复。</p>"
            ),
            retryCount: 0,
            receivers: [
              {toUser: $recipient}
            ]
          }
        ]
      }
    ' > "$payload_file"; then
    log 'Failed to build blocking email payload, continue pipeline'
    return 0
  fi

  if [[ "$dry_run" == "1" ]]; then
    log "[dry-run] would send blocking email to $recipient"
    return 0
  fi

  if curl --fail-with-body --silent --show-error \
    --max-time 30 \
    --request POST \
    --header 'Content-Type: application/json; charset=UTF-8' \
    --data-binary "@$payload_file" \
    "$CODE_REVIEW_EMAIL_API_URL" > "$response_file"; then
    log "Blocking email sent to $recipient"
  else
    log "Failed to send blocking email to $recipient, continue pipeline"
  fi
}

workdir="${LOCAL_RUN_DIR:-$PROJECT_DIR/.run}"
source "$workdir/meta/context.env"
payload_file="$workdir/output/review-status-payload.json"

[[ -s "$payload_file" ]] || {
  log 'Review status payload is missing, skip blocking notification'
  exit 0
}

status="$(jq -r '.status // empty' "$payload_file")"
[[ "$status" == 'BLOCKED' ]] || {
  log "Review status is ${status:-unknown}, skip blocking notification"
  exit 0
}

if ! api_get "/projects/$PROJECT_ID/merge_requests/$MR_IID" > "$workdir/meta/mr_before_close.json"; then
  log "Failed to query GitLab MR !$MR_IID before close, continue pipeline"
  exit 0
fi

mr_state="$(jq -r '.state // empty' "$workdir/meta/mr_before_close.json")"
latest_sha="$(jq -r '.sha // .diff_refs.head_sha // empty' "$workdir/meta/mr_before_close.json")"

if [[ "$latest_sha" != "$event_sha" ]]; then
  log "MR updated before close, skip notification: event=$event_sha latest=$latest_sha"
  exit 0
fi

if [[ "$mr_state" != 'opened' ]]; then
  log "MR state is ${mr_state:-unknown}, skip close but still send notification"
fi

last_commit_author_email="$(jq -r '.last_commit.author_email // .last_commit.committer_email // empty' "$workdir/meta/mr_before_close.json")"
if [[ -z "$last_commit_author_email" ]]; then
  if commit_json="$(api_get "/projects/$PROJECT_ID/repository/commits/$latest_sha")"; then
    last_commit_author_email="$(printf '%s' "$commit_json" | jq -r '.author_email // .committer_email // empty')"
  else
    log "Failed to query last commit $latest_sha, continue without email"
  fi
fi

mr_url="$(resolve_mr_url "$workdir/meta/mr_before_close.json" "$project_path")"

# SQL 审查结果（若存在）：仅在严重级别为 critical 时，邮件中追加 SQL 阻塞提示与报告链接。
sql_severity=''
sql_report_url=''
sql_response_file="$repo_dir/.code-review/sql/sql-check-response.json"
if [[ -s "$sql_response_file" ]] && sql_response_valid "$sql_response_file"; then
  sql_severity="$(jq -r '.sql_severity // .severity // empty' "$sql_response_file" | xargs)"
  sql_report_url="$(jq -r '.url // empty' "$sql_response_file" | xargs)"
fi

send_blocking_email "$last_commit_author_email" "$mr_url" "[Code Review] $project_path !$MR_IID 存在待处理问题" "$sql_severity" "$sql_report_url"

if [[ "$mr_state" == 'opened' ]]; then
  if close_merge_request > "$workdir/meta/mr_close_response.json"; then
    log "GitLab close request completed for MR !$MR_IID"
  else
    log "GitLab close request returned an error for MR !$MR_IID, verify current state"
  fi
fi

if api_get "/projects/$PROJECT_ID/merge_requests/$MR_IID" > "$workdir/meta/mr_after_close.json"; then
  mr_state_after_close="$(jq -r '.state // empty' "$workdir/meta/mr_after_close.json")"
  if [[ "$mr_state_after_close" == 'closed' ]]; then
    log "GitLab MR !$MR_IID is closed"
  else
    log "GitLab MR !$MR_IID was not closed: current state=${mr_state_after_close:-unknown}"
  fi
else
  log "Failed to query GitLab MR !$MR_IID after close request, continue pipeline"
fi
