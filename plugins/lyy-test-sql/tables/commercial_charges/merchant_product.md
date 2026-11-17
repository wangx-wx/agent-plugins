---
table: merchant_product
database: commercial_charges
domain: 中台
dbDictId: 10089
description: 商家产品表
use_cases:
  - saas、ai经营分析账单
---

# merchant_product

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | id |
| merchant_id | numeric(12,0) | 商家id |
| merchant_type | smallint | 商户类型 0:运营商 1:代理商 |
| product_code | character varying(64) | 产品编码 |
| product_id | bigint | 产品id |
| policy_type | character varying(2) | 计费规则类型 |
| pre_notice_date | date | 提醒日期 |
| func_downgrade_date | date | 功能降级日期 |
| auto_pay_style | character varying(64) | 自动扣款方式 |
| auto_pay | character varying(2) | 自动扣费:0:是 1:否 |
| renewal_status | character varying(2) | 续费状态 0:续费成功 1:续费失败 2:续费失败功能降级 |
| status | character varying(2) | 状态 0:使用中 1:自然终止 2:主动终止 |
| created | timestamp(6) without time zone | 创建时间 |
| createdby | numeric(10,0) | 创建人 |
| updated | timestamp(6) without time zone | 更新时间 |
| updatedby | numeric(10,0) | 更新人 |
| remark | character varying(512) | 备注 |
| account_id | numeric(12,0) | 订阅账号id |
| enjoy_service_account_id | numeric(12,0) | 享受服务账号id |
| experience_end_time | timestamp without time zone | 体验结束时间 |
| subscribe_start_time | timestamp without time zone | 订阅开始时间 |
| service_end_time | timestamp without time zone | 服务结束时间 |
| subscribe_end_time | timestamp without time zone | 订阅结束时间 |
| func_config | jsonb | 服务功能配置 |
| product_config | jsonb | 产品配置 |
| max_bill_end_time | timestamp without time zone | 最大账单账期结束时间 |
| extend_info | jsonb | 扩展信息，autoGray:自动转企业版，fallbackNormal:恢复普通版 |

## 查询规则

- 待补充

## 参考 SQL

### saas、ai经营分析账单

```sql
select * from merchant_product where merchant_id =1094781 and product_code ='SAAS' order by created desc;
```

## 索引

- PK: id
- INDEX: (merchant_id, product_code)
- INDEX: pre_notice_date
- INDEX: product_id
