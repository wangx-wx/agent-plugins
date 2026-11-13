---
table: xiaole_life_user_relate
database: lyy_infor
domain: 洗水
dbDictId: 10376
description: 小乐用户关联平台用户记录表
use_cases:
  - 查app用户与lyy
  - ls系统用户关联关系
---

# xiaole_life_user_relate

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | ID |
| subject_platform | character varying(20) | 接入主体所在平台:微信、支付宝、抖音等 |
| subject_app_id | character varying(64) | 接入主体应用id |
| subject_app_name | character varying(64) | 接入主体应用名称 |
| subject_app_secret | character varying(64) | 接入主体应用密钥 |
| main_user_id | bigint | 小乐应用主平台Id |
| open_id | character varying(64) | 开放平台用户Id |
| open_user_avatar | character varying(255) | 开放平台用户头像 |
| platform_user_id | character varying(64) | 关联的乐摇摇体系下的用户Id |
| status | smallint | 记录状态 |
| create_time | timestamp without time zone | 创建时间 |
| created_by | character varying(20) | 创建人 |
| update_time | timestamp without time zone | 更新时间 |
| updated_by | character varying(20) | 更新人 |
| deleted | boolean | 是否删除 |
| client_type | character varying(64) | 客户端,wechat,alipay |
| mark_singled | boolean | 是否已标记单通道 |
| is_default | boolean | 是否默认记录 |
| open_nickname | character varying(100) | 第三方昵称 |

## 查询规则

- 待补充

## 索引

- PK: id
- INDEX: (platform_user_id, deleted, create_time)
- INDEX: platform_user_id
- INDEX: (main_user_id, platform_user_id, subject_platform)
- INDEX: (main_user_id, subject_platform)
- INDEX: (platform_user_id, subject_platform)
