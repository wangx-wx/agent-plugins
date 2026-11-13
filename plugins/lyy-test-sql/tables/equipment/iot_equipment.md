---
table: iot_equipment
database: equipment
domain: 设备
dbDictId: 10093
description: 设备信息表
use_cases:
  - 查设备信息
---

# iot_equipment

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | numeric(12,0) | 设备ID |
| value | character varying(40) | 设备编号 |
| unique_code | character varying(32) | 设备唯一码 |
| iccid | character varying(32) | iccid卡号 |
| imei | character varying(64) | imei码 |
| login_flag | numeric(10,0) | 登录标识 |
| factory | numeric(12,0) | 生产工厂 |
| mainboard_factory | numeric(12,0) | 主板工厂 |
| mainboard_model | character varying(255) | 主板型号 |
| factory_model | character varying(255) | 生产工厂设备型号 |
| hardware_model | character varying(255) | 硬件网关编号 |
| hardware_project | numeric(12,0) | 硬件产品 |
| interface_type | character varying(6) | 接口类型 |
| bluetooth_mac | character varying(60) | 蓝牙mac地址 |
| mac | character varying(60) | mac地址 |
| firmware_version | character varying(32) | 固件版本号/version_no |
| business_version_no | character varying(30) | 业务版本号/business_version_no |
| initial_time | timestamp without time zone | 初始时间 |
| factory_type | numeric(12,0) | 出厂设备类型 |
| device_type | character varying(10) | 设备类型 LYY/LYY2 |
| status | character varying(12) | 设备状态(启用:非disabled字段均可，默认使用1Normal   禁用:disabled) |
| hardware_flag | numeric(6,0) | 设备底层标识 |
| gateway | smallint | 网关 |
| category | integer[] | 设备形态(array格式) / 蓝牙、刷脸、反扫 (1、反扫 2、刷脸 3、蓝牙) |
| firmware_business_no | character varying(64) | 硬件业务版本/firmware_no |
| firmware_underlay_no | character varying(64) | 硬件底层版本 |
| created | timestamp without time zone | 创建时间 |
| updated | timestamp without time zone | 更新时间 |
| is_active | boolean | 是否可用 |
| createdby | numeric(12,0) | 创建者 |
| updatedby | numeric(12,0) | 更新者 |
| private_key | character varying(64) | 设备私钥 |
| pkey_password | character varying(32) | 私钥密码 |
| bluetooth_key | character varying(64) | 蓝牙密钥 |

## 查询规则

- 待补充

## 索引

- PK: id
- UNIQUE: unique_code
- UNIQUE: value
- INDEX: (mac, is_active)
- INDEX: iccid
- INDEX: login_flag
- INDEX: firmware_version
