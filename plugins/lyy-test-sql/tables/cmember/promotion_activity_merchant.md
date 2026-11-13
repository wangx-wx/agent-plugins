---
table: promotion_activity_merchant
database: cmember
domain: 洗水
dbDictId: 10087
description: 洗水商家商创活动
use_cases:
  - 查洗水商家维度商创活动
---

# promotion_activity_merchant

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| promotion_activity_merchant_id | numeric(10,0) | 待补充 |
| merchant_id | numeric(10,0) | 商户id |
| merchant_name | character varying(128) | 商户名称 |
| merchant_phone | character varying(64) | 商户账号 |
| activity_id | numeric(10,0) | 活动id |
| activity_type | integer | 活动类型 |
| is_unique | smallint | 是否互斥1-是，2-否 |
| created | timestamp(3) without time zone | 待补充 |
| updated | timestamp(3) without time zone | 待补充 |
| createdby | numeric(10,0) | 待补充 |
| updatedby | numeric(10,0) | 待补充 |
| createdby_name | character varying(64) | 待补充 |
| merchant_config | jsonb | 商户配置 |
| status | smallint | null或0表示开启   1关闭状态 |

## 查询规则

- 待补充

## 索引

- PK: promotion_activity_merchant_id
- INDEX: (activity_id, merchant_id)
- INDEX: (merchant_id, activity_type)
