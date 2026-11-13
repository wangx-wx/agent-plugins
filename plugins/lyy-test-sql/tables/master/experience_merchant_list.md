---
table: adempiere.experience_merchant_list
database: master
domain: 支付
dbDictId: 10099
description: 体验期商户清单
use_cases:
  - 查体验期
---

# experience_merchant_list

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| experience_merchant_list_id | integer | id |
| ad_org_id | numeric(11,0) | 运营商id |
| ad_org_value | character varying(40) | 运营商账号 |
| app_id | character varying(60) | app_id |
| lyy_swiftpass_merchant_id | numeric(11,0) | 商户资料id |
| submit_entry_time | timestamp(6) without time zone | 提交进件时间 |
| created | timestamp(6) without time zone | 待补充 |
| updated | timestamp(6) without time zone | 待补充 |
| created_by | numeric(12,0) | 待补充 |
| updated_by | numeric(12,0) | 待补充 |
| is_active | boolean | 待补充 |
| workday | smallint | 工作日 |
| open_time | timestamp(6) without time zone | 体验期开启时间 |
| channel_code | smallint | 渠道code 4-汇付(已废弃) |
| close_time | timestamp(6) without time zone | 体验期关闭时间 |
| effective_time_end | timestamp(6) without time zone | 有效期结束时间 |
| merchant_name | character varying(60) | 商户全称 |
| merchant_code | character varying(60) | 渠道商户号(已废弃) |
| remark | character varying(255) | 备注 |
| real_name_show_dialog | smallint | 实名弹窗 0-不弹窗  1-弹窗 |
| status | smallint | 状态 0 初始 1 有效 2-失效 |
| expire_notice_day | smallint | 过期通知天数 |
| support_group_divide | boolean | 是否支持场地分账（v4.0 新增）。TRUE=走 MerchantGroupDivideRule 新链路；FALSE/NULL=走 ExperienceMerchantDivideRule 旧链路（默认）。NULL 表示从未开启过。 |
| ignore_real_name_codes | character varying(128) | 体验期关闭时忽略实名的渠道编码，多个渠道用英文逗号分隔 |
| support_client_check | boolean | 是否支持支付端检查体验期 |
| wechat_client_status | smallint | 微信端是否在体验期 0=否 1=是 |
| alipay_client_status | smallint | 支付宝端是否在体验期 0=否 1=是 |

## 查询规则

- 待补充

## 索引

- PK: experience_merchant_list_id
- UNIQUE: (ad_org_id, lyy_swiftpass_merchant_id)
- INDEX: ad_org_id
