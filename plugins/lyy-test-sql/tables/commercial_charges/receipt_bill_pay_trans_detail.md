---
table: receipt_bill_pay_trans_detail
database: commercial_charges
domain: 中台
dbDictId: 10089
description: 收款账单支付交易表
use_cases:
  - 查询账单支付交易详情表
---

# receipt_bill_pay_trans_detail

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | 交易id |
| receipt_bill_pay_trans_id | bigint | 收款账单支付交易id |
| receipt_bill_id | bigint | 收款账单id |
| receipt_bill_detail_id | bigint | 收款账单详情id |
| trans_no | character varying(32) | 交易单号 |
| merchant_id | numeric(12,0) | 商家id |
| amount | numeric(10,2) | 交易金额 |
| trans_finished_time | timestamp(6) without time zone | 交易完成时间 |
| pay_order_no | character varying(32) | 账单支付渠道单号 |
| pay_type | character varying(2) | 支付方式 1:主动缴费,2:线下缴费,3:平台代扣,4:自动缴费,5:代理商缴费 |
| status | character varying(2) | 状态 1:支付中 2:已支付 3:支付失败 |
| created | timestamp(6) without time zone | 创建时间 |
| createdby | numeric(10,0) | 创建人 |
| updated | timestamp(6) without time zone | 更新时间 |
| updatedby | numeric(10,0) | 更新人 |
| remark | character varying(512) | 备注 |

## 查询规则

- 待补充

## 索引

- PK: id
- INDEX: (merchant_id, created)
- INDEX: receipt_bill_id
- INDEX: receipt_bill_detail_id
- INDEX: trans_no
