---
table: adempiere.ad_org_attach
database: master
domain: 充电桩
dbDictId: 10099
description: B端商户扩展表
use_cases:
  - 查询是否资金池商家
---

# ad_org_attach

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| ad_org_attach_id | numeric(11,0) | 待补充 |
| ad_org_id | numeric(11,0) | 待补充 |
| customer_skin_version | character varying(1) | 1-旧版 2-新版 |
| switch_data | jsonb | 开关数据 |
| banner_logo_path | character varying(512) | 商家的自定义logo路径 |
| lyy_integral_switch | smallint | 乐摇摇积分商城开关，null或0为关，1为开 |
| equipment_value | character varying(32) | 商家默认设备 |
| open_quick_replenish | character(1) | C端快捷补货入口开关 Y-开启 N-关闭 |
| replenish_phone | character varying(255) | 快捷补货人员手机号 多个手机号“,”分割 |
| customer_topic_version | jsonb | c端主题版本 |
| created | timestamp(6) without time zone | 创建时间 |
| updated | timestamp(6) without time zone | 更新时间 |
| draw_fee_limit | smallint | 摇奖免单活动认证 0或null- 未认证  1-已认证 |
| third_balance_open | jsonb | 第三方会员导入开关 homePageNotify：导入余币余额首页强提醒开关设置：Y-开启，N-关闭 customerServiceAccess：导入余币余额客服入口开关设置：Y-开启，N-关闭 |
| alias_name | character varying(60) | 商家别名 |
| link_name | character varying(30) | 商家联系人 |
| primary_category | character varying(128) | 主营品类: 0:默认 1:电瓶车充电桩 2:自动售货机 3:按摩类 4:新能源汽车充电桩 5:洗衣水控类 6:游乐类 |
| is_wallet_settlement | boolean | 是否资金池结算,true是,false否 |
| business_scene_merchant_id | numeric(11,0) | 经销商商户ID |
| business_scene_agent_user_id | numeric(11,0) | 经销商代理商ID |
| belong_agent_user_id | numeric(11,0) | 归属代理商ID |
| belong_agent_merchant_id | numeric(11,0) | 归属商户ID |
| business_scene_type | character varying(32) | dealer：经销商，brand：品牌商 |

## 查询规则

- 待补充

## 索引

- PK: ad_org_attach_id
- UNIQUE: ad_org_id
