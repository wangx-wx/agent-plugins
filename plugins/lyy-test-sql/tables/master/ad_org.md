---
table: adempiere.ad_org
database: master
domain: 充电桩
dbDictId: 10099
description: 商家工厂表
use_cases:
  - 查询商家ID
---

# ad_org

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| ad_org_id | numeric(10,0) | 主键id |
| ad_client_id | numeric(10,0) | 待补充 |
| isactive | character(1) | 待补充 |
| created | timestamp without time zone | 待补充 |
| createdby | numeric(12,0) | 待补充 |
| updated | timestamp without time zone | 待补充 |
| updatedby | numeric(12,0) | 待补充 |
| value | character varying(40) | 编号 |
| name | character varying(60) | 名称 |
| description | character varying(255) | 备注 |
| issummary | character(1) | 没用 |
| ad_replicationstrategy_id | numeric(10,0) | 没用 |
| is_internal_orders_enabled | character(1) | 没用 |
| c_bpartner_id | numeric(10,0) | 没用 |
| balance | numeric(10,2) | 收益余额 |
| total | numeric(12,2) | 收益总额 |
| address | character varying(256) | 没用 |
| alipay_account | character varying(40) | 没用 |
| card_holder | character varying(30) | 没用 |
| bank_account | character varying(60) | 没用 |
| bank_name | character varying(30) | 没用 |
| sub_bank | character varying(250) | 没用 |
| type | character varying(2) | 类型：D-商家 F-工厂 DE-经销商 |
| default_price | numeric | 没用 |
| alipay_name | character varying(20) | 没用 |
| cooperation_mode | character varying(6) | 摇摇车合作模式-已没用 |
| contact | character varying(64) | 没用 |
| telephone | character varying(21) | 手机号码 |
| lyy_staff_id | numeric(10,0) | 关联的职工id-已没用 |
| lyy_district_id | numeric(10,0) | 区域id-已没用 |
| has_income | character(1) | 没用 |
| sub_total | numeric | 子商户收益总额-已没用 |
| sub_merchant | character(1) | 是否子商户-已没用 |
| merchant_number | character varying(16) | 子商户号-已没用 |
| sub_created | timestamp without time zone | 子商户创建时间-已没用 |
| api_key | character varying(60) | 没用 |
| secret_key | character varying(60) | 没用 |
| cib_total | numeric | 特约商户收益总额 |
| cib_merchant | character(1) | 是否特约商户 |
| cib_number | character varying(16) | 特约商户号 |
| cib_key | character varying(32) | 没用 |
| cib_created | timestamp without time zone | 特约商户生效时间 |
| isadvertise | character(1) | 是否开启广告 |
| min_ad_price | numeric | 广告最低价格 |
| min_equipment_count | numeric(10,0) | 没用 |
| ad_percent | numeric | 工厂广告分成比例 |
| customer_service_number | character varying(20) | 客服电话 |
| business_name | character varying(50) | 商户名称 |
| default_discount | numeric(10,2) | 没用 |
| agent_number | character varying(20) | 代理商编码 |
| can_owe | character(1) | 是否允许欠费 |
| can_owe_fee | numeric(10,2) | 可欠费金额 |
| agent_id | numeric(10,0) | 广告主类型组织所属的代理商主键 |
| advert_price | numeric(10,2) | 广告默认单价 |
| distributorpart | numeric(10,2) | 投放商分成，用于代理商所属广告任务分成 |
| is_member_card_enable | character(1) | 会员卡开关 |
| avatar | character varying(255) | 头像地址 |
| third_pay_service_code | character varying(255) | 支付服务，例：浦发支付，则为"spdb" |
| wechat_pay_flag | character(1) | 是否可使用微信原生支付Y:是 N:否 F:禁用 |
| ispopadwindow | character(1) | 是否已读广告弹窗 Y:已读 N:未读 |
| isopenintegral | character(1) | 是否开通积分商城：Y=是 |
| balance_alias | character(3) | 商户游戏币显示名称 |
| cib_balance | numeric | 电子秤特约商户账户余额 |
| country_code | character varying(8) | 国家编码 |
| wechat_facepay_sign_flag | character(1) | 微信刷脸签约状态 Y-已签约  N-未签约 |
| allow_pay | numeric(1,0) | 支付状态：null /0 允许，1不允许 |
| platform_user_id | numeric(10,0) | 平台用户id |
| app_id | character varying(64) | 待补充 |
| merchant_logo | character varying(255) | 品牌logo |

## 查询规则

- 待补充

## 参考 SQL

### 查询商家ID

```sql
select * from ad_org  where value like '%17665126143%'
```

## 索引

- PK: ad_org_id
- UNIQUE: value
- UNIQUE: (ad_client_id, value)
- INDEX: created
- INDEX: api_key
- INDEX: (name, type)
- INDEX: cooperation_mode
