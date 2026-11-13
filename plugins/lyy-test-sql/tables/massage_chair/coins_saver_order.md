---
table: coins_saver_order
database: massage_chair
domain: 娱乐
dbDictId: 10097
description: 存分业务订单表
use_cases:
  - 查询机器存币记录
---

# coins_saver_order

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | numeric(12,0) | 待补充 |
| order_id | character varying(32) | 业务单号 |
| equipment_value | character varying(40) | 设备编码 |
| equipment_id | numeric(12,0) | 设备id |
| store_id | numeric(12,0) | 场地id |
| merchant_id | numeric(12,0) | 商户id |
| equipment_type_id | numeric(12,0) | 设备类型id |
| equipment_type_value | character varying(16) | 设备类型标识 |
| coins | numeric(10,0) | 存分数量 |
| user_id | numeric(12,0) | 用户id |
| device_status | smallint | 设备状态 |
| order_status | smallint | 订单状态 |
| description | character varying(512) | 描述 |
| created | timestamp(6) without time zone | 待补充 |
| updated | timestamp(6) without time zone | 待补充 |
| equity_type | smallint | 权益类型 1:积分 |

## 查询规则

- 待补充

## 索引

- PK: id
- UNIQUE: (order_id, equipment_value)
- INDEX: (user_id, equipment_value, device_status, updated)
- INDEX: equipment_id
- INDEX: (store_id, merchant_id, created)
