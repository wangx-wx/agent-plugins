---
table: lyy.wash_activity_rule_equipment
database: cmember
domain: 洗水
dbDictId: 10087
description: 洗水活动规则-设备名单
use_cases:
  - 查洗水商家维度商创活动（Excel 表名列写作 promotion_activity_merchant）
---

# wash_activity_rule_equipment

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | numeric(12,0) | ID |
| merchant_id | numeric(10,0) | 商家ID |
| equipment_value | character varying(40) | 设备编号 |
| product_type | smallint | 洗水活动类型 |
| scene | smallint | 场景码 |
| type | smallint | 0白名单 1黑名单 |
| remark | character varying(32) | 备注 |
| created_time | timestamp without time zone | 创建时间 |
| updated_time | timestamp without time zone | 更新时间 |
| deleted | boolean | true表示已删除 |
| created_by | numeric(10,0) | 创建人 |
| updated_by | numeric(10,0) | 更新人 |

## 查询规则

- 待补充

## 索引

- PK: id
- INDEX: (merchant_id, equipment_value, type, deleted)
