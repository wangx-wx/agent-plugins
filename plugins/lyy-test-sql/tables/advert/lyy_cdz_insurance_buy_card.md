---
table: lyy_cdz_insurance_buy_card
database: advert
domain: 充电桩
dbDictId: 10082
description: 充电桩保险购卡表
use_cases:
  - 保险周卡、保险月卡、V会员保险月卡、星会员保险月卡
---

# lyy_cdz_insurance_buy_card

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| lyy_cdz_insurance_buy_card_id | numeric(11,0) | 主键id |
| lyy_user_id | numeric(12,0) | 用户id |
| lyy_distributor_id | numeric(11,0) | 商家id |
| lyy_equipment_id | numeric(11,0) | 设备id |
| lyy_equipment_type_id | numeric(11,0) | 设备类型id |
| lyy_equipment_group_id | numeric(11,0) | 设备场地id |
| out_trade_no | character varying(64) | 乐摇摇订单号 |
| third_trxid | character varying(64) | 第三方订单号 |
| status | numeric(2,0) | 状态：1-待支付，2-已支付，3-自动退款 |
| pay_amount | numeric(11,0) | 实际支付金额 |
| purchase_time | timestamp without time zone | 支付成功时间 |
| ad_org_id | numeric(11,0) | 支付虚拟商户 |
| ad_split_type | numeric(2,0) | 类型：5-充电桩保险月卡 |
| distributor_amount | numeric(11,0) | 商户分得总额 |
| lyy_amount | numeric(11,0) | 乐摇摇分得总额 |
| unionid | character varying(64) | 玩家unionid |
| name | character varying(64) | 玩家昵称 |
| invalid_flag | numeric(2,0) | 是否失效：0-否；1-是 |
| invalid_date | timestamp without time zone | 失效时间 |
| trade_type | character varying(12) | 支付渠道：aliPay-支付宝；JSAPI-微信 |
| tip_flag | character varying(1) | 是否已弹窗提示:0-否;1-是 |
| order_type | character varying(2) | 订单来源:1-banner弹窗;2扫码弹窗;3-购物车弹窗 |
| created | timestamp without time zone | 创建时间 |
| createdby | numeric(10,0) | 创建人ID |
| updated | timestamp without time zone | 更新时间 |
| updatedby | numeric(10,0) | 更新人ID |
| card_type | integer | 卡类别：1月卡；2-周卡 |
| effect_date | timestamp without time zone | 生效时间 |
| complaint_flag | character varying(2) | 是否投诉：0-否；1-是 |
| complaint_remark | character varying(200) | 投诉原因 |
| refund_type | smallint | 退款来源：1-平台（默认）；2-用户 |

## 查询规则

- 待补充

## 参考 SQL

### 保险周卡、保险月卡、V会员保险月卡、星会员保险月卡

```sql
select * from lyy_cdz_insurance_buy_card where lyy_user_id =2200006170 order by created  desc
```

## 索引

- PK: lyy_cdz_insurance_buy_card_id
- INDEX: out_trade_no
- INDEX: lyy_user_id
- INDEX: (purchase_time, status)
- INDEX: created
