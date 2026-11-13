---
table: lyy_cdz_member_card
database: advert
domain: 充电桩
dbDictId: 10082
description: 充电桩自动续费会员卡
use_cases:
  - V会员
  - 星会员卡表
---

# lyy_cdz_member_card

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | 主键ID |
| lyy_user_id | bigint | 关联用户ID |
| lyy_user_name | character varying(64) | 用户昵称 |
| lyy_distributor_id | bigint | 关联商家ID |
| out_trade_no | character varying(64) | 乐摇摇订单号 |
| third_order_no | character varying(64) | 第三方订单号 |
| pay_status | smallint | 支付状态 0：待支付、1：已支付、2：已退款 |
| card_status | smallint | 卡状态 0：代生效、1：生效中、2：已过期、3：已退卡 |
| amount | numeric(10,2) | 支付金额 |
| order_source | smallint | 订单来源 0：微信 1：支付宝 |
| order_position | smallint | 订单触发位置：0：首页弹窗 |
| agent_user_id | bigint | 代理商ID |
| agent_user_name | character varying(64) | 代理商名称 |
| user_phone | character varying(32) | 用户手机号 |
| start_time | timestamp(6) without time zone | 生效开始时间 |
| end_time | timestamp(6) without time zone | 生效结束时间 |
| discount_rate | integer | 折扣比例 |
| single_limit_amount | numeric(10,2) | 单次折扣上限 |
| month_limit_amount | numeric(10,2) | 每月折扣累计上限 |
| current_limit_amount | numeric(10,2) | 当前累计 |
| callback_json | character varying(500) | 回调信息：用于自动续费成功订单创建订单信息 |
| created | timestamp(6) without time zone | 创建时间 |
| createdby | character varying(64) | 创建人 |
| updated | timestamp(6) without time zone | 更新时间 |
| updatedby | character varying(64) | 更新人 |
| tip_flag | smallint | 是否已弹窗提示:0-否;1-是 |
| open_id | character varying(64) | 支付宝openId |
| channel_code | character varying(32) | 渠道编码 |
| refund_reason | character varying(256) | 退款类型 |
| refund_type | smallint | 退款类型，1 用户取消、2：后台取消 |
| refund_time | timestamp(6) without time zone | 退款时间 |

## 查询规则

- 待补充

## 索引

- PK: id
- INDEX: created
- INDEX: lyy_distributor_id
- INDEX: lyy_user_id
- INDEX: third_order_no
- INDEX: open_id
- INDEX: out_trade_no
- INDEX: (channel_code, created)
