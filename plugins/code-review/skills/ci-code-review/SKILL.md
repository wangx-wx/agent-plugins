---
name: ci-code-review
description: 对已有的 Java 代码进行审查，以确保其可重复使用性、质量和效率，然后生成审查报告。当用户提到代码审查、review、代码检查、合并前审查、MR 审查、PR 审查、代码质量检查、P3C 检查、Java 规范检查时，应使用此 skill。即使用户只是说"帮我看看代码"或"检查一下改动"，只要上下文是 Java 项目，都应触发此 skill。
allowed-tools: Bash(git:*), Bash(date:*), Bash(mkdir:*), AskUserQuestion, Agent, Read, Grep, Glob, Write
disable-model-invocation: true
---

# Java Code Review

对两个分支之间所有变更文件进行多维度审查（P3C 静态分析、基础规范、配置文件、数据库 XML），最终生成一份结构化的审查报告。

## 阶段1：确认分支信息

1. 若 `$ARGUMENTS[0]` 非空，执行 `git show-ref --verify refs/heads/$ARGUMENTS[0] || git show-ref --verify refs/remotes/$ARGUMENTS[0]`，命令成功则 `{source}` = `$ARGUMENTS[0]`
2. 若 `$ARGUMENTS[1]` 非空，执行 `git show-ref --verify refs/heads/$ARGUMENTS[1] || git show-ref --verify refs/remotes/$ARGUMENTS[1]`，命令成功则 `{target}` = `$ARGUMENTS[1]`
3. 若 `{source}` 和 `{target}` 均已设置，跳过第 4-6 步直接继续
4. 执行 `git rev-parse --abbrev-ref HEAD` 获取当前分支名，作为 `{source}` 的默认值
5. `{target}` 默认值设为 `origin/master`，`{repo}` 默认值设为当前工作目录
6. 使用 AskUserQuestion 让用户确认或修改以下信息：
   - **source 分支**：默认当前分支
   - **target 分支**：默认 `origin/master`
   - **仓库路径**：默认当前工作目录

> 后续阶段中，`{source}` 代表最终确定的 source 分支，`{target}` 代表最终确定的 target 分支，`{repo-path}` 代表仓库路径。
> `{skill-path}` = ${CLAUDE_SKILL_DIR}

## 阶段2：并行启动 2 个 Review Agents

使用 Agent tool 在一条消息中同时启动 2 个Agent（`subagent_type: "general-purpose"`），每个代理独立完成各自的检查任务并返回结果，主 Agent 不参与具体的检查过程，仅负责收集结果。
忽略 `pom.xml`文件的审查

并行启动以下 2 个子 Agent，禁止指导子Agent审查步骤：

1. **Java 规范检查**：派发Agent `java-standards-reviewer`，同时传入 `{source}`、`{target}`、`{repo-path}`
2. **数据库 XML 检查**：派发Agent `db-xml-reviewer`，同时传入 `{source}`、`{target}`、`{repo-path}`

## 阶段3：汇总输出审查报告

收集所有 Agent 返回的 JSON 数组结果:

1. **合并结果**：将 2 个 Agent 的 JSON 数组合并为一个结果报告
2. **分级排列**：按 `blockLevel` 严重程度排序：Blocker → Critical → Major → Minor，禁止修改子Agent返回的 `blockLevel` 字段值，禁止修改子Agent返回的 `ruleId` 字段值
