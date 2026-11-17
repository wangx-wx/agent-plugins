---
table: um_benefit_scope
database: user_member
domain: 中台
dbDictId: 10108 / 10109 / 10110 / 10111
description: 权益范围表
use_cases:
  - 权益范围
---

# um_benefit_scope

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | 主键id |
| benefit_id | bigint | 权益ID |
| applicable | smallint | 适用类型 1 品类 2 场地 3 设备 4 商品 |
| associated_id | numeric | 关联ID |
| create_time | timestamp(0) without time zone | 创建时间 |
| update_time | timestamp(0) without time zone | 更新时间 |
| merchant_id | numeric | 商户Id |

## 查询规则

- 待补充

## 参考 SQL

### 权益范围

```sql
select * from lyy.um_benefit_scope where benefit_id ='1152274125952294912'
```

## 索引

- PK: id
- INDEX: (merchant_id, benefit_id)
- INDEX: (associated_id, applicable)
- INDEX: benefit_id
