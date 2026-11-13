---
table: infra_station
database: carcharging
domain: 汽充桩
dbDictId: 10131
description: 充电站基础信息
use_cases:
  - 站点
---

# infra_station

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | 主键Id，雪花算法生成 |
| operator_code | character(9) | 组织机构代码，去掉前八位和最后一位 |
| platform_origin_id | integer | 平台来源Id |
| merchant_id | bigint | 商户Id |
| station_id | bigint | 关联中台站场Id |
| business_hours_type | integer | 运营时间类型 0：7*24小时 1：非7*24小时 |
| business_hours_desc | character varying(255) | 运营时间 |
| station_tel | character varying(50) | 站点电话 |
| service_tel | character varying(50) | 服务电话；平台服务电话 |
| park_num | integer | 车位数量 |
| park_fee_desc | character varying(255) | 停车费用描述 |
| guide | character varying(255) | 站点引导，描述性文字 |
| invoice_type | integer | 开票方式 |
| images | character varying | 站场图片 |
| station_name | character varying(50) | 站场名称 |
| province_id | numeric | 省Id |
| city_id | numeric(10,2) | 城市Id |
| district_id | numeric | 区域Id |
| district_code | character(12) | 区域行政编码 |
| address | character varying(255) | 地址 |
| station_operate_status | smallint | 站场运营状态 |
| lng | numeric(12,8) | 经度 |
| lat | numeric(12,8) | 纬度 |
| remark | character varying(255) | 备注 |
| station_visible | smallint | App可见不可见 INVISIBLE(0, "不可见") VISIBLE(1, "可见") |
| price_model_id | bigint | 最新计费模型Id |
| created | timestamp without time zone | 创建时间 |
| created_by | bigint | 创建人 |
| updated | timestamp without time zone | 修改时间 |
| updated_by | bigint | 更新人 |
| organization_id | bigint | 组织Id |
| deleted | boolean | 软删除 |
| ext_resource | text | 特殊资源 |
| platform_origin_merchant_id | character varying(64) | 平台来源商户Id |
| station_type | integer | 场地类型，0：默认，1：支持校园一卡通，2：支持并充 |
| hlht_platform_operator_id | character varying(32) | 互联互通平台组织机构代码 |
| hlht_merchant_operator_id | character varying(32) | 互联互通商户组织机构代码 |
| hlht_station_id | character varying(32) | 互联互通第三方场地id |
| hlht_extend_info | text | 互联互通推送站点额外信息json格式 |

## 查询规则

- 待补充

## 索引

- PK: id
- INDEX: (station_id, deleted)
