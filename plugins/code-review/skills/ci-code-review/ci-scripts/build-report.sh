#!/usr/bin/env bash
# 辅助：汇总 AI 审查结果，生成 code-review-report.md。
#
# 用法：build-report.sh <ai_json_file> <output_md>
# 依赖 context.env 中的 source_branch / review_base_branch / repo_dir。
#
# 数据来源：
#   - AI 审查：{findings:[{fileName,location,ruleId,blockLevel,title,codeSnippet,affectedScope,suggestion}]}
#   - SQL 检查：$repo_dir/.code-review/sql/sql-check-response.json（接口原始响应）
# AI 审查结果归一化后作为 code-review；SQL 检查结果原样放入 sql-review。
# 两者一并落盘到 code-review-merged.json。
#
# 说明：AI 条目标题取 schema 的 title，affectedScope 作为独立字段透传。
set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

ai_json_file="${1:?ai_json_file is required}"
output_file="${2:?output_file is required}"

workdir="${LOCAL_RUN_DIR:-$PROJECT_DIR/.run}"
source "$workdir/meta/context.env"

sql_response_file="$repo_dir/.code-review/sql/sql-check-response.json"
merged_json_file="$repo_dir/${CLAUDE_MERGED_JSON_RELATIVE_PATH:-.code-review/code-review-merged.json}"

[[ -s "$ai_json_file" ]] || { log "AI JSON report not found: $ai_json_file"; exit 1; }

# 归一化 AI 审查结果，得到 code-review；SQL 检查结果原样作为 sql-review。
# 结果落盘为独立的合并 JSON 文件，同时留一份供生成 markdown 使用。
mkdir -p "$(dirname "$merged_json_file")"
merged_file="$(mktemp)"
trap 'rm -f "$merged_file"' EXIT

jq -c '{codeReview: [.findings[]? | {
  fileName: (.fileName // ""),
  location: (.location // ""),
  ruleId: (.ruleId // ""),
  blockLevel: (.blockLevel // ""),
  codeSnippet: (.codeSnippet // ""),
  title: (.title // ""),
  affectedScope: (.affectedScope // ""),
  suggestion: (.suggestion // "")
}]}' "$ai_json_file" > "$merged_file"

# sql-review：有响应文件则原样并入，否则为 null。
if [[ -s "$sql_response_file" ]]; then
  jq -s '.[0] + {sqlReview: (.[1])}' "$merged_file" "$sql_response_file" > "$merged_json_file"
else
  jq -s '.[0] + {sqlReview: null}' "$merged_file" > "$merged_json_file"
fi
cp "$merged_json_file" "$merged_file"

log "Merged JSON written to $merged_json_file (code-review: $(jq '.codeReview | length' "$merged_json_file") findings)"

count_of() {
  jq --arg l "$1" '[.codeReview[]? | select(.blockLevel == $l)] | length' "$merged_file"
}

# 按文件名后缀推断代码块语言标记，识别不了则留空。
lang_for() {
  case "$1" in
    *.sql)            printf 'sql' ;;
    *.xml)            printf 'xml' ;;
    *.java)           printf 'java' ;;
    *.kt)             printf 'kotlin' ;;
    *.js)             printf 'javascript' ;;
    *.ts)             printf 'typescript' ;;
    *.py)             printf 'python' ;;
    *.sh)             printf 'bash' ;;
    *.yml|*.yaml)     printf 'yaml' ;;
    *.json)           printf 'json' ;;
    *.md)             printf 'markdown' ;;
    *)                printf '' ;;
  esac
}

emit_level() {
  local level="$1"
  local count
  count="$(count_of "$level")"

  printf '### %s\n\n' "$level"

  if [[ "$count" == "0" ]]; then
    printf '无\n\n'
    return 0
  fi

  local i=0
  while IFS= read -r item; do
    i=$((i + 1))

    local file location rule snippet title scope suggestion lang
    file="$(printf '%s' "$item" | jq -r '.fileName')"
    location="$(printf '%s' "$item" | jq -r '.location')"
    rule="$(printf '%s' "$item" | jq -r '.ruleId')"
    snippet="$(printf '%s' "$item" | jq -r '.codeSnippet')"
    title="$(printf '%s' "$item" | jq -r '.title')"
    scope="$(printf '%s' "$item" | jq -r '.affectedScope // ""')"
    suggestion="$(printf '%s' "$item" | jq -r '.suggestion')"
    lang="$(lang_for "$file")"

    printf '%d. %s\n' "$i" "$title"
    printf '   - 规则：%s\n' "$rule"
    printf '   - 位置：%s\n' "$location"
    if [[ -n "$snippet" ]]; then
      printf '   - 证据：\n'
      printf '     ```%s\n' "$lang"
      printf '%s\n' "$snippet" | sed 's/^/     /'
      printf '     ```\n'
    fi
    if [[ -n "$scope" ]]; then
      printf '   - 影响：%s\n' "$scope"
    fi
    if [[ -n "$suggestion" ]]; then
      printf '   - 修复建议：%s\n' "$suggestion"
    fi
    printf '\n'
  done < <(jq -c --arg l "$level" '.codeReview[]? | select(.blockLevel == $l)' "$merged_file")
}

blocker="$(count_of Blocker)"
critical="$(count_of Critical)"
major="$(count_of Major)"
minor="$(count_of Minor)"

# 评估结论：存在 Blocker 或 Critical 即为「否」。
can_merge='是'
if [[ "$blocker" != "0" || "$critical" != "0" ]]; then
  can_merge='否'
fi

{
  printf '# 审查报告\n\n'

  printf '## 审查范围\n\n'
  printf 'Source: %s → Target: origin/%s\n\n' "$source_branch" "$review_base_branch"

  printf '## 统计\n\n'
  printf '| 级别 | 数量 |\n'
  printf '|------|------|\n'
  printf '| Blocker | %s |\n' "$blocker"
  printf '| Critical | %s |\n' "$critical"
  printf '| Major | %s |\n' "$major"
  printf '| Minor | %s |\n\n' "$minor"

  printf '## 问题\n\n'
  emit_level Blocker
  emit_level Critical
  emit_level Major
  emit_level Minor

  printf '## 评估结论\n\n'
  printf '是否可合并： %s\n' "$can_merge"
} > "$output_file"

log "Review report written to $output_file (canMerge=$can_merge)"
