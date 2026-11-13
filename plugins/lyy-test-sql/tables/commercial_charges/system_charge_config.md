---
table: system_charge_config
database: commercial_charges
domain: 充电桩
dbDictId: 10089
description: 系统收费配置表
use_cases:
  - 收费配置
---

# system_charge_config

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| system_charge_config_id | numeric(10,0) | 主键id |
| lyy_equipment_type_id | numeric(10,0) | 设备类型 |
| agent_user_id | numeric(10,0) | 代理商ID |
| lyy_distributor_id | numeric(10,0) | 商户ID |
| cost | numeric(10,0) | 成本价(分) |
| status | numeric(2,0) | 状态   0：生效  1：无效 |
| customer_type | integer | 客户类型,总控(1),白名单(2) |
| charge_days | integer | 续费天数 |
| charge_type | numeric(2,0) | 收费类型: 0:按台收费,1:按GMV抽成收费 |
| createdby | numeric(10,0) | 创建人 |
| created | timestamp(6) without time zone | 创建时间 |
| updatedby | numeric(10,0) | 更新人 |
| updated | timestamp(6) without time zone | 更新时间 |

## 查询规则

- 待补充

## 索引

- PK: system_charge_config_id
