---
table: system_charge_equipment
database: commercial_charges
domain: 充电桩
dbDictId: 10089
description: 系统收费设备表
use_cases:
  - 收费设备
---

# system_charge_equipment

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| system_charge_equipment_id | numeric(10,0) | 待补充 |
| system_charge_rule_id | numeric(10,0) | 对应系统收费规则表ID |
| agent_user_id | numeric(10,0) | 代理商ID |
| lyy_distributor_id | numeric(10,0) | 商家ID |
| lyy_equipment_group_id | numeric(10,0) | 场地ID |
| lyy_equipment_type_id | numeric(10,0) | 设备类型ID |
| lyy_equipment_id | numeric(10,0) | 设备ID |
| equipment_value | character varying(32) | 设备编号 |
| first_registration_date | timestamp(6) without time zone | 设备首次注册时间 |
| end_date | date | 设备过期日期 |
| created | timestamp(6) without time zone | 待补充 |
| updated | timestamp(6) without time zone | 待补充 |
| flow_card_end_date | timestamp(6) without time zone | 流量卡到期时间 |
| is_confirm | smallint | 是否确认(0:未确认,1:已确认) |

## 查询规则

- 待补充

## 参考 SQL

### 收费设备

```sql
select * from  system_charge_equipment where equipment_value ='87150504'
```

## 索引

- PK: system_charge_equipment_id
- UNIQUE: lyy_equipment_id
- INDEX: (agent_user_id, end_date)
- INDEX: (lyy_distributor_id, end_date)
- INDEX: (lyy_equipment_id, end_date)
- INDEX: equipment_value
