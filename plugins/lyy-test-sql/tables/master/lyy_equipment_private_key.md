---
table: adempiere.lyy_equipment_private_key
database: master
domain: 设备
dbDictId: 10099
description: 设备密钥
use_cases:
  - 查设备密钥
---

# lyy_equipment_private_key

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| lyy_equipment_private_key_id | numeric(10,0) | 主键id |
| unique_code | character varying(16) | 唯一码 |
| private_key | character varying(64) | 私钥 |
| password | character varying(32) | 密码 |
| ad_org_id | numeric(10,0) | 废弃 |
| ad_client_id | numeric(10,0) | 待补充 |
| isactive | character(1) | 待补充 |
| created | timestamp(6) without time zone | 待补充 |
| createdby | numeric(10,0) | 待补充 |
| updated | timestamp(6) without time zone | 待补充 |
| updatedby | numeric(10,0) | 待补充 |

## 查询规则

- 待补充

## 参考 SQL

### 查设备密钥

```sql
SELECT lyy_equipment_private_key_id, unique_code, private_key, password FROM adempiere.lyy_equipment_private_key WHERE unique_code=？;
```

## 索引

- PK: lyy_equipment_private_key_id
- UNIQUE: unique_code
