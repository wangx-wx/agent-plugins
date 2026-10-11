#!/usr/bin/env bash
# 辅助（本地版）：汇总 AI 审查与 P3C 检查结果，生成 code-review-report.md。
#
# 用法：build-report.sh <ai_json_file> <output_md>
# 依赖 context.env 中的 source_branch / review_base_branch / repo_dir。
#
# 数据来源：
#   - AI 审查：{findings:[{fileName,location,ruleId,blockLevel,codeSnippet,affectedScope,suggestion}]}
#   - P3C 检查：$repo_dir/.code-review/p3c-report.json（扁平数组，字段见下）
# 两者按 blockLevel 合并到同一份报告，条目以 [AI] / [P3C] 标记来源。
#
# 说明：schema 未提供「问题标题」字段，条目标题取 affectedScope（AI）或 violation 描述（P3C），
# 因此 P3C 条目不再单独输出「修复建议」行，避免与标题重复。
set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

ai_json_file="${1:?ai_json_file is required}"
output_file="${2:?output_file is required}"

workdir="${LOCAL_RUN_DIR:-$PROJECT_DIR/.run}"
source "$workdir/meta/context.env"

p3c_file="${P3C_REPORT_FILE:-$repo_dir/.code-review/p3c-report.json}"

[[ -s "$ai_json_file" ]] || { log "AI JSON report not found: $ai_json_file"; exit 1; }

# 归一化并合并两个来源，输出 {"findings":[...]}。
merged_file="$(mktemp)"
trap 'rm -f "$merged_file"' EXIT

{
  jq -c '[.findings[]? | {
    source: "AI",
    fileName: (.fileName // ""),
    location: (.location // ""),
    ruleId: (.ruleId // ""),
    blockLevel: (.blockLevel // ""),
    codeSnippet: (.codeSnippet // ""),
    title: (.affectedScope // ""),
    suggestion: (.suggestion // "")
  }]' "$ai_json_file"

  if [[ -s "$p3c_file" ]]; then
    jq -c '[.[]? | {
      source: "P3C",
      fileName: (.fileName // ""),
      location: (((.fileName // "") + ":" + ((.beginline // 0) | tostring))),
      ruleId: (.ruleId // ""),
      blockLevel: (.blockLevel // ""),
      codeSnippet: "",
      title: (.suggestion // ""),
      suggestion: ""
    }]' "$p3c_file"
  else
    echo '[]'
  fi
} | jq -cs '{findings: add}' > "$merged_file"

count_of() {
  jq --arg l "$1" '[.findings[]? | select(.blockLevel == $l)] | length' "$merged_file"
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

    local source file location rule snippet title suggestion lang
    source="$(printf '%s' "$item" | jq -r '.source')"
    file="$(printf '%s' "$item" | jq -r '.fileName')"
    location="$(printf '%s' "$item" | jq -r '.location')"
    rule="$(printf '%s' "$item" | jq -r '.ruleId')"
    snippet="$(printf '%s' "$item" | jq -r '.codeSnippet')"
    title="$(printf '%s' "$item" | jq -r '.title')"
    suggestion="$(printf '%s' "$item" | jq -r '.suggestion')"
    lang="$(lang_for "$file")"

    printf '%d. [%s] %s\n' "$i" "$source" "$title"
    printf '   - 规则：%s\n' "$rule"
    printf '   - 位置：%s\n' "$location"
    if [[ -n "$snippet" ]]; then
      printf '   - 证据：\n'
      printf '     ```%s\n' "$lang"
      printf '%s\n' "$snippet" | sed 's/^/     /'
      printf '     ```\n'
    fi
    if [[ -n "$suggestion" ]]; then
      printf '   - 修复建议：%s\n' "$suggestion"
    fi
    printf '\n'
  done < <(jq -c --arg l "$level" '.findings[]? | select(.blockLevel == $l)' "$merged_file")
}

blocker="$(count_of Blocker)"
critical="$(count_of Critical)"
major="$(count_of Major)"
minor="$(count_of Minor)"

# 评估结论：存在 Blocker 或 Critical 即为「否」（AI 与 P3C 合并后统一判定）。
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
