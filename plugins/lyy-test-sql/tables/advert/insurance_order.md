---
table: insurance_order
database: advert
domain: 按摩
dbDictId: 10082
description: 商创保险订单
use_cases:
  - 权益订单表
---

# insurance_order

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | numeric(11,0) | 主键id |
| order_time | timestamp(6) without time zone | 下单时间 |
| end_time | timestamp(6) without time zone | 结束时间 |
| out_trade_no | character varying(64) | 订单号 |
| insurance_no | character varying(64) | 保单号 |
| equipment_type | character varying(8) | 设备类型 |
| equipment_value | character varying(16) | 设备编码 |
| equipment_id | numeric(11,0) | 设备Id |
| lyy_user_id | numeric(11,0) | 用户Id |
| distributor_id | numeric(11,0) | 商家Id |
| equipment_group_id | numeric(11,0) | 设备场地id |
| equipment_group_name | character varying(255) | 设备场地名称 |
| order_source | smallint | 订单来源 |
| open_id | character varying(64) | 用户openId |
| user_name | character varying(64) | 用户名 |
| router_id | numeric(11,0) | 路由Id |
| insurance_name | character varying(64) | 保险名称 |
| insurance_price | numeric(5,2) | 保险金额 |
| order_channel | smallint | 订单渠道 |
| equip_status | smallint | 设备状态 |
| order_status | smallint | 订单状态 |
| insurance_status | smallint | 保单状态 |
| created | timestamp(6) without time zone | 创建时间 |
| updated | timestamp(6) without time zone | 更新时间 |
| click_status | smallint | 订单勾选状态 |
| vertical | smallint | 是否竖版 |
| provider | character varying(20) | 保险提供商 |
| benefit_name | character varying(20) | 保险权益名称 |
| config_id | numeric(11,0) | 配置ID |
| sku_id | character varying(64) | 商品ID |
| brand | character varying(20) | 设备品牌 |

## 查询规则

- 待补充

## 参考 SQL

### 权益订单表

```sql
select * from insurance_order   where lyy_user_id in(2200020344) and created >= '2026-10-10' and distributor_id ='1032498';
```

## 索引

- 无（DDL 中未定义索引）
