---
table: um_account_benefit
database: user_member
domain: 中台
dbDictId: 10108 / 10109 / 10110 / 10111
description: 会员账户明细表
use_cases:
  - 权益明细
---

# um_account_benefit

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | bigint | 标识 |
| account_id | bigint | 账户ID |
| user_id | bigint | 用户id |
| benefit_id | bigint | 权益ID |
| total | numeric(12,2) | 总权益 |
| balance | numeric(12,2) | 剩余权益 |
| classify | smallint | 权益类型 |
| status | smallint | 状态：1=正常，2=过期， 3=已消耗 |
| expiry_date_category | smallint | 有效期类型:0、无限期,1、日期区间可用,2、单日时间区间可用 |
| up_time | character varying(32) | 上线时间  如果是类型1(日期区间)，字段内容格式是:  yyyy-MM-dd HH:mm:ss 如果是类型2(时间区间)，字段内容格式是:  HH:mm:ss |
| down_time | character varying(32) | 下线时间  如果是类型1(日期区间)，字段内容格式是:  yyyy-MM-dd HH:mm:ss 如果是类型2(时间区间)，字段内容格式是:  HH:mm:ss |
| create_time | timestamp(3) without time zone | 创建时间 |
| create_by | numeric(12,0) | 创建人id |
| update_time | timestamp(3) without time zone | 更新时间 |
| update_by | numeric(12,0) | 更新人id |
| resource | smallint | 权益来源类型：1=会员升级，2=权益规则触发 |
| resource_id | bigint | 权益来源关联的业务id |
| merchant_id | numeric | 商户id |
| merchant_user_id | numeric(19,0) | 商家用户id |
| merchant_benefit_classify_id | numeric(10,0) | 商家自定义权益id |
| use_rule_id | bigint | 使用规则id |
| store_id | bigint | 所属门店 |
| value_type | smallint | 权益值类型，1：额度类型，2：频次类型 |
| frozen_amount | numeric(10,2) | 冻结金额 |

## 查询规则

- 待补充

## 参考 SQL

### 权益明细

```sql
select * from um_account_benefit where user_id='2200009773'and merchant_id=1035814  order by update_time  desc ;
```

## 索引

- 无（DDL 中未定义索引）
