---
table: adempiere.lyy_divide_merchant_info
database: master
domain: 支付
dbDictId: 10099
description: 分账商户信息
use_cases:
  - 查分账用户信息
---

# lyy_divide_merchant_info

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | 主键 |
| ad_org_id | bigint | 分成方商户ID |
| lyy_swiftpass_merchant_id | bigint | 资料ID |
| merchant_code | character varying(64) | 分成方商户号 |
| channel_code | smallint | 渠道编号 |
| channel_parent_merchant_code | character varying(64) | 渠道父级商户号或代理商号 |
| channel_data | jsonb | 渠道商户号附加数据 |
| status | integer | 状态 1-正常 其他不可用 |
| deleted | integer | 逻辑删除 1-删除 0-未删除 |
| create_time | timestamp without time zone | 创建时间 |
| create_by | bigint | 创建人 |
| update_time | timestamp without time zone | 修改时间 |
| update_by | bigint | 修改人 |
| auto_settle | character varying(30) | 结算类型 auto:自动结算 manual:手动结算 |
| withdraw_default | boolean | true-是 false-否 |

## 查询规则

- 待补充

## 索引

- PK: id
- UNIQUE: (ad_org_id, lyy_swiftpass_merchant_id, channel_code, channel_parent_merchant_code, auto_settle)
- INDEX: ad_org_id
