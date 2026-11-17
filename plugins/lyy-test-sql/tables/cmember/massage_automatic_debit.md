---
table: massage_automatic_debit
database: cmember
domain: 按摩
dbDictId: 10087
description: 按摩签约记录
use_cases:
  - 领取福利记录
---

# massage_automatic_debit

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | numeric(12,0) | 签约ID |
| order_no | character varying(64) | 乐摇摇订单号 |
| parent_id | numeric(12,0) | 父扣费流水ID |
| user_id | numeric(11,0) | 乐摇摇支付宝用户id |
| wechat_user_id | numeric(11,0) | 乐摇摇微信用户ID |
| merchant_id | numeric(11,0) | 商家id |
| store_id | numeric(11,0) | 场地id |
| equipment_value | character varying(32) | 设备编号 |
| equipment_type | numeric(11,0) | 设备类型 |
| product_type | smallint | 产品类型：1=超级VIP |
| phone_number | character varying(32) | 手机号码 |
| first_pay_amount | numeric(10,2) | 首笔金额 |
| first_debit_time | timestamp(6) without time zone | 首次签约时间 |
| debit_amount | numeric(10,2) | 扣费金额 |
| debit_time | timestamp(6) without time zone | 扣费时间 |
| start_time | timestamp(6) without time zone | 开始时间 |
| end_time | timestamp(6) without time zone | 到期时间 |
| cancel_time | timestamp(6) without time zone | 解约时间 |
| status | smallint | 0=未支付(签约未扣款) 1-支付成功(扣款成功) 2-支付失败(扣款失败) |
| third_order_no | character varying(64) | 渠道订单号 |
| promotion_activity_id | numeric(11,0) | 活动ID |
| order_source | smallint | 订单来源 0：微信 1：支付宝 |
| order_position | smallint | 订单触发位置：0：首页弹窗 1:首页套餐位置 |
| reward_config | jsonb | 奖励配置 |
| extend_info | jsonb | 扩展信息 |
| deleted | boolean | 待补充 |
| created | timestamp(6) without time zone | 待补充 |
| createdby | bigint | 待补充 |
| updated | timestamp(6) without time zone | 待补充 |
| updatedby | bigint | 待补充 |
| sign_channel | character varying(20) | 签约渠道 |
| client | character varying(20) | 签约用户权益客户端 |
| sign_user_id | numeric(11,0) | 签约用户ID |
| refund_status | smallint | 退款状态 0或者空=未退款 1=退款中 2=已退款 3=退款失败 |

## 查询规则

- 待补充

## 参考 SQL

### 领取福利记录

```sql
select * from massage_automatic_debit where  created >= '2026-3-3' and user_id = 2200012720 ;
```

## 索引

- PK: id
- INDEX: wechat_user_id
- INDEX: merchant_id
- INDEX: order_no
- INDEX: created
- INDEX: sign_user_id
- INDEX: (order_no, id)
