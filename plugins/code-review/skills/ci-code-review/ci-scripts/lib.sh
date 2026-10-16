#!/usr/bin/env bash
# 代码审查流水线公共函数库。
# 由同目录的各步骤脚本 source；调用方可用 REVIEW_LOG_PREFIX 指定日志前缀。

# LIB_DIR：脚本自身所在目录（review-local/scripts），用于定位同目录的兄弟脚本与 schema。
# PROJECT_DIR：review-local/ 根目录，用于定位 .env 与运行目录 .run。
LIB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$LIB_DIR/.." && pwd)"

log() {
  printf '[%s] %s\n' "${REVIEW_LOG_PREFIX:-claude-review}" "$*"
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

# 从 Claude stream-json 中提取审查报告，写入 $2。
# 先取 assistant 文本中最大的一段，为空时回退到 result 事件。
extract_report_from_stream() {
  local stream_file="$1"
  local report_file="$2"

  jq -sr '
    [
      .[] |
      select(.type == "assistant" and .parent_tool_use_id == null) |
      (
        if ((.message.content? | type) == "array") then
          [.message.content[]? | select(.type == "text") | (.text // "")] | join("")
        elif ((.message.content? | type) == "string") then
          .message.content
        elif (.text? != null) then
          .text
        else
          empty
        end
      ) |
      select(type == "string" and length > 0)
    ] | max_by(length) // empty
  ' "$stream_file" > "$report_file"

  if [[ ! -s "$report_file" ]]; then
    jq -sr '[.[] | select(.type == "result" and (.result // "") != "") | .result] | last // empty' \
      "$stream_file" > "$report_file"
  fi
}

# SQL 检查响应校验：必须是对象，且 sql_severity(或 severity) 与 url 均为非空字符串。
sql_response_valid() {
  jq -e '
    type == "object" and
    (((.sql_severity? // .severity? // "") | type) == "string") and
    (((.sql_severity? // .severity? // "") | length) > 0) and
    (((.url? // "") | type) == "string") and
    (((.url? // "") | length) > 0)
  ' "$1" >/dev/null 2>&1
}

# 从 MR JSON 中取 web_url，缺失时用 project_path 拼接兜底。
resolve_mr_url() {
  local mr_json_file="$1"
  local project_path="$2"
  local mr_url

  mr_url="$(jq -r '.web_url // empty' "$mr_json_file")"
  if [[ -z "$mr_url" ]]; then
    mr_url="${GITLAB_API_URL%/api/v4}/$project_path/merge_requests/$MR_IID"
  fi
  printf '%s' "$mr_url"
}

# 载入 .env（若存在）与运行期 context.env（若已生成）。
load_local_env() {
  local env_file="${LOCAL_ENV_FILE:-$PROJECT_DIR/.env}"
  if [[ -f "$env_file" ]]; then
    set -a
    # shellcheck disable=SC1090
    source "$env_file"
    set +a
  fi
}

# 便携超时：macOS 无 GNU timeout，用后台 + 看门狗实现。
# 返回被包裹命令的退出码；超时按 124 处理。
run_with_timeout() {
  local secs="$1"
  shift
  local rc=0
  "$@" &
  local pid=$!
  ( sleep "$secs"; kill -TERM "$pid" 2>/dev/null || true ) &
  local watcher=$!
  wait "$pid" || rc=$?
  kill -TERM "$watcher" 2>/dev/null || true
  wait "$watcher" 2>/dev/null || true
  if [[ "$rc" == "143" ]]; then
    rc=124
  fi
  return "$rc"
}
