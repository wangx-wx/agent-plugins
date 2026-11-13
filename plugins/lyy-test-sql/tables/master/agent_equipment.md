---
table: adempiere.agent_equipment
database: master
domain: 充电桩
dbDictId: 10099
description: 代理商设备表
use_cases:
  - 代理商设备表
---

# agent_equipment

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| agent_equipment_id | numeric(10,0) | 待补充 |
| lyy_equipment_id | numeric(10,0) | 待补充 |
| ad_user_id | numeric(10,0) | 待补充 |
| agent_user_id | numeric(10,0) | 待补充 |
| ad_org_id | numeric(10,0) | 待补充 |
| unique_code | character varying(64) | 待补充 |
| equipment_value | character varying(32) | 待补充 |
| equipment_type_name | character varying(32) | 待补充 |
| equipment_type_value | character varying(16) | 待补充 |
| created | timestamp(6) without time zone | 待补充 |
| createdby | numeric(10,0) | 待补充 |
| updated | timestamp(6) without time zone | 待补充 |
| updatedby | numeric(10,0) | 待补充 |
| bd_id | numeric(10,0) | 待补充 |
| secord_agent_user_id | numeric(10,0) | 待补充 |
| agent_equipment_status | character varying(8) | 待补充 |
| merchant_authority | numeric(2,0) | 待补充 |
| remark | character varying(200) | 备注 |
| current_agent_user_id | numeric(10,0) | 设备当前所属代理商id |

## 查询规则

- 待补充

## 索引

- PK: agent_equipment_id
- UNIQUE: equipment_value
- INDEX: current_agent_user_id
- INDEX: unique_code
- INDEX: lyy_equipment_id
- INDEX: ad_org_id
- INDEX: secord_agent_user_id
- INDEX: (agent_user_id, agent_equipment_id)
