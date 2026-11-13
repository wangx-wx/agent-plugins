---
table: wash_dimension_user_info
database: cmember
domain: 洗水
dbDictId: 10087
description: 洗水用户维度信息表
use_cases:
  - 查洗水商创活动退款
  - 投诉记录
---

# wash_dimension_user_info

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | numeric(12,0) | ID |
| user_id | numeric(10,0) | 商家ID |
| activity_info | jsonb | 活动相关信息 |
| created_time | timestamp without time zone | 创建时间 |
| updated_time | timestamp without time zone | 更新时间 |
| deleted | boolean | true表示已删除 |
| created_by | numeric(10,0) | 创建人 |
| updated_by | numeric(10,0) | 更新人 |

## 查询规则

- 待补充

## 索引

- PK: id
- UNIQUE: user_id
