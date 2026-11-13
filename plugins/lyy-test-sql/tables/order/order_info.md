---
table: order_info
database: order
domain: 洗水
dbDictId: 10166
description: 乐摇摇订单信息
use_cases:
  - 查订单信息
---

# order_info

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| out_trade_no | varchar(32) | 交易订单号 |
| parent_no | varchar(32) | 父订单号 |
| order_type | tinyint(255) | 订单类型 1:普通订单 2:虚拟单 |
| user_id | bigint(11) | 用户id |
| distributor_id | bigint(11) | 商户id |
| store_id | bigint(11) | 店铺id |
| order_amount | decimal(11,2) | 订单金额 |
| actual_amount | decimal(11,2) | 实际金额 |
| marketing_detail | json | 营销详情 |
| status | tinyint(255) | 订单状态 1:待支付 2:已支付 3:退款中 4:已退款 5:已取消 6:未支付 7:已关闭 |
| trans_type | tinyint(255) | 交易类型 |
| business_type | smallint(255) | 业务编号 |
| create_time | timestamp | 订单创建时间 |
| goods_detail | json | 商品详情 |
| equipment_detail | json | 设备详情 |
| discount_detail | json | 优惠详情 |
| member_detail | json | 会员详情 |
| pay_detail | json | 支付详情 |
| client_type | tinyint(4) | 客户端类型 |
| pay_order_no | varchar(32) | 支付单号 |
| sub_order_num | int(2) | 子单数量 |
| id | bigint(11) | 待补充 |
| remark | varchar(255) | 订单备注 |
| operator | json | 操作人信息 |
| paid_amount | decimal(11,2) | 已付金额 |
| update_time | timestamp | 待补充 |
| create_by | bigint(11) | 创建人 |
| update_by | bigint(11) | 修改人 |
| organization_id | bigint(11) | 组织id |
| sales_order_no | varchar(50) | 销售单号 |
| extend_str | text | 业务扩展字段 |
| common_extend | text | 通用扩展字段 |
| refund_mark | tinyint(4) | 退款标记,1部分退款,2全部退款 |
| equipment_id | bigint(20) | 设备id |
| dealer_order_type | tinyint(4) | 订单分类(充值订单,消费订单,权益结算订单) |
| is_wallet_settlement | tinyint(4) | 是否资金池结算 |
| business_scene_merchant_id | bigint(20) | 经销商商户id |
| agent_merchant_id | bigint(20) | 代理商商户id |
| open_id | varchar(255) | 从member_detail取open_id存储 |
| def6 | varchar(255) | 待补充 |
| def7 | json | 待补充 |
| def8 | json | 待补充 |
| def9 | decimal(11,2) | 待补充 |
| def10 | decimal(11,2) | 待补充 |

## 查询规则

- 待补充

## 索引

- PK: (id, create_time)
- UNIQUE: (out_trade_no, create_time)
- INDEX: agent_merchant_id
- INDEX: business_scene_merchant_id
- INDEX: (distributor_id, create_time)
- INDEX: open_id
- INDEX: update_time
- INDEX: create_time
- INDEX: equipment_id
- INDEX: parent_no
- INDEX: user_id
