---
table: jd_insurance_start_record
database: cmember
domain: 按摩
dbDictId: 10087
description: 京东保险核销启动记录表
use_cases:
  - 京东权益领取记录
---

# jd_insurance_start_record

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | numeric(12,0) | 主键ID |
| user_id | numeric(12,0) | 用户ID |
| merchant_id | numeric(11,0) | 商家ID |
| store_id | numeric(11,0) | 场地ID |
| equipment_value | character varying(24) | 设备编号 |
| phone | character varying(16) | 手机号 |
| reward_value | numeric(10,2) | 奖励值 |
| subsidy_amount | numeric(10,2) | 补贴金额 |
| use_time | timestamp without time zone | 使用核销时间 |
| use_status | smallint | 使用核销状态 0=初始化 1=核销成功 2=核销失败 |
| start_time | timestamp without time zone | 启动时间 |
| start_status | smallint | 启动状态 0=初始化 1=启动成功 2=启动失败 |
| create_time | timestamp without time zone | 创建时间 |
| update_time | timestamp without time zone | 更新时间 |
| created_by | bigint | 创建人 |
| updated_by | bigint | 修改人 |
| deleted | boolean | 是否删除 |
| order_no | character varying(32) | 订单号 |
| reward_type | smallint | 奖励类型 1=设备启动 2=券奖励 |
| extend_info | jsonb | 扩展信息字段 |

## 查询规则

- 待补充

## 索引

- PK: id
- INDEX: use_time
- INDEX: user_id
- INDEX: phone
