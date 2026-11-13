---
table: lyy_distributor_advertise_coupon
database: advert
domain: 充电桩
dbDictId: 10082
description: 商家广告红包表
use_cases:
  - 用户广告红包权益
---

# lyy_distributor_advertise_coupon

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| lyy_distributor_advertise_coupon_id | numeric | 主键ID |
| lyy_user_id | numeric | 关联用户ID |
| ad_org_id | numeric | 商家ID |
| lyy_equipment_id | numeric | 关联设备ID |
| lyy_equipment_group_id | numeric | 关联设备场地ID |
| lyy_fans_id | numeric | 关联粉丝ID |
| coupon_fee | numeric | 优惠券金额 |
| balance | numeric | 余额 |
| isactive | character(1) | 是否激活 |
| start_time | timestamp without time zone | 开始时间 |
| end_time | timestamp without time zone | 结束时间 |
| created | timestamp without time zone | 创建时间 |
| createdby | numeric | 创建人ID |
| updated | timestamp without time zone | 更新时间 |
| updatedby | numeric | 更新人ID |
| task_id | numeric | 关联任务ID |
| task_price | numeric | 任务价格 |
| coupon_type | integer | 优惠券类型 |

## 查询规则

- 待补充

## 索引

- PK: lyy_distributor_advertise_coupon_id
- INDEX: (lyy_user_id, lyy_fans_id)
- INDEX: (ad_org_id, lyy_user_id)
