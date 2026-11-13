---
table: ods_unified_redeem_order
database: selectdb_payment
domain: 中台
dbDictId: 281279114926002178
description: 核销订单聚合，聚合三方，美团，抖音核销的数据
use_cases:
  - 经营统计查抖音核销数据
  - 经营统计查美团核销数据
---

# ods_unified_redeem_order

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| source_table | varchar(64) | 来源表名(third_redeem_record,meituan_redeem_record,tiktok_activity_order) |
| source_id | bigint | 来源表主键ID |
| day | date | 日期分区字段(来源于created) |
| channel | varchar(32) | 渠道: meituan/tiktok |
| business_type | varchar(32) | 业务类型: self/assembly |
| distributor_id | bigint | 商户ID |
| equipment_group_id | bigint | 场地ID |
| equipment_type_id | bigint | 设备类型ID |
| equipment_id | bigint | 设备ID |
| user_id | bigint | 用户ID |
| position_id | bigint | 仓位ID |
| locate | bigint | 仓位编号 |
| province_id | bigint | 省份ID |
| city_id | bigint | 城市ID |
| district_id | bigint | 区县ID |
| code | varchar(255) | 券码 |
| title | varchar(255) | 商品名称 |
| redeem_amount | decimal(10,2) | 核销金额 |
| goods_amount | decimal(10,2) | 商品金额 |
| pay_amount | decimal(10,2) | 支付金额 |
| redeem_type | smallint | 核销类型 |
| status | smallint | 统一状态: 1=初始化 2=已核销 3=已退款 4=失败 |
| good_info | json | 商品信息JSON |
| ext_data | json | 渠道特有字段JSON |
| created | datetime | 创建时间 |
| updated | datetime | 更新时间 |

## 查询规则

- 待补充

## 索引

- PK: (source_table, source_id, day)
