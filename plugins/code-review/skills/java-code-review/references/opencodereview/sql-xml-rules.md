# SQL/XML 检查清单（OpenCodeReview）

## 审查与输出约定

- 本清单仅用于当前 <review_files> 中的 MyBatis Mapper XML（包括被映射语句引用的 SQL 片段）。先根据 mapper/select/insert/update/delete/sql 等结构确认文件用途；不因扩展名是 XML 就套用 SQL 检查，pom.xml 不审查。
- 仅对新增或修改的代码报告；历史代码和其他文件只作为核实依据。使用 file_read 阅读同文件映射语句、code_search/file_find 查找 Mapper 接口与调用方、file_read_diff 检查相关变更。需要数据库方言时，从依赖、数据源配置或需求背景确认，无法确认则不猜测。
- 核对 include、where、trim、if、choose、foreach 等标签处理后的有效 SQL，以及 Java 调用方的参数校验；不要把 XML 原文直接当成最终 SQL。只读代码检查不等于已经执行数据库 EXPLAIN、编译或集成测试。
- 通过 code_comment 提交问题。content 以 [SQL-000XX] 开头，仅用一到两句话说明问题与修复方向；正确的可替换片段才放入 suggestion_code。

## SQL-00001 禁止使用 SELECT *
- 原级别：Critical
- severity：high
- category：maintainability
- 判定：新增或修改的 MyBatis 查询使用 SELECT * 或表别名.* 返回全部字段，包括展开 include 后能够确定存在的全列投影。保留团队要求显式列名的约定。
- 排除：COUNT(*)、乘法运算、注释/字符串字面值；EXISTS 内只用于存在性判断且不返回业务字段的 SELECT * 不按全列结果传输问题报告。
- 影响：按实际场景说明返回字段契约、冗余数据或维护成本，不声称增加任意列必然导致映射失败。
- 修复：显式列出所需字段，必要时复用 Base_Column_List 片段，保留已有别名和映射约定。

## SQL-00002 DML 缺失 WHERE 条件
- 原级别：Critical
- severity：high
- category：bug
- 判定：展开 SQL 片段和动态标签后，UPDATE/DELETE 存在可到达的全表操作路径，且缺少合理的业务范围保护。不能只在当前 diff hunk 中搜索 WHERE 就下结论。
- 排除：条件在 include/固定片段中，或按目标方言使用有效的 JOIN/USING 等限定；有明确授权和保护的全量维护操作不虚构为意外误删。
- 修复：增加必需的业务/主键条件并校验参数，明确影响行数和失败处理；不能只加一个可为空的可选条件。

## SQL-00003 DML 条件完全被 <where> 标签包裹导致条件失效
- 原级别：Critical
- severity：high
- category：bug
- 判定：UPDATE/DELETE 的全部限制条件都是可选动态分支，并存在调用方可传入的参数组合让它们全部不成立，最终生成无范围限制的语句。说明至少一个具体可达参数组合，并核对调用前校验。
- 排除：固定必需条件、保证生成限制条件的 choose/otherwise、调用方已强制校验且无法绕过。无法证明空条件路径可达时不推断必然全表更新。
- 修复：保留不可省略的业务限定，或在调用边界拒绝空条件；不能把“出现 <where>”本身当成问题。

## SQL-00004 SQL 注入风险（${} 拼接）
- 原级别：Critical
- severity：high
- category：security
- 判定：${} 或其他直接字符串拼接进入 SQL，且可从 Mapper 参数与调用链确认内容受外部输入控制、没有有效白名单约束。说明输入来源和具体拼接位置。
- 排除：正确使用 #{} 参数绑定、固定常量、严格枚举/白名单控制的动态表名或列名。仅出现 ${} 不足以证明漏洞。
- 修复：普通值使用 #{}；无法参数化的标识符采用固定映射或严格白名单。不要把表名/排序方向简单替换成值占位符而生成无效 SQL。
