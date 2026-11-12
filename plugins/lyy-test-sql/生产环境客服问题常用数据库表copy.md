# 生产环境客服问题常用数据库表

> 来源：`生产环境客服问题常用数据库表收集.xlsx`（工作表1），共 87 条记录。
> 用途：客服排查问题时的库表速查手册。
>
> **建表语句位置**：全部集中在 `tables/{库名}/{表名}.sql`，按库隔离，无说明文件。
> 本文件中的「建表 SQL」列给出相对本文件的路径（`./tables/...`），可直接打开对应文件。
> 完整索引见 [`tables/INDEX.md`](./tables/INDEX.md)。

## 一、概览

| 业务分类 | 库名 | 表数量 | 数据表 |
| --- | --- | --- | --- |
| 商创 | `lyy_consumption` | 1 | `lyy_request_history` |
| 娱乐 | `cmember` | 3 | `tiktok_activity_order`、`tiktok_activity_poi`、`tiktok_activity_coupon` |
| 娱乐 | `master` | 2 | `lyy_media_ads_device`、`MEITUAN_STORE_APPLY` |
| 娱乐 | `massage_chair` | 1 | `coins_saver_order` |
| 多金宝 | `small_venue` | 1 | `t_merchant_card` |
| 充电桩 | `master` | 5 | `merchant_equipment`、`agent_equipment`、`ad_org`、`ad_org_attach`、`equipment_charging_type` |
| 充电桩 | `massage_chair` | 5 | `lyy_charging_order`、`lyy_charging_order_power`、`lyy_charging_equipment_port`、`lyy_ic_card`、`lyy_ic_card_flow` |
| 充电桩 | `advert` | 8 | `lyy_cdz_insurance_buy_card`、`lyy_cdz_insurance_order`、`lyy_cdz_activity_black_list`、`cdz_debit_order`、`automatic_debit_order`、`lyy_cdz_member_card`、`lyy_cdz_insurance_equipment_order_detail`、`lyy_distributor_advertise_coupon` |
| 充电桩 | `commercial_charges` | 4 | `system_charge_equipment_bill`、`system_charge_equipment_bill_flow`、`system_charge_equipment`、`system_charge_config` |
| 汽充桩 | `carcharging` | 4 | `infra_station`、`order_charge`、`family_equipment_vip`、`member_user_info` |
| 中台 | `commercial_charges` | 8 | `merchant_product`、`receipt_bill`、`receipt_bill_detail`、`receipt_bill_pay_trans`、`receipt_bill_pay_trans_detail`、`receipt_bill_refund_trans`、`receipt_bill_refund_trans_detail`、`merchant_message_config` |
| 中台 | `user_member` | 5 | `um_account_record`、`um_account`、`um_account_benefit`、`um_benefit_scope`、`um_benefit` |
| 中台 | `selectdb_payment` | 6 | `dwd_payment_payment_record_trade`、`dwd_payment_refund_record_trade`、`ads_order_info_agg`、`ds_unified_redeem_order`、`ods_unified_redeem_order`、`ads_payment_equipment_record_di` |
| 洗水 | `cmember` | 3 | `wash_dimension_user_info`、`promotion_activity_merchant`、`wash_product_order` |
| 洗水 | `merchant` | 1 | `merchant_equipment_board` |
| 洗水 | `middle_stage` | 1 | `ticket` |
| 洗水 | `massage_chair` | 3 | `lyy_ic_card`、`lyy_ic_card_flow`、`ic_card_limit_config` |
| 洗水 | `lyy_infor` | 5 | `xiaole_user_points_record`、`xiaole_life_user`、`xiaole_life_user_relate`、`xiaole_black_user`、`xiaole_user_no_app_request` |
| 洗水 | `order` | 2 | `order_info`、`refund_order_info` |
| 设备 | `equipment` | 4 | `device`、`iot_equipment`、`iot_equipment_setting`、`iot_equipment_docking` |
| 设备 | `master` | 1 | `lyy_equipment_private_key` |
| 支付 | `master` | 7 | `payment_fee_deduction_equipment`、`experience_merchant_list`、`lyy_merchant_info`、`lyy_divide_merchant_info`、`lyy_swiftpass_merchant_detail`、`lyy_payment`、`payment_info_config` |
| 按摩 | `advert` | 4 | `insurance_user_benefit_card`、`insurance_order`、`automatic_debit_order`、`automatic_debit_receive_record` |
| 按摩 | `cmember` | 3 | `massage_automatic_debit`、`jd_insurance_start_record`、`promotion_activity_user` |

合计：**10** 个业务分类、**15** 个库、**87** 条表记录（去重后 **85** 张表）。

## 二、库与表明细

### 商创

**库：`lyy_consumption`**（1 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `lyy_request_history` | 查询商家风控补贴明细 | [lyy_consumption/lyy_request_history.sql](./tables/lyy_consumption/lyy_request_history.sql) |

```sql
-- 【lyy_request_history】查询商家风控补贴明细
SELECT * FROM lyy_request_history WHERE ad_org_id = 1497193 AND created  >= '2024-01-01 00:00:00'
```

### 娱乐

**库：`cmember`**（3 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `tiktok_activity_order` | 查询抖音订单 | [cmember/tiktok_activity_order.sql](./tables/cmember/tiktok_activity_order.sql) |
| `tiktok_activity_poi` | 查询抖音商户门店 | [cmember/tiktok_activity_poi.sql](./tables/cmember/tiktok_activity_poi.sql) |
| `tiktok_activity_coupon` | 查询抖音商户授权 | [cmember/tiktok_activity_coupon.sql](./tables/cmember/tiktok_activity_coupon.sql) |

```sql
-- 【tiktok_activity_order】查询抖音订单
select * from tiktok_activity_order where skuId='7284593202361796669'

-- 【tiktok_activity_poi】查询抖音商户门店
select * from tiktok_activity_poi where poi_id='7284593202361796669'

-- 【tiktok_activity_coupon】查询抖音商户授权
select * from tiktok_activity_coupon where poi_id='7284593202361796669'  and isactive='Y' and sku_id='1838044671248384'
```

**库：`master`**（2 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `lyy_media_ads_device` | 查询兑币机下发广告记录 | [master/lyy_media_ads_device.sql](./tables/master/lyy_media_ads_device.sql) |
| `MEITUAN_STORE_APPLY` | 查询美团授权记录 | [master/meituan_store_apply.sql](./tables/master/meituan_store_apply.sql) |

```sql
-- 【lyy_media_ads_device】查询兑币机下发广告记录
select * from lyy_media_ads_device where lyy_media_ads_device_id in (158466,158464)

-- 【MEITUAN_STORE_APPLY】查询美团授权记录
select
* 
from 
MEITUAN_STORE_APPLY 
where lyy_distributor_id = 2149938 
and apply_status = 'Pass' and pay_status='Pay' AND is_del = 'N' limit 1
```

**库：`massage_chair`**（1 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `coins_saver_order` | 查询机器存币记录 | [massage_chair/coins_saver_order.sql](./tables/massage_chair/coins_saver_order.sql) |

```sql
-- 【coins_saver_order】查询机器存币记录
SELECT * FROM (select
coins as "币数",
user_id as "用户id",
equipment_value as "设备编码",
created as "创建时间",
updated as "上报时间",
case when device_status =0 then '取消存币' 
when device_status =1 then '启动成功'
when device_status =2 then '同步结束状态'
when device_status =3 then '正常结束' end as "设备状态"
from coins_saver_order 
where merchant_id = 1878870
order by created desc) as t LIMIT 10000
```

### 多金宝

**库：`small_venue`**（1 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `t_merchant_card` | 多金宝查询某个会员卡号信息 | [small_venue/t_merchant_card.sql](./tables/small_venue/t_merchant_card.sql) |

```sql
-- 【t_merchant_card】多金宝查询某个会员卡号信息
select * from t_merchant_card where merchant_id = 1596190 and card_no = 'LYYDJB100080';
```

### 充电桩

**库：`master`**（5 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `merchant_equipment` | 商家设备表 | [master/merchant_equipment.sql](./tables/master/merchant_equipment.sql) |
| `agent_equipment` | 代理商设备表 | [master/agent_equipment.sql](./tables/master/agent_equipment.sql) |
| `ad_org` | 查询商家ID | [master/ad_org.sql](./tables/master/ad_org.sql) |
| `ad_org_attach` | 查询是否资金池商家 | [master/ad_org_attach.sql](./tables/master/ad_org_attach.sql) |
| `equipment_charging_type` | 场地配置信息 | [master/equipment_charging_type.sql](./tables/master/equipment_charging_type.sql) |

```sql
-- 【merchant_equipment】商家设备表
select * from merchant_equipment where equipment_value ='87150504'

-- 【agent_equipment】代理商设备表
select * from agent_equipment where equipment_value ='87150504'

-- 【ad_org】查询商家ID
select * from ad_org  where value like '%17665126143%'

-- 【ad_org_attach】查询是否资金池商家
select * from ad_org_attach  where ad_org_id=1093804

-- 【equipment_charging_type】场地配置信息
select * from equipment_charging_type where lyy_equipment_group_id =1120128
```

**库：`massage_chair`**（5 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `lyy_charging_order` | 充电业务订单 | [massage_chair/lyy_charging_order.sql](./tables/massage_chair/lyy_charging_order.sql) |
| `lyy_charging_order_power` | 充电订单对应功率过程 | [massage_chair/lyy_charging_order_power.sql](./tables/massage_chair/lyy_charging_order_power.sql) |
| `lyy_charging_equipment_port` | 设备端口 | [massage_chair/lyy_charging_equipment_port.sql](./tables/massage_chair/lyy_charging_equipment_port.sql) |
| `lyy_ic_card` | IC卡表 | [massage_chair/lyy_ic_card.sql](./tables/massage_chair/lyy_ic_card.sql) |
| `lyy_ic_card_flow` | IC卡流水记录 | [massage_chair/lyy_ic_card_flow.sql](./tables/massage_chair/lyy_ic_card_flow.sql) |

```sql
-- 【lyy_charging_order】充电业务订单
select * from lyy_charging_order where out_trade_no ='PA303026101011333322000143141005'

-- 【lyy_charging_order_power】充电订单对应功率过程
select * from lyy_charging_order_power where charging_order_id =1285629

-- 【lyy_charging_equipment_port】设备端口
select * from lyy_charging_equipment_port where unique_code='0000000087150504'

-- 【lyy_ic_card】IC卡表
select * from lyy_ic_card where card_no ='2788463341' and merchant_id =1036030

-- 【lyy_ic_card_flow】IC卡流水记录
select * from lyy_ic_card_flow where card_no ='2788463341' order by create_time  desc
```

**库：`advert`**（8 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `lyy_cdz_insurance_buy_card` | 保险周卡、保险月卡、V会员保险月卡、星会员保险月卡 | [advert/lyy_cdz_insurance_buy_card.sql](./tables/advert/lyy_cdz_insurance_buy_card.sql) |
| `lyy_cdz_insurance_order` | 投保订单记录 | [advert/lyy_cdz_insurance_order.sql](./tables/advert/lyy_cdz_insurance_order.sql) |
| `lyy_cdz_activity_black_list` | 用户、场地、商家黑名单 | [advert/lyy_cdz_activity_black_list.sql](./tables/advert/lyy_cdz_activity_black_list.sql) |
| `cdz_debit_order` | 星会员签约表 | [advert/cdz_debit_order.sql](./tables/advert/cdz_debit_order.sql) |
| `automatic_debit_order` | V会员签约表 | [advert/automatic_debit_order.sql](./tables/advert/automatic_debit_order.sql) |
| `lyy_cdz_member_card` | V会员、星会员卡表 | [advert/lyy_cdz_member_card.sql](./tables/advert/lyy_cdz_member_card.sql) |
| `lyy_cdz_insurance_equipment_order_detail` | 设备整桩投保记录 | [advert/lyy_cdz_insurance_equipment_order_detail.sql](./tables/advert/lyy_cdz_insurance_equipment_order_detail.sql) |
| `lyy_distributor_advertise_coupon` | 用户广告红包权益 | [advert/lyy_distributor_advertise_coupon.sql](./tables/advert/lyy_distributor_advertise_coupon.sql) |

```sql
-- 【lyy_cdz_insurance_buy_card】保险周卡、保险月卡、V会员保险月卡、星会员保险月卡
select * from lyy_cdz_insurance_buy_card where lyy_user_id =2200006170 order by created  desc

-- 【lyy_cdz_insurance_order】投保订单记录
select * from lyy_cdz_insurance_order where lyy_user_id =2200006170 order by created  desc

-- 【lyy_cdz_activity_black_list】用户、场地、商家黑名单
select * from lyy_cdz_activity_black_list where business_type =1 and phone ='18877571383'

-- 【cdz_debit_order】星会员签约表
select * from cdz_debit_order where user_id =2200020065 and order_no ='RELAXED22000200651781073784685'

-- 【automatic_debit_order】V会员签约表
select * from automatic_debit_order where user_id =2200020065 and order_no ='ALCDZ220000123020240808115504387'

-- 【lyy_cdz_member_card】V会员、星会员卡表
select * from lyy_cdz_member_card where lyy_user_id =22000140791 and third_order_no ='WXCDZ220002410620261010155849021' order by created  desc

-- 【lyy_cdz_insurance_equipment_order_detail】设备整桩投保记录
select * from lyy_cdz_insurance_equipment_order_detail where out_trade_no ='PA116125081211305100331796651102'

-- 【lyy_distributor_advertise_coupon】用户广告红包权益
select * from lyy_distributor_advertise_coupon where lyy_user_id=33159152 and ad_org_id=1032469 order by created  desc
```

**库：`commercial_charges`**（4 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `system_charge_equipment_bill` | 收费规则 | [commercial_charges/system_charge_equipment_bill.sql](./tables/commercial_charges/system_charge_equipment_bill.sql) |
| `system_charge_equipment_bill_flow` | 收费流水 | [commercial_charges/system_charge_equipment_bill_flow.sql](./tables/commercial_charges/system_charge_equipment_bill_flow.sql) |
| `system_charge_equipment` | 收费设备 | [commercial_charges/system_charge_equipment.sql](./tables/commercial_charges/system_charge_equipment.sql) |
| `system_charge_config` | 收费配置 | [commercial_charges/system_charge_config.sql](./tables/commercial_charges/system_charge_config.sql) |

```sql
-- 【system_charge_equipment_bill】收费规则
select * from  system_charge_equipment_bill where lyy_equipment_id =1258164

-- 【system_charge_equipment_bill_flow】收费流水
select * from  system_charge_equipment_bill_flow where system_charge_equipment_bill_id =261000

-- 【system_charge_equipment】收费设备
select * from  system_charge_equipment where equipment_value ='87150504'

-- 【system_charge_config】收费配置
select * from  system_charge_config where lyy_equipment_type_id in(1000078)
```

### 汽充桩

**库：`carcharging`**（4 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `infra_station` | 站点 | [carcharging/infra_station.sql](./tables/carcharging/infra_station.sql) |
| `order_charge` | 订单 | [carcharging/order_charge.sql](./tables/carcharging/order_charge.sql) |
| `family_equipment_vip` | 家充设备活动表 | [carcharging/family_equipment_vip.sql](./tables/carcharging/family_equipment_vip.sql) |
| `member_user_info` | 用户表 | [carcharging/member_user_info.sql](./tables/carcharging/member_user_info.sql) |

```sql
-- 【infra_station】站点
select * from  infra_station where merchant_id =1036030 and station_id=1123364

-- 【order_charge】订单
select * from  order_charge where merchant_id =1036438 and member_id=34293078 and pay_id='PA1105220915172024342930788074'

-- 【family_equipment_vip】家充设备活动表
select * from  family_equipment_vip where equipment_code ='880240422'

-- 【member_user_info】用户表
select * from  member_user_info where member_id=2200005679
```

### 中台

**库：`commercial_charges`**（8 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `merchant_product` | saas、ai经营分析账单 | [commercial_charges/merchant_product.sql](./tables/commercial_charges/merchant_product.sql) |
| `receipt_bill` | saas、ai经营分析收款账单 | [commercial_charges/receipt_bill.sql](./tables/commercial_charges/receipt_bill.sql) |
| `receipt_bill_detail` | 查询账单明细 | [commercial_charges/receipt_bill_detail.sql](./tables/commercial_charges/receipt_bill_detail.sql) |
| `receipt_bill_pay_trans` | 查询账单支付交易表 | [commercial_charges/receipt_bill_pay_trans.sql](./tables/commercial_charges/receipt_bill_pay_trans.sql) |
| `receipt_bill_pay_trans_detail` | 查询账单支付交易详情表 | [commercial_charges/receipt_bill_pay_trans_detail.sql](./tables/commercial_charges/receipt_bill_pay_trans_detail.sql) |
| `receipt_bill_refund_trans` | 账单退款表 | [commercial_charges/receipt_bill_refund_trans.sql](./tables/commercial_charges/receipt_bill_refund_trans.sql) |
| `receipt_bill_refund_trans_detail` | 账单退款明细表 | [commercial_charges/receipt_bill_refund_trans_detail.sql](./tables/commercial_charges/receipt_bill_refund_trans_detail.sql) |
| `merchant_message_config` | 经营快报 | [commercial_charges/merchant_message_config.sql](./tables/commercial_charges/merchant_message_config.sql) |

```sql
-- 【merchant_product】saas、ai经营分析账单
select * from merchant_product where merchant_id =1094781 and product_code ='SAAS' order by created desc;

-- 【receipt_bill】saas、ai经营分析收款账单
select * from receipt_bill where merchant_id ='1095114' and product_code='SAAS' order by created desc

-- 【receipt_bill_detail】查询账单明细
select * from receipt_bill_detail where merchant_id ='1095114'and product_code='SAAS' order by created desc

-- 【receipt_bill_pay_trans】查询账单支付交易表
select * from receipt_bill_pay_trans where merchant_id ='1032498' order by created desc

-- 【receipt_bill_pay_trans_detail】查询账单支付交易详情表
select * from receipt_bill_pay_trans_detail where merchant_id ='1032498'  order by updated  desc

-- 【receipt_bill_refund_trans】账单退款表
select * from receipt_bill_refund_trans where merchant_id ='1033278' order by created desc

-- 【receipt_bill_refund_trans_detail】账单退款明细表
select * from receipt_bill_refund_trans_detail where merchant_id ='1033278'order by created desc

-- 【merchant_message_config】经营快报
select * from merchant_message_config where merchant_id ='1036030'
```

**库：`user_member`**（5 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `um_account_record` | 会员流水 | [user_member/um_account_record.sql](./tables/user_member/um_account_record.sql) |
| `um_account` | 总权益 | [user_member/um_account.sql](./tables/user_member/um_account.sql) |
| `um_account_benefit` | 权益明细 | [user_member/um_account_benefit.sql](./tables/user_member/um_account_benefit.sql) |
| `um_benefit_scope` | 权益范围 | [user_member/um_benefit_scope.sql](./tables/user_member/um_benefit_scope.sql) |
| `um_benefit` | 权益类型 | [user_member/um_benefit.sql](./tables/user_member/um_benefit.sql) |

```sql
-- 【um_account_record】会员流水
select * from um_account_record uar  where uar.merchant_id  = '1035814' and uar.user_id  = '2200009773' order by uar.create_time desc;

-- 【um_account】总权益
select * from um_account where user_id='2200007861' and merchant_id=1035814 order by update_time desc ;

-- 【um_account_benefit】权益明细
select * from um_account_benefit where user_id='2200009773'and merchant_id=1035814  order by update_time  desc ;

-- 【um_benefit_scope】权益范围
select * from lyy.um_benefit_scope where benefit_id ='1152274125952294912'

-- 【um_benefit】权益类型
select * from lyy.um_benefit where merchant_id ='1035814' order by create_time desc
```

**库：`selectdb_payment`**（6 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `dwd_payment_payment_record_trade` | 查询每个订单在移动端报表内实际增加和退款金额 | [selectdb_payment/dwd_payment_payment_record_trade.sql](./tables/selectdb_payment/dwd_payment_payment_record_trade.sql) |
| `dwd_payment_refund_record_trade` | 查询退款交易 | [selectdb_payment/dwd_payment_refund_record_trade.sql](./tables/selectdb_payment/dwd_payment_refund_record_trade.sql) |
| `ads_order_info_agg` | 查询订单信息 | [selectdb_payment/ads_order_info_agg.sql](./tables/selectdb_payment/ads_order_info_agg.sql) |
| `ds_unified_redeem_order` | 经营统计查抖音核销数据 | [selectdb_payment/ds_unified_redeem_order.sql](./tables/selectdb_payment/ds_unified_redeem_order.sql) |
| `ods_unified_redeem_order` | 经营统计查美团核销数据 | [selectdb_payment/ods_unified_redeem_order.sql](./tables/selectdb_payment/ods_unified_redeem_order.sql) |
| `ads_payment_equipment_record_di` | 经营统计每日的收入概览、启动概览、储值概览、每日经营趋势、收款金额趋势、时段经营趋势、收款分析 | [selectdb_payment/ads_payment_equipment_record_di.sql](./tables/selectdb_payment/ads_payment_equipment_record_di.sql) |

> ⚠ 以下表未收集到建表语句：`dwd_payment_payment_record_trade`、`dwd_payment_refund_record_trade`、`ads_order_info_agg`、`ds_unified_redeem_order`、`ods_unified_redeem_order`、`ads_payment_equipment_record_di`

```sql
-- 【dwd_payment_payment_record_trade】查询每个订单在移动端报表内实际增加和退款金额
select aa.out_trade_no, aa.amount, aa.receivable_amount,aa.store_id ,aa.e_store_name,aa.e_code,aa.create_time ,aa.trade_time,
       dprrt.refund_amount, dprrt.receivable_refund_amount
from dwd_payment_payment_record_trade aa
left join (
    select out_trade_no, sum(refund_amount) as refund_amount,
           sum(receivable_refund_amount) as receivable_refund_amount
    from dwd_payment_refund_record_trade
    where (ds>='2026-05-22' and ds<='2026-05-22')
     and status not in ('3','4')
    group by out_trade_no
) dprrt on aa.out_trade_no =dprrt.out_trade_no
where (aa.ds>='2026-05-22' and aa.ds<='2026-05-22')
 and aa.distributor_id ='1073579'
  -- and aa.store_id ='1092037'
   --and aa.e_code ='77289630'
-- and aa.e_store_name ='no分账'
-- and aa.out_trade_no ='PA103026012915421922000124151436'
order by aa.create_time desc;

-- 【dwd_payment_refund_record_trade】查询退款交易
select * from dwd_payment_refund_record_trade where ds='2026-02-03' and distributor_id = '1399163' and e_code ='83918187'

-- 【ads_order_info_agg】查询订单信息
select * from ads_order_info_agg where  out_trade_no ='PA101525082813502922000055181532' and ds='2025-08-28'

-- 【ds_unified_redeem_order】经营统计查抖音核销数据
select * from ods_unified_redeem_order where distributor_id ='1073579' and `day` ='2026-07-16'

-- 【ods_unified_redeem_order】经营统计查美团核销数据
select * from ods_unified_redeem_order where distributor_id ='1073579' and `day` ='2026-07-17'

-- 【ads_payment_equipment_record_di】经营统计每日的收入概览、启动概览、储值概览、每日经营趋势、收款金额趋势、时段经营趋势、收款分析
select * from ads_payment_equipment_record_di aperd where ds='2026-07-24' and distributor_id ='1399163' and `type` ='商家维度'
```

### 洗水

**库：`cmember`**（3 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `wash_dimension_user_info` | 查洗水商创活动退款、投诉记录 | [cmember/wash_dimension_user_info.sql](./tables/cmember/wash_dimension_user_info.sql) |
| `promotion_activity_merchant` | 查洗水商家维度商创活动 | [cmember/promotion_activity_merchant.sql](./tables/cmember/promotion_activity_merchant.sql) |
| `wash_activity_rule_equipment` | 查洗水商家维度商创活动（Excel 表名列写作 `promotion_activity_merchant`） | [cmember/wash_activity_rule_equipment.sql](./tables/cmember/wash_activity_rule_equipment.sql) |
| `wash_product_order` | 查洗水商创产品 | [cmember/wash_product_order.sql](./tables/cmember/wash_product_order.sql) |

```sql
-- 【wash_dimension_user_info】查洗水商创活动退款、投诉记录
select * from wash_dimension_user_info

-- 【promotion_activity_merchant】查洗水商家维度商创活动
SELECT id, merchant_id, equipment_value, product_type, scene, type, remark, created_time, updated_time, deleted, created_by, updated_by FROM wash_activity_rule_equipment 
WHERE 1=1 AND merchant_id IN ( 1036016 ) AND product_type IN ( 4 ) AND type = 1 and deleted = false ORDER BY updated_time DESC LIMIT 10

-- 【wash_product_order】查洗水商创产品
select * from wash_product_order
```

**库：`merchant`**（1 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `merchant_equipment_board` | 查设备属于XYJ还是XYJY | [merchant/merchant_equipment_board.sql](./tables/merchant/merchant_equipment_board.sql) |

```sql
-- 【merchant_equipment_board】查设备属于XYJ还是XYJY
select * from merchant_equipment_board where equipment_value = '22514034' limit 10
```

**库：`middle_stage`**（1 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `ticket` | 查工单 | [middle_stage/ticket.sql](./tables/middle_stage/ticket.sql) |

```sql
-- 【ticket】查工单
select * from ticket
```

**库：`massage_chair`**（3 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `lyy_ic_card` | 查ic卡信息 | [massage_chair/lyy_ic_card.sql](./tables/massage_chair/lyy_ic_card.sql) |
| `lyy_ic_card_flow` | 查ic卡流水 | [massage_chair/lyy_ic_card_flow.sql](./tables/massage_chair/lyy_ic_card_flow.sql) |
| `ic_card_limit_config` | 查ic卡限额信息 | [massage_chair/ic_card_limit_config.sql](./tables/massage_chair/ic_card_limit_config.sql) |

```sql
-- 【lyy_ic_card】查ic卡信息
select * from lyy_ic_card lic where card_no ='06909'order by create_time desc limit 10

-- 【lyy_ic_card_flow】查ic卡流水
select * from lyy_ic_card_flow licf where card_no ='6217003110010638458' order by create_time desc limit 10

-- 【ic_card_limit_config】查ic卡限额信息
select * from ic_card_limit_config iclc where store_id ='1066577' order by create_time desc
```

**库：`lyy_infor`**（5 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `xiaole_user_points_record` | 查app用户积分记录 | [lyy_infor/xiaole_user_points_record.sql](./tables/lyy_infor/xiaole_user_points_record.sql) |
| `xiaole_life_user` | 查app用户信息 | [lyy_infor/xiaole_life_user.sql](./tables/lyy_infor/xiaole_life_user.sql) |
| `xiaole_life_user_relate` | 查app用户与lyy、ls系统用户关联关系 | [lyy_infor/xiaole_life_user_relate.sql](./tables/lyy_infor/xiaole_life_user_relate.sql) |
| `xiaole_black_user` | 查不跳转app用户黑名单 | [lyy_infor/xiaole_black_user.sql](./tables/lyy_infor/xiaole_black_user.sql) |
| `xiaole_user_no_app_request` | 查app不使用申请黑名单 | [lyy_infor/xiaole_user_no_app_request.sql](./tables/lyy_infor/xiaole_user_no_app_request.sql) |

```sql
-- 【xiaole_user_points_record】查app用户积分记录
select * from xiaole_user_points_record xupr where user_id ='2399' order by create_time desc

-- 【xiaole_life_user】查app用户信息
select * from xiaole_life_user xlu where telephone in ('15915908118')

-- 【xiaole_life_user_relate】查app用户与lyy、ls系统用户关联关系
select* from xiaole_life_user_relate xlur  where platform_user_id ='2200009261' and subject_platform ='leyaoyao'order by create_time  desc

-- 【xiaole_black_user】查不跳转app用户黑名单
select * from xiaole_black_user where black_type = 4

-- 【xiaole_user_no_app_request】查app不使用申请黑名单
select * from xiaole_user_no_app_request xunar
```

**库：`order`**（2 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `order_info` | 查订单信息 | [order/order_info.sql](./tables/order/order_info.sql) |
| `refund_order_info` | 查订单退款信息 | [order/refund_order_info.sql](./tables/order/refund_order_info.sql) |

```sql
-- 【order_info】查订单信息
SELECT * FROM order_info where distributor_id='1913197'and user_id ='194947573' and create_time > '2025-11-04 00:00:00'  order by create_time desc;

-- 【refund_order_info】查订单退款信息
select *  from refund_order_info roi where distributor_id ='2347269' and refund_success_time >'2025-11-03 00:00:00' and refund_success_time <'2025-11-04 00:00:00'
```

### 设备

**库：`equipment`**（4 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `device` | 查设备初始化 | [equipment/device.sql](./tables/equipment/device.sql) |
| `iot_equipment` | 查设备信息 | [equipment/iot_equipment.sql](./tables/equipment/iot_equipment.sql) |
| `iot_equipment_setting` | 查设备对应的协议 | [equipment/iot_equipment_setting.sql](./tables/equipment/iot_equipment_setting.sql) |
| `iot_equipment_docking` | 查安卓设备信息 | [equipment/iot_equipment_docking.sql](./tables/equipment/iot_equipment_docking.sql) |

```sql
-- 【device】查设备初始化
SELECT * FROM lyy.device WHERE device_id=？;

-- 【iot_equipment】查设备信息
SELECT id, unique_code, iccid, imei, login_flag, factory, mainboard_factory, mainboard_model, factory_model, hardware_model, hardware_project, interface_type, bluetooth_mac, mac, firmware_version, business_version_no, initial_time, factory_type, device_type, status, hardware_flag, gateway, category, firmware_business_no, firmware_underlay_no, private_key, pkey_password, bluetooth_key FROM lyy.iot_equipment WHERE unique_code=？;

-- 【iot_equipment_setting】查设备对应的协议
SELECT id, equipment_id, product_number, system_version, is_pulse, app_version, signal,protocol_id, gps_support, return_ability, low_power FROM lyy.iot_equipment_setting WHERE equipment_id=？;

-- 【iot_equipment_docking】查安卓设备信息
SELECT id, equipment_id, equipment_value, app_id, app_secret, app_uuid, switch_type, face_equipment_type, serial_unique_code, app_type, android_unique_code, third_factory,  connect_type, connect_mode, protocol_version, mainboard_id FROM lyy.iot_equipment_docking WHERE equipment_value=？;
```

**库：`master`**（1 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `lyy_equipment_private_key` | 查设备密钥 | [master/lyy_equipment_private_key.sql](./tables/master/lyy_equipment_private_key.sql) |

```sql
-- 【lyy_equipment_private_key】查设备密钥
SELECT lyy_equipment_private_key_id, unique_code, private_key, password FROM adempiere.lyy_equipment_private_key WHERE unique_code=？;
```

### 支付

**库：`master`**（7 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `payment_fee_deduction_equipment` | 查手续费外扣 | [master/payment_fee_deduction_equipment.sql](./tables/master/payment_fee_deduction_equipment.sql) |
| `experience_merchant_list` | 查体验期 | [master/experience_merchant_list.sql](./tables/master/experience_merchant_list.sql) |
| `lyy_merchant_info` | 查商户信息 | [master/lyy_merchant_info.sql](./tables/master/lyy_merchant_info.sql) |
| `lyy_divide_merchant_info` | 查分账用户信息 | [master/lyy_divide_merchant_info.sql](./tables/master/lyy_divide_merchant_info.sql) |
| `lyy_swiftpass_merchant_detail` | 查商家资料 | [master/lyy_swiftpass_merchant_detail.sql](./tables/master/lyy_swiftpass_merchant_detail.sql) |
| `lyy_payment` | 查提现情况 | [master/lyy_payment.sql](./tables/master/lyy_payment.sql) |
| `payment_info_config` | 查appid路由配置 | [master/payment_info_config.sql](./tables/master/payment_info_config.sql) |

```sql
-- 【payment_fee_deduction_equipment】查手续费外扣
select *
from payment_fee_deduction_equipment
where equipment_value ='12200001';

-- 【experience_merchant_list】查体验期
select *
from experience_merchant_list
where ad_org_id = '1094750';

-- 【lyy_merchant_info】查商户信息
select *
from lyy_merchant_info
where ad_org_id = 1094949;

-- 【lyy_divide_merchant_info】查分账用户信息
select *
from lyy_divide_merchant_info
where  ad_org_id=1094552;

-- 【lyy_swiftpass_merchant_detail】查商家资料
select * from lyy_swiftpass_merchant_detail where ad_org_id = 1073610;

-- 【lyy_payment】查提现情况
select *
from lyy_payment
where ad_org_id in (1036475)
order by created desc;

-- 【payment_info_config】查appid路由配置
select * from payment_info_config where distributor_id = 2267406
```

### 按摩

**库：`advert`**（4 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `insurance_user_benefit_card` | 权益表 | [advert/insurance_user_benefit_card.sql](./tables/advert/insurance_user_benefit_card.sql) |
| `insurance_order` | 权益订单表 | [advert/insurance_order.sql](./tables/advert/insurance_order.sql) |
| `automatic_debit_order` | 代扣订单 | [advert/automatic_debit_order.sql](./tables/advert/automatic_debit_order.sql) |
| `automatic_debit_receive_record` | 代扣记录 | [advert/automatic_debit_receive_record.sql](./tables/advert/automatic_debit_receive_record.sql) |

```sql
-- 【insurance_user_benefit_card】权益表
select * from insurance_user_benefit_card where lyy_user_id in(2200020344) and created >= '2026-10-10';

-- 【insurance_order】权益订单表
select * from insurance_order   where lyy_user_id in(2200020344) and created >= '2026-10-10' and distributor_id ='1032498';

-- 【automatic_debit_order】代扣订单
select * from automatic_debit_order where created >= '2026-3-3'  and user_id = 2200012720 ;

-- 【automatic_debit_receive_record】代扣记录
select * from automatic_debit_receive_record   where user_id in(2200020344) and created >= '2026-10-10' and distributor_id ='1032498';
```

**库：`cmember`**（3 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `massage_automatic_debit` | 领取福利记录 | [cmember/massage_automatic_debit.sql](./tables/cmember/massage_automatic_debit.sql) |
| `jd_insurance_start_record` | 京东权益领取记录 | [cmember/jd_insurance_start_record.sql](./tables/cmember/jd_insurance_start_record.sql) |
| `promotion_activity_user` | — | [cmember/promotion_activity_user.sql](./tables/cmember/promotion_activity_user.sql) |

```sql
-- 【massage_automatic_debit】领取福利记录
select * from massage_automatic_debit where  created >= '2026-3-3' and user_id = 2200012720 ;

-- 【jd_insurance_start_record】京东权益领取记录
select * from jd_insurance_start_record where user_id=2200020344 and create_time >= '2026-10-3';

-- 【promotion_activity_user】
select * from promotion_activity_user where lyy_user_id =2200020344 and  created >= '2026-10-3' and lyy_distributor_id = 1032498 ;
```

## 三、按库汇总（去重）

| 库名 | 表数量 | 表名 |
| --- | --- | --- |
| `lyy_consumption` | 1 | `lyy_request_history` |
| `cmember` | 9 | `tiktok_activity_order`、`tiktok_activity_poi`、`tiktok_activity_coupon`、`wash_dimension_user_info`、`promotion_activity_merchant`、`wash_product_order`、`massage_automatic_debit`、`jd_insurance_start_record`、`promotion_activity_user` |
| `master` | 15 | `lyy_media_ads_device`、`MEITUAN_STORE_APPLY`、`merchant_equipment`、`agent_equipment`、`ad_org`、`ad_org_attach`、`equipment_charging_type`、`lyy_equipment_private_key`、`payment_fee_deduction_equipment`、`experience_merchant_list`、`lyy_merchant_info`、`lyy_divide_merchant_info`、`lyy_swiftpass_merchant_detail`、`lyy_payment`、`payment_info_config` |
| `massage_chair` | 7 | `coins_saver_order`、`lyy_charging_order`、`lyy_charging_order_power`、`lyy_charging_equipment_port`、`lyy_ic_card`、`lyy_ic_card_flow`、`ic_card_limit_config` |
| `small_venue` | 1 | `t_merchant_card` |
| `advert` | 8 | `lyy_cdz_insurance_buy_card`、`lyy_cdz_insurance_order`、`lyy_cdz_activity_black_list`、`cdz_debit_order`、`automatic_debit_order`、`lyy_cdz_member_card`、`lyy_cdz_insurance_equipment_order_detail`、`lyy_distributor_advertise_coupon` |
| `commercial_charges` | 12 | `system_charge_equipment_bill`、`system_charge_equipment_bill_flow`、`system_charge_equipment`、`system_charge_config`、`merchant_product`、`receipt_bill`、`receipt_bill_detail`、`receipt_bill_pay_trans`、`receipt_bill_pay_trans_detail`、`receipt_bill_refund_trans`、`receipt_bill_refund_trans_detail`、`merchant_message_config` |
| `carcharging` | 4 | `infra_station`、`order_charge`、`family_equipment_vip`、`member_user_info` |
| `user_member` | 5 | `um_account_record`、`um_account`、`um_account_benefit`、`um_benefit_scope`、`um_benefit` |
| `selectdb_payment` | 6 | `dwd_payment_payment_record_trade`、`dwd_payment_refund_record_trade`、`ads_order_info_agg`、`ds_unified_redeem_order`、`ods_unified_redeem_order`、`ads_payment_equipment_record_di` |
| `merchant` | 1 | `merchant_equipment_board` |
| `middle_stage` | 1 | `ticket` |
| `lyy_infor` | 5 | `xiaole_user_points_record`、`xiaole_life_user`、`xiaole_life_user_relate`、`xiaole_black_user`、`xiaole_user_no_app_request` |
| `order` | 2 | `order_info`、`refund_order_info` |
| `equipment` | 4 | `device`、`iot_equipment`、`iot_equipment_setting`、`iot_equipment_docking` |
| `advert` | 4 | `insurance_user_benefit_card`、`insurance_order`、`automatic_debit_order`、`automatic_debit_receive_record` |

## 四、数据一致性校验

表名列与示例 SQL 中 `FROM`/`JOIN` 的表名不一致的记录：

| Excel 行 | 业务分类 | 库 | 表名列 | SQL 中的表 | 使用场景 |
| --- | --- | --- | --- | --- | --- |
| 52 | 中台 | `selectdb_payment` | `ds_unified_redeem_order` | `ods_unified_redeem_order` | 经营统计查抖音核销数据 |
| 56 | 洗水 | `cmember` | `promotion_activity_merchant` | `wash_activity_rule_equipment` | 查洗水商家维度商创活动 |