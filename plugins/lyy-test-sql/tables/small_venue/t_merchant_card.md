---
table: t_merchant_card
database: small_venue
domain: 多金宝
dbDictId: 10142
description: 待补充
use_cases:
  - 多金宝查询某个会员卡号信息
---

# t_merchant_card

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| id | integer | 主键id |
| merchant_id | numeric(10,0) | 商户id |
| code | character varying(100) | 商户编码 |
| card_no | character varying(50) | 会员卡号 |
| create_time | date | 创建时间 |
| update_time | date | 更新时间 |
| deleted | smallint | 是否删除 |
| remark | character varying(50) | 备注 |
| status | smallint | 卡状态：1.待制作，2.已制卡，3.已绑定 |
| password | character varying(255) | 卡密码 |
| out_trade_no | character varying(50) | 订单编号 |
| initial_card_no | character varying(50) | 初始卡号 |
| card_id | character varying(50) | 卡id |
| store_id | bigint | 开卡门店 |
| user_id | bigint | 用户id |

## 查询规则

- 待补充

## 参考 SQL

### 多金宝查询某个会员卡号信息

```sql
select * from t_merchant_card where merchant_id = 1596190 and card_no = 'LYYDJB100080';
```

## 索引

- PK: id
- UNIQUE: (code, card_no)
- INDEX: card_no
- INDEX: code
- INDEX: merchant_id
- INDEX: out_trade_no
