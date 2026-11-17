---
table: automatic_debit_receive_record
database: advert
domain: 按摩
dbDictId: 10082
description: 自动扣费领取记录表
use_cases:
  - 代扣记录
---

# automatic_debit_receive_record

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | 待补充 |
| user_id | numeric(11,0) | 用户id |
| distributor_id | numeric(11,0) | 商家id |
| group_id | numeric(11,0) | 场地id |
| equipment_id | numeric(11,0) | 设备id |
| equipment_value | character varying(32) | 设备编号 |
| equipment_type | numeric(11,0) | 设备类型 |
| track_no | character varying(32) | 扣费流水单号 |
| receive_amount | character varying(32) | 领取金额 |
| created | timestamp(6) without time zone | 待补充 |
| createdby | bigint | 待补充 |
| updated | timestamp(6) without time zone | 待补充 |
| updatedby | bigint | 待补充 |
| deleted | boolean | 逻辑删除，false-未删除 |

## 查询规则

- 待补充

## 参考 SQL

### 代扣记录

```sql
select * from automatic_debit_receive_record   where user_id in(2200020344) and created >= '2026-10-10' and distributor_id ='1032498';
```

## 索引

- PK: id
