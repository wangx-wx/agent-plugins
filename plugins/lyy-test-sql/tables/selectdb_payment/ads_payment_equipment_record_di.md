---
table: ads_payment_equipment_record_di
database: selectdb_payment
domain: 中台
dbDictId: 281279114926002178
description: 经营统计汇总表
use_cases:
  - 经营统计每日的收入概览
  - 启动概览
  - 储值概览
  - 每日经营趋势
  - 收款金额趋势
  - 时段经营趋势
  - 收款分析
---

# ads_payment_equipment_record_di

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| ds | date | 日期 |
| distributor_id | bigint | 商户id |
| store_id | bigint | 场地id |
| e_type_id | bigint | 设备类型id |
| equipment_id | bigint | 设备id |
| type | varchar(65533) | 维度类型 |
| e_type_name | varchar(65533) | 设备类型名称 |
| e_code | varchar(65533) | 设备value |
| province_id | bigint | 省份id |
| province | varchar(65533) | 省份 |
| city_id | bigint | 城市id |
| city | varchar(65533) | 城市名称 |
| district_id | bigint | 区域id |
| district | varchar(65533) | 区域名称 |
| month | date | 月 |
| year | date | 年 |
| week_day | bigint | 星期几 |
| is_workday | varchar(200) | 是否工作日 |
| is_weekday | varchar(200) | 是否节假日 |
| week_sta | date | 本周开始日期 |
| week_end | date | 本周结束日期 |
| week_month_rnk | bigint | 待补充 |
| order_amount | decimal(38,2) | 订单金额 |
| actual_amount | decimal(38,2) | 实际金额 |
| pay_amount | decimal(38,2) | 支付金额 |
| receivable_amount | decimal(38,2) | 应收金额 |
| received_amount | decimal(38,2) | 实收金额 |
| mk_offer_amount | decimal(38,2) | 营销金额 |
| pay_service_fee | decimal(38,2) | 手续费金额 |
| deduction_payment_service_fee | decimal(38,2) | 外扣手续费 |
| platform_tying_amount | decimal(38,2) | 平台搭售金额 |
| platform_amount | decimal(38,2) | 平台抽佣金额 |
| independent_amount | decimal(38,2) | 分账金额 |
| refund_amount | decimal(38,2) | 退款金额 |
| receivable_refund_amount | decimal(38,2) | 应退金额 |
| received_refund_amount | decimal(38,2) | 实退金额 |
| refund_service_fee | decimal(38,2) | 退款手续费金额 |
| deduction_refund_service_fee | decimal(38,2) | 退款外扣手续费金额 |
| platform_refund_tying_amount | decimal(38,2) | 平台搭售退款金额 |
| platform_refund_amount | decimal(38,2) | 平台抽佣退款金额 |
| independent_refund_amount | decimal(38,2) | 分账退款金额 |
| pay_count | bigint | 支付笔数 |
| refund_count | bigint | 退款笔数 |
| 0_1_hour_pay_count | bigint | 0-1小时支付笔数 |
| 1_2_hour_pay_count | bigint | 1-2小时支付笔数 |
| 2_3_hour_pay_count | bigint | 2-3小时支付笔数 |
| 3_4_hour_pay_count | bigint | 3-4小时支付笔数 |
| 4_5_hour_pay_count | bigint | 4-5小时支付笔数 |
| 5_6_hour_pay_count | bigint | 5-6小时支付笔数 |
| 6_7_hour_pay_count | bigint | 6-7小时支付笔数 |
| 7_8_hour_pay_count | bigint | 7-8小时支付笔数 |
| 8_9_hour_pay_count | bigint | 8-9小时支付笔数 |
| 9_10_hour_pay_count | bigint | 9-10小时支付笔数 |
| 10_11_hour_pay_count | bigint | 10-11小时支付笔数 |
| 11_12_hour_pay_count | bigint | 11-12小时支付笔数 |
| 12_13_hour_pay_count | bigint | 12-13小时支付笔数 |
| 13_14_hour_pay_count | bigint | 13-14小时支付笔数 |
| 14_15_hour_pay_count | bigint | 14-15小时支付笔数 |
| 15_16_hour_pay_count | bigint | 15-16小时支付笔数 |
| 16_17_hour_pay_count | bigint | 16-17小时支付笔数 |
| 17_18_hour_pay_count | bigint | 17-18小时支付笔数 |
| 18_19_hour_pay_count | bigint | 18-19小时支付笔数 |
| 19_20_hour_pay_count | bigint | 19-20小时支付笔数 |
| 20_21_hour_pay_count | bigint | 20-21小时支付笔数 |
| 21_22_hour_pay_count | bigint | 21-22小时支付笔数 |
| 22_23_hour_pay_count | bigint | 22-23小时支付笔数 |
| 23_24_hour_pay_count | bigint | 23-24小时支付笔数 |
| 0_1_hour_pay_amount | decimal(38,2) | 0-1小时支付金额 |
| 1_2_hour_pay_amount | decimal(38,2) | 1-2小时支付金额 |
| 2_3_hour_pay_amount | decimal(38,2) | 2-3小时支付金额 |
| 3_4_hour_pay_amount | decimal(38,2) | 3-4小时支付金额 |
| 4_5_hour_pay_amount | decimal(38,2) | 4-5小时支付金额 |
| 5_6_hour_pay_amount | decimal(38,2) | 5-6小时支付金额 |
| 6_7_hour_pay_amount | decimal(38,2) | 6-7小时支付金额 |
| 7_8_hour_pay_amount | decimal(38,2) | 7-8小时支付金额 |
| 8_9_hour_pay_amount | decimal(38,2) | 8-9小时支付金额 |
| 9_10_hour_pay_amount | decimal(38,2) | 9-10小时支付金额 |
| 10_11_hour_pay_amount | decimal(38,2) | 10-11小时支付金额 |
| 11_12_hour_pay_amount | decimal(38,2) | 11-12小时支付金额 |
| 12_13_hour_pay_amount | decimal(38,2) | 12-13小时支付金额 |
| 13_14_hour_pay_amount | decimal(38,2) | 13-14小时支付金额 |
| 14_15_hour_pay_amount | decimal(38,2) | 14-15小时支付金额 |
| 15_16_hour_pay_amount | decimal(38,2) | 15-16小时支付金额 |
| 16_17_hour_pay_amount | decimal(38,2) | 16-17小时支付金额 |
| 17_18_hour_pay_amount | decimal(38,2) | 17-18小时支付金额 |
| 18_19_hour_pay_amount | decimal(38,2) | 18-19小时支付金额 |
| 19_20_hour_pay_amount | decimal(38,2) | 19-20小时支付金额 |
| 20_21_hour_pay_amount | decimal(38,2) | 20-21小时支付金额 |
| 21_22_hour_pay_amount | decimal(38,2) | 21-22小时支付金额 |
| 22_23_hour_pay_amount | decimal(38,2) | 22-23小时支付金额 |
| 23_24_hour_pay_amount | decimal(38,2) | 23-24小时支付金额 |
| 0_1_pay_count | bigint | 0-1元支付笔数 |
| 1_3_pay_count | bigint | 1-3元支付笔数 |
| 3_5_pay_count | bigint | 3-5元支付笔数 |
| 5_10_pay_count | bigint | 5-10元支付笔数 |
| 10_15_pay_count | bigint | 10-15元支付笔数 |
| 15_30_pay_count | bigint | 15-30元支付笔数 |
| 30_50_pay_count | bigint | 30-50元支付笔数 |
| 50_100_pay_count | bigint | 50-100元支付笔数 |
| 100_200_pay_count | bigint | 100-200元支付笔数 |
| 200_500_pay_count | bigint | 200-500元支付笔数 |
| 500_1000_pay_count | bigint | 500-1000元支付笔数 |
| over_1000_pay_count | bigint | 1000元以上支付笔数 |
| not_know_pay_count | bigint | 未知金额支付笔数 |
| 0_1_pay_amount | decimal(38,2) | 0-1元支付金额 |
| 1_3_pay_amount | decimal(38,2) | 1-3元支付金额 |
| 3_5_pay_amount | decimal(38,2) | 3-5元支付金额 |
| 5_10_pay_amount | decimal(38,2) | 5-10元支付金额 |
| 10_15_pay_amount | decimal(38,2) | 10-15元支付金额 |
| 15_30_pay_amount | decimal(38,2) | 15-30元支付金额 |
| 30_50_pay_amount | decimal(38,2) | 30-50元支付金额 |
| 50_100_pay_amount | decimal(38,2) | 50-100元支付金额 |
| 100_200_pay_amount | decimal(38,2) | 100-200元支付金额 |
| 200_500_pay_amount | decimal(38,2) | 200-500元支付金额 |
| 500_1000_pay_amount | decimal(38,2) | 500-1000元支付金额 |
| over_1000_pay_amount | decimal(38,2) | 1000元以上支付金额 |
| not_know_pay_amount | decimal(38,2) | 未知支付金额 |
| wechat_h5_pay_count | bigint | 微信H5支付笔数 |
| wechat_mini_pay_count | bigint | 微信小程序支付笔数 |
| wechat_face_pay_count | bigint | 微信刷脸支付笔数 |
| wechat_qrcode_pay_count | bigint | 微信付款码支付笔数 |
| ali_pay_count | bigint | 支付宝支付笔数 |
| ali_single_pay_count | bigint | 支付宝信用付笔数 |
| ali_qrcode_pay_count | bigint | 支付宝付款码支付笔数 |
| ali_face_pay_count | bigint | 支付宝刷脸支付笔数 |
| jd_pay_count | bigint | 京东支付笔数 |
| union_pay_count | bigint | 云闪付支付笔数 |
| cash_pay_count | bigint | 现金支付笔数 |
| wechat_score_pay_count | bigint | 微信支付分支付笔数 |
| reverse_scan_pay_count | bigint | 反扫支付笔数 |
| other_pay_count | bigint | 其他支付笔数 |
| wechat_h5_pay_amount | decimal(38,2) | 微信H5支付金额 |
| wechat_mini_pay_amount | decimal(38,2) | 微信小程序支付金额 |
| wechat_face_pay_amount | decimal(38,2) | 微信刷脸支付金额 |
| wechat_qrcode_pay_amount | decimal(38,2) | 微信付款码支付金额 |
| ali_pay_amount | decimal(38,2) | 支付宝支付金额 |
| ali_single_pay_amount | decimal(38,2) | 支付宝信用付金额 |
| ali_qrcode_pay_amount | decimal(38,2) | 支付宝付款码支付金额 |
| ali_face_pay_amount | decimal(38,2) | 支付宝刷脸支付金额 |
| jd_pay_amount | decimal(38,2) | 京东支付金额 |
| union_pay_amount | decimal(38,2) | 云闪付支付金额 |
| cash_pay_amount | decimal(38,2) | 现金支付金额 |
| wechat_score_pay_amount | decimal(38,2) | 微信支付分支付金额 |
| reverse_scan_pay_amount | decimal(38,2) | 反扫支付金额 |
| other_pay_amount | decimal(38,2) | 其他支付金额 |
| wechat_app_pay_count | bigint | 待补充 |
| ali_app_pay_count | bigint | 待补充 |
| douyin_h5_pay_count | bigint | 待补充 |
| douyin_qrcode_pay_count | bigint | 待补充 |
| douyin_face_pay_count | bigint | 待补充 |
| meituan_h5_pay_count | bigint | 待补充 |
| meituan_qrcode_pay_count | bigint | 待补充 |
| meituan_face_pay_count | bigint | 待补充 |
| web_sit_wap_pay_count | bigint | 待补充 |
| web_sit_e_bank_pay_count | bigint | 待补充 |
| wechat_app_pay_amount | decimal(38,2) | 待补充 |
| ali_app_pay_amount | decimal(38,2) | 待补充 |
| douyin_h5_pay_amount | decimal(38,2) | 待补充 |
| douyin_qrcode_pay_amount | decimal(38,2) | 待补充 |
| douyin_face_pay_amount | decimal(38,2) | 待补充 |
| meituan_h5_pay_amount | decimal(38,2) | 待补充 |
| meituan_qrcode_pay_amount | decimal(38,2) | 待补充 |
| meituan_face_pay_amount | decimal(38,2) | 待补充 |
| web_sit_wap_pay_amount | decimal(38,2) | 待补充 |
| web_sit_e_bank_pay_amount | decimal(38,2) | 待补充 |

## 查询规则

- 待补充

## 索引

- PK: (ds, distributor_id, store_id, e_type_id, equipment_id, type, e_type_name, e_code)
- INDEX: distributor_id
- INDEX: store_id
- INDEX: city_id
- INDEX: district_id
- INDEX: e_type_id
- INDEX: e_code
- INDEX: equipment_id
