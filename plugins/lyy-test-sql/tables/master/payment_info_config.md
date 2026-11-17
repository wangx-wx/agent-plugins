---
table: adempiere.payment_info_config
database: master
domain: 支付
dbDictId: 10099
description: 支付信息配置表
use_cases:
  - 查appid路由配置
---

# payment_info_config

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | 待补充 |
| distributor_id | bigint | 商户id |
| channel_code | smallint | 渠道编号 |
| merchant_code | character varying(255) | 渠道商户号 |
| config_value | character varying(255) | 配置的值 |
| config_type | smallint | 配置类型 1=appid配置 2=支付目录配置 |
| status | smallint | 状态 0=初始 1=处理中 2=成功 3=失败 4=无效 |
| card_id | bigint | 商户资料id |
| out_app_id | character varying(64) | 接入方系统id |
| extend_info | jsonb | 扩展信息，json 格式 |
| created | timestamp without time zone | 创建时间 |
| updated | timestamp without time zone | 修改时间 |
| created_by | bigint | 创建人 |
| updated_by | bigint | 修改人 |
| deleted | boolean | 逻辑删除标识 false=有效 true=删除 |

## 查询规则

- 待补充

## 参考 SQL

### 查appid路由配置

```sql
select * from payment_info_config where distributor_id = 2267406
```

## 索引

- PK: id
- UNIQUE: (distributor_id, channel_code, merchant_code, config_value, config_type)
- INDEX: (channel_code, config_value, config_type)
