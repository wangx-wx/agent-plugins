---
table: iot_equipment_setting
database: equipment
domain: 设备
dbDictId: 10093
description: 设备设置参数
use_cases:
  - 查设备对应的协议
---

# iot_equipment_setting

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | numeric(12,0) | 待补充 |
| equipment_id | numeric(12,0) | 设备ID |
| product_number | character varying(32) | 主板产品编号 |
| system_version | character varying(50) | 系统版本号 |
| is_pulse | character(1) | 是否开启脉冲间隔 / isinterval |
| app_version | character varying(50) | app版本号 |
| signal | integer | 信号值 |
| pulse_interval | smallint | 脉冲间隔 |
| interface_baud_rate | character varying(6) | 接口波特率 |
| pulse_width_one | numeric(12,0) | 待补充 |
| pulse_width_two | numeric(12,0) | 待补充 |
| standby_status | character varying(2) | 待补充 |
| support_grip | character varying(2) | 待补充 |
| support_gift | character varying(2) | 待补充 |
| paper_model | character varying(6) | 待补充 |
| pulse_duration_ratio | smallint | 脉冲转换率 |
| gateway_equipment_value | character varying(32) | 网关设备号 |
| factory_brand | character varying(32) | 工厂品牌 |
| created | timestamp without time zone | 创建时间 |
| updated | timestamp without time zone | 更新时间 |
| is_active | boolean | 是否可用 |
| createdby | numeric(12,0) | 创建者 |
| updatedby | numeric(12,0) | 更新者 |
| standby_level | smallint | 待机电平,0 常开 1常闭 |
| pulse_width | smallint | 脉冲宽度 |
| other_standby_level | smallint | 额外设备-待机电平 |
| other_pulse_width | smallint | 额外设备-脉冲宽度 |
| other_pulse_interval | smallint | 额外设置-脉冲间隔 |
| pulse_interval_one | numeric | 脉冲间隔one |
| pulse_interval_two | numeric | 脉冲间隔two |
| protocol_id | character varying(20) | 所属协议id |
| gps_support | smallint | 是否支持GPS: 0-不支持, 1-支持, NULL-未知 |
| return_ability | jsonb | 设备还车能力 |
| low_power | boolean | 是否低功耗 |

## 查询规则

- 待补充

## 参考 SQL

### 查设备对应的协议

```sql
SELECT id, equipment_id, product_number, system_version, is_pulse, app_version, signal,protocol_id, gps_support, return_ability, low_power FROM lyy.iot_equipment_setting WHERE equipment_id=？;
```

## 索引

- PK: id
- INDEX: equipment_id
