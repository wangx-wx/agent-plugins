---
table: lyy_request_history
database: lyy_consumption
domain: 商创
dbDictId: 10102
description: 商家风控补贴记录
use_cases:
  - 查询商家风控补贴明细
---

# lyy_request_history

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| lyy_request_history_id | numeric(10,0) | 待补充 |
| lyy_equipment_id | numeric(11,0) | 待补充 |
| lyy_fans_id | numeric(12,0) | 待补充 |
| lyy_task_id | numeric(11,0) | 待补充 |
| amount | numeric | 待补充 |
| distributorpart | numeric | 待补充 |
| shopkeeperpart | numeric | 待补充 |
| price | numeric(8,2) | 待补充 |
| code | character varying(32) | 待补充 |
| ad_org_id | numeric(10,0) | 待补充 |
| ad_client_id | numeric(10,0) | 待补充 |
| isactive | character(1) | 待补充 |
| created | timestamp(6) without time zone | 待补充 |
| createdby | numeric(10,0) | 待补充 |
| updated | timestamp(6) without time zone | 待补充 |
| updatedby | numeric(10,0) | 待补充 |
| yxb_incid | character varying(16) | 待补充 |
| lyy_trade_transaction_id | numeric(10,0) | 待补充 |
| agent_price | numeric(8,2) | 待补充 |
| lyy_equipment_group_id | numeric(10,0) | 待补充 |
| factorypart | numeric(6,2) | 待补充 |
| isvalid | character(1) | 待补充 |
| lyy_factory_id | numeric(10,0) | 待补充 |
| lyy_online_coins_history_id | numeric(12,0) | 待补充 |
| is_statistics | character(1) | 是否已算入工厂收益（Y/N） |
| out_trade_no | character varying(32) | 广告收益所属订单 |
| agentpart | numeric(6,2) | 待补充 |
| is_agent_statistics | character(1) | 待补充 |
| agent_user_id | numeric(10,0) | 待补充 |
| online_subsidy | boolean | 是否在线补贴 |
| card_id | bigint | 资料ID |
| settle_type | smallint | 结算方式 |
| main_distributor | bigint | 主营商家 |
| store_id | numeric(12,0) | 多金宝门店id |
| wallet_user_id | numeric(12,0) | 多金宝钱包id |
| settlement_way | character varying(20) | 清分结算方式，wallet,channel |
| receive_pay_account | character varying(30) | 清分商户号 |

## 查询规则

- 待补充

## 参考 SQL

### 查询商家风控补贴明细

```sql
SELECT * FROM lyy_request_history WHERE ad_org_id = 1497193 AND created  >= '2024-01-01 00:00:00'
```

## 索引

- 无（DDL 中未定义索引）
