#!/usr/bin/env bash
# 辅助（本地版）：组装 MR 评论正文。
set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

report_file="${1:?report_file is required}"
output_file="${2:?output_file is required}"

workdir="${LOCAL_RUN_DIR:-$PROJECT_DIR/.run}"
source "$workdir/meta/context.env"

sql_dir="$repo_dir/.code-review/sql"
sql_response_file="$sql_dir/sql-check-response.json"
sql_error_log="$sql_dir/error.log"
p3c_report_file="$repo_dir/.code-review/p3c-report.json"
p3c_error_log="$repo_dir/.code-review/p3c-error.log"

{
  echo "$marker"
  echo
  echo "## Claude Code Review"
  echo
  echo "- Project: $project_path"
  echo "- Source Branch: $source_branch"
  echo "- Target Branch: $target_branch"
  echo "- Commit: \`$event_sha\`"
  echo "- Jenkins: ${LOCAL_RUN_URL:-local}"
  echo
  cat "$report_file"

  if [[ -s "$p3c_report_file" ]]; then
    echo
    echo "## P3C 检查"
    echo "- 违规数：$(jq 'length' "$p3c_report_file" 2>/dev/null || echo '?')"
  elif [[ -s "$p3c_error_log" ]]; then
    echo
    echo "## P3C 检查"
    echo
    echo "### 错误日志"
    echo '```text'
    cat "$p3c_error_log"
    echo '```'
  fi

  if [[ -s "$sql_response_file" || -s "$sql_error_log" ]]; then
    echo
    echo "## SQL 检查"

    if [[ -s "$sql_response_file" ]] && sql_response_valid "$sql_response_file"; then
      sql_severity="$(jq -r '.sql_severity // .severity' "$sql_response_file")"
      sql_report_url="$(jq -r '.url' "$sql_response_file")"
      echo "- 严重等级：$sql_severity"
      echo "- 检查报告：$sql_report_url"
    fi

    if [[ -s "$sql_error_log" ]]; then
      echo
      echo "### 错误日志"
      echo '```text'
      cat "$sql_error_log"
      echo '```'
    fi
  fi
} > "$output_file"
