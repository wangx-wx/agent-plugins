---
table: automatic_debit_order
database: advert
domain: 充电桩、按摩
dbDictId: 10082
description: 自动扣款订单表
use_cases:
  - V会员签约表、代扣订单
---

# automatic_debit_order

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | numeric(11,0) | 主键ID |
| order_no | character varying(64) | 乐摇摇订单号 |
| user_id | numeric(11,0) | 用户id |
| distributor_id | numeric(11,0) | 商家id |
| group_id | numeric(11,0) | 场地id |
| equipment_id | numeric(11,0) | 设备id |
| equipment_value | character varying(32) | 设备编号 |
| equipment_type | numeric(11,0) | 设备类型 |
| client | character varying(16) | 客户端 |
| channel_id | character varying(64) | 渠道id |
| debit_type | smallint | 扣费方式 |
| phone_number | character varying(32) | 手机号码 |
| first_pay_amount | character varying(32) | 首笔金额 |
| debit_amount | character varying(32) | 扣费金额 |
| execute_time | character varying(32) | 执行时间 |
| period | character varying(32) | 执行时间 |
| status | smallint | 0-未支付,1-支付完成,2-取消,3-签约成功，-1失败 |
| created | timestamp(6) without time zone | 创建时间 |
| createdby | bigint | 创建人 |
| updated | timestamp(6) without time zone | 更新时间 |
| updatedby | bigint | 更新人 |
| channel_order_no | character varying(64) | 渠道订单号 |
| extra_info | jsonb | 透传信息 |
| business_order_no | character varying(64) | 业务订单号 |
| alipay_user_id | character varying(64) | 支付宝用户ID |
| last_debit_amount | character varying(32) | 最新扣费金额 |
| last_debit_date | character varying(32) | 最近扣款时间 |
| fail_reason | character varying(200) | 失败原因 |
| platform | character varying(32) | 平台标识 |
| platform_user_id | character varying(64) | 第三方平台用户ID |
| automatic_debit_config_id | numeric(11,0) | 自动扣款配置ID |
| channel_code | character varying(32) | 渠道编码 |
| next_deduct_time | character varying(32) | 下次扣费时间 |
| unsign_time | character varying(32) | 解约时间 |
| agreement_no | character varying(64) | 平台签约单号 |
| first_debit_period | character varying(20) | 首次扣费周期（天） |

## 查询规则

- 待补充

## 参考 SQL

### V会员签约表

```sql
select * from automatic_debit_order where user_id =2200020065 and order_no ='ALCDZ220000123020240808115504387'
```

### 代扣订单

```sql
select * from automatic_debit_order where created >= '2026-3-3'  and user_id = 2200012720 ;
```

## 索引

- PK: id
- INDEX: (channel_code, status, next_deduct_time)
- INDEX: (user_id, created)
- INDEX: channel_order_no
- INDEX: (user_id, status)
- INDEX: order_no
- INDEX: (platform, channel_code, platform_user_id, status, id)
- INDEX: phone_number
- INDEX: alipay_user_id
- INDEX: (channel_code, platform, created)
- INDEX: created
- INDEX: platform_user_id
