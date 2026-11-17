---
table: receipt_bill_detail
database: commercial_charges
domain: 中台
dbDictId: 10089
description: 账单明细表
use_cases:
  - 查询账单明细
---

# receipt_bill_detail

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | 账单明细详情id |
| receipt_bill_id | bigint | 收款账单id |
| merchant_id | numeric(12,0) | 商户id |
| merchant_type | smallint | 商户类型 0=运营商 1=代理商 |
| batch_no | character varying(32) | 批次号 |
| product_id | bigint | 产品id |
| product_code | character varying(64) | 产品code |
| product_name | character varying(64) | 产品名称 |
| product_charging_policy_id | bigint | 计费规则id |
| pay_type | character varying(64) | 支付方式 1:主动缴费,2:线下缴费,3:平台代扣,4:自动缴费,5:代理商缴费 |
| charge_type | character varying(2) | 收费类型 1:预付费,2:后付费 |
| bill_start_time | timestamp(6) without time zone | 账单开始时间 |
| bill_end_time | timestamp(6) without time zone | 账单结束时间 |
| bill_close_time | timestamp(6) without time zone | 账单关闭时间 |
| bill_deadline | timestamp(6) without time zone | 账单截止时间 |
| original_amount | numeric(10,2) | 原始金额 |
| discount_amount | numeric(10,2) | 优惠金额 |
| receivable_amount | numeric(10,2) | 应收金额 |
| received_amount | numeric(10,2) | 实收金额 |
| owed_amount | numeric(10,2) | 欠费金额 |
| refund_amount | numeric(10,2) | 退款金额 |
| bill_status | character varying(2) | 状态 0:出账中 1:已出账 2:部分结清 3:已结清 |
| description | character varying(64) | 描述信息 |
| remark | character varying(64) | 备注 |
| created | timestamp(6) without time zone | 创建时间 |
| createdby | numeric(10,0) | 创建人 |
| updated | timestamp(6) without time zone | 更新时间 |
| updatedby | numeric(10,0) | 更新人 |

## 查询规则

- 待补充

## 参考 SQL

### 查询账单明细

```sql
select * from receipt_bill_detail where merchant_id ='1095114'and product_code='SAAS' order by created desc
```

## 索引

- PK: id
- INDEX: receipt_bill_id
- INDEX: merchant_id
- INDEX: bill_status
- INDEX: (bill_start_time, bill_end_time)
