---
table: system_charge_equipment_bill
database: commercial_charges
domain: 充电桩
dbDictId: 10089
description: 设备缴费单表
use_cases:
  - 收费规则
---

# system_charge_equipment_bill

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| system_charge_equipment_bill_id | numeric(11,0) | 待补充 |
| lyy_equipment_id | numeric(10,0) | 设备ID |
| cost | numeric(10,0) | 成本价（分） |
| increase_price | numeric(10,0) | 提价（分） |
| charge_days | integer | 续费天数 |
| total_fee | numeric(10,0) | 缴费总额（分） |
| balance_fee | numeric(10,0) | 剩余缴费金额（分） |
| end_date | date | 当前到期日期 |
| next_end_date | date | 续费后到期日期 |
| status | integer | 状态：0未缴完；1已缴完 |
| created | timestamp(6) without time zone | 待补充 |
| updated | timestamp(6) without time zone | 待补充 |
| charge_type | integer | 收费类型: 0:按台收费,1:按GMV抽成收费 |
| charge_value | integer | 收费值-如果是比例，则是万分比，如果是固定金额则单位是分 |
| factory_increase_price_rate | numeric(10,2) | 工厂分成比例 |
| system_charge_rule_id | numeric(10,0) | 规则ID |

## 查询规则

- 待补充

## 参考 SQL

### 收费规则

```sql
select * from  system_charge_equipment_bill where lyy_equipment_id =1258164
```

## 索引

- PK: system_charge_equipment_bill_id
- INDEX: (lyy_equipment_id, end_date, status)
