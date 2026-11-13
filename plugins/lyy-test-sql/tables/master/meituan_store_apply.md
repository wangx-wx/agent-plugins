---
table: adempiere.meituan_store_apply
database: master
domain: 娱乐
dbDictId: 10099
description: 美团店铺申请表
use_cases:
  - 查询美团授权记录
---

# meituan_store_apply

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| meituan_store_apply_id | numeric(10,0) | 待补充 |
| lyy_distributor_id | numeric(10,0) | 商户id |
| lyy_equipment_group_id | numeric(10,0) | 场地id |
| meituan_store_id | character varying(64) | 美团店铺id |
| pay_status | character varying(16) | 支付状态：Prepare待支付，Pay已支付 |
| meituan_store_order_id | numeric(10,0) | 业务订单id |
| apply_status | character varying(16) | 申请状态：Applying申请中，Refuse审核不通过，Pass已通过 |
| store_name | character varying(32) | 待补充 |
| lyy_district_id | numeric(10,0) | 地区id |
| district_info | character varying(64) | 地区信息 |
| address | character varying(64) | 商户地址 |
| phone_number | character varying(11) | 商户电话 |
| package_info | jsonb | 套餐信息数组 |
| store_img | jsonb | 店铺图片url数组 |
| remark | character varying(100) | 备注 |
| created | timestamp(3) without time zone | 待补充 |
| createdby | numeric(10,0) | 待补充 |
| updated | timestamp(3) without time zone | 待补充 |
| is_del | character(1) | 是否删除：Y/N |
| branch_store_name | character varying(20) | 分店名称 |
| business_time | jsonb | 营业时间：记录{开始时间:startTime,结束时间:endTime} |
| is_await_pay | character(1) | 是否待支付 |
| channel | character(1) | 0 旧核销，1 新核销 |
| bid | character varying(64) | 美团商家Id |
| migrate_status | smallint | 1:已迁移美团op |
| op_poi_id | character varying(64) | 美团op门店id |
| op_customer_id | character varying(64) | 美团op客户id |
| multi_point | smallint | 1:多经点位 |
| meituan_shop_id | numeric(30,0) | 美团门店shop_id |

## 查询规则

- 待补充

## 索引

- PK: meituan_store_apply_id
- INDEX: op_poi_id
- INDEX: lyy_district_id
- INDEX: (lyy_equipment_group_id, apply_status)
- INDEX: lyy_distributor_id
