---
table: iot_equipment_docking
database: equipment
domain: 设备
dbDictId: 10093
description: 设备对接参数
use_cases:
  - 查安卓设备信息
---

# iot_equipment_docking

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | numeric(12,0) | 待补充 |
| equipment_id | numeric(12,0) | 设备ID |
| equipment_value | character varying(40) | 设备编号 |
| user_name | character varying(25) | 管理员姓名 |
| phone | character varying(25) | 管理员手机号码 |
| screen_width | smallint | 屏幕宽度 |
| screen_type | smallint | 屏幕类型 (1-福袋机屏,2-落地屏) |
| screen_height | smallint | 屏幕高度 |
| resolution_height | smallint | 屏幕分辨率高度 |
| resolution_with | smallint | 屏幕分辨率宽度 |
| screen_size | character varying(64) | 屏幕大小 |
| resolution | character varying(31) | 分辨率 |
| rolling_frequency | smallint | 滚动频率 |
| app_id | character varying(32) | 接入应用编码 |
| app_secret | character varying(100) | 接入私钥 |
| app_uuid | character varying(64) | 接入设备uuid |
| switch_type | smallint | 接入方式( 0 接口接入 1 盒子接入) |
| face_equipment_type | character varying(100) | 刷脸设备型号 |
| serial_unique_code | character varying(200) | 设备序列唯一码 |
| app_type | character varying(20) | app 类型 |
| android_unique_code | character varying(64) | android唯一码 |
| third_factory | character varying(20) | 对接第三方工厂 |
| created | timestamp without time zone | 创建时间 |
| updated | timestamp without time zone | 更新时间 |
| is_active | boolean | 是否可用 |
| createdby | numeric(12,0) | 创建者 |
| updatedby | numeric(12,0) | 更新者 |
| connect_type | smallint | 待补充 |
| connect_mode | integer[] | 待补充 |
| protocol_version | character varying(32) | 协议版本号，登陆时会更新，目前用于sdk设备 |
| mainboard_id | numeric(12,0) | 主板id |

## 查询规则

- 待补充

## 索引

- PK: id
- UNIQUE: (app_id, app_uuid)
- INDEX: equipment_id
