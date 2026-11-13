---
table: wash_product_order
database: cmember
domain: 洗水
dbDictId: 10087
description: 洗水产品订单表
use_cases:
  - 查洗水商创产品
---

# wash_product_order

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | numeric(11,0) | 待补充 |
| product_type | smallint | 产品类型 |
| out_trade_no | character varying(32) | 订单编号 |
| order_source | character varying(30) | 订单来源 |
| status | smallint | 订单状态  1 已支付 2 已退款 |
| merchant_id | numeric(11,0) | 商家ID |
| user_id | numeric(11,0) | 用户ID |
| equipment_value | character varying(32) | 设备编号 |
| store_id | numeric(11,0) | 场地ID |
| pay_detail | jsonb | 支付详情 |
| equipment_detail | jsonb | 设备详情 |
| product_detail | jsonb | 产品详情 |
| refund_time | timestamp without time zone | 退款时间 |
| refund_amount | numeric(11,2) | 待补充 |
| created_time | timestamp without time zone | 待补充 |
| updated_time | timestamp without time zone | 待补充 |
| deleted | boolean | 待补充 |
| created_by | numeric(10,0) | 待补充 |
| updated_by | numeric(10,0) | 待补充 |

## 查询规则

- 待补充

## 索引

- PK: id
- INDEX: (user_id, status, product_type, created_time)
- INDEX: (product_type, status, created_time)
- INDEX: out_trade_no
