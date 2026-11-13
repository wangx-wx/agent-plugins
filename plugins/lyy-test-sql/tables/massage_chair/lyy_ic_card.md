---
table: lyy_ic_card
database: massage_chair
domain: 充电桩、洗水
dbDictId: 10097
description: IC卡表
use_cases:
  - IC卡表、查ic卡信息
---

# lyy_ic_card

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| lyy_ic_card_id | numeric(11,0) | 主键ID |
| merchant_id | numeric(11,0) | ad_org表的用户 |
| factory_id | numeric(11,0) | 工厂ID |
| card_no | character varying(32) | 卡号 |
| amount | numeric(8,2) | 卡余额 |
| create_time | timestamp(6) without time zone | 创建时间 |
| modify_time | timestamp(6) without time zone | 修改时间 |
| memo | character varying(256) | 说明 |
| user_name | character varying(64) | 用户姓名 |
| phone | numeric(11,0) | 手机号 |
| status | smallint | 卡状态：0-禁用，1-正常，2-挂失，3-未绑定 |
| type | smallint | 卡类型，默认为0 0-离线卡，1-在线卡 |
| user_id | numeric(12,0) | 用户ID |
| lyy_group_id | numeric(11,0) | 场地id |
| school_id | numeric(10,0) | 学校ID |
| class_id | numeric(10,0) | 班级ID |
| sub_type | smallint | 1为水杯，2为ic卡 |
| contact_name | character varying(32) | 联系人名称 |
| charge_mode | character varying(64) | 计费方式 |
| output_water_type | character varying(64) | 出水方式 |
| single_water_amount | numeric(6,0) | 单次取水量 |
| water_work_mode | smallint | 售水机工作方式(1 在线 2离线) |
| bind_time | timestamp(6) without time zone | 绑定时间 |
| expiration_date | date | 过期日期 |
| present | numeric(8,2) | 赠送金额 |
| remark | character varying(32) | 备注 |
| third_user_id | character varying(32) | 第三方平台ID |
| third_platform | character varying(16) | 第三方平台枚举 0:乐摇摇 DJ:东晙 |
| grade_id | numeric(10,0) | 年级ID |
| limit_status | smallint | 限制状态 0=未限制 1=已限额 2=手动解除限额 |
| limit_type | smallint | 限制类型 0= 日限额 1= 月限额 |
| prestore_status | numeric(4,0) | 预存状态:0待领取,1已领取 |
| support_member_card | smallint | 支持会员卡类型：0或null=不支持，1=次卡 |
| charging_count_limit | smallint | 每日充电笔数限制，0或null表示不限制 |
| day_limit_amount | numeric(11,2) | 单日使用限制金额 |
| month_limit_amount | numeric(11,2) | 月使用限制金额 |

## 查询规则

- 待补充

## 参考 SQL

### IC卡表

```sql
select * from lyy_ic_card where card_no ='2788463341' and merchant_id =1036030
```

### 查ic卡信息

```sql
select * from lyy_ic_card lic where card_no ='06909'order by create_time desc limit 10
```

## 索引

- PK: lyy_ic_card_id
- INDEX: user_name
- INDEX: (merchant_id, card_no)
- INDEX: (user_id, merchant_id)
- INDEX: phone
- INDEX: card_no
- INDEX: user_id
- INDEX: school_id
