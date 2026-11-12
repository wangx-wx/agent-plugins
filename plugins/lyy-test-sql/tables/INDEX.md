# 数据表建表 SQL 索引

目录规则：`tables/{库名}/{表名}.sql`，按库隔离，无说明文件。

## 数据库 dbDictId 对照

| 库 | 数据源 | dbDictId |
| --- | --- | --- |
| `advert` | 生产环境查询p——advert | 10082 |
| `carcharging` | 生产环境查询p——carcharging | 10131 |
| `cmember` | 生产环境查询p——cmember | 10087 |
| `commercial_charges` | 生产环境查询p——commercial_charges | 10089 |
| `equipment` | 生产环境查询p——equipment | 10093 |
| `lyy_consumption` | 生产环境查询p——lyy_consumption | 10102 |
| `lyy_infor` | 生产环境查询p——lyy_infor | 10376 |
| `massage_chair` | 生产环境查询p——massage_chair | 10097 |
| `master` | 生产环境查询p——master | 10099 |
| `merchant` | 生产环境查询p——merchant | 10172 |
| `middle_stage` | 生产环境查询p——middle_stage | 10346 |
| `order` | 生产环境查询p——polardb-order | 10166 |
| `selectdb_payment` | 生产环境查询s——SelectDB-payment | 281279114926002178 |
| `small_venue` | 生产环境查询p——small_venue | 10142 |
| `user_member` | 生产环境查询p——user_member_1 ~ user_member_4 | 10108 / 10109 / 10110 / 10111 |

### `user_member` 分库规则

该库分了 4 个实例，按**商户 id 取模**路由：

```
merchant_id % 128
```

| 取模结果 | 数据源 | dbDictId |
| --- | --- | --- |
| 0 ~ 31 | 生产环境查询p——user_member_1 | 10108 |
| 32 ~ 63 | 生产环境查询p——user_member_2 | 10109 |
| 64 ~ 95 | 生产环境查询p——user_member_3 | 10110 |
| 96 ~ 127 | 生产环境查询p——user_member_4 | 10111 |

## 表清单

| 库 | 表数量 | 数据表 |
| --- | --- | --- |
| `advert` | 11 | [automatic_debit_order](./advert/automatic_debit_order.sql)、[automatic_debit_receive_record](./advert/automatic_debit_receive_record.sql)、[cdz_debit_order](./advert/cdz_debit_order.sql)、[insurance_order](./advert/insurance_order.sql)、[insurance_user_benefit_card](./advert/insurance_user_benefit_card.sql)、[lyy_cdz_activity_black_list](./advert/lyy_cdz_activity_black_list.sql)、[lyy_cdz_insurance_buy_card](./advert/lyy_cdz_insurance_buy_card.sql)、[lyy_cdz_insurance_equipment_order_detail](./advert/lyy_cdz_insurance_equipment_order_detail.sql)、[lyy_cdz_insurance_order](./advert/lyy_cdz_insurance_order.sql)、[lyy_cdz_member_card](./advert/lyy_cdz_member_card.sql)、[lyy_distributor_advertise_coupon](./advert/lyy_distributor_advertise_coupon.sql) |
| `carcharging` | 4 | [family_equipment_vip](./carcharging/family_equipment_vip.sql)、[infra_station](./carcharging/infra_station.sql)、[member_user_info](./carcharging/member_user_info.sql)、[order_charge](./carcharging/order_charge.sql) |
| `cmember` | 10 | [jd_insurance_start_record](./cmember/jd_insurance_start_record.sql)、[massage_automatic_debit](./cmember/massage_automatic_debit.sql)、[promotion_activity_merchant](./cmember/promotion_activity_merchant.sql)、[promotion_activity_user](./cmember/promotion_activity_user.sql)、[tiktok_activity_coupon](./cmember/tiktok_activity_coupon.sql)、[tiktok_activity_order](./cmember/tiktok_activity_order.sql)、[tiktok_activity_poi](./cmember/tiktok_activity_poi.sql)、[wash_activity_rule_equipment](./cmember/wash_activity_rule_equipment.sql)、[wash_dimension_user_info](./cmember/wash_dimension_user_info.sql)、[wash_product_order](./cmember/wash_product_order.sql) |
| `commercial_charges` | 12 | [merchant_message_config](./commercial_charges/merchant_message_config.sql)、[merchant_product](./commercial_charges/merchant_product.sql)、[receipt_bill](./commercial_charges/receipt_bill.sql)、[receipt_bill_detail](./commercial_charges/receipt_bill_detail.sql)、[receipt_bill_pay_trans](./commercial_charges/receipt_bill_pay_trans.sql)、[receipt_bill_pay_trans_detail](./commercial_charges/receipt_bill_pay_trans_detail.sql)、[receipt_bill_refund_trans](./commercial_charges/receipt_bill_refund_trans.sql)、[receipt_bill_refund_trans_detail](./commercial_charges/receipt_bill_refund_trans_detail.sql)、[system_charge_config](./commercial_charges/system_charge_config.sql)、[system_charge_equipment](./commercial_charges/system_charge_equipment.sql)、[system_charge_equipment_bill](./commercial_charges/system_charge_equipment_bill.sql)、[system_charge_equipment_bill_flow](./commercial_charges/system_charge_equipment_bill_flow.sql) |
| `equipment` | 4 | [device](./equipment/device.sql)、[iot_equipment](./equipment/iot_equipment.sql)、[iot_equipment_docking](./equipment/iot_equipment_docking.sql)、[iot_equipment_setting](./equipment/iot_equipment_setting.sql) |
| `lyy_consumption` | 1 | [lyy_request_history](./lyy_consumption/lyy_request_history.sql) |
| `lyy_infor` | 5 | [xiaole_black_user](./lyy_infor/xiaole_black_user.sql)、[xiaole_life_user](./lyy_infor/xiaole_life_user.sql)、[xiaole_life_user_relate](./lyy_infor/xiaole_life_user_relate.sql)、[xiaole_user_no_app_request](./lyy_infor/xiaole_user_no_app_request.sql)、[xiaole_user_points_record](./lyy_infor/xiaole_user_points_record.sql) |
| `massage_chair` | 7 | [coins_saver_order](./massage_chair/coins_saver_order.sql)、[ic_card_limit_config](./massage_chair/ic_card_limit_config.sql)、[lyy_charging_equipment_port](./massage_chair/lyy_charging_equipment_port.sql)、[lyy_charging_order](./massage_chair/lyy_charging_order.sql)、[lyy_charging_order_power](./massage_chair/lyy_charging_order_power.sql)、[lyy_ic_card](./massage_chair/lyy_ic_card.sql)、[lyy_ic_card_flow](./massage_chair/lyy_ic_card_flow.sql) |
| `master` | 15 | [ad_org](./master/ad_org.sql)、[ad_org_attach](./master/ad_org_attach.sql)、[agent_equipment](./master/agent_equipment.sql)、[equipment_charging_type](./master/equipment_charging_type.sql)、[experience_merchant_list](./master/experience_merchant_list.sql)、[lyy_divide_merchant_info](./master/lyy_divide_merchant_info.sql)、[lyy_equipment_private_key](./master/lyy_equipment_private_key.sql)、[lyy_media_ads_device](./master/lyy_media_ads_device.sql)、[lyy_merchant_info](./master/lyy_merchant_info.sql)、[lyy_payment](./master/lyy_payment.sql)、[lyy_swiftpass_merchant_detail](./master/lyy_swiftpass_merchant_detail.sql)、[meituan_store_apply](./master/meituan_store_apply.sql)、[merchant_equipment](./master/merchant_equipment.sql)、[payment_fee_deduction_equipment](./master/payment_fee_deduction_equipment.sql)、[payment_info_config](./master/payment_info_config.sql) |
| `merchant` | 1 | [merchant_equipment_board](./merchant/merchant_equipment_board.sql) |
| `middle_stage` | 1 | [ticket](./middle_stage/ticket.sql) |
| `order` | 2 | [order_info](./order/order_info.sql)、[refund_order_info](./order/refund_order_info.sql) |
| `selectdb_payment` | 6 | [ads_order_info_agg](./selectdb_payment/ads_order_info_agg.sql)、[ads_payment_equipment_record_di](./selectdb_payment/ads_payment_equipment_record_di.sql)、[ds_unified_redeem_order](./selectdb_payment/ds_unified_redeem_order.sql)、[dwd_payment_payment_record_trade](./selectdb_payment/dwd_payment_payment_record_trade.sql)、[dwd_payment_refund_record_trade](./selectdb_payment/dwd_payment_refund_record_trade.sql)、[ods_unified_redeem_order](./selectdb_payment/ods_unified_redeem_order.sql) |
| `small_venue` | 1 | [t_merchant_card](./small_venue/t_merchant_card.sql) |
| `user_member` | 5 | [um_account](./user_member/um_account.sql)、[um_account_benefit](./user_member/um_account_benefit.sql)、[um_account_record](./user_member/um_account_record.sql)、[um_benefit](./user_member/um_benefit.sql)、[um_benefit_scope](./user_member/um_benefit_scope.sql) |

合计：**85** 张表、**15** 个库。

## 未收集到建表语句

- `selectdb_payment/ads_order_info_agg.sql`
- `selectdb_payment/ads_payment_equipment_record_di.sql`
- `selectdb_payment/ds_unified_redeem_order.sql`
- `selectdb_payment/dwd_payment_payment_record_trade.sql`
- `selectdb_payment/dwd_payment_refund_record_trade.sql`
- `selectdb_payment/ods_unified_redeem_order.sql`
