---
table: lyy_charging_equipment_port
database: massage_chair
domain: 充电桩
dbDictId: 10097
description: 二轮充电桩端口信息表
use_cases:
  - 设备端口
---

# lyy_charging_equipment_port

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | 主键 |
| merchant_id | bigint | 商户ID |
| station_id | bigint | 站点ID |
| lyy_equipment_id | bigint | 设备ID |
| unique_code | character varying(32) | 设备唯一编码 |
| mode_type | smallint | 0、普通设备，统计端口，1：脉冲设备，不统计端口 |
| login_flag | integer | 登陆标识、冗余字段 |
| port | smallint | 端口号 |
| port_status | smallint | 端口状态 IDLE(1, "空闲"), CHARGING(2, "充电中"), FAULT(3, "故障"), DISABLE(4, "禁用"), OFFLINE(5, "离线"), UN_KNOW(255, "未知"), |
| created | timestamp(6) without time zone | 创建时间 |
| created_by | character varying(32) | 创建人 |
| updated | timestamp(6) without time zone | 更新时间 |
| updated_by | character varying(32) | 更新人 |
| port_operator_status | smallint | 服务端端口的操作状态 0:启用 1:禁用 |

## 查询规则

- 待补充

## 参考 SQL

### 设备端口

```sql
select * from lyy_charging_equipment_port where unique_code='0000000087150504'
```

## 索引

- PK: id
- INDEX: merchant_id
- INDEX: unique_code
- INDEX: (unique_code, merchant_id)
- INDEX: (unique_code, port)
