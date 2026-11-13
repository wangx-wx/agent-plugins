---
table: um_account
database: user_member
domain: 中台
dbDictId: 10108 / 10109 / 10110 / 10111
description: 会员账户表
use_cases:
  - 总权益
---

# um_account

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | 账户ID |
| user_id | bigint | 用户ID |
| merchant_id | numeric(12,0) | 商户ID |
| total | numeric(12,2) | 总权益 |
| balance | numeric(12,2) | 剩余权益 |
| classify | smallint | 权益类型 |
| status | smallint | 状态：1=正常，2=禁用3=挂失，4=过期 |
| description | character varying(200) | 备注 |
| create_time | timestamp(3) without time zone | 创建时间 |
| create_by | numeric(12,0) | 创建人id |
| update_time | timestamp(3) without time zone | 更新时间 |
| update_by | numeric(12,0) | 更新人 |
| merchant_user_id | numeric(19,0) | 商家用户id |
| card_no | character varying(50) | 卡号 |
| parent_account_id | bigint | 父权益id |
| store_id | bigint | 所属门店id |
| down_time | timestamp(3) without time zone | 卡有效期 |
| deposit | numeric(6,2) | 押金 |
| default_flag | boolean | 是否是默认卡账户 true:是，false：否 |
| frozen_amount | numeric(10,2) | 冻结金额 |

## 查询规则

- 待补充

## 索引

- 无（DDL 中未定义索引）
