#!/usr/bin/env bash
# stage 3（本地版）：直接调用 claude CLI 执行代码审查。
# 与生产版的差异：不做 sudo 切换、不使用 Jenkins aiAgent 插件、不覆盖 HOME/PATH；
# 额外用 --json-schema 约束输出，并把结构化结果落到仓库内的
# .code-review/code-review-report-json.json。
#
# 过程输出（stream-json 事件流）保持不变，仍写入 logs/claude.stream.json，
# 供下游 report-status.sh / publish-note.sh 解析。
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

log "Calling Claude Code locally (repo=$repo_dir, schema=$schema_file)"

cd "$repo_dir"
run_with_timeout "${CLAUDE_TIMEOUT_SECONDS:-3000}" \
  claude --permission-mode bypassPermissions --verbose \
    --output-format stream-json --include-partial-messages \
    --json-schema "$(cat "$schema_file")" \
    --add-dir "$repo_dir" -p "$claude_prompt" \
  > >(tee "$stream_file") \
  2> >(tee "$err_file" >&2)

test -s "$stream_file"

# 从 stream 末尾的 result 事件中取出结构化审查结果，落盘到仓库内的 .code-review/，
# 与 markdown 报告（CLAUDE_REPORT_RELATIVE_PATH）同目录，供下游读取。
# 失败不中断流程：下游仍可回退到从文本报告中提取。
json_report_file="$repo_dir/${CLAUDE_REPORT_JSON_RELATIVE_PATH:-.code-review/code-review-report-json.json}"
mkdir -p "$(dirname "$json_report_file")"
if jq -e 'select(.type == "result") | .structured_output' "$stream_file" > "$json_report_file" 2>/dev/null && [[ -s "$json_report_file" ]]; then
  log "Structured findings written to $json_report_file"
else
  rm -f "$json_report_file"
  log "No structured_output in result event, skip JSON report"
fi
