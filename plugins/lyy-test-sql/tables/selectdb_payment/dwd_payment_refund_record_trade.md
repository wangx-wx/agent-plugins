---
table: dwd_payment_refund_record_trade
database: selectdb_payment
domain: 中台
dbDictId: 281279114926002178
description: 退款交易
use_cases:
  - 查询退款交易
---

# dwd_payment_refund_record_trade

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| refund_record_no | varchar(100) | 退款流水号 |
| out_trade_no | varchar(100) | 交易订单号 |
| refund_no | varchar(100) | 退款单号 |
| order_no | varchar(100) | 内部订单号 |
| ds | date | 日期 |
| distributor_id | bigint | 商户id |
| payment_created | date | 支付创建时间 |
| bill_date | date | 账单日期 |
| pay_amount | decimal(11,2) | 支付金额 |
| merchant_code | varchar(400) | 渠道商户号 |
| channel_code | int | 渠道编号 |
| settlement_channel_code | int | 待补充 |
| refund_amount | decimal(11,2) | 退款金额 |
| remark | text | 备注 |
| failed_description | varchar(255) | 退款失败原因 |
| status | tinyint | 退款状态 1:退款中 2:退款成功 3:退款失败 |
| source | tinyint | 退款来源(从什么服务发起的退款) 1:支付服务 2:支付回调 3:C端  4:B端 5:设备服务 6:支付网关 7:订单服务 |
| refund_type | tinyint | 退款类型 1:自动退款 2:手动退款 |
| refund_time | datetime(3) | 退款发起时间 |
| refund_success_time | datetime(3) | 退款成功时间 |
| f_reserve | bigint | 待补充 |
| pay_method | varchar(200) | 付款方式（目前提供给线下支付使用） |
| pay_method_name | varchar(255) | 付款方式名称 |
| create_time | datetime(3) | 支付记录创建时间 |
| update_time | datetime(3) | 待补充 |
| update_by | bigint | 修改人 |
| organization_id | bigint | 组织id |
| create_by | bigint | 创建人id |
| client_type | tinyint | 退款方式 |
| channel_order_no | varchar(200) | 渠道退款单号 |
| certificate | json | 退款凭证 |
| attach | text | 业务附加字段 |
| out_app_id | varchar(200) | 接入方appid,对应auth_signature表的app_id字段 |
| common_extend | text | 通用扩展字段 |
| refund_service_fee | decimal(10,2) | 退款退还手续费 |
| deduction_refund_service_fee | decimal(10,2) | 外扣-退款-退回手续费 |
| settlement_date | date | 待补充 |
| merchant_name | varchar(255) | 待补充 |
| merchant_short_name | varchar(255) | 待补充 |
| id_code | varchar(255) | 待补充 |
| business_license | varchar(255) | 待补充 |
| account_code | varchar(255) | 待补充 |
| account_name | varchar(255) | 待补充 |
| merchant_type | char(1) | 待补充 |
| account_type | char(1) | 待补充 |
| bank_short_name | varchar(255) | 待补充 |
| bank_name | varchar(255) | 待补充 |
| district_id | bigint | 区域id |
| province_id | bigint | 省份id |
| city_id | bigint | 城市id |
| province | varchar(50) | 省份 |
| city | varchar(100) | 城市名称 |
| district | varchar(100) | 区域名称 |
| e_name | varchar(400) | 设备名称 |
| equipment_id | bigint | 设备id |
| e_code | varchar(160) | 设备value |
| e_device_no | varchar(160) | 待补充 |
| e_terminal_value | varchar(160) | 终端码 |
| e_location_name | varchar(800) | 待补充 |
| e_type_id | bigint | 设备类型id |
| e_type_value | varchar(80) | 设备类型编号 |
| e_type_name | varchar(400) | 设备类型名称 |
| store_id | bigint | 场地id |
| e_store_name | varchar(400) | 场地名称 |
| e_store_address | varchar(800) | 待补充 |
| receivable_refund_amount | decimal(38,2) | 应退金额 |
| received_refund_amount | decimal(38,2) | 实退金额 |
| platform_refund_tying_amount | decimal(38,2) | 平台搭售退款金额 |
| platform_refund_tying_service_fee | decimal(38,2) | 待补充 |
| platform_refund_tying_deduction_service_fee | decimal(38,2) | 待补充 |
| platform_refund_amount | decimal(38,2) | 平台抽佣退款金额 |
| platform_refund_service_fee | decimal(38,2) | 待补充 |
| platform_refund_deduction_service_fee | decimal(38,2) | 待补充 |
| independent_refund_amount | decimal(38,2) | 分账退款金额 |
| refund_divide_amount | decimal(38,2) | 待补充 |
| refund_divide_service_fee | decimal(38,2) | 待补充 |
| refund_deduction_divide_service_fee | decimal(38,2) | 待补充 |
| hour | tinyint | 待补充 |
| pay_amount_level | text | 待补充 |
| pay_type | text | 待补充 |
| month | date | 月 |
| year | date | 年 |
| is_workday | text | 是否工作日 |
| is_weekday | text | 是否节假日 |
| is_week_year | bigint | 待补充 |
| week_year_rnk | bigint | 待补充 |
| week_day | bigint | 星期几 |
| week_sta | date | 本周开始日期 |
| week_end | date | 本周结束日期 |
| week_month_rnk | bigint | 待补充 |
| card_id | bigint | 商户卡ID |
| clearing_settlement | smallint | 二清结算 1-是 为空或其他否 |
| primary_clearing_category_code | varchar(64) | 清分一级类目 |
| second_clearing_category_code | varchar(64) | 清分二级类目 |
| third_clearing_category_code | varchar(64) | 清分三级类目 |
| pay_ad_org_id | bigint | 大商户号ID |
| trans_category | smallint | 交易类型聚合 1启动 2充值 |

## 查询规则

- 待补充

## 索引

- PK: (refund_record_no, out_trade_no, refund_no, order_no, ds)
