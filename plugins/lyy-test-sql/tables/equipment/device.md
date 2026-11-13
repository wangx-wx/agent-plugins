---
table: device
database: equipment
domain: 设备
dbDictId: 10093
description: 设备表
use_cases:
  - 查设备初始化
---

# device

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | numeric(12,0) | 待补充 |
| device_id | character varying(32) | 设备唯一标识 |
| product_key | character varying(64) | 产品标识符 |
| createdby | character varying(32) | 创建者 |
| updatedby | character varying(32) | 更新者 |
| created | timestamp without time zone | 创建时间 |
| updated | timestamp without time zone | 更新时间 |
| tenant_id | character varying(30) | 租户ID |
| auth_org_id | character varying(30) | 组织ID |
| unique_code | character varying(32) | 业务唯一编码 |
| disabled | boolean | 是否封禁，默认否 |
| is_active | boolean | 虚拟删除 |
| transferred | boolean | 设备是否被转移 |
| gateway | integer | 网关类型  0：LMQ 1:  NettyGateway 2:  2.0Gateway 3:  ExtendGateway 4:  OpenGateway 5:  BlueTooth 6:  PanguGateway 7:  EMQX |

## 查询规则

- 待补充

## 索引

- PK: id
- UNIQUE: (device_id, product_key)
- INDEX: unique_code
- INDEX: product_key
