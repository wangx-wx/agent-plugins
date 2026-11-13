---
table: xiaole_user_points_record
database: lyy_infor
domain: 洗水
dbDictId: 10376
description: 用户获取与消耗积分记录表
use_cases:
  - 查app用户积分记录
---

# xiaole_user_points_record

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | 主键ID |
| user_id | bigint | 用户Id |
| record_type | smallint | 记录类型，获取、消耗 |
| p_from | smallint | 积分来源 |
| from_id | bigint | 如果from是PointsTask，就拿具体的task，签到的话，这个fromId就为空 |
| p_to | smallint | 积分消耗处 |
| to_id | bigint | 如果to是exchange，就拿具体的PointsCommodity的id，如果是过期的话，这个toId就为空 |
| points | numeric | 积分值 |
| valid | smallint | 这条记录拿到的积分是否还有效 |
| create_time | timestamp without time zone | 创建时间 |
| created_by | character varying(20) | 创建人 |
| update_time | timestamp without time zone | 更新时间 |
| updated_by | character varying(20) | 更新人 |
| deleted | boolean | 是否删除 |

## 查询规则

- 待补充

## 参考 SQL

### 查app用户积分记录

```sql
select * from xiaole_user_points_record xupr where user_id ='2399' order by create_time desc
```

## 索引

- PK: id
- INDEX: user_id
