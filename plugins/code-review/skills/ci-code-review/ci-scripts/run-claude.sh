#!/usr/bin/env bash
# stage 4：调用 claude CLI 执行代码审查（由 Jenkins aiAgent 插件的 commandOverride 驱动）。
# 用 --json-schema 约束输出，并把结构化结果落到仓库内的
# .code-review/code-review-report-json.json；过程输出（stream-json 事件流）
# 写入 logs/claude.stream.json，供下游 report-status.sh / publish-note.sh 解析。
set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
load_local_env

workdir="${LOCAL_RUN_DIR:-$PROJECT_DIR/.run}"
stream_file="$workdir/logs/claude.stream.json"
err_file="$workdir/logs/claude.err"
source "$workdir/meta/context.env"

rm -f "$stream_file" "$err_file"
touch "$stream_file" "$err_file"

claude_prompt="/code-review:ci-code-review $source_branch origin/$review_base_branch"
schema_file="${REVIEW_SCHEMA_FILE:-$LIB_DIR/code-review-schema.json}"

[[ -s "$schema_file" ]] || { log "schema file not found: $schema_file"; exit 1; }

log "Calling Claude Code (repo=$repo_dir, schema=$schema_file)"

cd "$repo_dir"
# Jenkins 生产以 root 运行：claude 默认拒绝 root 使用 bypassPermissions，
# IS_SANDBOX=1 声明运行在隔离环境以放行（非 root 环境下无副作用）。
run_with_timeout "${CLAUDE_TIMEOUT_SECONDS:-3000}" \
  env IS_SANDBOX=1 claude --permission-mode bypassPermissions --verbose \
    --output-format stream-json --include-partial-messages \
    --json-schema "$(cat "$schema_file")" \
    --add-dir "$repo_dir" -p "$claude_prompt" \
  > >(tee "$stream_file") \
  2> >(tee "$err_file" >&2)

test -s "$stream_file"

# 取最后一个 result 事件的结构化审查结果，落盘到仓库内的 .code-review/，
# 与 markdown 报告（CLAUDE_REPORT_RELATIVE_PATH）同目录，供下游读取。
# 失败不中断流程：下游仍可回退到从文本报告中提取。
#
# 注意：子 Agent 以后台方式并发时，主 Agent 会在子 Agent 返回前先投一次
# StructuredOutput，随后每次被子 Agent 完成事件唤醒又投一次（内容为累积快照）。
# 因此 stream 中会有多个带 structured_output 的 result 事件，只取最后一个才是完整结果。
json_report_file="$repo_dir/${CLAUDE_REPORT_JSON_RELATIVE_PATH:-.code-review/code-review-report-json.json}"
mkdir -p "$(dirname "$json_report_file")"
if jq -e -s 'map(select(.type == "result")) | last | .structured_output' "$stream_file" > "$json_report_file" 2>/dev/null && [[ -s "$json_report_file" ]]; then
  log "Structured findings written to $json_report_file"
else
  rm -f "$json_report_file"
  log "No structured_output in result event, skip JSON report"
fi
