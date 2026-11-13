---
table: lyy_ic_card_flow
database: massage_chair
domain: 充电桩、洗水
dbDictId: 10097
description: 卡流水金额
use_cases:
  - IC卡流水记录
  - 查ic卡流水
---

# lyy_ic_card_flow

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| lyy_ic_card_flow_id | numeric(11,0) | 主键ID |
| lyy_equipment_id | numeric(11,0) | 设备ID |
| equipment_no | character(16) | 设备号 |
| lyy_user_id | numeric(11,0) | 用户ID |
| merchant_id | numeric(11,0) | 商户ID |
| card_no | character varying(32) | 卡号 |
| flow_amount | numeric(8,2) | 流水记录金额，单位：元 |
| flow_type | numeric(2,0) | 1扫码充卡 2刷卡充电 3使用账户余额充卡 4回刷停止充电 5充电自动停止 6-扫码充卡结果 7-打卡洗衣 8-刷卡洗衣启动失败 9-剩余费用退款,10 实际消费金额 ,11 刷卡取水,12手工退款 13销卡,14余额转入,15商家赠送,16销卡退款,17商家修改增加余额,18商家修改减少余额, 19消费扣款 |
| ext | character varying(64) | 扩展字段和流水类型匹配，对应充值订单号、补卡的卡号 |
| create_time | timestamp(6) without time zone | 创建时间 |
| lyy_equipment_group | character varying(50) | 设备归属的场地名称可改变 |
| memo | character varying(64) | 说明 |
| status | numeric(1,0) | 0初始状态  1操作成功   2失败  3超时  4无效 -1已退款 |
| amount | numeric(8,2) | ic卡当前的余额，计算后的 |
| receive_status | numeric(1,0) | 圈存版充值流水领取状态：0-待领取；1-领取中；2-已领取 |
| refund_amount | numeric(8,2) | 充值余额-退款金额 |
| refund_time | timestamp(6) without time zone | 退款时间 |
| expiration_date | date | 过期日期 |
| time_limit | bigint | 有效期（天） |
| usage_amount | numeric(8,0) | 使用量(售水机为出水量 ml) |
| charge_mode | character varying(64) | 计费方式（TIME_INTERVAL-按时段计费，TIMES-按次数计费） |
| order_id | numeric(10,0) | 业务订单Id |
| lyy_ic_card_id | numeric(11,0) | ic卡ID |
| present | numeric(8,2) | ic卡当前的赠送余额，计算后的 |
| flow_present | numeric(8,2) | 赠送金额流水 |
| passway | numeric(4,0) | 端口 |
| start_param | character varying(1024) | 启动参数(参考:LifeOrderStartParamDTO) |
| deduction_remarks | character varying(64) | 扣款备注 |
| actual_time | timestamp(6) without time zone | 消费时间 |
| order_no | character varying(64) | 中台支付单号 |
| update_time | timestamp(6) without time zone | 更新时间 |
| refund_present | numeric(8,2) | 赠送余额-退款金额 |

## 查询规则

- 待补充

## 索引

- 无（DDL 中未定义索引）
