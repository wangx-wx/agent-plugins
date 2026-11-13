---
table: lyy_cdz_activity_black_list
database: advert
domain: 充电桩
dbDictId: 10082
description: 充电桩商创活动黑名单
use_cases:
  - 用户、场地、商家黑名单
---

# lyy_cdz_activity_black_list

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| lyy_cdz_activity_black_list_id | numeric(13,0) | 充电桩活动黑名单ID |
| business_type | numeric(4,0) | 业务类型(1:用户,2:场地,3:商户) |
| business_id | numeric(13,0) | 业务类型ID |
| business_name | character varying(64) | 业务类型名称 |
| merchant_id | numeric(13,0) | 商家ID |
| phone | character varying(32) | 手机号 |
| activity_id | numeric(4,0) | 活动类型ID:(1:保险次卡,2:1元保险月卡) |
| activity_name | character varying(64) | 活动类型名称 |
| operate_id | numeric(13,0) | 操作人ID |
| operate_name | character varying(64) | 操作人名称 |
| create_by | numeric(13,0) | 创建人 |
| update_by | numeric(13,0) | 更新人 |
| create_time | timestamp(6) without time zone | 创建时间 |
| update_time | timestamp(6) without time zone | 更新时间 |
| deleted | boolean | 是否删除 |

## 查询规则

- 待补充

## 参考 SQL

### 用户、场地、商家黑名单

```sql
select * from lyy_cdz_activity_black_list where business_type =1 and phone ='18877571383'
```

## 索引

- PK: lyy_cdz_activity_black_list_id
- UNIQUE: (business_type, business_id, activity_id)
- INDEX: business_id
- INDEX: merchant_id
