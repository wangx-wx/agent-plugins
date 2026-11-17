---
table: refund_order_info
database: order
domain: 洗水
dbDictId: 10166
description: 乐摇摇订单退款信息
use_cases:
  - 查订单退款信息
---

# refund_order_info

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| out_trade_no | varchar(32) | 交易订单号 |
| refund_no | varchar(32) | 退款单号 |
| user_id | bigint(11) | 用户id |
| distributor_id | bigint(11) | 商户id |
| order_amount | decimal(11,2) | 订单金额 |
| refund_amount | decimal(11,2) | 退款金额 |
| refund_detail | json | 退款详情 |
| status | tinyint(255) | 退款状态 1:退款中 2:退款成功 3:退款失败 |
| refund_reason | varchar(255) | 退款原因 |
| refund_time | timestamp | 退款发起时间 |
| refund_success_time | timestamp | 退款成功时间 |
| refund_type | tinyint(255) | 退款类型 1:自动退款 2:手动退款 |
| goods_detail | json | 退款商品详情 |
| id | bigint(11) | 待补充 |
| create_by | bigint(11) | 创建人id |
| cashier | varchar(32) | 操作人名称 |
| terminal_id | bigint(11) | 终端设备id |
| terminal_name | varchar(32) | 终端设备名称 |
| create_time | timestamp | 待补充 |
| update_time | timestamp | 待补充 |
| update_by | bigint(11) | 修改人 |
| organization_id | bigint(11) | 组织id |
| business_type | smallint(255) | 待补充 |
| deduction_amount | decimal(11,2) | 退抵扣金额 |
| store_id | bigint(11) | 店铺id |
| refund_order_no | varchar(64) | 退款单号（废弃，用refund_no） |
| remark | varchar(255) | 备注 |
| common_extend | json | 扩展信息 |
| extend_str | varchar(1024) | 业务扩展字段 |
| def1 | varchar(256) | 待补充 |
| refund_source | tinyint(4) | 退款来源 |
| def3 | varchar(128) | 待补充 |
| def4 | bigint(12) | 待补充 |
| def11 | tinyint(4) | 待补充 |
| def2 | tinyint(4) | 待补充 |
| def13 | bigint(20) | 待补充 |
| def14 | bigint(20) | 待补充 |
| def5 | varchar(255) | 待补充 |
| def6 | varchar(255) | 待补充 |
| marketing_detail | json | 营销详情 |
| def8 | json | 待补充 |
| def9 | decimal(11,2) | 待补充 |
| def10 | decimal(11,2) | 待补充 |

## 查询规则

- 待补充

## 参考 SQL

### 查订单退款信息

```sql
select *  from refund_order_info roi where distributor_id ='2347269' and refund_success_time >'2025-11-03 00:00:00' and refund_success_time <'2025-11-04 00:00:00'
```

## 索引

- PK: (id, refund_time)
- UNIQUE: (refund_no, refund_time)
- UNIQUE: (id, refund_time)
- INDEX: (distributor_id, refund_time)
- INDEX: create_time
- INDEX: out_trade_no
- INDEX: update_time
- INDEX: (refund_time, store_id)
- INDEX: user_id
