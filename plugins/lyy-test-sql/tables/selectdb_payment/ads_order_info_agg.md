---
table: ads_order_info_agg
database: selectdb_payment
domain: 中台
dbDictId: 281279114926002178
description: selectdb乐摇摇订单聚合表
use_cases:
  - 查询订单信息
---

# ads_order_info_agg

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| out_trade_no | varchar(100) | 交易订单号 |
| distributor_id | bigint | 商户id |
| ds | date | 分区日期（按天） |
| store_id | bigint | 店铺id |
| equipment_id | bigint | 设备id |
| user_id | bigint | 用户id |
| create_time | datetime | 订单创建时间 |
| status | smallint | 订单状态 |
| status_agg | tinyint | 订单聚合状态 |
| aggregate_order_no | varchar(65533) | 聚合单号(订单号,支付单号,商户单号,渠道单号) |
| payment_method_agg_list | array<text> | 聚合支付方式 |
| order_amount | decimal(38,2) | 订单金额 |
| actual_amount | decimal(38,2) | 实际金额 |
| refund_amount | decimal(38,2) | 退款成功渠道金额 |
| merchant_actual_amount | decimal(38,2) | 商家实收 |
| merchant_actual_refund_amount | decimal(38,2) | 商家实退 |
| platform_service_amount | decimal(38,2) | 增值服务费 |
| platform_service_refund_amount | decimal(38,2) | 增值服务费实退 |
| platform_tying_amount | decimal(38,2) | 搭售服务费 |
| platform_tying_refund_amount | decimal(38,2) | 搭售服务费实退 |
| refund_order_list | text | 退款信息 |
| order_goods_list | text | 商品信息 |
| payment_record_list | text | 流水信息 |
| balance_stored | decimal(18,2) | 余额储值 |
| coin_stored | decimal(18,2) | 余币储值 |
| member_card_times_stored | decimal(18,2) | 次卡储值 |
| time_card_stored | decimal(18,2) | 时长卡储值 |
| ic_card_stored | decimal(18,2) | IC卡储值 |
| refund_balance_stored | decimal(38,2) | 已退余额储值 |
| refund_coin_stored | decimal(38,2) | 已退余币储值 |
| refund_member_card_times_stored | decimal(38,2) | 已退次卡储值 |
| refund_time_card_stored | decimal(38,2) | 已退时长卡储值 |
| refund_ic_card_stored | decimal(38,2) | 已退IC卡储值 |
| p_channel_code_list | text | 渠道编码集合(逗号分割) |
| p_pay_mode_list | text | 支付方式集合(逗号分割) |
| p_channel_order_no_list | text | 渠道单号集合(逗号分割) |
| p_third_order_no_list | text | 交易单号集合(逗号分割) |
| p_channel_merchant_order_no_list | text | 商户单号集合(逗号分割) |
| p_settlement_status_list | text | 结算状态 1待结算 2部分结算 3已结算 |
| p_delay_settlement_list | text | 是否延迟结算 0否 1是 |
| trade_time | datetime(3) | 最大交易时间 |
| channel_code | int | 渠道编号 |
| confirm_date | datetime | 最大确认时间 |
| e_code | varchar(100) | 设备编码 |
| e_type_value | varchar(100) | 设备类型编号 |
| e_type_id | bigint | 设备类型id |
| e_remark | text | 设备备注 |
| e_store_name | varchar(512) | 场地名称 |
| e_name | varchar(255) | 设备名称 |
| e_terminal_value | varchar(65533) | 终端码 |
| e_type_name | varchar(255) | 设备类型名称 |
| e_model | varchar(40) | 通道号 |
| e_mainboard_id | bigint | 主板id |
| e_mainboard_value | varchar(40) | 主板编号 |
| e_mainboard_unique_code | varchar(100) | 主板唯一码 |
| e_imei_value | varchar(65533) | IMEI码 |
| e_labels | varchar(65533) | 待补充 |
| g_mainboard_position_id_list | text | 商品仓位id集合(逗号分割) |
| goods_total_quantity | bigint | 商品总数 |
| refund_goods_total_quantity | bigint | 退款商品总数 |
| goods_name_splice | varchar(65533) | 商品名称拼接 |
| goods_name_quantity_splice | varchar(65533) | 商品名称+数量拼接 |
| r_status_list | varchar(65533) | 退款状态(不含平台发起搭售退款) |
| r_remark_list | varchar(65533) | 退款原因(不含平台发起搭售退款) |
| mk_activity_type_id_list | varchar(65533) | 营销类型集合 |
| mk_activity_id_list | varchar(65533) | 营销活动集合 |
| mk_offer_amount | decimal(11,2) | 营销优惠总金额 |
| c_ic_card_no | varchar(65533) | ic卡号 |
| u_phone | varchar(65533) | 待补充 |
| c_status_source | varchar(65533) | 订单状态补充 |
| subsidy_amount | decimal(12,2) | 补贴金额 |
| order_type | smallint | 订单类型 |
| sales_order_no | varchar(65533) | 业务订单号 |
| marketing_detail_list | text | 营销信息 |
| member_detail | json | 会员详情 |
| equipment_detail | json | 设备详情 |
| client_type | smallint | 客户端类型 |
| business_type | smallint | 业务编号 |
| refund_mark | smallint | 退款标记 |
| remark | text | 订单备注 |
| parent_no | varchar(100) | 父订单号 |
| trans_type | smallint | 交易类型 |
| common_extend | json | 公共扩展信息 |
| pay_detail_list | text | 储值支付 |
| operator | json | 操作人信息 |
| only_channel_pay | tinyint | 待补充 |
| mk_draw_amount | decimal(11,2) | 待补充 |
| current_agent_user_id | bigint | 当前代理商id |
| dealer_order_type | tinyint | 订单分类(充值订单,消费订单,权益结算订单) |
| consumer_confirm_status | tinyint | 消费确认状态 1待确认 2已确认 |
| consumer_confirm_time | datetime | 消费确认时间 |
| consumer_confirm_amount | decimal(38,2) | 消费确认金额(可结算) |
| business_scene_type | varchar(64) | 业务场景类型 dealer：经销商，brand：品牌商 |
| business_scene_merchant_id | bigint | 业务商户id |
| agent_merchant_id | bigint | 代理商商户id |
| store_value_detail_agg | json | 储值对象 |
| confirm_before_refund_store_value_detail_agg | json | 确认前退款储值对象 |
| refund_subsidy_amount | decimal(38,2) | 补贴退款总额 |
| aggregate_user_member | text | 聚合用户查询:名称,手机号,id |
| member_card_type | tinyint | 会员卡类型(1.次卡,2.时长卡,3折扣卡) |
| is_wallet_settlement | tinyint | 是否资金池结算 |
| consumer_service_amount | decimal(38,2) | 消费服务费 |
| consumer_service_refund_amount | decimal(38,2) | 消费退款服务费 |
| consumer_divide_list | text | 消费分账信息 |
| consumer_status | smallint | 消费状态,1服务中,2已完成 |
| business_domain | smallint | 业务域分类 1.乐摇摇 2.多金宝 99.其他订单(暂无) |
| pay_attribute | smallint | 支付属性 1.免支付(0元单) 2.渠道支付,3.储值支付 4.组合支付(渠道+储值支付) 5.押金支付 |
| consume_mode | smallint | 消费模式 1.先付后用 2.先用后付(支付分,芝麻分等) |

## 查询规则

- 待补充

## 参考 SQL

### 查询订单信息

```sql
select * from ads_order_info_agg where  out_trade_no ='PA101525082813502922000055181532' and ds='2025-08-28'
```

## 索引

- PK: (out_trade_no, distributor_id, ds)
- INDEX: aggregate_order_no
- INDEX: distributor_id
- INDEX: store_id
- INDEX: user_id
- INDEX: equipment_id
- INDEX: status
