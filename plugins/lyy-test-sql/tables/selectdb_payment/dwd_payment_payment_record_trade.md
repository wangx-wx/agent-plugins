---
table: dwd_payment_payment_record_trade
database: selectdb_payment
domain: 中台
dbDictId: 281279114926002178
description: 交易记录表
use_cases:
  - 查询每个订单在移动端报表内实际增加和退款金额
---

# dwd_payment_payment_record_trade

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| out_trade_no | varchar(500) | 交易订单号 |
| order_no | varchar(500) | 支付单号 |
| ds | date | 日期 |
| distributor_id | bigint | 商户id |
| order_date | date | 待补充 |
| amount | decimal(11,2) | 支付金额 |
| confirm_date | date | 交易确认时间，非延迟结算则为交易完成日期，延迟结算为确认完成日期 |
| pay_amount | decimal(16,2) | 支付金额 |
| merchant_code | varchar(500) | 渠道商户号 |
| channel_code | int | 渠道编号 |
| settlement_channel_code | int | 待补充 |
| open_id | varchar(500) | 用户open_id |
| app_id | varchar(500) | 公众号id |
| channel_order_no | varchar(500) | 渠道订单号 |
| third_order_no | varchar(500) | 微信、支付宝、云闪付订单号 |
| status | tinyint | 支付状态 1:处理中 2:支付成功 3:支付失败 4:已关闭 |
| refund_mark | tinyint | 退款标识 1:无退款 2: 存在退款 3:完全退款 |
| remainder_amount | decimal(11,2) | 退款后该笔订单剩余用户支付金额 |
| client_type | tinyint | 客户端类型 |
| notifiable | tinyint | 是否异步通知  1:不需要通知 2:需要通知 1: 通知 2:不通知 对应外部支付服务需要异步通知支付结果和退款结果 |
| exist_divide_profit | tinyint | 是否存在分账 1:存在分账 2:无分账 |
| remark | text | 备注 |
| trade_time | datetime(3) | 交易时间 |
| create_time | datetime(3) | 支付记录创建时间 |
| pay_mode | smallint | 支付方式 |
| delay_settlement | tinyint | 是否延迟结算 0否 1是 |
| f_reserve | bigint | 待补充 |
| create_by | bigint | 创建人id |
| update_time | datetime(3) | 待补充 |
| update_by | bigint | 修改人 |
| organization_id | bigint | 组织id |
| pay_method | varchar(500) | 付款方式（目前提供给线下支付使用） |
| pay_method_name | varchar(500) | 付款方式名称 |
| channel_merchant_order_no | varchar(500) | 待补充 |
| certificate | json | 收款凭证 |
| attach | text | 业务附加字段 |
| out_app_id | varchar(500) | 接入方appid,对应auth_signature表的app_id字段 |
| pay_ad_org_id | bigint | 交易商户id |
| pay_merchant_code | varchar(500) | 交易渠道商户号 |
| use_pay_merchant_code_biz_type | tinyint | 使用交易渠道商户的业务类型 1-体验期  2-清结算 3-资金池 |
| settlement_amount | decimal(16,2) | 已结算金额或已分账金额 |
| settlement_status | tinyint | 结算状态 1待结算 2部分结算 3已结算 |
| product_code2 | varchar(500) | 待补充 |
| terminal_no | varchar(500) | 待补充 |
| product_code | varchar(500) | 产品码 |
| pay_service_fee | decimal(10,2) | 支付手续费 |
| merchant_out_app_id | varchar(500) | 待补充 |
| deduction_payment_service_fee | decimal(10,2) | 外扣手续费 非空且大约0 说明是外扣 |
| failed_description | text | 下单失败原因 |
| has_service_fee_deduction | tinyint | 待补充 |
| deduction_merchant_code | varchar(500) | 待补充 |
| settlement_date | date | 待补充 |
| order_amount | tinyint | 订单金额 |
| actual_amount | tinyint | 实际金额 |
| mk_offer_amount | tinyint | 营销金额 |
| u_user_id | bigint | 待补充 |
| district_id | bigint | 区域id |
| province_id | bigint | 省份id |
| city_id | bigint | 城市id |
| province | varchar(500) | 省份 |
| city | varchar(500) | 城市名称 |
| district | varchar(500) | 区域名称 |
| equipment_id | bigint | 设备id |
| e_code | varchar(40) | 设备value |
| e_type_id | bigint | 设备类型id |
| e_type_value | varchar(500) | 设备类型编号 |
| e_type_name | varchar(500) | 设备类型名称 |
| store_id | bigint | 场地id |
| e_store_name | varchar(500) | 场地名称 |
| merchant_name | varchar(500) | 待补充 |
| merchant_short_name | varchar(1024) | 待补充 |
| id_code | varchar(500) | 待补充 |
| business_license | varchar(500) | 待补充 |
| account_code | varchar(500) | 待补充 |
| account_name | varchar(500) | 待补充 |
| merchant_type | char(1) | 待补充 |
| account_type | char(1) | 待补充 |
| bank_short_name | varchar(1024) | 待补充 |
| bank_name | varchar(1024) | 待补充 |
| hour | tinyint | 待补充 |
| receivable_amount | decimal(38,2) | 应收金额 |
| received_amount | decimal(38,2) | 实收金额 |
| platform_tying_amount | decimal(38,2) | 平台搭售金额 |
| platform_tying_service_fee | decimal(38,2) | 待补充 |
| platform_tying_deduction_divide_service_fee | decimal(38,2) | 待补充 |
| platform_amount | decimal(38,2) | 平台抽佣金额 |
| platform_service_fee | decimal(38,2) | 待补充 |
| platform_deduction_divide_service_fee | decimal(38,2) | 待补充 |
| divide_amount | decimal(38,2) | 待补充 |
| divide_service_fee | decimal(38,2) | 待补充 |
| deduction_divide_service_fee | decimal(38,2) | 待补充 |
| independent_amount | decimal(38,2) | 分账金额 |
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
| trans_category | smallint | 交易类型聚合 1启动 2充值 |

## 查询规则

- 待补充

## 索引

- PK: (out_trade_no, order_no, ds)
