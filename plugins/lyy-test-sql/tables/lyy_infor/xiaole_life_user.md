---
table: xiaole_life_user
database: lyy_infor
domain: 洗水
dbDictId: 10376
description: 小乐生活APP用户表
use_cases:
  - 查app用户信息
---

# xiaole_life_user

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | ID |
| telephone | character varying(20) | 手机号码 |
| nickname | character varying(64) | 昵称 |
| head_img | character varying(255) | 头像 |
| gender | smallint | 性别 1-男 2-女 0-未知 |
| birthday | timestamp without time zone | 生日 |
| status | smallint | 用户状态 |
| last_cancel_time | timestamp without time zone | 上次注销时间 |
| total_points | numeric | 用户总积分 |
| app_version | character varying(64) | 应用版本 |
| app_endpoint | character varying(20) | 应用终端 |
| mobile_model | character varying(32) | 移动端型号 |
| create_time | timestamp without time zone | 创建时间 |
| created_by | character varying(20) | 创建人 |
| update_time | timestamp without time zone | 更新时间 |
| updated_by | character varying(20) | 更新人 |
| deleted | boolean | 是否删除 |
| sign_notify | smallint | 签到通知 |
| device_id | character varying(64) | 设备ID |
| password | character varying(64) | 登录密码 |
| source | smallint | 用户来源，1、微信，2、支付宝 |
| app_name | character varying(64) | 应用名称 |

## 查询规则

- 待补充

## 索引

- PK: id
- INDEX: telephone
- INDEX: telephone
