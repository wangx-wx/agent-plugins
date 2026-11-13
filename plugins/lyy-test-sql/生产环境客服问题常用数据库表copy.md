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
| 中台 | `selectdb_payment` | 5 | `dwd_payment_payment_record_trade`、`dwd_payment_refund_record_trade`、`ads_order_info_agg`、`ods_unified_redeem_order`、`ads_payment_equipment_record_di` |
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

合计：**10** 个业务分类、**15** 个库、**87** 条表记录（去重后 **84** 张表）。

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
select * from tiktok_activity_order where sku_id='7284593202361796669'

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

**库：`selectdb_payment`**（5 张表）

| 表名 | 使用场景 | 建表 SQL（相对本文件） |
| --- | --- | --- |
| `dwd_payment_payment_record_trade` | 查询每个订单在移动端报表内实际增加和退款金额 | [selectdb_payment/dwd_payment_payment_record_trade.sql](./tables/selectdb_payment/dwd_payment_payment_record_trade.sql) |
| `dwd_payment_refund_record_trade` | 查询退款交易 | [selectdb_payment/dwd_payment_refund_record_trade.sql](./tables/selectdb_payment/dwd_payment_refund_record_trade.sql) |
| `ads_order_info_agg` | 查询订单信息 | [selectdb_payment/ads_order_info_agg.sql](./tables/selectdb_payment/ads_order_info_agg.sql) |
| `ods_unified_redeem_order` | 经营统计查抖音核销数据、经营统计查美团核销数据 | [selectdb_payment/ods_unified_redeem_order.sql](./tables/selectdb_payment/ods_unified_redeem_order.sql) |
| `ads_payment_equipment_record_di` | 经营统计每日的收入概览、启动概览、储值概览、每日经营趋势、收款金额趋势、时段经营趋势、收款分析 | [selectdb_payment/ads_payment_equipment_record_di.sql](./tables/selectdb_payment/ads_payment_equipment_record_di.sql) |

```sql
CREATE TABLE `dwd_payment_payment_record_trade` (
  `out_trade_no` varchar(500) NULL,
  `order_no` varchar(500) NULL,
  `ds` date NULL,
  `distributor_id` bigint NULL,
  `order_date` date NULL,
  `amount` decimal(11,2) NULL,
  `confirm_date` date NULL,
  `pay_amount` decimal(16,2) NULL,
  `merchant_code` varchar(500) NULL,
  `channel_code` int NULL,
  `settlement_channel_code` int NULL,
  `open_id` varchar(500) NULL,
  `app_id` varchar(500) NULL,
  `channel_order_no` varchar(500) NULL,
  `third_order_no` varchar(500) NULL,
  `status` tinyint NULL,
  `refund_mark` tinyint NULL,
  `remainder_amount` decimal(11,2) NULL,
  `client_type` tinyint NULL,
  `notifiable` tinyint NULL,
  `exist_divide_profit` tinyint NULL,
  `remark` text NULL,
  `trade_time` datetime(3) NULL,
  `create_time` datetime(3) NULL,
  `pay_mode` smallint NULL,
  `delay_settlement` tinyint NULL,
  `f_reserve` bigint NULL,
  `create_by` bigint NULL,
  `update_time` datetime(3) NULL,
  `update_by` bigint NULL,
  `organization_id` bigint NULL,
  `pay_method` varchar(500) NULL,
  `pay_method_name` varchar(500) NULL,
  `channel_merchant_order_no` varchar(500) NULL,
  `certificate` json NULL,
  `attach` text NULL,
  `out_app_id` varchar(500) NULL,
  `pay_ad_org_id` bigint NULL,
  `pay_merchant_code` varchar(500) NULL,
  `use_pay_merchant_code_biz_type` tinyint NULL,
  `settlement_amount` decimal(16,2) NULL,
  `settlement_status` tinyint NULL,
  `product_code2` varchar(500) NULL,
  `terminal_no` varchar(500) NULL,
  `product_code` varchar(500) NULL,
  `pay_service_fee` decimal(10,2) NULL,
  `merchant_out_app_id` varchar(500) NULL,
  `deduction_payment_service_fee` decimal(10,2) NULL,
  `failed_description` text NULL,
  `has_service_fee_deduction` tinyint NULL,
  `deduction_merchant_code` varchar(500) NULL,
  `settlement_date` date NULL,
  `order_amount` tinyint NULL,
  `actual_amount` tinyint NULL,
  `mk_offer_amount` tinyint NULL,
  `u_user_id` bigint NULL,
  `district_id` bigint NULL,
  `province_id` bigint NULL,
  `city_id` bigint NULL,
  `province` varchar(500) NULL,
  `city` varchar(500) NULL,
  `district` varchar(500) NULL,
  `equipment_id` bigint NULL,
  `e_code` varchar(40) NULL,
  `e_type_id` bigint NULL,
  `e_type_value` varchar(500) NULL,
  `e_type_name` varchar(500) NULL,
  `store_id` bigint NULL,
  `e_store_name` varchar(500) NULL,
  `merchant_name` varchar(500) NULL,
  `merchant_short_name` varchar(1024) NULL,
  `id_code` varchar(500) NULL,
  `business_license` varchar(500) NULL,
  `account_code` varchar(500) NULL,
  `account_name` varchar(500) NULL,
  `merchant_type` char(1) NULL,
  `account_type` char(1) NULL,
  `bank_short_name` varchar(1024) NULL,
  `bank_name` varchar(1024) NULL,
  `hour` tinyint NULL,
  `receivable_amount` decimal(38,2) NULL,
  `received_amount` decimal(38,2) NULL,
  `platform_tying_amount` decimal(38,2) NULL,
  `platform_tying_service_fee` decimal(38,2) NULL,
  `platform_tying_deduction_divide_service_fee` decimal(38,2) NULL,
  `platform_amount` decimal(38,2) NULL,
  `platform_service_fee` decimal(38,2) NULL,
  `platform_deduction_divide_service_fee` decimal(38,2) NULL,
  `divide_amount` decimal(38,2) NULL,
  `divide_service_fee` decimal(38,2) NULL,
  `deduction_divide_service_fee` decimal(38,2) NULL,
  `independent_amount` decimal(38,2) NULL,
  `pay_amount_level` text NULL,
  `pay_type` text NULL,
  `month` date NULL,
  `year` date NULL,
  `is_workday` text NULL,
  `is_weekday` text NULL,
  `is_week_year` bigint NULL,
  `week_year_rnk` bigint NULL,
  `week_day` bigint NULL,
  `week_sta` date NULL,
  `week_end` date NULL,
  `week_month_rnk` bigint NULL,
  `card_id` bigint NULL COMMENT "商户卡ID",
  `clearing_settlement` smallint NULL COMMENT "二清结算 1-是  为空或其他否",
  `primary_clearing_category_code` varchar(64) NULL COMMENT "清分一级类目",
  `second_clearing_category_code` varchar(64) NULL COMMENT "清分二级类目",
  `third_clearing_category_code` varchar(64) NULL COMMENT "清分三级类目",
  `trans_category` smallint NULL COMMENT "交易类型聚合 1启动 2充值"
) ENGINE=OLAP
UNIQUE KEY(`out_trade_no`, `order_no`, `ds`)
PARTITION BY RANGE(`ds`)()
DISTRIBUTED BY HASH(`out_trade_no`) BUCKETS 8
PROPERTIES (
"file_cache_ttl_seconds" = "0",
"is_being_synced" = "false",
"dynamic_partition.enable" = "true",
"dynamic_partition.time_unit" = "DAY",
"dynamic_partition.time_zone" = "Asia/Shanghai",
"dynamic_partition.start" = "-2147483648",
"dynamic_partition.end" = "3",
"dynamic_partition.prefix" = "p",
"dynamic_partition.buckets" = "8",
"dynamic_partition.create_history_partition" = "false",
"dynamic_partition.history_partition_num" = "-1",
"dynamic_partition.hot_partition_num" = "0",
"dynamic_partition.reserved_history_periods" = "NULL",
"storage_medium" = "hdd",
"storage_format" = "V2",
"inverted_index_storage_format" = "V2",
"enable_unique_key_merge_on_write" = "true",
"light_schema_change" = "true",
"disable_auto_compaction" = "false",
"enable_single_replica_compaction" = "false",
"group_commit_interval_ms" = "10000",
"group_commit_data_bytes" = "134217728",
"enable_mow_light_delete" = "false"
);

CREATE TABLE `dwd_payment_refund_record_trade` (
  `refund_record_no` varchar(100) NULL,
  `out_trade_no` varchar(100) NULL,
  `refund_no` varchar(100) NULL,
  `order_no` varchar(100) NULL,
  `ds` date NULL,
  `distributor_id` bigint NULL,
  `payment_created` date NULL,
  `bill_date` date NULL,
  `pay_amount` decimal(11,2) NOT NULL,
  `merchant_code` varchar(400) NULL,
  `channel_code` int NULL,
  `settlement_channel_code` int NULL,
  `refund_amount` decimal(11,2) NOT NULL,
  `remark` text NULL,
  `failed_description` varchar(255) NULL,
  `status` tinyint NULL,
  `source` tinyint NULL,
  `refund_type` tinyint NULL,
  `refund_time` datetime(3) NULL,
  `refund_success_time` datetime(3) NULL,
  `f_reserve` bigint NULL,
  `pay_method` varchar(200) NULL,
  `pay_method_name` varchar(255) NULL,
  `create_time` datetime(3) NULL,
  `update_time` datetime(3) NULL,
  `update_by` bigint NULL,
  `organization_id` bigint NULL,
  `create_by` bigint NULL,
  `client_type` tinyint NULL,
  `channel_order_no` varchar(200) NULL,
  `certificate` json NULL,
  `attach` text NULL,
  `out_app_id` varchar(200) NULL,
  `common_extend` text NULL,
  `refund_service_fee` decimal(10,2) NOT NULL,
  `deduction_refund_service_fee` decimal(10,2) NOT NULL,
  `settlement_date` date NULL,
  `merchant_name` varchar(255) NULL,
  `merchant_short_name` varchar(255) NULL,
  `id_code` varchar(255) NULL,
  `business_license` varchar(255) NULL,
  `account_code` varchar(255) NULL,
  `account_name` varchar(255) NULL,
  `merchant_type` char(1) NULL,
  `account_type` char(1) NULL,
  `bank_short_name` varchar(255) NULL,
  `bank_name` varchar(255) NULL,
  `district_id` bigint NULL,
  `province_id` bigint NULL,
  `city_id` bigint NULL,
  `province` varchar(50) NULL,
  `city` varchar(100) NULL,
  `district` varchar(100) NULL,
  `e_name` varchar(400) NULL,
  `equipment_id` bigint NULL,
  `e_code` varchar(160) NULL,
  `e_device_no` varchar(160) NULL,
  `e_terminal_value` varchar(160) NULL,
  `e_location_name` varchar(800) NULL,
  `e_type_id` bigint NULL,
  `e_type_value` varchar(80) NULL,
  `e_type_name` varchar(400) NULL,
  `store_id` bigint NULL,
  `e_store_name` varchar(400) NULL,
  `e_store_address` varchar(800) NULL,
  `receivable_refund_amount` decimal(38,2) NOT NULL,
  `received_refund_amount` decimal(38,2) NOT NULL,
  `platform_refund_tying_amount` decimal(38,2) NOT NULL,
  `platform_refund_tying_service_fee` decimal(38,2) NOT NULL,
  `platform_refund_tying_deduction_service_fee` decimal(38,2) NOT NULL,
  `platform_refund_amount` decimal(38,2) NOT NULL,
  `platform_refund_service_fee` decimal(38,2) NOT NULL,
  `platform_refund_deduction_service_fee` decimal(38,2) NOT NULL,
  `independent_refund_amount` decimal(38,2) NOT NULL,
  `refund_divide_amount` decimal(38,2) NOT NULL,
  `refund_divide_service_fee` decimal(38,2) NOT NULL,
  `refund_deduction_divide_service_fee` decimal(38,2) NOT NULL,
  `hour` tinyint NULL,
  `pay_amount_level` text NOT NULL,
  `pay_type` text NOT NULL,
  `month` date NULL,
  `year` date NULL,
  `is_workday` text NULL,
  `is_weekday` text NULL,
  `is_week_year` bigint NULL,
  `week_year_rnk` bigint NULL,
  `week_day` bigint NULL,
  `week_sta` date NULL,
  `week_end` date NULL,
  `week_month_rnk` bigint NULL,
  `card_id` bigint NULL COMMENT "商户卡ID",
  `clearing_settlement` smallint NULL COMMENT "二清结算 1-是  为空或其他否",
  `primary_clearing_category_code` varchar(64) NULL COMMENT "清分一级类目",
  `second_clearing_category_code` varchar(64) NULL COMMENT "清分二级类目",
  `third_clearing_category_code` varchar(64) NULL COMMENT "清分三级类目",
  `pay_ad_org_id` bigint NULL COMMENT "大商户号ID",
  `trans_category` smallint NULL COMMENT "交易类型聚合 1启动 2充值"
) ENGINE=OLAP
UNIQUE KEY(`refund_record_no`, `out_trade_no`, `refund_no`, `order_no`, `ds`)
PARTITION BY RANGE(`ds`)()
DISTRIBUTED BY HASH(`refund_record_no`) BUCKETS 8
PROPERTIES (
"file_cache_ttl_seconds" = "0",
"is_being_synced" = "false",
"dynamic_partition.enable" = "true",
"dynamic_partition.time_unit" = "DAY",
"dynamic_partition.time_zone" = "Asia/Shanghai",
"dynamic_partition.start" = "-2147483648",
"dynamic_partition.end" = "3",
"dynamic_partition.prefix" = "p",
"dynamic_partition.buckets" = "8",
"dynamic_partition.create_history_partition" = "false",
"dynamic_partition.history_partition_num" = "-1",
"dynamic_partition.hot_partition_num" = "0",
"dynamic_partition.reserved_history_periods" = "NULL",
"storage_medium" = "hdd",
"storage_format" = "V2",
"inverted_index_storage_format" = "V2",
"enable_unique_key_merge_on_write" = "true",
"light_schema_change" = "true",
"disable_auto_compaction" = "false",
"enable_single_replica_compaction" = "false",
"group_commit_interval_ms" = "10000",
"group_commit_data_bytes" = "134217728",
"enable_mow_light_delete" = "false"
);

CREATE TABLE `ads_order_info_agg` (
  `out_trade_no` varchar(100) NULL,
  `distributor_id` bigint NULL,
  `ds` date NULL,
  `store_id` bigint NULL,
  `equipment_id` bigint NULL,
  `user_id` bigint NULL,
  `create_time` datetime NULL,
  `status` smallint NULL,
  `status_agg` tinyint NULL,
  `aggregate_order_no` varchar(65533) NULL,
  `payment_method_agg_list` array<text> NULL,
  `order_amount` decimal(38,2) NULL,
  `actual_amount` decimal(38,2) NULL,
  `refund_amount` decimal(38,2) NULL,
  `merchant_actual_amount` decimal(38,2) NULL,
  `merchant_actual_refund_amount` decimal(38,2) NULL,
  `platform_service_amount` decimal(38,2) NULL,
  `platform_service_refund_amount` decimal(38,2) NULL,
  `platform_tying_amount` decimal(38,2) NULL,
  `platform_tying_refund_amount` decimal(38,2) NULL,
  `refund_order_list` text NULL,
  `order_goods_list` text NULL,
  `payment_record_list` text NULL,
  `balance_stored` decimal(18,2) NULL,
  `coin_stored` decimal(18,2) NULL,
  `member_card_times_stored` decimal(18,2) NULL,
  `time_card_stored` decimal(18,2) NULL,
  `ic_card_stored` decimal(18,2) NULL,
  `refund_balance_stored` decimal(38,2) NULL,
  `refund_coin_stored` decimal(38,2) NULL,
  `refund_member_card_times_stored` decimal(38,2) NULL,
  `refund_time_card_stored` decimal(38,2) NULL,
  `refund_ic_card_stored` decimal(38,2) NULL,
  `p_channel_code_list` text NULL,
  `p_pay_mode_list` text NULL,
  `p_channel_order_no_list` text NULL,
  `p_third_order_no_list` text NULL,
  `p_channel_merchant_order_no_list` text NULL,
  `p_settlement_status_list` text NULL,
  `p_delay_settlement_list` text NULL,
  `trade_time` datetime(3) NULL,
  `channel_code` int NULL,
  `confirm_date` datetime NULL,
  `e_code` varchar(100) NULL,
  `e_type_value` varchar(100) NULL,
  `e_type_id` bigint NULL,
  `e_remark` text NULL,
  `e_store_name` varchar(512) NULL COMMENT "场地名称",
  `e_name` varchar(255) NULL,
  `e_terminal_value` varchar(65533) NULL,
  `e_type_name` varchar(255) NULL,
  `e_model` varchar(40) NULL,
  `e_mainboard_id` bigint NULL,
  `e_mainboard_value` varchar(40) NULL,
  `e_mainboard_unique_code` varchar(100) NULL,
  `e_imei_value` varchar(65533) NULL,
  `e_labels` varchar(65533) NULL,
  `g_mainboard_position_id_list` text NULL,
  `goods_total_quantity` bigint NULL,
  `refund_goods_total_quantity` bigint NULL,
  `goods_name_splice` varchar(65533) NULL,
  `goods_name_quantity_splice` varchar(65533) NULL,
  `r_status_list` varchar(65533) NULL,
  `r_remark_list` varchar(65533) NULL,
  `mk_activity_type_id_list` varchar(65533) NULL,
  `mk_activity_id_list` varchar(65533) NULL,
  `mk_offer_amount` decimal(11,2) NULL,
  `c_ic_card_no` varchar(65533) NULL,
  `u_phone` varchar(65533) NULL,
  `c_status_source` varchar(65533) NULL,
  `subsidy_amount` decimal(12,2) NULL,
  `order_type` smallint NULL,
  `sales_order_no` varchar(65533) NULL,
  `marketing_detail_list` text NULL,
  `member_detail` json NULL,
  `equipment_detail` json NULL,
  `client_type` smallint NULL,
  `business_type` smallint NULL,
  `refund_mark` smallint NULL,
  `remark` text NULL,
  `parent_no` varchar(100) NULL,
  `trans_type` smallint NULL,
  `common_extend` json NULL,
  `pay_detail_list` text NULL,
  `operator` json NULL,
  `only_channel_pay` tinyint NULL,
  `mk_draw_amount` decimal(11,2) NULL,
  `current_agent_user_id` bigint NULL COMMENT "当前代理商id",
  `dealer_order_type` tinyint NULL COMMENT "订单分类(充值订单,消费订单,权益结算订单)",
  `consumer_confirm_status` tinyint NULL DEFAULT "1" COMMENT "消费确认状态 1待确认 2已确认",
  `consumer_confirm_time` datetime NULL COMMENT "消费确认时间",
  `consumer_confirm_amount` decimal(38,2) NULL COMMENT "消费确认金额(可结算)",
  `business_scene_type` varchar(64) NULL COMMENT "业务场景类型 dealer：经销商，brand：品牌商",
  `business_scene_merchant_id` bigint NULL COMMENT "业务商户id",
  `agent_merchant_id` bigint NULL COMMENT "代理商商户id",
  `store_value_detail_agg` json NULL COMMENT "储值对象",
  `confirm_before_refund_store_value_detail_agg` json NULL COMMENT "确认前退款储值对象",
  `refund_subsidy_amount` decimal(38,2) NULL COMMENT "补贴退款总额",
  `aggregate_user_member` text NULL COMMENT "聚合用户查询:名称,手机号,id",
  `member_card_type` tinyint NULL COMMENT "会员卡类型(1.次卡,2.时长卡,3折扣卡)",
  `is_wallet_settlement` tinyint NULL COMMENT "是否资金池结算",
  `consumer_service_amount` decimal(38,2) NULL COMMENT "消费服务费",
  `consumer_service_refund_amount` decimal(38,2) NULL COMMENT "消费退款服务费",
  `consumer_divide_list` text NULL COMMENT "消费分账信息",
  `consumer_status` smallint NULL COMMENT "消费状态,1服务中,2已完成",
  `business_domain` smallint NULL COMMENT "业务域分类 1.乐摇摇 2.多金宝 99.其他订单(暂无)",
  `pay_attribute` smallint NULL COMMENT "支付属性 1.免支付(0元单) 2.渠道支付,3.储值支付 4.组合支付(渠道+储值支付) 5.押金支付",
  `consume_mode` smallint NULL COMMENT "消费模式 1.先付后用 2.先用后付(支付分,芝麻分等)",
  INDEX idx_ngrambf_aggregate_order_no (`aggregate_order_no`) USING INVERTED PROPERTIES("lower_case" = "true", "parser" = "english", "support_phrase" = "true"),
  INDEX idx_distributor_id (`distributor_id`) USING INVERTED,
  INDEX idx_store_id (`store_id`) USING INVERTED,
  INDEX idx_user_id (`user_id`) USING INVERTED,
  INDEX idx_equipment_id (`equipment_id`) USING INVERTED,
  INDEX idx_status (`status`) USING INVERTED
) ENGINE=OLAP
UNIQUE KEY(`out_trade_no`, `distributor_id`, `ds`)
PARTITION BY RANGE(`ds`)()
DISTRIBUTED BY HASH(`distributor_id`) BUCKETS 2
PROPERTIES (
"file_cache_ttl_seconds" = "0",
"is_being_synced" = "false",
"dynamic_partition.enable" = "true",
"dynamic_partition.time_unit" = "DAY",
"dynamic_partition.time_zone" = "Asia/Shanghai",
"dynamic_partition.start" = "-2147483648",
"dynamic_partition.end" = "3",
"dynamic_partition.prefix" = "p",
"dynamic_partition.buckets" = "2",
"dynamic_partition.create_history_partition" = "false",
"dynamic_partition.history_partition_num" = "1460",
"dynamic_partition.hot_partition_num" = "0",
"dynamic_partition.reserved_history_periods" = "NULL",
"storage_medium" = "hdd",
"storage_format" = "V2",
"inverted_index_storage_format" = "V2",
"enable_unique_key_merge_on_write" = "true",
"light_schema_change" = "true",
"disable_auto_compaction" = "false",
"enable_single_replica_compaction" = "false",
"group_commit_interval_ms" = "10000",
"group_commit_data_bytes" = "134217728",
"enable_mow_light_delete" = "false"
);

CREATE TABLE `ods_unified_redeem_order` (
  `source_table` varchar(64) NOT NULL COMMENT "来源表名(third_redeem_record,meituan_redeem_record,tiktok_activity_order)",
  `source_id` bigint NOT NULL COMMENT "来源表主键ID",
  `day` date NOT NULL COMMENT "日期分区字段(来源于created)",
  `channel` varchar(32) NOT NULL COMMENT "渠道: meituan/tiktok",
  `business_type` varchar(32) NOT NULL COMMENT "业务类型: self/assembly",
  `distributor_id` bigint NOT NULL COMMENT "商户ID",
  `equipment_group_id` bigint NULL COMMENT "场地ID",
  `equipment_type_id` bigint NULL COMMENT "设备类型ID",
  `equipment_id` bigint NULL COMMENT "设备ID",
  `user_id` bigint NULL COMMENT "用户ID",
  `position_id` bigint NULL COMMENT "仓位ID",
  `locate` bigint NULL COMMENT "仓位编号",
  `province_id` bigint NULL COMMENT "省份ID",
  `city_id` bigint NULL COMMENT "城市ID",
  `district_id` bigint NULL COMMENT "区县ID",
  `code` varchar(255) NULL COMMENT "券码",
  `title` varchar(255) NULL COMMENT "商品名称",
  `redeem_amount` decimal(10,2) NULL COMMENT "核销金额",
  `goods_amount` decimal(10,2) NULL COMMENT "商品金额",
  `pay_amount` decimal(10,2) NULL COMMENT "支付金额",
  `redeem_type` smallint NULL COMMENT "核销类型",
  `status` smallint NULL COMMENT "统一状态: 1=初始化 2=已核销 3=已退款 4=失败",
  `good_info` json NULL COMMENT "商品信息JSON",
  `ext_data` json NULL COMMENT "渠道特有字段JSON",
  `created` datetime NOT NULL COMMENT "创建时间",
  `updated` datetime NULL COMMENT "更新时间"
) ENGINE=OLAP
UNIQUE KEY(`source_table`, `source_id`, `day`)
PARTITION BY RANGE(`day`)()
DISTRIBUTED BY HASH(`source_table`, `source_id`) BUCKETS 2
PROPERTIES (
"file_cache_ttl_seconds" = "0",
"is_being_synced" = "false",
"dynamic_partition.enable" = "true",
"dynamic_partition.time_unit" = "DAY",
"dynamic_partition.time_zone" = "Asia/Shanghai",
"dynamic_partition.start" = "-1460",
"dynamic_partition.end" = "3",
"dynamic_partition.prefix" = "p",
"dynamic_partition.buckets" = "2",
"dynamic_partition.create_history_partition" = "true",
"dynamic_partition.history_partition_num" = "-1",
"dynamic_partition.hot_partition_num" = "0",
"dynamic_partition.reserved_history_periods" = "NULL",
"storage_medium" = "hdd",
"storage_format" = "V2",
"inverted_index_storage_format" = "V2",
"enable_unique_key_merge_on_write" = "true",
"light_schema_change" = "true",
"disable_auto_compaction" = "false",
"enable_single_replica_compaction" = "false",
"group_commit_interval_ms" = "10000",
"group_commit_data_bytes" = "134217728",
"enable_mow_light_delete" = "false"
);

CREATE TABLE `ads_payment_equipment_record_di` (
  `ds` date NOT NULL COMMENT "日期",
  `distributor_id` bigint NULL COMMENT "商户id",
  `store_id` bigint NULL COMMENT "场地id",
  `e_type_id` bigint NULL COMMENT "设备类型id",
  `equipment_id` bigint NULL COMMENT "设备id",
  `type` varchar(65533) NOT NULL COMMENT "维度类型",
  `e_type_name` varchar(65533) NULL COMMENT "设备类型名称",
  `e_code` varchar(65533) NULL COMMENT "设备value",
  `province_id` bigint NULL COMMENT "省份id",
  `province` varchar(65533) NULL COMMENT "省份",
  `city_id` bigint NULL COMMENT "城市id",
  `city` varchar(65533) NULL COMMENT "城市名称",
  `district_id` bigint NULL COMMENT "区域id",
  `district` varchar(65533) NULL COMMENT "区域名称",
  `month` date NULL COMMENT "月",
  `year` date NULL COMMENT "年",
  `week_day` bigint NULL COMMENT "星期几",
  `is_workday` varchar(200) NULL COMMENT "是否工作日",
  `is_weekday` varchar(200) NULL COMMENT "是否节假日",
  `week_sta` date NULL COMMENT "本周开始日期",
  `week_end` date NULL COMMENT "本周结束日期",
  `week_month_rnk` bigint NULL,
  `order_amount` decimal(38,2) NULL COMMENT "订单金额",
  `actual_amount` decimal(38,2) NULL COMMENT "实际金额",
  `pay_amount` decimal(38,2) NULL COMMENT "支付金额",
  `receivable_amount` decimal(38,2) NULL COMMENT "应收金额",
  `received_amount` decimal(38,2) NULL COMMENT "实收金额",
  `mk_offer_amount` decimal(38,2) NULL COMMENT "营销金额",
  `pay_service_fee` decimal(38,2) NULL COMMENT "手续费金额",
  `deduction_payment_service_fee` decimal(38,2) NULL COMMENT "外扣手续费",
  `platform_tying_amount` decimal(38,2) NULL COMMENT "平台搭售金额",
  `platform_amount` decimal(38,2) NULL COMMENT "平台抽佣金额",
  `independent_amount` decimal(38,2) NULL COMMENT "分账金额",
  `refund_amount` decimal(38,2) NULL COMMENT "退款金额",
  `receivable_refund_amount` decimal(38,2) NULL COMMENT "应退金额",
  `received_refund_amount` decimal(38,2) NULL COMMENT "实退金额",
  `refund_service_fee` decimal(38,2) NULL COMMENT "退款手续费金额",
  `deduction_refund_service_fee` decimal(38,2) NULL COMMENT "退款外扣手续费金额",
  `platform_refund_tying_amount` decimal(38,2) NULL COMMENT "平台搭售退款金额",
  `platform_refund_amount` decimal(38,2) NULL COMMENT "平台抽佣退款金额",
  `independent_refund_amount` decimal(38,2) NULL COMMENT "分账退款金额",
  `pay_count` bigint NULL COMMENT "支付笔数",
  `refund_count` bigint NULL COMMENT "退款笔数",
  `0_1_hour_pay_count` bigint NULL COMMENT "0-1小时支付笔数",
  `1_2_hour_pay_count` bigint NULL COMMENT "1-2小时支付笔数",
  `2_3_hour_pay_count` bigint NULL COMMENT "2-3小时支付笔数",
  `3_4_hour_pay_count` bigint NULL COMMENT "3-4小时支付笔数",
  `4_5_hour_pay_count` bigint NULL COMMENT "4-5小时支付笔数",
  `5_6_hour_pay_count` bigint NULL COMMENT "5-6小时支付笔数",
  `6_7_hour_pay_count` bigint NULL COMMENT "6-7小时支付笔数",
  `7_8_hour_pay_count` bigint NULL COMMENT "7-8小时支付笔数",
  `8_9_hour_pay_count` bigint NULL COMMENT "8-9小时支付笔数",
  `9_10_hour_pay_count` bigint NULL COMMENT "9-10小时支付笔数",
  `10_11_hour_pay_count` bigint NULL COMMENT "10-11小时支付笔数",
  `11_12_hour_pay_count` bigint NULL COMMENT "11-12小时支付笔数",
  `12_13_hour_pay_count` bigint NULL COMMENT "12-13小时支付笔数",
  `13_14_hour_pay_count` bigint NULL COMMENT "13-14小时支付笔数",
  `14_15_hour_pay_count` bigint NULL COMMENT "14-15小时支付笔数",
  `15_16_hour_pay_count` bigint NULL COMMENT "15-16小时支付笔数",
  `16_17_hour_pay_count` bigint NULL COMMENT "16-17小时支付笔数",
  `17_18_hour_pay_count` bigint NULL COMMENT "17-18小时支付笔数",
  `18_19_hour_pay_count` bigint NULL COMMENT "18-19小时支付笔数",
  `19_20_hour_pay_count` bigint NULL COMMENT "19-20小时支付笔数",
  `20_21_hour_pay_count` bigint NULL COMMENT "20-21小时支付笔数",
  `21_22_hour_pay_count` bigint NULL COMMENT "21-22小时支付笔数",
  `22_23_hour_pay_count` bigint NULL COMMENT "22-23小时支付笔数",
  `23_24_hour_pay_count` bigint NULL COMMENT "23-24小时支付笔数",
  `0_1_hour_pay_amount` decimal(38,2) NULL COMMENT "0-1小时支付金额",
  `1_2_hour_pay_amount` decimal(38,2) NULL COMMENT "1-2小时支付金额",
  `2_3_hour_pay_amount` decimal(38,2) NULL COMMENT "2-3小时支付金额",
  `3_4_hour_pay_amount` decimal(38,2) NULL COMMENT "3-4小时支付金额",
  `4_5_hour_pay_amount` decimal(38,2) NULL COMMENT "4-5小时支付金额",
  `5_6_hour_pay_amount` decimal(38,2) NULL COMMENT "5-6小时支付金额",
  `6_7_hour_pay_amount` decimal(38,2) NULL COMMENT "6-7小时支付金额",
  `7_8_hour_pay_amount` decimal(38,2) NULL COMMENT "7-8小时支付金额",
  `8_9_hour_pay_amount` decimal(38,2) NULL COMMENT "8-9小时支付金额",
  `9_10_hour_pay_amount` decimal(38,2) NULL COMMENT "9-10小时支付金额",
  `10_11_hour_pay_amount` decimal(38,2) NULL COMMENT "10-11小时支付金额",
  `11_12_hour_pay_amount` decimal(38,2) NULL COMMENT "11-12小时支付金额",
  `12_13_hour_pay_amount` decimal(38,2) NULL COMMENT "12-13小时支付金额",
  `13_14_hour_pay_amount` decimal(38,2) NULL COMMENT "13-14小时支付金额",
  `14_15_hour_pay_amount` decimal(38,2) NULL COMMENT "14-15小时支付金额",
  `15_16_hour_pay_amount` decimal(38,2) NULL COMMENT "15-16小时支付金额",
  `16_17_hour_pay_amount` decimal(38,2) NULL COMMENT "16-17小时支付金额",
  `17_18_hour_pay_amount` decimal(38,2) NULL COMMENT "17-18小时支付金额",
  `18_19_hour_pay_amount` decimal(38,2) NULL COMMENT "18-19小时支付金额",
  `19_20_hour_pay_amount` decimal(38,2) NULL COMMENT "19-20小时支付金额",
  `20_21_hour_pay_amount` decimal(38,2) NULL COMMENT "20-21小时支付金额",
  `21_22_hour_pay_amount` decimal(38,2) NULL COMMENT "21-22小时支付金额",
  `22_23_hour_pay_amount` decimal(38,2) NULL COMMENT "22-23小时支付金额",
  `23_24_hour_pay_amount` decimal(38,2) NULL COMMENT "23-24小时支付金额",
  `0_1_pay_count` bigint NULL COMMENT "0-1元支付笔数",
  `1_3_pay_count` bigint NULL COMMENT "1-3元支付笔数",
  `3_5_pay_count` bigint NULL COMMENT "3-5元支付笔数",
  `5_10_pay_count` bigint NULL COMMENT "5-10元支付笔数",
  `10_15_pay_count` bigint NULL COMMENT "10-15元支付笔数",
  `15_30_pay_count` bigint NULL COMMENT "15-30元支付笔数",
  `30_50_pay_count` bigint NULL COMMENT "30-50元支付笔数",
  `50_100_pay_count` bigint NULL COMMENT "50-100元支付笔数",
  `100_200_pay_count` bigint NULL COMMENT "100-200元支付笔数",
  `200_500_pay_count` bigint NULL COMMENT "200-500元支付笔数",
  `500_1000_pay_count` bigint NULL COMMENT "500-1000元支付笔数",
  `over_1000_pay_count` bigint NULL COMMENT "1000元以上支付笔数",
  `not_know_pay_count` bigint NULL COMMENT "未知金额支付笔数",
  `0_1_pay_amount` decimal(38,2) NULL COMMENT "0-1元支付金额",
  `1_3_pay_amount` decimal(38,2) NULL COMMENT "1-3元支付金额",
  `3_5_pay_amount` decimal(38,2) NULL COMMENT "3-5元支付金额",
  `5_10_pay_amount` decimal(38,2) NULL COMMENT "5-10元支付金额",
  `10_15_pay_amount` decimal(38,2) NULL COMMENT "10-15元支付金额",
  `15_30_pay_amount` decimal(38,2) NULL COMMENT "15-30元支付金额",
  `30_50_pay_amount` decimal(38,2) NULL COMMENT "30-50元支付金额",
  `50_100_pay_amount` decimal(38,2) NULL COMMENT "50-100元支付金额",
  `100_200_pay_amount` decimal(38,2) NULL COMMENT "100-200元支付金额",
  `200_500_pay_amount` decimal(38,2) NULL COMMENT "200-500元支付金额",
  `500_1000_pay_amount` decimal(38,2) NULL COMMENT "500-1000元支付金额",
  `over_1000_pay_amount` decimal(38,2) NULL COMMENT "1000元以上支付金额",
  `not_know_pay_amount` decimal(38,2) NULL COMMENT "未知支付金额",
  `wechat_h5_pay_count` bigint NULL COMMENT "微信H5支付笔数",
  `wechat_mini_pay_count` bigint NULL COMMENT "微信小程序支付笔数",
  `wechat_face_pay_count` bigint NULL COMMENT "微信刷脸支付笔数",
  `wechat_qrcode_pay_count` bigint NULL COMMENT "微信付款码支付笔数",
  `ali_pay_count` bigint NULL COMMENT "支付宝支付笔数",
  `ali_single_pay_count` bigint NULL COMMENT "支付宝信用付笔数",
  `ali_qrcode_pay_count` bigint NULL COMMENT "支付宝付款码支付笔数",
  `ali_face_pay_count` bigint NULL COMMENT "支付宝刷脸支付笔数",
  `jd_pay_count` bigint NULL COMMENT "京东支付笔数",
  `union_pay_count` bigint NULL COMMENT "云闪付支付笔数",
  `cash_pay_count` bigint NULL COMMENT "现金支付笔数",
  `wechat_score_pay_count` bigint NULL COMMENT "微信支付分支付笔数",
  `reverse_scan_pay_count` bigint NULL COMMENT "反扫支付笔数",
  `other_pay_count` bigint NULL COMMENT "其他支付笔数",
  `wechat_h5_pay_amount` decimal(38,2) NULL COMMENT "微信H5支付金额",
  `wechat_mini_pay_amount` decimal(38,2) NULL COMMENT "微信小程序支付金额",
  `wechat_face_pay_amount` decimal(38,2) NULL COMMENT "微信刷脸支付金额",
  `wechat_qrcode_pay_amount` decimal(38,2) NULL COMMENT "微信付款码支付金额",
  `ali_pay_amount` decimal(38,2) NULL COMMENT "支付宝支付金额",
  `ali_single_pay_amount` decimal(38,2) NULL COMMENT "支付宝信用付金额",
  `ali_qrcode_pay_amount` decimal(38,2) NULL COMMENT "支付宝付款码支付金额",
  `ali_face_pay_amount` decimal(38,2) NULL COMMENT "支付宝刷脸支付金额",
  `jd_pay_amount` decimal(38,2) NULL COMMENT "京东支付金额",
  `union_pay_amount` decimal(38,2) NULL COMMENT "云闪付支付金额",
  `cash_pay_amount` decimal(38,2) NULL COMMENT "现金支付金额",
  `wechat_score_pay_amount` decimal(38,2) NULL COMMENT "微信支付分支付金额",
  `reverse_scan_pay_amount` decimal(38,2) NULL COMMENT "反扫支付金额",
  `other_pay_amount` decimal(38,2) NULL COMMENT "其他支付金额",
  `wechat_app_pay_count` bigint NULL,
  `ali_app_pay_count` bigint NULL,
  `douyin_h5_pay_count` bigint NULL,
  `douyin_qrcode_pay_count` bigint NULL,
  `douyin_face_pay_count` bigint NULL,
  `meituan_h5_pay_count` bigint NULL,
  `meituan_qrcode_pay_count` bigint NULL,
  `meituan_face_pay_count` bigint NULL,
  `web_sit_wap_pay_count` bigint NULL,
  `web_sit_e_bank_pay_count` bigint NULL,
  `wechat_app_pay_amount` decimal(38,2) NULL,
  `ali_app_pay_amount` decimal(38,2) NULL,
  `douyin_h5_pay_amount` decimal(38,2) NULL,
  `douyin_qrcode_pay_amount` decimal(38,2) NULL,
  `douyin_face_pay_amount` decimal(38,2) NULL,
  `meituan_h5_pay_amount` decimal(38,2) NULL,
  `meituan_qrcode_pay_amount` decimal(38,2) NULL,
  `meituan_face_pay_amount` decimal(38,2) NULL,
  `web_sit_wap_pay_amount` decimal(38,2) NULL,
  `web_sit_e_bank_pay_amount` decimal(38,2) NULL,
  INDEX idx_distributor_id (`distributor_id`) USING INVERTED,
  INDEX idx_store_id (`store_id`) USING INVERTED,
  INDEX idx_city_id (`city_id`) USING INVERTED,
  INDEX idx_district_id (`district_id`) USING INVERTED,
  INDEX idx_e_type_id (`e_type_id`) USING INVERTED,
  INDEX idx_e_code (`e_code`) USING INVERTED,
  INDEX idx_equipment_id (`equipment_id`) USING INVERTED
) ENGINE=OLAP
UNIQUE KEY(`ds`, `distributor_id`, `store_id`, `e_type_id`, `equipment_id`, `type`, `e_type_name`, `e_code`)
PARTITION BY RANGE(`ds`)()
DISTRIBUTED BY HASH(`distributor_id`) BUCKETS 8
PROPERTIES (
"file_cache_ttl_seconds" = "0",
"is_being_synced" = "false",
"dynamic_partition.enable" = "true",
"dynamic_partition.time_unit" = "DAY",
"dynamic_partition.time_zone" = "Asia/Shanghai",
"dynamic_partition.start" = "-2147483648",
"dynamic_partition.end" = "3",
"dynamic_partition.prefix" = "p",
"dynamic_partition.buckets" = "8",
"dynamic_partition.create_history_partition" = "false",
"dynamic_partition.history_partition_num" = "1460",
"dynamic_partition.hot_partition_num" = "0",
"dynamic_partition.reserved_history_periods" = "NULL",
"storage_medium" = "hdd",
"storage_format" = "V2",
"inverted_index_storage_format" = "V2",
"enable_unique_key_merge_on_write" = "true",
"light_schema_change" = "true",
"disable_auto_compaction" = "false",
"enable_single_replica_compaction" = "false",
"group_commit_interval_ms" = "10000",
"group_commit_data_bytes" = "134217728",
"enable_mow_light_delete" = "false"
);
```

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

-- 【ods_unified_redeem_order】经营统计查抖音核销数据
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
select * from insurance_user_benefit_card where user_id in(2200020344) and created >= '2026-10-10';

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
| `selectdb_payment` | 5 | `dwd_payment_payment_record_trade`、`dwd_payment_refund_record_trade`、`ads_order_info_agg`、`ods_unified_redeem_order`、`ads_payment_equipment_record_di` |
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
| 56 | 洗水 | `cmember` | `promotion_activity_merchant` | `wash_activity_rule_equipment` | 查洗水商家维度商创活动 |

> 注：Excel 第 52 行的 `ds_unified_redeem_order` 为录入手误，实际表名是 `ods_unified_redeem_order`（抖音、美团核销数据同表，按 `channel` 字段区分），已按正确表名统一。