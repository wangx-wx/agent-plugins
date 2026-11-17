---
table: lyy_cdz_insurance_order
database: advert
domain: 充电桩
dbDictId: 10082
description: 充电桩保险订单表
use_cases:
  - 投保订单记录
---

# lyy_cdz_insurance_order

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| lyy_cdz_insurance_order_id | numeric(11,0) | 主键id |
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
| insurance_amount | numeric(11,0) | 保单金额 |
| policy_no | character varying(128) | 保单号 |
| total_actual_premium | numeric(11,0) | 保费 |
| total_insured_amount | numeric(11,0) | 保额 |
| insurance_begin_date | timestamp without time zone | 保险起期 |
| insurance_end_date | timestamp without time zone | 保险止期 |
| insurance_status | character varying(2) | 保单状态：0-投保失败；1-投保成功;2-投保中;3-退保成功;4-退保失败 |
| insurance_describe | character varying(128) | 描述 |
| ad_split_type | numeric(2,0) | 分账类型：5-充电桩预充值 |
| order_type | character varying(2) | 订单来源：1-首页充值启动 |
| tip_flag | character varying(2) | 提示标志 |
| trade_type | character varying(12) | 支付渠道：aliPay-支付宝；JSAPI-微信 |
| distributor_amount | numeric(11,0) | 商户分得总额 |
| lyy_amount | numeric(11,0) | 乐摇摇分得总额 |
| unionid | character varying(64) | 玩家unionid |
| name | character varying(64) | 玩家昵称 |
| created | timestamp without time zone | 创建时间 |
| createdby | numeric(10,0) | 创建人ID |
| updated | timestamp without time zone | 更新时间 |
| updatedby | numeric(10,0) | 更新人ID |
| insurance_type | character varying(2) | 保险类型：1-单次；2-月卡 |
| openid | character varying(64) | 用户openid |
| equipment_value | character varying(64) | 设备号 |
| order_source | character varying(2) | 订单来源：1-乐摇摇；2-东晙 |
| settlement_flag | character varying(2) | 是否结算：0-否；1-是 |
| insure_platform | smallint | 0: 平安,1: 安心充 |

## 查询规则

- 待补充

## 参考 SQL

### 投保订单记录

```sql
select * from lyy_cdz_insurance_order where lyy_user_id =2200006170 order by created  desc
```

## 索引

- 无（DDL 中未定义索引）
