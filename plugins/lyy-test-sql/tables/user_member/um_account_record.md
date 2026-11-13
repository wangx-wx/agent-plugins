---
table: um_account_record
database: user_member
domain: 中台
dbDictId: 10108 / 10109 / 10110 / 10111
description: 账户流水记录表
use_cases:
  - 会员流水
---

# um_account_record

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | 流水号 |
| account_id | bigint | 账户ID |
| user_id | bigint | 平台用户ID |
| merchant_user_id | bigint | 商户用户ID |
| merchant_id | numeric(12,0) | 商户 |
| store_id | numeric(12,0) | 店铺 |
| equipment_id | numeric(12,0) | 设备 |
| benefit_classify | smallint | 权益类型 |
| benefit_id | bigint | 权益ID |
| initial_benefit | numeric(10,2) | 期初权益 |
| original_benefit | numeric(10,2) | 权益 |
| actual_benefit | numeric(10,2) | 实际权益 |
| out_trade_no | character varying(64) | 交易单号 |
| order_no | character varying(64) | 业务单号 |
| mode | smallint | 方式1=加，2=减 |
| create_time | timestamp(3) without time zone | 时间 |
| resource | character varying(200) | 来源 |
| description | character varying(200) | 备注 |
| trade_type | smallint | 交易类型 |
| trade_amount | numeric(12,2) | 交易金额 |
| commodity_name | character varying(64) | 商品名称 |
| store_name | character varying(120) | 场地/店铺名称 |
| equipment_type_name | character varying(16) | 设备类型名称 |
| equipment_value | character varying(16) | 设备编号 |
| equipment_type_id | numeric(12,0) | 设备类型id |
| record_type | smallint | 流水自定义类型 |
| sort | integer | 消费使用排序 |
| account_benefit_id | bigint | 账号权益明细id |
| createdby | numeric(10,0) | 操作人 |
| create_name | character varying(50) | 操作人名称 |
| card_no | character varying(50) | 卡号 |
| refund_no | character varying(64) | 退兑换单号 |
| goods_id | numeric(10,0) | 商品id |
| goods_type | smallint | 商品类型 |
| goods_classify | numeric(10,0) | 商品所属分类 |
| goods_classify_name | character varying(20) | 商品所属分类名称 |
| goods_num | numeric(6,0) | 商品数量 |
| discounts_amount | numeric(12,2) | 优惠金额 |
| operation_equipment_name | character varying(32) | 操作设备名称 |
| equipment_name | character varying(32) | 设备名称 |
| terminal_name | character varying(32) | 终端名称 |
| merchant_benefit_classify_id | numeric(10,0) | 商家自定义权益id |
| merchant_benefit_classify_name | character varying(32) | 商家自定义权益名称 |
| operation_type | smallint | 记录类型（1.商品购买记录 2.商品兑换记录；3.商品回收记录；4.储值变更记录（储值变更记录包括设备消费记录）） |
| operation_channel | smallint | 操作渠道（1.微信小程序；2.桌面收银台；3.移动收银台） |
| consume_type | smallint | 消费方式 （1.刷卡消费 2.微信小程序；3.桌面收银台；4.移动收银台） |
| sub_order_no | character varying(64) | 子单号 |
| actual_value | numeric(12,2) | 权益实际价值 |
| group_number | numeric(10,0) | 机台号 |
| goods_type_id | bigint | 商品类型id |
| goods_price | numeric(12,2) | 商品单价 |
| goods_type_name | character varying(64) | 商品类型名称 |
| account_initial_balance | numeric(12,2) | 账号下权益初始总数（总次数） |
| account_initial_num | numeric(12,2) | 账号下频次卡权益初始总张数 |

## 查询规则

- 待补充

## 索引

- 无（DDL 中未定义索引）
