---
table: member_user_info
database: carcharging
domain: 汽充桩
dbDictId: 10131
description: C端用户信息
use_cases:
  - 用户表
---

# member_user_info

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | ID |
| member_id | bigint | 中台全局用户ID |
| merchant_member_id | bigint | 商户用户ID |
| merchant_id | bigint | 商户ID |
| name | character varying(32) | 昵称 |
| phone | bigint | 手机号 |
| agreement_id | character varying(32) | 协议ID |
| head_image | character varying(255) | 头像地址 |
| sign_flag | smallint | 是否已签约：0 未签约， 1 签约成功，2 签约失败 |
| created | timestamp(6) without time zone | 创建时间 |
| updated | timestamp(6) without time zone | 修改时间 |
| created_by | bigint | 创建人 |
| updated_by | bigint | 修改人 |
| deleted | boolean | 软删除标志 |
| organization_id | bigint | 组织Id |
| last_start_mode | smallint | 记录用户上次启动方式 |
| last_select_insurance | boolean | 记录用户上次是否勾选保险 |
| phone_updated | timestamp without time zone | 手机号更新时间 |
| phone_station_id | bigint | 绑定手机号关联的场地 |

## 查询规则

- 待补充

## 参考 SQL

### 用户表

```sql
select * from  member_user_info where member_id=2200005679
```

## 索引

- PK: id
- UNIQUE: (merchant_member_id, merchant_id)
- UNIQUE: (member_id, merchant_id)
- INDEX: (phone, merchant_id)
