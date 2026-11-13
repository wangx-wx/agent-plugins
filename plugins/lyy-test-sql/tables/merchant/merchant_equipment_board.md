---
table: merchant_equipment_board
database: merchant
domain: 洗水
dbDictId: 10172
description: 设备IOT宽表
use_cases:
  - 查设备属于XYJ还是XYJY
---

# merchant_equipment_board

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | numeric(12,0) | 主键 |
| merchant_id | numeric(12,0) | 商户id |
| equipment_id | numeric(12,0) | 设备ID |
| parent_equipment_id | numeric(12,0) | 上级设备ID |
| store_id | numeric(12,0) | 场地id |
| store_name | character varying(255) | 场地名称 |
| group_number | numeric(12,0) | 场地内编号 |
| physical_tag_ids | numeric(12,0)[] | 物理标签 |
| unique_code | character varying(32) | 设备唯一码 |
| equipment_value | character varying(40) | 设备编号 |
| equipment_status | smallint | 设备状态 1=在线   0=离线 |
| equipment_work_status | smallint | 设备工作状态    1=工作中  2= 空闲    0=故障 |
| description | character varying(255) | 离线原因/故障原因 |
| offline_time | timestamp without time zone | 离线时间 |
| signal | numeric(10,0) | 信号值 |
| equipment_type_id | numeric(12,0) | 设备类型id |
| equipment_type_value | character varying(20) | 设备类型值 |
| equipment_type_name | character varying(40) | 设备类型名称 |
| factory_brand | character varying(30) | 工厂品牌 |
| remarks | character varying(255) | 设备备注 |
| created | timestamp without time zone | 创建日期 |
| updated | timestamp without time zone | 更新日期 |
| created_by | numeric(12,0) | 创建人 |
| updated_by | numeric(12,0) | 更新人 |
| is_active | boolean | 是否可用 |
| status | character varying(100) | 设备状态(启用:非disabled字段均可，默认使用1Normal   禁用:disabled) |
| login_flag | numeric(8,0) | 登录标识 |
| business_type | numeric(8,0) | 业务类型 |
| channel_id | character varying(20) | 通道ID |
| skb_connect_status | numeric(8,0) | 刷卡版链接状态  0=无链接 1=通讯正常 |
| expire_at | numeric(16,0) | 会话时间 |
| related_status | smallint | 关联的加液机状态 |
| related_device_type | smallint | 关联的加液机类型 |
| subsidy_status | smallint | 补贴状态(0=不补贴,1=补贴 目前为支付宝补贴设备使用） |
| health_status | smallint | 健康检测连接状态(null=无连接 1=通讯正常) |
| agent_user_id | bigint | 待补充 |
| current_agent_user_id | bigint | 待补充 |
| door_lock_state | smallint | 门锁状态(0=关闭 1=开启 NULL=从未上报，来源：iot_equipment_extension 经 device-event-hub 同步) |
| human_presence | smallint | 人体感应(0=无人 1=有人 NULL=从未上报，来源同上) |

## 查询规则

- 待补充

## 参考 SQL

### 查设备属于XYJ还是XYJY

```sql
select * from merchant_equipment_board where equipment_value = '22514034' limit 10
```

## 索引

- PK: id
- UNIQUE: unique_code
- INDEX: (parent_equipment_id, equipment_value)
- INDEX: (merchant_id, equipment_value, equipment_type_id)
- INDEX: equipment_id
- INDEX: equipment_value
- INDEX: store_id
