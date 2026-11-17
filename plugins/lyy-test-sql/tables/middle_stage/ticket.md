---
table: ticket
database: middle_stage
domain: 洗水
dbDictId: 10346
description: 工单表
use_cases:
  - 查工单
---

# ticket

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | numeric(12,0) | 主键id |
| code | character varying(50) | 工单编号 |
| title | character varying(50) | 工单标题 |
| category_id | numeric(12,0) | 工单分类id |
| group_id | numeric(12,0) | 场地id |
| status | smallint | 工单状态：0-初始化，1-待处理，2-处理中，3-已关闭 |
| timeout_limit | timestamp(6) without time zone | 超时截止时间 |
| processor_id | numeric(12,0) | 当前处理人 |
| processor_group_id | numeric(12,0) | 当前处理组 |
| create_by_source | smallint | 创建人来源：0-系统用户，1-C端用户，2-B端用户 |
| is_active | boolean | 设备类型编号 |
| create_time | timestamp(6) without time zone | 创建时间 |
| update_time | timestamp(6) without time zone | 更新时间 |
| create_by | numeric(12,0) | 创建人 |
| update_by | numeric(12,0) | 更新人 |
| close_timeout_limit | timestamp(6) without time zone | 关闭超时时间 |
| reply_timeout_limit | timestamp(6) without time zone | 自动回复超时时间 |
| merchant_id | numeric(12,0) | 商家ID |
| participants | numeric(12,0)[] | 商家参与者 |
| description | character varying(255) | 工单描述 |
| business_system | smallint | 业务系统(null或者1 代表乐摇摇默认的, 2代表多金宝) |

## 查询规则

- 待补充

## 参考 SQL

### 查工单

```sql
select * from ticket
```

## 索引

- PK: id
- INDEX: (merchant_id, create_time)
- INDEX: (group_id, merchant_id, create_time)
