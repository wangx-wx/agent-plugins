---
table: adempiere.merchant_equipment
database: master
domain: 充电桩
dbDictId: 10099
description: 商户设备表
use_cases:
  - 商家设备表
---

# merchant_equipment

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | numeric(12,0) | 主键 |
| merchant_id | numeric(12,0) | 商户ID |
| factory_id | numeric(12,0) | 工厂ID |
| equipment_id | numeric(12,0) | 设备ID |
| equipment_value | character varying(40) | 设备编号 |
| unique_code | character varying(32) | 设备唯一码 |
| equipment_type_id | numeric(12,0) | 设备类型ID |
| store_id | numeric(12,0) | 店铺/场地ID |
| equipment_name | character varying(120) | 设备名称 |
| remarks | character varying(256) | 备注 |
| register_date | timestamp without time zone | 注册时间 |
| group_number | numeric(10,0) | 机台号 |
| status | character varying(12) | 状态 1.注册 2.禁用 3.解绑 |
| cloudcode_flag | boolean | 是否注册到云码 0-否 1-是 |
| detail_switch | boolean | 商品详情开关 0-关闭 1-开启 |
| auto_refund | boolean | 是否自动退款 0=不自动退款，非0表示自动退款 |
| show_charging | boolean | 是否显示充电倒计时页面 0 否 1 是 |
| auto_restart | boolean | 是否断电自动重启 0=不自动重启，1=自动重启 |
| open_show | boolean | 只针对洗衣机,是否显示开启暂停终止功能的控制开关 1是显示 |
| group_service_cost_way | character varying(20) | 计费模式 |
| unit_price | numeric(10,2) | 启动单价 |
| gift_price | numeric(10,2) | 礼品单价 |
| display_mode | smallint | 商品展示方式 0-按商品顺序展示 1-按货道顺序同类商品合并展示 2-按货道顺序(不合并) |
| stock | integer | 库存数量 |
| charge_before_pay_status | boolean | 先充后付状态 0:关闭,1:打开 |
| charge_before_pay_min_money | numeric(5,2) | 最低余额使用限制(最小为1) |
| charge_before_pay_max_money | numeric(5,2) | 最高余额使用限制 |
| distributorpart | numeric(10,4) | 商家分成比例 |
| factorypart | numeric(10,4) | 广告工厂分成比例 |
| created | timestamp without time zone | 创建时间 |
| updated | timestamp without time zone | 更新时间 |
| createdby | numeric(10,0) | 创建者 |
| updatedby | numeric(10,0) | 更新者 |
| is_active | boolean | 是否可用 0:不可用；1:可用 |
| description | character varying(255) | 描述 |
| amount | numeric(6,2) | 启动金额 |
| mer_ble_switch_value | boolean | 商家4G+蓝牙开关 |
| server_compute_prop | character varying(2000) | 服务端计费属性 |
| register_system | character varying(12) | 注册系统标记：1.0 , 2.0 , 3.0 |
| city_id | numeric | 城市ID |
| district_id | numeric | 地区id |
| address | character varying(256) | 地址 |
| sim_longitude | numeric(10,7) | sim经度 |
| sim_latitude | numeric(10,7) | sim纬度 |
| login_flag | numeric(10,0) | 登录标识 |
| business_type | smallint | 1=福袋机，2=口红机，3=自动售货机，4=冰淇淋机，5=星座机，6=按摩垫1+N，7=功德箱 8=电子烟，9=兑币机, 11=豆浆机 ,12=咖啡机,13=格子机,14=混合货道机，15=萌盒机,16=综合售货机，17=汽车充电桩 |
| firmware_version | character varying(32) | 固件版本号, lyy_equipment的versionno |
| device_type | character varying(10) | 设备类型 LYY/LYY2 |
| business_version_no | character varying(32) | 业务版本号 |
| factory_brand | character varying(32) | 工厂品牌 |
| initial_time | timestamp without time zone | 初始时间 |
| firmware_business_no | character varying(64) | 硬件业务版本/firmware_no |
| gateway | smallint | 网关 |
| third_factory | character varying(20) | 对接第三方工厂 |
| protocol_id | character varying(20) | 所属协议id |
| mac | character varying(60) | mac地址 |
| terminal_value | character varying(64) | 终端码 |
| imei_value | character varying(64) | imei编码 |
| third_platform | character varying(20) | 第三方平台code，第三平台迁移过来的设备标记，东晙code: DJ |
| ant_flag | boolean | 是否注册到蚂蚁链 |
| ant_mode | smallint | 蚂蚁链补贴模式，0：重模式即单通，1：轻模式即双通 |

## 查询规则

- 待补充

## 索引

- PK: id
- UNIQUE: equipment_id
- UNIQUE: equipment_value
- INDEX: (unique_code, is_active)
- INDEX: firmware_version
- INDEX: imei_value
- INDEX: merchant_id
- INDEX: (store_id, equipment_type_id)
- INDEX: terminal_value
- INDEX: lower((terminal_value
- INDEX: lower((imei_value
- INDEX: unique_code text_pattern_ops
- INDEX: equipment_type_id
- INDEX: (store_id, merchant_id)
- INDEX: (third_factory, business_type)
