---
table: tiktok_activity_poi
database: cmember
domain: 娱乐
dbDictId: 10087
description: 抖音POI活动
use_cases:
  - 查询抖音商户门店
---

# tiktok_activity_poi

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| tiktok_activity_poi_id | numeric(11,0) | 抖音活动POI |
| lyy_distributor_name | character varying(40) | 商家名称 |
| lyy_distributor_id | numeric(10,0) | 商家ID |
| poi_id | character varying(40) | 抖音poi |
| poi_name | character varying(40) | 店名 |
| address | character varying(200) | 地址 |
| latitude | numeric(12,8) | 纬度 |
| longitude | numeric(12,8) | 经度 |
| show_switch | smallint | 展示开关 0 关闭 1 开启 |
| created | timestamp(6) without time zone | 创建时间 |
| updated | timestamp(6) without time zone | 更新时间 |
| createdby | numeric(10,0) | 创建人 |
| updatedby | numeric(10,0) | 更新人 |
| isactive | character(1) | 是否有效 Y 有效 N 无效 |
| account_id | character varying(40) | 商家抖音账号id |

## 查询规则

- 待补充

## 参考 SQL

### 查询抖音商户门店

```sql
select * from tiktok_activity_poi where poi_id='7284593202361796669'
```

## 索引

- PK: tiktok_activity_poi_id
- INDEX: (lyy_distributor_id, account_id)
