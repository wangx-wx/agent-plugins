---
table: adempiere.lyy_payment
database: master
domain: 支付
dbDictId: 10099
description: 提现记录表
use_cases:
  - 查提现情况
---

# lyy_payment

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| lyy_payment_id | numeric(10,0) | 主键id |
| payto_org_id | numeric(10,0) | 提现商家 |
| documentno | character varying(30) | 提现单号 |
| docaction | character varying(2) | 废弃 |
| c_doctype_id | character varying(10) | 废弃 |
| processed | character(1) | 废弃 |
| docstatus | character varying(30) | 废弃 |
| status | character varying(16) | Apply-初始 Finished-成功 Refuse-已拒绝 |
| description | character varying(255) | 描述 |
| ad_org_id | numeric(10,0) | 废弃 |
| ad_client_id | numeric(10,0) | 待补充 |
| isactive | character(1) | 待补充 |
| created | timestamp without time zone | 待补充 |
| createdby | numeric(10,0) | 待补充 |
| updated | timestamp without time zone | 待补充 |
| updatedby | numeric(10,0) | 待补充 |
| payment_date | timestamp without time zone | 提现成功时间 |
| amount | numeric(8,2) | 提现金额 |
| payment_type | character(1) | A-支付宝 B-银行卡 W-微信 |
| wx_billno | character varying(64) | 微信单号 |
| service_fee | numeric | 手续费 |
| actual_pay | numeric | 实际到账金额 |
| bank_name | character varying(60) | 银行名称 |
| type | character(1) | 1:支付收益 2:广告收益 3:电子秤的收益 4:二清支付收益 |
| source_type | smallint | 申请单来源类型,空或1:商户申请 2:签署协议后自动生成 3:人工导出 4:人工导入 |
| pay_channel_id | numeric(10,0) | 打款渠道id |
| receive_account | character varying(64) | 收款人账号,可以是openId 支付宝账号  银行卡号 |
| receive_name | character varying(64) | 收款人姓名 |
| remark | character varying(255) | 说明 |
| transfer_remark | character varying(64) | 转账备注,送往微信或支付宝或银联 |
| channel_code | smallint | 渠道编号 |
| merchant_code | character varying(255) | 渠道商户号 |
| receive_org_id | numeric(11,0) | 收款人商户ID |
| receive_org_type | character varying(10) | 收款人类型 空默认主商户,DIV:分成方 |
| settle_no | character varying(64) | 结算单号 type=4时有值 |
| receive_identity_type | character varying(36) | 接收方身份类型 支付宝的会员ID=ALIPAY_USER_ID，支付宝登录号=ALIPAY_LOGON_ID 支付宝openid=ALIPAY_OPEN_ID 微信openId=WECHAT_OPEN_ID 银行卡=BANK_CARD_NO |
| transfer_account | character varying(64) | 付款账号 |
| check_query_count | smallint | 回查次数 |
| wallet_id | numeric(12,0) | 钱包id |
| wallet_account_name | character varying(64) | 钱包名称 |
| wallet_uid | bigint | 钱包用户id |
| receive_card_id | bigint | 收款人资料id |
| withdraw_method | smallint | 1-自动提现 2-手动提现  默认1 |
| batch_no | character varying(64) | 提现批次号 |
| common_extend | jsonb | 通用扩展信息 |
| transfer_settlement_type | character varying(32) | 付款类型：FLEXIBLE_EMPLOYMENT-灵活用工 / WECHAT_TO_BALANCE-微信转账到余额 / ALIPAY_TO_BALANCE-支付宝转账到余额 / ALIPAY_TO_BANKCARD-支付宝转账到银行卡 / GLOBAL_FUND_PAYMENT-全域资金付款 / BALANCE_PAY-余额支付 / DM_WITHDRAW-dm取现 |
| funding_disburse_type | smallint | 资金拨付类型 1-仅付款 2-仅提现 3-付款+提现 |
| payment_no | character varying(32) | 关联付款单号（类型1/3 时指向 clearing_payment_record.payment_no，类型2 时为 null） |
| withdraw_payment_no | character varying(32) | 提现单号（WD 前缀，类型2/3 时有值，类型1 时为 null） |

## 查询规则

- 待补充

## 索引

- PK: lyy_payment_id
- INDEX: (payto_org_id, status)
- INDEX: wx_billno
- INDEX: settle_no
- INDEX: created
- INDEX: batch_no
