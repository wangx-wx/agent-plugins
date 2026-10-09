---
name: adp-search-knowledge
description: "This skill should be used when the user wants to search or retrieve knowledge from a Tencent Cloud ADP (formerly LKE) knowledge base via the SearchKnowledgeRelease API. It covers the full workflow: obtaining API credentials, resolving the target application (must be in 'running' status), checking document EnableScope before first search, calling SearchKnowledgeRelease to retrieve knowledge, and guiding users when no results are found. Important: this API only supports searching apps (AppBizId), not shared knowledge bases (KnowledgeBizId) directly, and the app must be in 'running' status. Triggers include mentions of SearchKnowledgeRelease, ADP knowledge search, LKE knowledge retrieval, knowledge base search, semantic search, document search, or requests to search/query/retrieve knowledge from a Tencent Cloud agent knowledge base."
disable-model-invocation: true
---

# Tencent Cloud ADP（智能体开发平台）- SearchKnowledgeRelease 知识检索

> **ADP 知识库管理系列 Skill** | 本 Skill 是 ADP 知识库能力系列之一，专注于**发布域知识检索**。在 SkillHub / ClawHub 中搜索 `tencentcloud-adp` 可找到系列中的其他 Skill（如文档上传、列表查询、属性修改、预览下载、删除等），组合使用可获得完整的 ADP 知识库管理能力。

## 概述

本技能提供 Tencent Cloud ADP（智能体开发平台）知识库知识检索的完整工作流，包含：
- 引导用户获取和安全存储 ADP API Key
- 通过 `ListApp` 获取应用列表让用户选择目标应用
- **首次检索前的必要检查**：调用 `ListDoc` + `DescribeDoc` 检查文档的 `EnableScope`（生效范围），确认文档在发布域可被检索到
- 调用 `SearchKnowledgeRelease` 执行知识检索
- 检索无结果时的诊断与提示

> **调用方式说明**：本 Skill 通过 ADP 平台的插件 API 调用，使用 HTTP POST + Bearer Token 认证，无需腾讯云 SDK。

> **重要限制**：
> 1. `SearchKnowledgeRelease` 接口**只能检索应用（App）的知识库**，必须传入 `AppBizId`（应用 ID），**不支持直接传入共享知识库的 `KnowledgeBizId`**。如果需要检索共享知识库中的内容，必须先找到一个**关联了该共享知识库且状态为"运行中"的应用**，然后用该应用的 `AppBizId` 进行检索。
> 2. **应用必须处于「运行中」状态**才能被检索。未上线、已停用或其他非运行状态的应用，即使知识库中有文档且 EnableScope 正确，`SearchKnowledgeRelease` 也无法返回任何结果。
> 3. `SearchKnowledgeRelease` 接口**只能检索发布域（Release）的知识**。文档的 `EnableScope` 必须包含发布域（值为 `3` 或 `4`）才能被检索到。`EnableScope` 为 `1`（不生效）或 `2`（仅开发域）的文档无法被此接口检索。

> ⛔ **数据安全约束（贯穿全流程）**：本 Skill 中的 `--fix` 命令会修改用户文档的 `EnableScope` 属性。**Agent 绝对不允许在未经用户明确确认的情况下执行任何修改操作**。检查发现 EnableScope 问题后，必须先完整列出问题文档、告知用户影响，然后**等待用户明确同意**后才能执行修改。这是贯穿本 Skill 所有流程的铁律。

## 首次激活流程

> ⚠️ **必须先检查，严禁直接引导用户配置密钥。** 多数情况下密钥已存在，跳过检查直接提醒是错误行为。

### 密钥检查（强制执行，不可跳过）

首次激活时，Agent **必须**先执行以下检查，**静默完成，不输出任何提示给用户**：

```bash
# 步骤 1: 检查当前 shell 环境变量
echo $ADP_API_KEY

# 步骤 2: 如果为空，检查 /etc/environment 文件（可能存在但未加载到当前 shell）
grep "ADP_API_KEY" /etc/environment 2>/dev/null
```

**检查结果分支**：

- **✅ 找到密钥** → **流程结束，直接进入正常使用流程。** 不输出任何关于密钥的提示，不提醒用户，不引导配置。如果密钥在 `/etc/environment` 中但当前 shell 未加载，先执行 `source /etc/environment`。
- **❌ 未找到密钥** → 才进入下方「密钥获取流程」。

> 💡 **脚本已内置 fallback**：脚本会自动依次查找 `os.environ` → `/etc/environment` → `~/.env` → `.env`，即使当前 shell 未加载变量，脚本也能找到密钥。但 Agent 在执行脚本前仍建议先 `source /etc/environment`，确保后续命令行操作也能使用该变量。

---

### 密钥获取流程（仅在上方检查未找到密钥时执行）

> 🚫 **再次确认**：如果上方检查已找到密钥，**禁止执行本节**。

> ⚠️ **执行前必须读取 `references/credential_guide.md`**：下方步骤是精简流程，credential_guide.md 中包含**详细操作指引、异常分支处理**。在与用户交互过程中遇到任何非预期情况，都应参照 credential_guide.md 中的完整说明来应对。

#### 主流程

引导用户按以下步骤操作：

1. 访问 [ADP 密钥管理页面](https://adp.cloud.tencent.com/adp?spaceId=default_space#/key-manage?spaceId=default_space)
2. 点击「**新建密钥**」
3. 保存密钥，发送给 agent

> ⚠️ **注意**：密钥最多只能创建 **2 个**。如果提示已达上限，需要先删除旧的密钥再新建。

> 🔒 **必须展示的提示**：在引导用户访问上述链接时，**每次都必须同时告知用户**：如果无法访问该页面，说明当前账号权限不够，请联系管理员开通权限。

#### 兜底流程（主流程链接未正常跳转时）

如果上述链接没有正常跳转到密钥管理页面，引导用户：

1. 访问 [ADP 控制台](https://adp.cloud.tencent.com/)
2. 点击「**产品体验**」按钮
3. 使用主账号登录
4. 点击右上角**头像** → 「**企业管理**」 → 「**密钥管理**」
5. 点击「**新建密钥**」

### 密钥存储（仅在用户提供新密钥后执行）

用户提供密钥后，**优先**写入 `/etc/environment`（全局生效），如果没有 sudo 权限则**兜底**写入项目 `.env` 文件。

#### 主方案：写入 /etc/environment（推荐）

```bash
# 写入 /etc/environment（需要 sudo 权限，对所有用户和 shell 生效）
echo 'ADP_API_KEY=用户提供的密钥' | sudo tee -a /etc/environment > /dev/null
```

写入后，重新加载使当前会话生效：

```bash
source /etc/environment
```

#### 兜底方案：写入 .env 文件（无 sudo 权限时）

如果用户没有 sudo 权限，写入项目根目录的 `.env` 文件：

```bash
echo 'ADP_API_KEY=用户提供的密钥' >> .env
```

> ⚠️ **变量名必须为 `ADP_API_KEY`**，完全一致，不可更改，否则会影响 ADP 平台上的业务逻辑。

存储完成后，告知用户密钥已保存。

## 执行工作流

### 前置条件收集

执行 SearchKnowledgeRelease 需要以下信息：

| 信息 | 来源 | 说明 |
|:---|:---|:---|
| ADP API Key | 环境变量或用户提供 | ADP 平台密钥，用于 Bearer Token 认证 |
| AppBizId | 通过知识库目标定位流程确定 | 目标应用 ID。**必须是应用的 AppBizId**，不支持直接传入共享知识库的 KnowledgeBizId。如需检索共享知识库的内容，需找到一个关联了该共享知识库且状态为「运行中」的应用（详见下方"知识库目标定位流程"） |
| Question | 用户提供 | 要检索的问题 |

### 知识库目标定位流程（确定 AppBizId）

> ⚠️ **关键约束**：`SearchKnowledgeRelease` **只支持检索应用**，且应用必须处于**「运行中」**状态。不支持直接传入共享知识库 ID 进行检索。

ADP 中有两种知识库：
- **应用默认知识库**：每个智能体应用自带的知识库，使用应用的 `AppBizId`
- **共享知识库**：独立于应用、可被多个应用关联引用的知识库。**检索时不能直接用 `KnowledgeBizId`**，必须找到一个关联了该共享知识库且状态为「运行中」的应用，然后用该应用的 `AppBizId` 进行检索

在执行知识检索前，需要先确定目标知识库的 ID。根据用户的表述，按以下路径处理：

#### 第一步：判断用户意图

| 用户表述 | 意图判断 | 进入路径 |
|:---|:---|:---|
| "搜索知识库" / "帮我检索知识"（未指定目标） | 未明确目标 | → **路径 A** |
| "搜索 XX 应用的知识库" / "在 XX 智能体中检索" | 指定了应用，未指定哪个知识库 | → **路径 B** |
| "搜索 XX 知识库"（直接说知识库名） | 直接指定知识库名称 | → **路径 C** |
| "搜索某个共享知识库" / "检索共享知识库" | 明确说了"共享知识库" | → **路径 D** |
| 用户直接提供了 AppBizId 或 KnowledgeBizId | 已有 ID | → **直接使用** |

#### 路径 A：未明确目标

1. 使用 CLI 列出所有应用：

   ```bash
   python scripts/search_knowledge.py --list-apps
   ```

   > ⚠️ **展示时必须标注应用状态**，并明确告知用户：**只有「运行中」状态的应用才能被检索**。非运行中的应用（如"未上线"、"已停用"等）即使有文档也无法检索。建议在表格中用 ✅/❌ 标记是否可用于检索。
   >
   > 展示示例：
   > | 序号 | 名称 | 状态 | 可检索 | AppBizId |
   > |:---|:---|:---|:---|:---|
   > | 1 | 健身小助理 | 运行中 | ✅ | 2013214412592822848 |
   > | 2 | 儿童睡前童话故事 | 未上线 | ❌ | 2013208223167461952 |

2. 问用户："请选择目标应用（输入序号或名称），注意只有状态为「运行中」的应用才能进行知识检索"
   - 用户选了一个**运行中**的应用 → 进入**路径 B**（需进一步确认该应用下的具体知识库）
   - 用户选了一个**非运行中**的应用 → **明确告知**该应用无法检索，并引导用户发布上线（参见下方「应用发布上线引导」），或选择其他运行中的应用
   - 用户说"不在这里面" / "我要操作的是共享知识库" → 进入**路径 D**

#### 路径 B：指定了应用，需确定知识库

1. 确定应用的 `AppBizId`（用户提供或通过 `--list-apps` + 关键词匹配）
2. **检查应用状态**：确认该应用是否处于「运行中」状态。如果应用不是运行中状态，**必须告知用户**该应用无法用于知识检索，并引导用户发布上线（参见下方「应用发布上线引导」），或选择其他运行中的应用
3. 调用 `ListReferShareKnowledge` 查询该应用关联的共享知识库：

   ```python
   import requests, json
   APP_ID = "4270baf0-d5a6-4b9f-b29a-38cebc821753"
   url = f"https://adp.cloud.tencent.com/plugin/api/v1/{APP_ID}/6fd5da0f-5540-4ffd-a05c-805129f9857d"
   headers = {"Content-Type": "application/json", "Authorization": f"Bearer {api_key}"}
   payload = {"AppBizId": app_biz_id, "PageNumber": 1, "PageSize": 20}
   resp = requests.post(url, headers=headers, json=payload, timeout=60)
   data = resp.json()
   ```

   - **`Total == "0"`（无共享知识库）** → 直接用 `AppBizId`，无需多问
   - **`Total > "0"`（有共享知识库）** → 展示列表让用户选择：

     | 序号 | 知识库 | 类型 | ID |
     |:---|:---|:---|:---|
     | 1 | 默认知识库 | 应用默认 | AppBizId |
     | 2 | 共享知识库A | 共享 | KnowledgeBizId |
     | 3 | 共享知识库B | 共享 | KnowledgeBizId |

     用户选择后：
     - 选了"默认知识库" → 使用 `AppBizId`
     - 选了某个共享知识库 → **仍然使用当前应用的 `AppBizId`**（检索时，该应用关联的共享知识库中的内容也会被检索到）

#### 路径 C：直接指定知识库名称

1. 同时调用两个接口进行搜索：

   ```python
   import requests, json
   APP_ID = "4270baf0-d5a6-4b9f-b29a-38cebc821753"
   headers = {"Content-Type": "application/json", "Authorization": f"Bearer {api_key}"}

   # 搜索共享知识库
   url1 = f"https://adp.cloud.tencent.com/plugin/api/v1/{APP_ID}/88dce784-32d6-4689-a527-ec969d0f6228"
   resp1 = requests.post(url1, headers=headers, json={"PageNumber": 1, "PageSize": 20, "Keyword": "用户提供的名称"}, timeout=60)

   # 搜索应用
   url2 = f"https://adp.cloud.tencent.com/plugin/api/v1/{APP_ID}/2506ec47-456e-430c-9904-42a30ae27f3c"
   resp2 = requests.post(url2, headers=headers, json={"PageNumber": 1, "PageSize": 50, "Keyword": "用户提供的名称"}, timeout=60)
   ```

2. 合并结果：
   - 仅匹配到应用 → 进入**路径 B**
   - 仅匹配到共享知识库 → **不能直接用 `KnowledgeBizId` 检索**。需查看该共享知识库关联的应用列表（`AppList`），找到一个**状态为「运行中」的关联应用**，使用该应用的 `AppBizId` 进行检索。如果没有运行中的关联应用，需引导用户发布上线一个关联应用（参见下方「应用发布上线引导」）
   - 都匹配到 → 列出全部结果，让用户确认目标
   - 都没匹配到 → 提示用户检查名称，或列出全部应用和共享知识库让用户选择

#### 路径 D：明确要操作共享知识库

1. 调用 `ListSharedKnowledge` 列出所有共享知识库：

   ```python
   import requests, json
   APP_ID = "4270baf0-d5a6-4b9f-b29a-38cebc821753"
   url = f"https://adp.cloud.tencent.com/plugin/api/v1/{APP_ID}/88dce784-32d6-4689-a527-ec969d0f6228"
   headers = {"Content-Type": "application/json", "Authorization": f"Bearer {api_key}"}
   payload = {"PageNumber": 1, "PageSize": 20}
   resp = requests.post(url, headers=headers, json=payload, timeout=60)
   data = resp.json()
   # ⚠️ 注意：列表字段名为 KnowledgeList（非 List），每项可能是 JSON 字符串
   ```

2. 展示列表（序号、名称、关联应用、KnowledgeBizId）

   > 展示时建议包含关联应用信息，帮助用户辨认。例如：
   > | 序号 | 名称 | 关联应用 | KnowledgeBizId |
   > |:---|:---|:---|:---|
   > | 1 | 产品文档库 | 产品客服、内部问答 | kb_xxx |
   > | 2 | FAQ知识库 | 售后助手 | kb_yyy |

3. 用户选择后，**不能直接用 `KnowledgeBizId` 检索**。需从该共享知识库的 `AppList`（关联应用列表）中找到一个**状态为「运行中」**的应用，使用该应用的 `AppBizId` 进行检索：
   - **有运行中的关联应用** → 自动选择该应用的 `AppBizId`，告知用户："将通过应用「XXX」（AppBizId: xxx）来检索该共享知识库的内容"
   - **有关联应用但都不是运行中** → 告知用户："该共享知识库关联的应用均不处于运行中状态，需要先将其中一个应用发布上线后才能检索。"并给出发布操作引导（参见下方「应用发布上线引导」）
   - **没有关联应用** → 告知用户："该共享知识库尚未被任何应用关联，需要先在 ADP 控制台创建一个应用并关联此共享知识库，然后将该应用发布上线后才能检索。"并给出发布操作引导（参见下方「应用发布上线引导」）

#### 路径 E：用户没有任何应用和知识库

当执行路径 A/B/C/D 时，如果 `ListApp` 返回空列表（没有任何应用）且 `ListSharedKnowledge` 也返回空列表（没有任何共享知识库），说明用户尚未在 ADP 平台创建过应用或知识库。

此时需要引导用户先创建：

> 您当前的 ADP 平台上还没有任何应用或知识库。要使用文档管理功能，需要先创建一个。以下是两种方式，您可以根据需要选择：
>
> **方式一：新建智能体应用**（应用会自带一个默认知识库，适合同时需要智能体和知识库的场景）
> 1. 打开 [ADP 控制台](https://adp.cloud.tencent.com/) → **点击「产品体验」** 进入平台 → 左侧菜单「应用开发」→「新建应用」
> 2. 填写应用名称 → 点击「新建」
> 3. 📖 详细教程：[新建应用文档](https://cloud.tencent.com/document/product/1759/122982)
>
> **方式二：新建共享知识库**（独立知识库，可被多个应用关联，适合只需要知识库的场景）
> 1. 打开 [ADP 控制台](https://adp.cloud.tencent.com/) → **点击「产品体验」** 进入平台 → 左侧菜单「知识库」→「新建知识库」
> 2. 填写知识库名称 → 点击「新建」
> 3. 📖 详细教程：[新建共享知识库文档](https://cloud.tencent.com/document/product/1759/123551)
>
> 创建完成后，请告诉我，我将继续为您操作。

用户创建完成后，重新执行知识库目标定位流程。

#### CLI 命令速查

> 脚本使用位置参数 + 命名参数混合模式，以下命令可直接在终端执行。

| 需求 | 命令 |
|---|---|
| 检索知识库 | `python scripts/search_knowledge.py <AppBizId> "检索问题"` |
| 检查文档 EnableScope | `python scripts/search_knowledge.py <AppBizId> --check` |
| 修复 EnableScope（需确认） | `python scripts/search_knowledge.py <AppBizId> --fix` |
| 列出所有应用 | `python scripts/search_knowledge.py --list-apps` |
| 全局搜索文档 | `python scripts/search_knowledge.py --search-all 关键词` |

> **注意**：
> - 此接口只支持检索**应用**（App），必须传入 AppBizId，不支持直接传入共享知识库的 KnowledgeBizId。
> - 应用必须处于「运行中」状态才能被检索。
> - ⛔ `--fix` 会修改文档属性，**Agent 必须在用户明确确认后才能调用**。脚本本身也有交互确认（输入 y），双重保障。
> - 文档的 EnableScope 必须包含发布域（值为 3 或 4）才能被检索到。

#### 备选方式：在控制台 URL 中查找 AppBizId

1. 打开 [Tencent Cloud ADP 控制台](https://adp.cloud.tencent.com/) → **点击「产品体验」进入平台**
2. 进入"应用开发"页面，点击目标智能体应用
3. 在跳转后的页面 URL 中找到 `appid=` 参数，该参数值即为 AppBizId

例如，若页面 URL 为 `https://adp.cloud.tencent.com/adp/#/app/knowledge/app-config?appid=1234567890&spaceId=default_space`，则 AppBizId 为 `1234567890`。

> **注意**：此方式只能找到应用的 AppBizId，无法获取共享知识库的 KnowledgeBizId。共享知识库的 ID 需通过 `ListSharedKnowledge` 接口获取。

### 应用发布上线引导

当发现用户的应用不是「运行中」状态（如"未上线"、"编辑中"等），需要引导用户将应用发布上线。**必须将以下操作步骤和文档链接一起告知用户**：

> **如何将应用发布上线（变为「运行中」状态）**：
>
> 1. 打开 [ADP 控制台](https://adp.cloud.tencent.com/) → **点击「产品体验」** 进入平台
> 2. 在左侧菜单选择「**应用开发**」，找到目标应用，点击进入应用编辑页面
> 3. 在应用编辑页面，确认应用的基本配置已完成（如已选择生成模型、已上传知识库文档等）
> 4. 点击编辑器**右上角的「发布」按钮**
> 5. 在弹出的发布确认弹窗中，确认发布内容，点击「**确认发布**」
> 6. 发布成功后，应用状态将变为「**运行中**」，此时即可通过 `SearchKnowledgeRelease` 接口检索该应用的知识库
>
> 📖 **详细发布教程文档**（含控制台截图和分步骤说明，请发给用户对照操作）：
> - 应用发布上线：https://cloud.tencent.com/document/product/1759/104209
>
> ⚠️ **注意事项**：
> - 发布操作会将当前开发环境的应用配置同步到生产环境
> - 如果应用之前已发布过但被停用，可在「应用发布」页面重新启用
> - 发布后如需修改应用配置，修改后需要**重新发布**才能使更改在生产环境生效

### ⛔ 首次检索前的 EnableScope 检查（关键步骤 — 涉及数据修改，必须征得用户确认）

> ⛔ **铁律：禁止擅自修改用户文档的任何属性。** EnableScope 是用户的业务配置，Agent **绝对不允许**在未经用户明确确认的情况下调用 `--fix` 或以任何方式修改文档的 EnableScope。即使检查发现问题，也只能**报告问题并询问用户是否需要修改**，由用户决定是否执行。

**这是本 Skill 的核心差异点**。`SearchKnowledgeRelease` 接口**只能检索发布域的知识**，因此在首次执行检索之前，**必须**先检查目标应用中文档的生效范围（`EnableScope`），确保文档在发布域可被检索到。

可使用 CLI 快速检查：

```bash
python scripts/search_knowledge.py <AppBizId> --check
```

#### EnableScope 值说明

| EnableScope 值 | 含义 | 是否可被 SearchKnowledgeRelease 检索 |
|:---|:---|:---|
| 1 | 不生效 | ❌ 不可检索 |
| 2 | 仅开发域生效 | ❌ 不可检索 |
| 3 | 仅发布域生效 | ✅ 可检索 |
| 4 | 开发域和发布域均生效 | ✅ 可检索 |

#### 检查流程

1. **调用 `ListDoc` 获取文档列表**：获取应用下的所有文档
2. **抽样调用 `DescribeDoc` 检查 EnableScope**：对返回的文档（至少前 5 篇），逐一调用 `DescribeDoc` 查看其 `EnableScope` 属性
3. **根据检查结果做出响应**：

| 检查结果 | Agent 行为（⛔ 禁止擅自修改） |
|:---|:---|
| 全部文档的 EnableScope ≥ 3（包含发布域） | 直接继续执行检索，无需告知用户 |
| 部分文档的 EnableScope 为 1 或 2（不包含发布域） | ⛔ **禁止直接修改。** 必须先**完整列出**这些文档的文件名和当前 EnableScope 值，告知用户："以下 X 篇文档当前仅在开发域生效（EnableScope=1或2），`SearchKnowledgeRelease` 接口无法检索到这些文档的内容。"然后**明确询问用户**："是否需要将它们的 EnableScope 修改为 4（开发域+发布域均生效）？"**只有用户明确回答"是/确认/修改"后**，才能执行 `--fix` |
| 全部文档的 EnableScope 为 1 或 2 | ⛔ **禁止直接修改。** 必须**明确告知用户**："该应用的所有文档均未在发布域生效，`SearchKnowledgeRelease` 接口将无法检索到任何内容。"然后**询问用户**是否需要批量修改。**只有用户明确同意后**，才能执行 `--fix` |

> ⛔ **再次强调**：无论哪种情况，Agent 都**不得**在用户未明确确认前执行任何修改操作。"帮用户省事"不是理由——用户可能有意将某些文档限制在开发域。

#### 修改 EnableScope（仅在用户确认后执行）

**只有在用户明确确认需要修改后**，才能使用 CLI 修复：

```bash
python scripts/search_knowledge.py <AppBizId> --fix
```

此命令会列出所有 EnableScope 为 1 或 2 的文档，并**要求用户在终端交互确认（输入 y）** 后才会执行修改。即使 Agent 调用了此命令，脚本层面也会再次要求确认，双重保障。

> **重要**：`ModifyDoc` 接口的 `IsRefer` 和 `AttrRange` 为必填参数。脚本会先通过 `DescribeDoc` 获取当前值并自动回填，确保不会意外修改其他属性。

修改完成后，等待 2-3 秒让变更生效，然后再执行检索。

### 调用 SearchKnowledgeRelease

参考 `scripts/search_knowledge.py` 中的完整代码模板。直接使用 CLI 调用：

```bash
python scripts/search_knowledge.py <AppBizId> "检索问题"
```

#### 请求参数

| 参数 | 必选 | 类型 | 说明 |
|:---|:---|:---|:---|
| AppBizId | 是 | String | 应用 ID（必须是应用的 AppBizId，不支持共享知识库的 KnowledgeBizId） |
| Question | 是 | String | 检索的问题 |
| VisitorBizId | 否 | String | 访客 ID（标识当前会话用户） |
| CustomVariables | 否 | Array of CustomVariable | 自定义参数，用于设置检索范围（见下方说明） |

#### CustomVariables 用法

`CustomVariables` 可用于缩小检索范围，支持两种方式：

**1. 按标签检索**（需先在 ADP 控制台设置 API 参数与标签的映射关系）：
```json
{"Name": "department", "Value": "行政部|人力资源部"}
```

**2. 按文档范围检索**（按文档 ID 限定检索范围）：
```json
{"Name": "ADP_DOC_BIZ_ID", "Value": "文档ID1|文档ID2"}
```

#### 结果展示（重要：先回答问题，再附出处）

> ⚠️ **核心原则**：用户问的是一个问题，他期望得到的是**答案**，而不是一堆文档片段的搬运。检索到知识后，必须**先回答问题，再附出处**。

**检索到结果时，按以下两段式结构输出**：

**第一部分：回答问题**

基于检索到的所有知识片段，对用户的原始问题进行**综合归纳回答**：
- **严格基于检索到的内容**回答，不要加入知识库里没有的信息，不要编造
- 用自然流畅的语言组织答案，不要简单复制粘贴原文
- 如果多条知识片段涉及同一问题的不同方面，进行整合归纳
- 如果多条知识片段之间存在矛盾，需在回答中指出差异
- 如果检索到的内容不足以完整回答问题，诚实说明"根据知识库中的现有内容，只能回答以下部分"，并指出缺失的部分

**第二部分：附上参考来源**

在回答之后，列出检索到的原始知识片段作为出处依据，方便用户追溯验证：

```
📎 参考来源（共 N 条）：

[1] 类型: DOC/QA
    文档: xxx.doc
    内容摘要: xxx（截取关键段落）

[2] ...
```

**示例输出**：

```
根据知识库中的信息，关于您的问题"XXX"：

（这里是基于检索内容的综合回答，用自然语言组织）

---
📎 参考来源（共 2 条）：
[1] 文档: 产品使用手册.pdf | 内容摘要: ……
[2] 文档: FAQ.docx | 内容摘要: ……
```

**检索结果中的字段说明**：

| 字段 | 说明 |
|:---|:---|
| KnowledgeType | 知识类型：`QA`=问答对，`DOC`=文档片段 |
| KnowledgeId | 知识 ID（QA 为问答对 ID，DOC 为文档片段 ID） |
| Question | 检索到的问题（仅 QA 类型有效） |
| Content | 内容（QA 为答案，DOC 为文档片段） |
| Title | 文档标题（仅 DOC 类型有效） |
| RelatedDocId | 关联文档 ID（仅 DOC 类型有效） |
| KnowledgeBaseId | 知识所属知识库 ID |
| DocName | 文档名称（仅 DOC 类型有效） |

### 检索失败或无结果时的诊断（重要）

#### 接口返回错误时

当接口返回错误时，需检查错误信息是否包含 token、quota、limit、exceed、容量、资源、配额、超限、不足等关键词。如果匹配，说明**检索模型剩余 token 不足**或**套餐资源已耗尽**，必须引导用户购买付费套餐或增购资源包：

> **⚠️ 检索模型 token 不足**：该错误通常是因为未订阅 ADP 付费套餐，或已订阅但检索模型 token / PU 资源已耗尽。
>
> 解决方案：
> 1. 如果尚未订阅套餐：前往 [ADP 购买页](https://buy.cloud.tencent.com/adp) 订阅**专业版**或**企业版**套餐
> 2. 如果已有套餐但资源不足：在购买页增购**预付费资源包**（PU 资源包，规格：1万/10万/100万/1000万 PU，有效期 1 年）
> 3. 免费版用户不支持 PU 资源充值，需先升级为付费套餐
> 4. 详细购买流程见 [购买方式文档](https://cloud.tencent.com/document/product/1759/127528)

#### 检索返回空结果时

当检索返回空结果（`KnowledgeList` 为空或为 null）时，**不要简单地告诉用户"未找到结果"**，而是要主动进行诊断并给出可操作的建议：

#### 诊断步骤

1. **检查应用状态**：通过 `--list-apps` 确认当前使用的应用是否处于「运行中」状态。如果应用不是运行中状态，这是导致检索不到结果的最可能原因
2. **检查 EnableScope**：运行 `--check` 检查文档的 `EnableScope`，看是否有文档未在发布域生效
3. **检查文档状态**：查看文档的 `Status` 字段，确认文档是否已成功导入解析（Status=10 为导入完成）
4. **根据诊断结果提示用户**：

| 诊断结果 | 提示内容 |
|:---|:---|
| 应用不是「运行中」状态 | "当前应用状态为「XXX」，不是运行中状态。`SearchKnowledgeRelease` 接口**只能检索运行中的应用**。请按以下步骤将应用发布上线，或选择其他运行中的应用进行检索。"并给出发布操作引导（参见下方「应用发布上线引导」） |
| 存在 EnableScope 为 1 或 2 的文档 | ⛔ **禁止直接修改。** 先完整列出问题文档，告知用户："发现 X 篇文档未在发布域生效，这是导致检索不到的最可能原因。"然后**明确询问用户**："是否需要将这些文档的生效范围改为包含发布域？"**只有用户确认后**才能执行 `--fix` |
| 文档状态异常（非 10/3/9） | "发现 X 篇文档状态异常（如解析失败、审核失败等），这些文档的内容可能未被正确索引。建议先处理异常文档。" |
| EnableScope 正常且文档状态正常 | "文档生效范围和状态均正常，可能是检索词与知识库内容匹配度不高。建议：1）换用更具体或不同角度的检索词；2）确认知识库中确实包含相关主题的文档" |
| 知识库中无文档 | "该应用的知识库中暂无文档，请先上传文档后再进行检索" |

**安装依赖**：`pip install requests`

### API 参考

完整的接口参数说明、响应格式和错误码，参见 `references/api_docs.md`。

## 常见问题排查

| 错误现象 | 原因 | 解决方案 |
|:---|:---|:---|
| 401 Unauthorized | API Key 无效或未设置 | 检查 `ADP_API_KEY` 环境变量是否已正确配置，或重新获取密钥 |
| 检索返回空结果 | 应用不是「运行中」状态 | 按照「应用发布上线引导」操作将应用发布上线，或选择其他运行中的应用。📖 [应用发布文档](https://cloud.tencent.com/document/product/1759/104209) |
| 检索返回空结果 | 直接使用了共享知识库的 KnowledgeBizId 作为 AppBizId | SearchKnowledgeRelease 不支持直接传入共享知识库 ID，需找到关联该共享知识库且状态为运行中的应用，使用该应用的 AppBizId |
| 检索返回空结果 | 文档 EnableScope 未包含发布域 | 运行 `--check` 检查，**向用户确认后**再运行 `--fix` 修复（⛔ 禁止擅自修改） |
| 检索返回空结果 | 文档未成功导入/解析 | 检查文档状态，重试解析 |
| Code=3000003 / 配额不足 | 套餐资源已耗尽 | 前往 [ADP 购买页](https://buy.cloud.tencent.com/adp) 购买或增购套餐 |
| 检索模型 token 不足 / 容量不足 / 配额超限 / 资源不足 | 未订阅 ADP 付费套餐或 PU 资源已耗尽 | 1. 前往 [ADP 购买页](https://buy.cloud.tencent.com/adp) 订阅**专业版**或**企业版**套餐；2. 已有套餐可增购**预付费资源包**（PU 资源包）；3. 免费版不支持 PU 充值，需先升级。详见 [购买方式文档](https://cloud.tencent.com/document/product/1759/127528) |

> 如果遇到本 skill 未覆盖的问题，建议前往 [腾讯云 ADP 官方文档](https://cloud.tencent.com/document/product/1759) 搜索解决方案，或在 [ADP 控制台](https://adp.cloud.tencent.com/) 提交工单获取技术支持。
