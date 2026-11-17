---
table: adempiere.equipment_charging_type
database: master
domain: 充电桩
dbDictId: 10099
description: 充电桩场地配置信息
use_cases:
  - 场地配置信息
---

# equipment_charging_type

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| equipment_charging_type_id | numeric(11,0) | 主键 |
| lyy_equipment_group_id | numeric(11,0) | 场地ID |
| charging_type | smallint | 充电桩类型 |
| refund_type | smallint | 是否退款：0:不退款，1:退款，2限时退款 |
| limit_time | smallint | 限制时间（分钟） |
| time_out_refund | boolean | 是否开启超时退款 |

## 查询规则

- 待补充

## 参考 SQL

### 场地配置信息

```sql
select * from equipment_charging_type where lyy_equipment_group_id =1120128
```

## 索引

- PK: equipment_charging_type_id
- UNIQUE: (lyy_equipment_group_id, charging_type)
- INDEX: lyy_equipment_group_id
