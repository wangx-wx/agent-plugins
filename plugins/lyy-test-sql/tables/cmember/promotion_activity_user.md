---
table: promotion_activity_user
database: cmember
domain: 按摩
dbDictId: 10087
description: 用户活动领取记录表
use_cases:
  - —
---

# promotion_activity_user

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| promotion_activity_user_id | numeric(10,0) | 主键ID |
| promotion_activity_id | numeric(10,0) | 活动ID |
| lyy_user_id | numeric(12,0) | 用户ID |
| lyy_distributor_id | numeric(10,0) | 商户ID |
| lyy_equipment_group_id | numeric(10,0) | 场地ID |
| lyy_equipment_type_id | numeric(10,0) | 设备类型ID |
| reward_type | smallint | 0, 充值满赠支付立减券（随机金额） 1, 充值满赠支付立减券（固定金额） 2, 充值满赠充值送币券（随机币数） 3, 充值满赠充值送币券（固定币数） 4, 随机金额立减 5, 固定金额立减 6, 满赠送币机会（随机币） 7, 满赠送币机会（固定币） 8, 限时优惠（现有场地套餐打折） 9, 限时优惠（自定义限时套餐) 10, 新用户特惠（首单打折） 11, 新用户特惠（首单扣减固定金额） 12, 通行证激励金（平台） 13, 乐摇摇平台券 14, 摇奖免单券(随机立减) 15, 免单券  16, 赠送券  17, 体验券  18, 广告红包, 19, 限时折扣活动配置 20,礼品兑换券 21,体验折扣券 22,充值满赠支付折扣券 23,新用户特惠(自定义新用户专享套餐) 24,广告打折活动 25,平台随机立减活动(金额) 26,平台随机立减活动(比例) |
| reward_details | jsonb | 奖品属性 json串 |
| end_time | timestamp(3) without time zone | 过期时间 |
| status | smallint | (1, "待支付"), (2, "待使用"), (3, "已使用"), (4, "已过期"); |
| winning | smallint | 抽奖状态 |
| created | timestamp(3) without time zone | 记录创建时间 |
| updated | timestamp(3) without time zone | 记录更新时间 |
| start_time | timestamp(3) without time zone | 开始时间 |
| equipment_id | numeric(10,0) | 记录对应设备id |
| receive_time | timestamp(6) without time zone | 领取时间 |

## 查询规则

- 待补充

## 参考 SQL

### 参考查询

```sql
select * from promotion_activity_user where lyy_user_id =2200020344 and  created >= '2026-10-3' and lyy_distributor_id = 1032498 ;
```

## 索引

- 无（DDL 中未定义索引）
