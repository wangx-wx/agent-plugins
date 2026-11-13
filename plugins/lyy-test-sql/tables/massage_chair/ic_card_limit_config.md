---
table: ic_card_limit_config
database: massage_chair
domain: 洗水
dbDictId: 10097
description: ic卡使用限制配置表
use_cases:
  - 查ic卡限额信息
---

# ic_card_limit_config

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | numeric(12,0) | 待补充 |
| merchant_id | numeric(12,0) | 商家ID |
| store_id | numeric(12,0) | 场地ID |
| day_limit_amount | numeric(11,2) | 日限制使用金额 |
| month_limit_amount | numeric(11,2) | 日限制使用金额 |
| create_time | timestamp without time zone | 创建时间 |
| update_time | timestamp without time zone | 更新时间 |
| update_by | numeric(12,0) | 待补充 |
| create_by | numeric(12,0) | 创建人 |
| deleted | boolean | 待补充 |

## 查询规则

- 待补充

## 索引

- PK: id
- INDEX: store_id
