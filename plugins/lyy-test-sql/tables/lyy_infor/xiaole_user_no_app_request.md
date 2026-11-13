---
table: xiaole_user_no_app_request
database: lyy_infor
domain: 洗水
dbDictId: 10376
description: 用户提交不要app的申请
use_cases:
  - 查app不使用申请黑名单
---

# xiaole_user_no_app_request

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | 待补充 |
| platform_user_id | character varying(64) | 平台用户Id |
| subject_platform | character varying(20) | 平台 |
| telephone | character varying(20) | 手机号 |
| reason | character varying(255) | 提交原因 |
| status | smallint | 审核状态，0：未审核，1：已审核 |
| create_time | timestamp without time zone | 待补充 |
| created_by | character varying(20) | 待补充 |
| update_time | timestamp without time zone | 待补充 |
| updated_by | character varying(20) | 待补充 |
| deleted | boolean | 待补充 |

## 查询规则

- 待补充

## 参考 SQL

### 查app不使用申请黑名单

```sql
select * from xiaole_user_no_app_request xunar
```

## 索引

- PK: id
