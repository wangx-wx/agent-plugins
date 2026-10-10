# Java Code Review Skill

基于 Claude Code 的 Java 代码审查 Skill，通过多 Agent 并行架构对分支变更进行多维度自动化审查，生成结构化的审查报告。

## 使用方式

### 方式一：自然语言触发

在 Claude Code 中输入以下任意指令，Skill 会自动识别并启动：

```
帮我审查一下代码
检查一下这个分支的改动
review 一下当前的变更
做一次代码审查
```

### 方式二：Skill 命令调用

```bash
/java-code-review source_branch target_branch 
```

### 执行流程

1. **确认分支信息** - Skill 自动检测当前分支并询问确认
2. **并行审查** - 启动 4 个 Agent 并行执行审查
3. **生成报告** - 汇总结果、去重、按严重级别排序输出


## 工作流程

```
┌─────────────────────────────────────┐
│  阶段1：确认分支信息                   │
│  source 分支 / target 分支 / 仓库路径  │
└──────────────┬──────────────────────┘
               │
               ▼
┌──────────────────────────────────────────────────────────┐
│  阶段2：并行启动 4 个 Review Agents                        │
│                                                          │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌────────────┐  │
│  │ Agent 1  │ │ Agent 2  │ │ Agent 3  │ │  Agent 4   │  │
│  │ P3C 静态 │ │ 基础规范 │ │ 配置文件 │ │ 数据库 XML │  │
│  │ 分析     │ │ 检查     │ │ 检查     │ │ 检查       │  │
│  └────┬─────┘ └────┬─────┘ └────┬─────┘ └─────┬──────┘  │
│       │            │            │              │         │
└───────┼────────────┼────────────┼──────────────┼─────────┘
        │            │            │              │
        ▼            ▼            ▼              ▼
┌──────────────────────────────────────────────────────────┐
│  阶段3：合并 → 去重 → 分级排列 → 生成审查报告              │
└──────────────────────────────────────────────────────────┘
```

## 审查维度

| Agent | 审查范围 | 检查方式 | 规则文件 |
|-------|---------|---------|---------|
| P3C 静态分析 | 变更的 `.java` 文件 | PMD 引擎扫描 | 阿里巴巴 P3C 规则集 |
| 基础规范检查 | 变更的 `.java` 文件 | AI 逐规则审查 | `references/base-rules.md` |
| 配置文件检查 | `.yml` `.properties` `.sql` `.sh` 等 | AI 逐规则审查 | `references/jcr-rules.md` |
| 数据库 XML 检查 | MyBatis mapper 等 `.xml` | AI 逐规则审查 | `references/sql-xml-rules.md` |

## 规则概览

### 基础规范（BASE-00001 ~ BASE-00012）

涵盖 N+1 查询、并发安全、内存泄漏、抽象泄漏、大型函数/文件、死代码、Null 风险、明文敏感信息、事务失效、API 设计等核心质量问题。

### 配置与脚本（JCR-00001 ~ JCR-00021）

涵盖明文敏感信息、生产配置保护、安全配置、SQL 脚本（DML 无 WHERE、SELECT *、DDL 破坏性变更）、高危删除命令、脚本安全执行选项等。

### 数据库 XML（SQL-00001 ~ SQL-00004）

针对 MyBatis mapper 文件，检查 SELECT *、DML 无 WHERE、`<where>` 标签导致条件失效、`${}` SQL 注入风险等。

## 目录结构

```
java-code-review/
├── SKILL.md                          # Skill 主指令文件
├── README.md                         # 本文件
├── assets/
│   ├── example-agent-output.md       # Agent 输出 JSON Schema 及示例
│   └── example-output.md             # 最终审查报告模板
├── references/
│   ├── base-rules.md                 # 基础规范规则（Java 代码）
│   ├── jcr-rules.md                  # 配置文件与脚本规则
│   └── sql-xml-rules.md              # 数据库 XML 规则（MyBatis）
└── scripts/
    ├── diff_scan.py                  # P3C 差异扫描脚本
    └── lib/                          # PMD + P3C 依赖 JAR
```

## 环境要求

- **Git**：用于分支差异对比
- **Java（JDK/JRE）**：P3C 静态分析依赖 PMD 引擎
- **Python 3**：运行 `diff_scan.py` 扫描脚本

## 扩展指南

本 Skill 的架构支持灵活扩展新的检查维度。扩展步骤：

### 1. 新增规则文件

在 `references/` 目录下创建新的规则文件，遵循统一格式：

```markdown
# 检查清单名称
> 规则编号采用 `XXX-00001` 形式递增。

## XXX-00001 规则名称
- 严重级别：Critical | Major | Minor
- 描述：问题描述
- 修复建议：具体修复方式
```

### 2. 在 SKILL.md 中注册 Agent

在阶段2中新增一个 Agent 定义，指定：
- 文件筛选的 `git diff --name-only` 命令
- 引用的规则文件路径
- 输出格式（遵循 `assets/example-agent-output.md`）

### 3. 未来演进方向

当前 Skill 的 Agent 数量是固定的（4 个）。未来可以演进为**动态 Agent 架构**：

- Skill 扫描 `<project>/.claude/code-review-rules/` 目录下所有规则文件
- 根据文件类型匹配规则，为每种匹配自动启动一个 Agent
- 实现"新增规则文件即自动生效"的插件化扩展

这种方式的好处是新增检查规则时，只需添加规则文件并配置文件匹配模式，无需修改 SKILL.md 主流程。
