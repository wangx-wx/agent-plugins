---
table: lyy.tiktok_activity_order
database: cmember
domain: 娱乐
dbDictId: 10087
description: 抖音活动订单表
use_cases:
  - 查询抖音订单
---

# tiktok_activity_order

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| tiktok_activity_order_id | numeric(10,0) | 抖音POI活动订单ID |
| lyy_distributor_id | numeric(10,0) | 商家ID |
| lyy_equipment_group_id | numeric(10,0) | 场地ID |
| lyy_equipment_id | numeric(10,0) | 设备ID |
| lyy_equipment_type_id | numeric(10,0) | 设备类型ID |
| equipment_value | character varying(40) | 设备value |
| tiktok_code | character varying(40) | 券码 |
| title | character varying(60) | 团单名称 |
| status | smallint | 状态 1 初始化 2 成功 3 失败 |
| details | jsonb | 详情 |
| created | timestamp(6) without time zone | 创建时间 |
| updated | timestamp(6) without time zone | 更新时间 |
| poi_id | character varying(40) | 商家poi_id |
| redeem_type | smallint | 核销类型 null: 反扫核销; 2: 抖音套餐核销; |
| sku_id | character varying(40) | 商品sku_id |
| lyy_user_id | bigint | 乐摇摇用户ID |

## 查询规则

- 待补充

## 参考 SQL

### 查询抖音订单

```sql
select * from tiktok_activity_order where sku_id='7284593202361796669'
```

## 索引

- 无（DDL 中未定义索引）
