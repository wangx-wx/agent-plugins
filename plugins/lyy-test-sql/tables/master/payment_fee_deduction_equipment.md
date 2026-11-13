---
table: adempiere.payment_fee_deduction_equipment
database: master
domain: 支付
dbDictId: 10099
description: 支付手续费扣减设备信息
use_cases:
  - 查手续费外扣
---

# payment_fee_deduction_equipment

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | id, 主键 |
| distributor_id | numeric(11,0) | 商户id |
| distributor_name | character varying(32) | 运营商名称,注册时的商户名称 |
| equipment_value | character varying(40) | 设备编号 |
| equipment_type_value | character varying(32) | 设备类型编码 |
| deduction_merchant_code | character varying(32) | 外扣商户号 |
| fee_member_id_code | character varying(32) | 手续费承担方证件id |
| fee_member_principal_name | character varying(40) | 手续费承担方主体名称 |
| out_app_id | character varying(64) | 接入方outAppId |
| status | smallint | 状态 0-不可用 1-可用 |
| create_time | timestamp(6) without time zone | 待补充 |
| update_time | timestamp(6) without time zone | 待补充 |
| create_by | bigint | 待补充 |
| update_by | bigint | 待补充 |

## 查询规则

- 待补充

## 索引

- PK: id
- UNIQUE: (equipment_value, deduction_merchant_code)
