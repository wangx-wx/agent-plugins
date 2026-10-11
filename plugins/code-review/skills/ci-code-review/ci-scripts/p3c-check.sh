#!/usr/bin/env bash
# stage 3（本地版）：执行 P3C 规范检查，结果输出为 JSON。
# 放在 AI Agent 审查之前，作为独立的静态规范检查环节。
set -u -o pipefail

REVIEW_LOG_PREFIX='p3c-check'
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
load_local_env

workdir="${LOCAL_RUN_DIR:-$PROJECT_DIR/.run}"
source "$workdir/meta/context.env"

p3c_dir="$repo_dir/.code-review"
p3c_report_file="$p3c_dir/p3c-report.json"
error_log="$p3c_dir/p3c-error.log"

mkdir -p "$p3c_dir"
rm -f "$p3c_report_file" "$error_log"

if [[ -z "${P3C_SCAN_SCRIPT_PATH:-}" ]]; then
  printf 'P3C_SCAN_SCRIPT_PATH is not configured\n' > "$error_log"
elif [[ ! -f "$P3C_SCAN_SCRIPT_PATH" ]]; then
  printf 'P3C_SCAN_SCRIPT_PATH not found: %s\n' "$P3C_SCAN_SCRIPT_PATH" > "$error_log"
elif ! node "$P3C_SCAN_SCRIPT_PATH" "$repo_dir" \
    --source "$source_branch" \
    --target "origin/$review_base_branch" \
    > "$p3c_report_file" 2> "$error_log"; then
  [[ -s "$error_log" ]] || printf 'P3C scan command failed\n' > "$error_log"
  rm -f "$p3c_report_file"
fi

if [[ -s "$error_log" ]]; then
  log "P3C scan error log:"
  cat "$error_log" >&2
fi

if [[ -s "$p3c_report_file" ]]; then
  log "P3C report written to $p3c_report_file ($(jq 'length' "$p3c_report_file" 2>/dev/null || echo '?') findings)"
fi
