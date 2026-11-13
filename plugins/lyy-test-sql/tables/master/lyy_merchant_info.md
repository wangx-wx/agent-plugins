---
table: adempiere.lyy_merchant_info
database: master
domain: 支付
dbDictId: 10099
description: 进件后的商户表
use_cases:
  - 查商户信息
---

# lyy_merchant_info

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| lyy_merchant_info_id | numeric(10,0) | 主键 |
| merchant_code | character varying(255) | 进件后颁发的商户code |
| ad_org_id | numeric(10,0) | 商户id |
| channel_code | smallint | 渠道code 1:威富通;2:富友;3:网商;4:云闪付 |
| goods_type_code | character varying(32) | 商品类型code，兼容有设备的和无设备的 |
| open_pay_type | jsonb | 开通的支付类型 0:未开通，1:已开通无子商户号，其他值:已开通该值为商户号，微信(WechatPay)、支付宝(AliPay)、小程序(WechatMiniPay)、云闪付(UnionPay)子商户id |
| fee_rate | double precision | 进件费率 |
| status | smallint | 商户状态枚举 1:正常;2:冻结(可解冻使用);3:禁用(永久不可用) |
| created | timestamp(6) without time zone | 创建时间 |
| updated | timestamp(6) without time zone | 修改时间 |
| remark | character varying(255) | 备注 |
| support_client_type | jsonb | 支持的客户端类型 |
| divide_type | smallint | 分账属性类型,0:无分账权限 1:有分账权限 2:有但暂停分账权限 |
| settlement_type | smallint | 1正常结算 2延迟结算 |
| real_name_status | smallint | 是否已实名认证 0:未实名 1已实名 |
| lyy_swiftpass_merchant_id | numeric(10,0) | 待补充 |
| alipay_real_name_status | smallint | 支付宝是否已实名认证 0:未实名 1已实名 |
| settlement_period | smallint | 结算周期,默认D+1 0:手动 1:D+1 |
| channel_entry_type | smallint | 渠道进件类型 1=商户进件 2=用户进件 |
| common_extend | jsonb | 扩展字段 |

## 查询规则

- 待补充

## 参考 SQL

### 查商户信息

```sql
select *
from lyy_merchant_info
where ad_org_id = 1094949;
```

## 索引

- PK: lyy_merchant_info_id
- UNIQUE: (ad_org_id, merchant_code, channel_code)
- INDEX: merchant_code varchar_pattern_ops
- INDEX: (ad_org_id, status)
- INDEX: updated
- INDEX: (lyy_swiftpass_merchant_id, channel_code)
