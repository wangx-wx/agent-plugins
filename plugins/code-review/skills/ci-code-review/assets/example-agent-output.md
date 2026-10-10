# Agent 审查报告输出格式

每个 Agent 返回一个 JSON 数组，每个元素代表一个发现的问题。无问题时返回空数组 `[]`。

## Schema

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "CodeReviewReport",
  "description": "单个 Agent 的代码审查报告",
  "type": "array",
  "items": {
    "type": "object",
    "required": ["fileName", "location", "ruleId", "blockLevel", "codeSnippet", "affectedScope", "suggestion"],
    "properties": {
      "fileName": {
        "type": "string",
        "description": "相对于仓库根目录的文件路径"
      },
      "location": {
        "type": "string",
        "description": "问题位置，格式为 文件路径:行号，如 src/main/java/com/example/UserService.java:42"
      },
      "ruleId": {
        "type": "string",
        "description": "规则编号，如 BASE-00001、JCR-00001、SQL-00001 或 P3C 规则名"
      },
      "blockLevel": {
        "type": "string",
        "description": "问题级别",
        "enum": ["Blocker", "Critical", "Major", "Minor"]
      },
      "codeSnippet": {
        "type": "string",
        "description": "问题代码片段，用于在报告中展示证据"
      },
      "affectedScope": {
        "type": "string",
        "description": "影响范围描述"
      },
      "suggestion": {
        "type": "string",
        "description": "修复建议"
      }
    },
    "additionalProperties": false
  }
}
```

## 示例

```json
[
  {
    "fileName": "src/main/java/com/example/UserService.java",
    "location": "src/main/java/com/example/UserService.java:42",
    "ruleId": "BASE-00001",
    "blockLevel": "Critical",
    "codeSnippet": "for (User u : users) { userDao.updateStatus(u.getId(), status); }",
    "affectedScope": "循环内执行数据库更新，用户量大时严重影响性能",
    "suggestion": "改为批量更新：userDao.batchUpdateStatus(userIds, status)"
  }
]
```
