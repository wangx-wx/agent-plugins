---
table: system_charge_equipment_bill_flow
database: commercial_charges
domain: 充电桩
dbDictId: 10089
description: 设备缴费流水表
use_cases:
  - 收费流水
---

# system_charge_equipment_bill_flow

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| system_charge_equipment_bill_flow_id | numeric(11,0) | 待补充 |
| system_charge_equipment_bill_id | numeric(11,0) | 设备缴费单表ID |
| out_trade_no | character varying(64) | 支付订单号 |
| channel_code | smallint | 支付渠道号 |
| merchant_code | character varying(32) | 支付商户号 |
| time_end | timestamp(6) without time zone | 支付完成时间 |
| payment_amount | numeric(10,0) | 支付金额 |
| amount | numeric(10,0) | 流水金额（分） |
| ratio | numeric(4,2) | 扣减比例 |
| status | integer | 状态：0未支付；1待支付；2已支付；3退款 |
| agent_user_id | numeric(10,0) | 代理商ID |
| lyy_distributor_id | numeric(10,0) | 商家ID |
| from_equipment_id | numeric(10,0) | 来源设备ID |
| from_equipment_group_id | numeric(10,0) | 来源场地ID |
| from_distributor_id | numeric(10,0) | 来源商家ID |
| from_agent_user_id | numeric(10,0) | 来源代理商ID |
| created | timestamp(6) without time zone | 待补充 |
| updated | timestamp(6) without time zone | 待补充 |

## 查询规则

- 待补充

## 索引

- PK: system_charge_equipment_bill_flow_id
- INDEX: (lyy_distributor_id, time_end)
- INDEX: (created, lyy_distributor_id)
- INDEX: out_trade_no
- INDEX: (from_distributor_id, time_end)
- INDEX: system_charge_equipment_bill_id
- INDEX: status
