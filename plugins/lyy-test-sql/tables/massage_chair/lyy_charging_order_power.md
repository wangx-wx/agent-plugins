---
table: lyy_charging_order_power
database: massage_chair
domain: 充电桩
dbDictId: 10097
description: 待补充
use_cases: 充电订单对应功率表
  - 充电订单对应功率过程
---

# lyy_charging_order_power

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | numeric(12,0) | 充电功率记录ID（主键） |
| charging_order_id | numeric(10,0) | 充电订单ID |
| charging_time | character varying(8) | 充电时间点（HH：SS 格式） |
| charging_power | numeric(8,0) | 充电功率(网络原因不能够上传默认为0) |
| create_time | timestamp(6) without time zone | 创建时间 |
| charging_electric | numeric(9,5) | 充电电量 |
| charging_temperature | numeric(10,2) | 温度 |
| charging_voltage | numeric(10,2) | 电压 |
| charging_current | numeric(10,2) | 电流 |
| created | timestamp(6) without time zone | 待补充 |

## 查询规则

- 待补充

## 索引

- 无（DDL 中未定义索引）
