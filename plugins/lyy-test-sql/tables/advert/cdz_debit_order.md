---
table: cdz_debit_order
database: advert
domain: 充电桩
dbDictId: 10082
description: 充电桩扣款订单表
use_cases:
  - 星会员签约表
---

# cdz_debit_order

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | numeric(11,0) | 待补充 |
| order_no | character varying(64) | 乐摇摇订单号 |
| user_id | numeric(11,0) | 用户id |
| distributor_id | numeric(11,0) | 商家id |
| group_id | numeric(11,0) | 场地id |
| equipment_id | numeric(11,0) | 设备id |
| equipment_value | character varying(32) | 设备编号 |
| equipment_type | numeric(11,0) | 设备类型 |
| client | character varying(16) | 客户端 |
| app_id | character varying(64) | 待补充 |
| debit_type | smallint | 扣费方式 |
| phone_number | character varying(32) | 手机号码 |
| first_pay_amount | numeric(10,2) | 首笔金额 |
| debit_amount | numeric(10,2) | 扣费金额 |
| last_debit_amount | numeric(10,2) | 待补充 |
| execute_time | character varying(32) | 执行时间 |
| period | character varying(32) | 执行间隔时间 |
| sign_status | smallint | 签约状态 0-未处理,1-签约成功,2-签约取消,3-签约失败 |
| deduction_status | smallint | 扣款状态 0-未处理,1-扣款成功,2-扣款处理中,3-扣款失败 |
| created | timestamp(6) without time zone | 待补充 |
| createdby | bigint | 待补充 |
| updated | timestamp(6) without time zone | 待补充 |
| updatedby | bigint | 待补充 |
| channel_order_no | character varying(64) | 渠道订单号（签约） |
| extra_info | jsonb | 透传信息 |
| business_order_no | character varying(64) | 业务订单号（扣款） |
| last_debit_date | character varying(32) | 最近扣款时间 |
| fail_reason | character varying(200) | 失败原因 |
| platform_user_id | character varying(64) | 第三方平台用户ID |
| debit_config_id | numeric(11,0) | 待补充 |
| channel_code | character varying(32) | 渠道编码 |
| next_deduct_time | character varying(32) | 下次扣费时间 |
| unsign_time | character varying(32) | 解约时间 |
| contract_id | character varying(64) | 委托代扣协议id |
| fail_count | smallint | 扣费失败重试次数 |
| deleted | boolean | 是否删除,true:已删除 |

## 查询规则

- 待补充

## 索引

- PK: id
- UNIQUE: channel_order_no
- UNIQUE: order_no
- INDEX: user_id
- INDEX: (user_id, order_no, created)
- INDEX: created
