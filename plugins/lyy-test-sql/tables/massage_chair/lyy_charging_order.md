---
table: lyy_charging_order
database: massage_chair
domain: 充电桩
dbDictId: 10097
description: 充电业务订单表
use_cases:
  - 充电业务订单
---

# lyy_charging_order

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | numeric(10,0) | 订单ID |
| lyy_equipment_id | numeric(12,0) | 设备ID |
| lyy_equipment_group_id | numeric(12,0) | 场地ID |
| group_service_id | numeric(12,0) | 套餐ID |
| passage_way | numeric(4,0) | 通道 |
| coins | numeric(10,0) | 模拟投币数 |
| money | numeric(12,2) | 价格 |
| openid | character varying(128) | 用户openid |
| lyy_user_id | numeric(12,0) | 用户id |
| durings | numeric(10,0) | 时长 |
| start_time | timestamp without time zone | 订单开始时间 |
| pause_start_time | timestamp without time zone | 暂时开始时间 |
| pause_during_time | numeric(10,0) | 暂停多少时长 |
| device_status | numeric | 设备状态 |
| is_send_user | numeric(4,0) | 是否发送用户 |
| order_status | numeric | 订单状态 |
| create_time | timestamp without time zone | 创建时间 |
| update_time | timestamp without time zone | 更新时间/结束时间 |
| deleted | numeric(4,0) | 是否删除 |
| value | character varying(16) | 设备编号 |
| username | character varying(64) | 用户昵称 |
| description | character varying(255) | 描述 |
| lyy_distributor_id | numeric(10,0) | 待补充 |
| refund_money | numeric(10,2) | 退款金额 |
| lyy_online_coins_history_id | numeric(12,0) | 消费记录总表id-废弃 |
| main_order_id | numeric(10,0) | 主订单id |
| parent_id | numeric(10,0) | 上一次订单id |
| service_durings | numeric(10,0) | 服务套餐时长,单位:分钟 |
| group_number | numeric(10,0) | 设备机台号 |
| actual_time | numeric(10,0) | 实际充电时长 |
| close_action | smallint | 订单关闭来源, 0正常关闭，1商家远程停止, 2用户手动结束, 3设备启动失败, 4设备故障, 5订单未激活, 6订单服务时长为空, 7同一通道号重复下单关闭 8设备或端口异常，被迫停止 9瞬时功率过大，停止充电 10未接充电器 11机箱内出现烟雾，电源关闭 12充电过程中出现短路故障 13充电过程中出现过载故障 14设备意外断电或者意外复位导致停止充电 |
| out_trade_no | character varying(32) | 支付订单编号   0：余额启动，1：月卡启动,其他值 有支付订单 |
| hardware_minutes | numeric(10,0) | 主板剩余时长(分钟) |
| service_money | numeric(10,2) | 服务套餐金额 |
| login_flag | numeric(10,0) | 登录标识 |
| agent_user_id | numeric(11,0) | 代理商ID |
| group_service_cost_way | character varying(20) | 计费模式 |
| device_status_name | character varying(30) | 上报状态 |
| refund_type | smallint | 退款规则：0:不退款，1:实时退款，2限时退款 |
| limit_time | smallint | 限时退款 限制时间（分钟） |
| refund_way | numeric(1,0) | 退款方式：（1退余额，2原路退款） |
| time_or_electric | numeric(10,0) | 电量或者时长 |
| ic_card_no | character varying(32) | ic卡号 |
| attach_info | character varying(3000) | 附加信息 |
| end_power | integer | 充电功率 |
| pay_score_type | smallint | 支付分状态:-1不存在,0未支付,1待支付,2已支付,3已取消,4已失效 |
| start_type | smallint | 启动方式: 0余额启动,1:月卡启动, 2:投币, 3:刷卡,4:支付启动 ,5:支付分启动, 6:先充后付,7:服务端时长套餐，8:服务端金额套餐 |
| extend_param | character varying(500) | 订单扩展信息，用于显示 |
| app_id | character varying(128) | 微信appid(支付分需要回传) |
| pay_order_no | character varying(64) | 支付订单号 |
| order_no | character varying(32) | 新支付订单号 |
| pay_way | smallint | 支付方式 |
| delay_confirm_time | timestamp without time zone | 延迟结算订单确认时间 |
| delay_flag | smallint | 是否走延迟结算标识，0:否，1:是 |
| delay_status | smallint | 延迟结算状态，0：待确认，1：已确认，2：确认失败，3：无结果 |
| extra_param | text | 额外一些参数 |

## 查询规则

- 待补充

## 参考 SQL

### 充电业务订单

```sql
select * from lyy_charging_order where out_trade_no ='PA303026101011333322000143141005'
```

## 索引

- 无（DDL 中未定义索引）
