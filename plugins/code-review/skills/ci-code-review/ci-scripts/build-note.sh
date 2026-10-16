#!/usr/bin/env bash
# 辅助：组装 MR 评论正文。
set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

report_file="${1:?report_file is required}"
output_file="${2:?output_file is required}"

workdir="${LOCAL_RUN_DIR:-$PROJECT_DIR/.run}"
source "$workdir/meta/context.env"

sql_dir="$repo_dir/.code-review/sql"
sql_response_file="$sql_dir/sql-check-response.json"
sql_error_log="$sql_dir/error.log"

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

  if [[ -s "$sql_response_file" || -s "$sql_error_log" ]]; then
    echo
    echo "## SQL 检查"

    # 不做响应体校验（reviews 结构可能随数据库实例变化），解析异常静默忽略。
    if [[ -s "$sql_response_file" ]]; then
      sql_severity="$(jq -r '.sql_severity // .severity // empty' "$sql_response_file" 2>/dev/null | xargs)"
      sql_report_url="$(jq -r '.url // empty' "$sql_response_file" 2>/dev/null | xargs)"

      if [[ -n "$sql_severity" ]]; then
        echo "- 严重等级：$sql_severity"
      fi
      if [[ -n "$sql_report_url" ]]; then
        echo "- 检查报告：$sql_report_url"
      fi

      if jq -e '.summary' "$sql_response_file" >/dev/null 2>&1; then
        echo
        echo "| 级别 | 数量 |"
        echo "|------|------|"
        echo "| Critical | $(jq -r '.summary.critical // 0' "$sql_response_file" 2>/dev/null) |"
        echo "| Major | $(jq -r '.summary.major // 0' "$sql_response_file" 2>/dev/null) |"
        echo "| Minor | $(jq -r '.summary.minor // 0' "$sql_response_file" 2>/dev/null) |"
        echo "| Info | $(jq -r '.summary.info // 0' "$sql_response_file" 2>/dev/null) |"
        echo "| 合计 | $(jq -r '.summary.total // 0' "$sql_response_file" 2>/dev/null) |"
      fi
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
