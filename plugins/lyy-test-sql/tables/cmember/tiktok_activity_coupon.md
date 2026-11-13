---
table: tiktok_activity_coupon
database: cmember
domain: 娱乐
dbDictId: 10087
description: 抖音套餐映射
use_cases:
  - 查询抖音商户授权
---

# tiktok_activity_coupon

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| tiktok_activity_coupon_id | numeric(11,0) | 抖音套餐映射Id |
| tiktok_activity_poi_id | numeric(11,0) | 抖音活动Id |
| poi_id | character varying(40) | 门店poi_id |
| sku_id | character varying(40) | 抖音sku_id |
| title | character varying(40) | 套餐名称 |
| price | numeric(10,2) | 价格 |
| coins | integer | 获取权益,use_type=null或1时表示(币数),  user_type=2时表示需要给用户派发商家派发金额(分) |
| status | smallint | poi状态,默认 0:投放中, 1:已终止 |
| created | timestamp(6) without time zone | 创建时间 |
| updated | timestamp(6) without time zone | 更新时间 |
| createdby | numeric(10,0) | 创建人 |
| updatedby | numeric(10,0) | 更新人 |
| isactive | character(1) | 是否有效 Y 有效 N 无效 |
| use_type | smallint | 适用类型: null或1表示娃娃机与兑币机适用  2表示洗车机 |
| auth_created_by | character varying(20) | createdby=-10000时展示,sp操作人 |
| auth_updated_by | character varying(20) | updatedby=-10000时展示,sp操作人 |
| order_no | smallint | 排序编号 |
| display_on_coin_exchange | boolean | 在兑币机上展示 |
| equipment_type_value | character varying[] | 设备类型，use_type=4时使用 |
| redeem_mode | smallint | 核销方式：1直接使用/启动设备，2充值到会员账户 |
| recharge_type | smallint | 充值类型：1余额，2余币，仅redeem_mode=2时生效 |
| expire_date | jsonb | 有效期配置：category为0或null表示无期限，1表示自定义 |
| mock_coins | integer | 模拟投币数 |

## 查询规则

- 待补充

## 参考 SQL

### 查询抖音商户授权

```sql
select * from tiktok_activity_coupon where poi_id='7284593202361796669'  and isactive='Y' and sku_id='1838044671248384'
```

## 索引

- PK: tiktok_activity_coupon_id
- INDEX: (sku_id, tiktok_activity_poi_id, created)
