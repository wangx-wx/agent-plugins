---
table: order_charge
database: carcharging
domain: 汽充桩
dbDictId: 10131
description: 充电订单表
use_cases:
  - 订单
---

# order_charge

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | 主键Id，雪花算法生成 |
| member_id | bigint | 会员Id |
| merchant_member_id | bigint | 商户会员Id |
| merchant_id | bigint | 商户Id |
| out_trade_id | character varying(32) | 交易单号 |
| pay_id | character varying(32) | 支付单号 |
| out_side_order_no | character varying(64) | 第三方交易订单号 |
| station_id | bigint | 站id |
| equipment_code | character varying(20) | 充电桩编码 |
| socket_code | character varying(22) | 充电枪编码 |
| socket_num | integer | 枪序号 |
| unique_code | character varying(20) | 设备唯一码 |
| pay_mode | smallint | WECHAT("wechat", 1, "Wechat"),     WX_MINI("wxMini", 2, "Wechat"),     ALI_PAY("aliPay", 3, "Alipay"),     ALI_MINI("aliMini", 4, "Alipay"),     BALANCED("Balanced", 90, "Balanced"),     UNKNOWN("Unknown", 99, "Unknown"), |
| total_amount | numeric(15,2) | 总金额 |
| actual_amount | numeric(15,2) | 实付金额 |
| reduce_amount | numeric(15,2) | 优惠金额 |
| total_charge_fee | numeric(15,2) | 总电费 |
| total_service_fee | numeric(15,2) | 总服务费 |
| total_power | numeric(15,4) | 总充电量，单位度 |
| total_time | integer | 总充电时长，单位分钟 |
| end_reason | character varying(255) | 结束原因 |
| pay_status | smallint | UN_PAY(1, 待支付), PAYING(2, 支付中), PAY_SUCCESS(3, 支付成功), PAY_FAIL(4, 支付失败), PAY_CANCEL(5, "支付取消"),; |
| order_status | smallint | RUNNING(1,"启动中"), RUN_FAIL(2,"启动失败"), CHARGING(3,"（启动成功）充电中"), PEND(4,"(停止失败)结算中"), FINISH(5,"充电完成"), ; |
| order_origin | smallint | customer(1, "c端"), card(2, "刷卡"), vin(3, "vin码"), |
| order_mode | smallint | AUTO(1,"自动充满"), money(2,"按金额"), ele(3,"按电量"), time(4,"按时间"), |
| station_name | character varying(64) | 场地名称 |
| pay_time | timestamp without time zone | 支付时间 |
| price_model_id | bigint | 当时使用的计费模型id |
| equipment_statute_type | bigint | 充电规约类型 |
| created | timestamp without time zone | 创建时间 |
| created_by | bigint | 创建时间 |
| updated | timestamp without time zone | 结束时间 |
| updated_by | bigint | 更新人 |
| organization_id | bigint | 组织Id |
| deleted | boolean | 软删除 |
| nickname | character varying(50) | 用户昵称 |
| price_data | text | 价格数据（冗余计费模型） |
| open_id | character varying(64) | 微信openid |
| app_id | character varying(64) | 微信的appid |
| start_amount | numeric(15,2) | 启动金额 |
| start_mode | smallint | 启动方式 |
| finish_time | timestamp without time zone | 完结时间 |
| license_plate | character varying(20) | 车牌号 |
| platform_id | character varying(15) | 平台ID |
| operator_id | character varying(15) | 商户组织机构代码 |
| equipment_id | bigint | 中台的设备ID |
| equipment_type | integer | 设备类型 |
| card_no | character varying(30) | 刷卡启动的卡号 |
| order_mode_param | numeric(15,2) | 充电方式参数 自动充满为空 按时长充电：是时长 按电量充电：是电量 按金额充电：是金额 |
| es_flag | boolean | es标志 |
| pay_version | smallint | 支付版本，1-旧支付，2-新支付 |
| pay_need | boolean | 是否需要拉起支付标识，true是，false否 |
| delay_status | integer | 延迟结算状态 0-待确认 1-成功 2-失败 3-无结果 999-确认异常 |
| end_reason_code | character varying(20) | 结束原因编码 |
| normal_flag | integer | 是否正常单表示，0：正常单，1：异常单 |
| hlht_socket_code | character varying(40) | 互联互通枪编号 |
| car_team_id | bigint | 车队ID |
| car_team_name | character varying(30) | 车队名称 |
| vin_code | character varying(32) | vin码 |
| order_type | integer | 2：放电订单，为空是充电订单 |
| hlht_platform_operator_id | character varying(20) | 外部设备平台id |
| hlht_merchant_operator_id | character varying(20) | 外部设备商户id |
| delay_flag | integer | 延迟结算标识 |

## 查询规则

- 待补充

## 参考 SQL

### 订单

```sql
select * from  order_charge where merchant_id =1036438 and member_id=34293078 and pay_id='PA1105220915172024342930788074'
```

## 索引

- PK: id
- UNIQUE: out_trade_id
- INDEX: (equipment_code, finish_time)
- INDEX: member_id
- INDEX: out_side_order_no
- INDEX: (merchant_member_id, created)
- INDEX: (merchant_member_id, order_status)
- INDEX: (merchant_id, order_status)
- INDEX: pay_id
- INDEX: (socket_code, created)
- INDEX: updated
- INDEX: (station_id, merchant_id, order_status)
