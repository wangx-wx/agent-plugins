# Java 审查规则：OpenCodeReview 适配版

本目录适配相邻的 java-rules.md、sql-xml-rules.md，共 21 条规则：Java 16 条、MyBatis XML 5 条。原文件和原 Skill 保持不变。

其中 JAVA-00016 与 SQL-00005 为 2026-10 误判复盘后新增，用于修复“规则集无编号可挂导致问题被挂到无关规则”的错挂问题；两份规则顶部同时补入了硬性证据要求。

jcr-rules.md（配置/SQL/脚本）已解除引用，不再参与 OpenCodeReview 审查；文件保留在本目录备查。原 Skill 中对应配置审查的部分保持不变。

适配依据：本地 OpenCodeReview 源码 fabbdb2。该版本支持 Markdown 文件规则、code_comment 工具和 severity/category，不支持规则级 severity/default_severity 或结构化 rule_id。

## 使用方式

推荐使用外部规则包，在待审查的 Java 仓库中运行。将 /absolute/path/to/opencodereview 替换为本目录绝对路径：

    ocr rules check --rule /absolute/path/to/opencodereview/rule.json src/main/java/com/example/OrderService.java
    ocr rules check --rule /absolute/path/to/opencodereview/rule.json src/main/resources/mapper/OrderMapper.xml
    ocr review --rule /absolute/path/to/opencodereview/rule.json --from origin/master --to HEAD --preview
    ocr review --rule /absolute/path/to/opencodereview/rule.json --from origin/master --to HEAD --background "本次变更的需求、输入约束、重试机制和部署环境" --format json --output /tmp/ocr-java-review.json

origin/master 为示例基线，按项目实际分支替换。旧 Skill 的 target 对应 OCR 的 --from，source 对应 --to；分支审查使用 merge-base 到目标提交的变更。第一次正式审查前，先用 rules check 核对最终正文，用 --preview 核对实际文件范围。

本 rule.json 的文件引用相对于该 JSON 所在目录，适用于显式 --rule。若要自动加载项目规则：把本目录中的两份规则 Markdown 和 rule.json 复制到待审查仓库的 .opencodereview/ 下，并将 rule.json 中两个 rule 值分别改成：

    .opencodereview/java-rules.md
    .opencodereview/sql-xml-rules.md

自动加载项目配置时，引用以仓库根目录为基准。不要复制后直接沿用外部规则包的相对路径，也不要用未经调整的项目版配置再传给 --rule。若目标仓库已有 rule.json，应按原配置顺序合并，不要覆盖已有规则。

## 严重程度与规则编号

| 原 blockLevel | OCR severity | 原门禁含义 |
|---|---|---|
| Blocker | critical | 阻断 |
| Critical | high | 阻断 |
| Major | medium | 不自动阻断 |
| Minor | low | 不自动阻断 |

这是本规则包约定的映射，不是 OCR 内置的 Blocker/Critical 转换。每条规则写明原级别、severity 和 category。模型应按该映射填充 code_comment，仍属于提示词约束，程序不会强制按规则编号重写级别。

规则编号写入 content 开头，例如 [JAVA-00008]。OCR 不会保存自定义的 ruleId、blockLevel、affectedScope 等顶层字段，所以影响范围、证据和修复建议应写进 content，原代码写入 existing_code，可用的修复片段写入 suggestion_code。

不要直接复用旧 Skill 的 JSON 数组输出模板。OCR 由 code_comment 收集问题，task_done 结束审查。SARIF 的 ruleId 在当前 OCR 实现中表示 category，不是 JAVA/SQL/JCR 编号。

## 范围与已知差异

- 三份正文均只审查新增或修改的代码；上下文用于核实，不为历史代码单独报问题。
- 使用 merge_system_rule: false，延续原审查 Agent 的“只用自定义规则”约定，避免同类问题被内置规则重复报告。若改为 true，会引入额外内置检查，并不只执行这里的 21 条规则。
- 两个路径规则以外的文件仍可能使用 OCR 的全局或内置规则。此配置不是全仓文件白名单；include 也不是白名单。需要更窄范围时，根据 --preview 结果增加 exclude。
- 保留原流程忽略 pom.xml、排除 Java 单元测试目录的约定。OCR 自身还会默认排除部分测试、生成代码、依赖和构建目录，与旧 Skill 的候选集合不完全相同。
- XML 入口收窄为 `**/{*Mapper.xml,mapper/**/*.xml}`，只覆盖以 Mapper.xml 结尾或位于 mapper 目录下的文件；其他 XML 不进入本规则，不再依赖正文识别。正文仍保留 MyBatis 用途识别，作为命中文件内部的二次守卫。收窄后的取舍：非 mapper 目录、又不以 Mapper.xml 结尾的 MyBatis XML（如 `src/main/resources/sqlmap/UserDao.xml`）不再命中本规则，必要时按实际目录补充 path。
- jcr-rules.md 已解除引用：.conf/.ddl/.dml 不在 OCR 默认扩展名白名单中，原先只能靠 include 纳入，现随本规则一并移除，不再审查。.yml/.yaml/.properties/.ini/.env/.sql/.sh/.bash/.zsh 仍在白名单内，会继续由 OCR 内置规则审查，只是不再套用本包的 JCR 规则。脚本、配置与 SQL 的团队专属检查不再由本包提供。
- OCR 会强制排除 .env/.env.* 敏感路径（特定示例文件除外），以及部分其他敏感路径，不能用 include 解除。本包没有尝试绕过该限制；凭据检查仅针对实际可读、可审查文件。
- 原 P3C/PMD 的 diff_scan.mjs 没有迁移进提示词。需要 P3C 时，单独运行原静态分析流程；本规则包不声称已经执行 PMD、编译、单元测试或数据库验证。
- 跨文件的规则编号引用只是关联说明，OCR 不会递归加载另一个 Markdown。每条规则在本文件中都具备独立的判定条件。
- 新增 JAVA-00016（异常处理缺陷）与 SQL-00005（强制类型转换与 JSON 取值安全）的背景：2026-10 的一次真实审查中，模型识别出的问题因规则集无对应编号，被挂到语义无关的 SQL-00003/JAVA-00006 上，造成“规则错挂”。补入这两类后，异常处理与类型转换问题有了正确的归属编号。两条规则都显式写明了与相邻规则（JAVA-00005、SQL-00002/00003）的边界，避免同一问题重复报告。
- 两份规则顶部新增的“证据要求”是硬性条款，用于降低推测性报告：报告类型/形态相关判断前必须 file_read 到声明点或写入点并在 content 中写明，读不到则不报。这是提示词约束，OCR 程序侧不会校验；若后续需要程序化保障，应在 OCR 中增加结构化 rule_id 与证据字段。
- 新增的 JAVA-00016、SQL-00005 与相邻规则划分了边界（JAVA-00005、SQL-00002/00003），同一处问题只按更贴切的一条报告。
- 原始 JAVA-00012「多实例基础设施 Bean 未显式区分」未迁移进适配版的 java-rules.md，适配版 Java 规则共 16 条。原规则中依赖 Grep 统计 Bean 定义与注入点的检查步骤未能直接映射到 OCR 工具集，如需保留该检查请补充独立的路径规则。

## 判定校正记录

| 规则 | 判定要点 |
|---|---|
| JAVA-00002 | 并发建议要求确认性能收益、数据依赖、事务/线程上下文和线程池限制，不把顺序 IO 一律当错误。 |
| JAVA-00004/00009 | 分层和 API 样式以明确的项目约定为依据；参数阈值统一为“超过 5 个”。 |
| JAVA-00005/00007/00008 | 要求证明 null 路径、共享并发访问或实际事务影响，避免仅因缺判空/同步/rollbackFor 报错。 |
| JAVA-00010/00011 | @Async/@Scheduled/监听器不等同于非 Spring 管理；混用 static 与实例注入本身不证明 NPE。只有实际非托管实例、初始化前访问或未赋值的 static 使用链才报错。 |
| JAVA-00012 | 区分 Redis KEYS、无边界删除和有明确范围的缓存失效；不把 @CacheEvict 中的冒号/星号直接解释成 Redis 通配符命令。 |
| JAVA-00013/00014 | 区分完整消息体与元信息，检查对象的实际日志表示和采样条件，同一条日志不重复报告。 |
| JAVA-00015 | 保留禁用 fastjson 1.x 的团队规则；不因任意 API 调用就宣称存在可利用的 RCE，明确排除 fastjson2。 |
| JAVA-00016 | 异常处理缺陷：捕获后静默、分支不完备、先报成功后失败三类。要求给出可达状态组合与后果，与 JAVA-00005 划清边界。 |
| SQL-00001/00002/00003 | 区分 SELECT * 与 COUNT(*)/EXISTS；展开动态 SQL 和 include 片段，核实无 WHERE 路径是否可达。 |
| SQL-00004 | 区分可控字符串插值、白名单标识符及安全参数绑定；按目标方言和动态标签处理确认语法。 |
| SQL-00005 | 强制类型转换与 JSON 取值安全：逐条核实写入方的实际类型，区分“字段缺失返回 NULL”（不报）与“内容非法”（需具体证据）。 |

正文中的级别标注才是实际生效值。

## 报告与门禁

原 Skill 的 Blocker/Critical 阻断条件对应 OCR 的 critical/high。使用项目自带的 GitLab 发布脚本时，可配置 OCR_FAIL_ON_SEVERITY=high；这属于集成脚本能力，不是 ocr review 的规则参数。

同时检查 status 和 manifest.coverage。退出码 0、没有评论或“未命中规则”不代表所有文件已被完整审查。规则文本中的级别约定也不是硬性门禁保证；需要稳定绑定时，应在 OCR 中增加经过校验的规则标识与程序侧级别映射。

## 验证边界

本次适配检查 JSON 格式、规则编号完整性、级别映射、工具字段与文件引用。移除 jcr 规则与 include 后，已用 ocr v1.12.13 对代表性路径运行 ocr rules check 和 ocr review --preview 验证：.java 与 MyBatis XML 命中本包规则，.conf/.ddl/.dml 因 unsupported_ext 被排除，.sql/.yml/.properties/.sh 回落到内置规则。未运行真实模型审查。

当前环境未提供生产仓库，规则实际命中效果仍应在目标仓库中用 --preview 核对。
