---
table: family_equipment_vip
database: carcharging
domain: 汽充桩
dbDictId: 10131
description: 家充设备收费
use_cases:
  - 家充设备活动表
---

# family_equipment_vip

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | 主键id |
| equipment_code | character varying(64) | 设备号 |
| register_time | timestamp without time zone | 注册时间 |
| factory_id | bigint | 工厂id |
| vip_start_time | timestamp without time zone | vip开始时间 |
| vip_end_time | timestamp without time zone | vip过期时间 |
| created | timestamp without time zone | 创建时间 |
| created_by | bigint | 创建人 |
| updated | timestamp without time zone | 修改时间 |
| updated_by | bigint | 创建人 |
| organization_id | bigint | 组织Id |
| deleted | boolean | 软删除 |
| insurance_type | integer | 保险类型 0无1次卡2日卡,3月卡,4年卡 |
| insurance_start_time | timestamp without time zone | 保险开始时间 |
| insurance_end_time | timestamp without time zone | 保险结束时间 |
| guarantee_start_time | timestamp without time zone | 质保开始时间 |
| guarantee_end_time | timestamp without time zone | 质保结束时间 |
| extended_warranty_start_time | timestamp without time zone | 维修开始时间 |
| extended_warranty_end_time | timestamp without time zone | 维修结束时间 |
| vip_template_id | bigint | vip收费模板id |

## 查询规则

- 待补充

## 参考 SQL

### 家充设备活动表

```sql
select * from  family_equipment_vip where equipment_code ='880240422'
```

## 索引

- PK: id
- UNIQUE: equipment_code
