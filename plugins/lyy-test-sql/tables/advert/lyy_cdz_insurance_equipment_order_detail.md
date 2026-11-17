---
table: lyy_cdz_insurance_equipment_order_detail
database: advert
domain: 充电桩
dbDictId: 10082
description: 整桩投保订单详情表
use_cases:
  - 设备整桩投保记录
---

# lyy_cdz_insurance_equipment_order_detail

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| lyy_cdz_insurance_equipment_order_detail_id | bigint | 主键ID |
| out_trade_no | character varying(32) | 订单表 |
| lyy_distributor_id | bigint | 关联商家ID |
| equipment_value | character varying(32) | 设备value |
| equipment_port | integer | 端口号 |
| lyy_equipment_id | bigint | 关联设备ID |
| lyy_equipment_group_id | bigint | 关联设备场地ID |
| insurance_amount | numeric(10,2) | 保单金额 |
| policy_no | character varying(128) | 保单号 |
| total_actual_premium | numeric(10,2) | 保费 |
| total_insured_amount | numeric(10,2) | 保额 |
| insurance_begin_date | timestamp(6) without time zone | 保险起期 |
| insurance_end_date | timestamp(6) without time zone | 保险止期 |
| insurance_status | integer | FAIL(0, "失败"), SUCCESS(1, "生效中（成功）"), EXPIRE(2, "失效（过期）"), REFUND(3, "已退保"); |
| insurance_describe | character varying(128) | 描述 |
| created | timestamp(6) without time zone | 创建时间 |
| createdby | bigint | 创建人ID |
| updated | timestamp(6) without time zone | 更新时间 |
| updatedby | bigint | 更新人ID |

## 查询规则

- 待补充

## 参考 SQL

### 设备整桩投保记录

```sql
select * from lyy_cdz_insurance_equipment_order_detail where out_trade_no ='PA116125081211305100331796651102'
```

## 索引

- PK: lyy_cdz_insurance_equipment_order_detail_id
- INDEX: lyy_equipment_group_id
- INDEX: equipment_value
- INDEX: out_trade_no
