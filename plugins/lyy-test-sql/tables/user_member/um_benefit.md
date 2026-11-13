---
table: um_benefit
database: user_member
domain: 中台
dbDictId: 10108 / 10109 / 10110 / 10111
description: 权益表
use_cases:
  - 权益类型
---

# um_benefit

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | 主键id |
| merchant_id | numeric | 商户ID |
| title | character varying(32) | 标题 |
| sub_title | character varying(32) | 副标题 |
| code | character varying(32) | 权益编码 |
| classify | smallint | 权益分类 |
| benefit_count | numeric | 权益数量 |
| expiry_date_category | smallint | 可用有效期类型 0、无限期 1、日期区间可用 2、单日时间区间可用 |
| up_time | character varying(32) | 上线时间 |
| down_time | character varying(32) | 下线时间 |
| show_date_category | smallint | 可见有效期类型 0、无限期  1、日期区间可用 2、单日时间区间可用 |
| show_up_time | character varying(32) | 可见上线时间 |
| show_down_time | character varying(32) | 可见下线时间 |
| is_active | boolean | 是否可用 |
| create_time | timestamp(0) without time zone | 创建时间 |
| update_time | timestamp(0) without time zone | 更新时间 |

## 查询规则

- 待补充

## 参考 SQL

### 权益类型

```sql
select * from lyy.um_benefit where merchant_id ='1035814' order by create_time desc
```

## 索引

- PK: id
- INDEX: (merchant_id, classify, up_time, down_time)
- INDEX: (merchant_id, classify, expiry_date_category, is_active)
