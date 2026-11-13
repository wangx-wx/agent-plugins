---
table: receipt_bill
database: commercial_charges
domain: 中台
dbDictId: 10089
description: 收款账单表
use_cases:
  - saas
  - ai经营分析收款账单
---

# receipt_bill

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | 收款账单id |
| merchant_id | numeric(12,0) | 商户id |
| merchant_type | smallint | 商户类型 0=运营商 1=代理商 |
| charge_type | character varying(2) | 收费类型 1:预付费,2:后付费 |
| pay_type | character varying(64) | 支付方式 1:主动缴费,2:线下缴费,3:平台代扣,4:自动缴费,5:代理商缴费 |
| product_code | character varying(64) | 产品编码 |
| status | character varying(2) | 状态 1:已出账 2:部分结清 3:已结清 |
| close_time | timestamp(6) without time zone | 账单关闭时间 |
| settlement_completed_time | timestamp(6) without time zone | 账单结清时间 |
| receivable_amount | numeric(10,2) | 应收金额 |
| received_amount | numeric(10,2) | 实收金额 |
| owed_amount | numeric(10,2) | 欠费金额 |
| refund_amount | numeric(10,2) | 退款金额 |
| refund_status | character varying(2) | 退款状态 1未退款 2部分退款 3已退款 |
| sort | smallint | 扣款优先级，数值越小越优先 |
| bill_payment_start_time | timestamp(6) without time zone | 账单缴费开始时间 |
| created | timestamp(6) without time zone | 创建时间 |
| createdby | numeric(10,0) | 创建人 |
| updated | timestamp(6) without time zone | 更新时间 |
| updatedby | numeric(10,0) | 更新人 |
| account_id | numeric(12,0) | 账号id |
| merchant_product_id | numeric(12,0) | 商家产品记录id |
| marketing_config | jsonb | 营销配置 |
| func_config | jsonb | 服务功能配置 |

## 查询规则

- 待补充

## 索引

- PK: id
- INDEX: merchant_id
- INDEX: status
- INDEX: (charge_type, pay_type)
- INDEX: merchant_product_id
