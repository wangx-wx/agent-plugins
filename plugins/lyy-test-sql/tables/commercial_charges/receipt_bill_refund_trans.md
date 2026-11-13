---
table: receipt_bill_refund_trans
database: commercial_charges
domain: 中台
dbDictId: 10089
description: 收款账单退款交易表
use_cases:
  - 账单退款表
---

# receipt_bill_refund_trans

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | 交易id |
| refund_no | character varying(32) | 退款单号 |
| merchant_id | numeric(12,0) | 商家id |
| refund_amount | numeric(10,2) | 退款金额 |
| finished_time | timestamp(6) without time zone | 交易完成时间 |
| trans_no | character varying(32) | 交易单号 |
| status | character varying(2) | 状态 1:退款中 2:已退款 3:退款失败 |
| created | timestamp(6) without time zone | 创建时间 |
| createdby | numeric(10,0) | 创建人 |
| updated | timestamp(6) without time zone | 更新时间 |
| updatedby | numeric(10,0) | 更新人 |
| remark | character varying(512) | 备注 |
| refund_type | character varying(64) | 退款类型 1订单退款 2手动退款 |

## 查询规则

- 待补充

## 索引

- PK: id
- INDEX: (merchant_id, created)
- INDEX: trans_no
- INDEX: refund_no
