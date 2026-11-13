---
table: merchant_message_config
database: commercial_charges
domain: 中台
dbDictId: 10089
description: 商家消息配置
use_cases:
  - 经营快报
---

# merchant_message_config

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | integer | 主键id |
| merchant_id | numeric(12,0) | 商户id |
| receive_way | integer[] | 支持的消息接收方式,1:微信公众号 2:站内信 3:短信 |
| ad_user_id | numeric(12,0) | 账号id |

## 查询规则

- 待补充

## 索引

- PK: id
- INDEX: (merchant_id, ad_user_id)
