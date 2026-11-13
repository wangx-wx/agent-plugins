---
table: insurance_user_benefit_card
database: advert
domain: 按摩
dbDictId: 10082
description: 权益用户卡记录表
use_cases:
  - 权益表
---

# insurance_user_benefit_card

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | numeric(11,0) | 主键id |
| card_sku_id | character varying(64) | 权益卡商品ID |
| card_name | character varying(64) | 权益卡名称 |
| config_id | numeric(11,0) | 配置Id |
| distributor_id | numeric(11,0) | 商家ID |
| status | smallint | 状态 |
| user_id | numeric(11,0) | 用户ID |
| card_code | character varying(30) | 卡码 |
| card_pass | character varying(64) | 卡密 |
| out_trade_no | character varying(64) | 订单号 |
| created | timestamp(6) without time zone | 创建时间 |
| updated | timestamp(6) without time zone | 更新时间 |
| price | numeric(9,2) | 权益卡金额 |
| equipment_type | character varying(20) | 设备类型 |
| equipment_id | numeric(11,0) | 设备Id |
| equipment_group_id | numeric(11,0) | 设备场地Id |
| equipment_group_name | character varying(32) | 设备场地名称 |
| open_id | character varying(64) | open_id |
| order_source | smallint | 订单来源 |
| order_channel | smallint | 订单渠道 |
| deleted | smallint | 是否删除 |
| subsidies_amount | numeric(10,2) | 补贴金额（元） |
| third_reward_type | smallint | 权益来源 |
| piao_piao_type | character varying(24) | 权益类型 |
| commodity_id | numeric(11,0) | 商品ID |
| use_status | smallint | 使用状态 领取状态 0、未领取 1、领取中 2、已领取 |
| use_phone | character varying(12) | 使用手机号 |
| remark | character varying(128) | 备注 |
| parent_id | numeric(11,0) | 关联父ID |
| product_type | smallint | 产品类型用于区分商创业务1=保障 2=权益卡 3=附带商品 |

## 查询规则

- 待补充

## 索引

- PK: id
- INDEX: parent_id
- INDEX: created
- INDEX: (order_source, equipment_type, product_type)
- INDEX: out_trade_no
- INDEX: card_code
- INDEX: distributor_id
- INDEX: user_id
