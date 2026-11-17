# 客服查询 SQL 与查询说明一致性核对报告

> **核对对象**：`生产环境客服问题常用数据库表copy.md`，共 87 条查询 SQL。
> **核对方式**：每条 SQL 独立派一个子 agent，对照 `tables/{库名}/{表名}.sql` 建表语句，核对**表名 / 列存在性 / 语义匹配**三项；首轮判定为「存疑」「不匹配」的条目再派独立复核 agent 二次确认，最后由人工对复核分歧逐条裁决。
> **核对结果**：87/87 条全部完成。经业务方最终裁决并修正 2 处列名后，**匹配 87 条，无遗留问题**。
> **说明**：核对报告面向 `copy.md`（含 DDL 与示例 SQL 的中间表文档）。原始数据来自 `生产环境客服问题常用数据库表收集.xlsx`，是测试同学为解决客服问题整理的常用查询表，其 SQL 为**泛用示例**，示例值仅作格式参考，不代表真实业务数据。
> **首轮 vs 复核**：首轮 agent 判定 匹配 72 / 存疑 10 / 不匹配 5；复核推翻 9 条误报，业务方最终裁决驳回剩余 6 条中的 4 条，实际需修正的仅 2 条列名问题（已修复）。

## 一、已修复的问题（2 条）

已按下述方式修正 `copy.md` 与 `生产环境客服问题常用数据库表.md` 中的示例 SQL。

| # | 库.表 | 原问题 | 处理结果 |
| --- | --- | --- | --- |
| **2** | `cmember.tiktok_activity_order` | SQL 用 `skuId`（驼峰），DDL 无此列，PG 会折叠成 `skuid` 导致报错 | ✅ 已改为 `sku_id`。该表为抖音活动订单表，可按 `sku_id` 或 `lyy_user_id` 查询；示例值与 `poi_id` 相同仅因测试随手取的参考值，无实际意义，不构成问题。 |
| **81** | `advert.insurance_user_benefit_card` | SQL 用 `lyy_user_id`，该表实际列为 `user_id` | ✅ 已改为 `user_id`。该表为权益用户卡记录表，按 `user_id` 查询权益记录正确。 |

## 二、经业务方裁决不成立的问题（4 条）

首轮/复核判定为存疑或不匹配，经业务方确认属于**核对规则的过度解读**，SQL 与说明均无需变更。

| # | 库.表 | 原判定 | 业务方裁决 |
| --- | --- | --- | --- |
| **51** | `selectdb_payment.ds_unified_redeem_order` | no-ddl、semantic-mismatch、table-name-mismatch | 不成立。`ds_unified_redeem_order` 系录入手误，实际表名为 `ods_unified_redeem_order`（已统一修正并补齐 DDL）。该表是 SelectDB 对多个实际数据库的聚合表，主要用于记录**团购核销记录**，抖音与美团核销数据同表存储，**按 `channel` 字段区分**。示例 SQL 无需再加区分条件。 |
| **54** | `cmember.wash_dimension_user_info` | questionable-field、semantic-mismatch | 不成立。`activity_info` 是**聚合字段**，内部记录了退款及投诉次数，语义与「查洗水商创活动退款、投诉记录」相符，SQL 无误。 |
| **79** | `master.lyy_payment` | questionable-field | 不成立。按 `ad_org_id` 查询提现情况是客服现有习惯用法，不需要变更。 |
| **85** | `cmember.massage_automatic_debit` | questionable-field、semantic-mismatch | 不成立。该 SQL 就是「领取福利记录」的常用查法，不需要变更。 |

## 三、逐条核对总表

> 三列取值：`ok` 通过、`bad` 不通过、`doubtful` 存疑、`unknown` 无建表语句无法核对。「复核」列：`—` 首轮即判定匹配未复核、`维持` 复核认同、`降级` 复核推翻后改判、`人工` 人工裁决。

| # | 业务分类 | 库.表 | 查询说明 | 表名 | 列 | 语义 | 首轮 | 复核 | 最终结论 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 商创 | `lyy_consumption.lyy_request_history` | 查询商家风控补贴明细 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 2 | 娱乐 | `cmember.tiktok_activity_order` | 查询抖音订单 | ok | bad→ok | ok | ❌ 不匹配 | 维持 | ✅ 匹配（已修正列名） |
| 3 | 娱乐 | `cmember.tiktok_activity_poi` | 查询抖音商户门店 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 4 | 娱乐 | `cmember.tiktok_activity_coupon` | 查询抖音商户授权 | ok | ok | doubtful | ⚠️ 存疑 | 降级 | ✅ 匹配 |
| 5 | 娱乐 | `master.lyy_media_ads_device` | 查询兑币机下发广告记录 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 6 | 娱乐 | `master.MEITUAN_STORE_APPLY` | 查询美团授权记录 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 7 | 娱乐 | `massage_chair.coins_saver_order` | 查询机器存币记录 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 8 | 多金宝 | `small_venue.t_merchant_card` | 多金宝查询某个会员卡号信息 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 9 | 充电桩 | `master.merchant_equipment` | 商家设备表 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 10 | 充电桩 | `master.agent_equipment` | 代理商设备表 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 11 | 充电桩 | `master.ad_org` | 查询商家ID | ok | ok | doubtful | ⚠️ 存疑 | 降级 | ✅ 匹配 |
| 12 | 充电桩 | `master.ad_org_attach` | 查询是否资金池商家 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 13 | 充电桩 | `master.equipment_charging_type` | 场地配置信息 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 14 | 充电桩 | `massage_chair.lyy_charging_order` | 充电业务订单 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 15 | 充电桩 | `massage_chair.lyy_charging_order_power` | 充电订单对应功率过程 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 16 | 充电桩 | `massage_chair.lyy_charging_equipment_port` | 设备端口 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 17 | 充电桩 | `massage_chair.lyy_ic_card` | IC卡表 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 18 | 充电桩 | `massage_chair.lyy_ic_card_flow` | IC卡流水记录 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 19 | 充电桩 | `advert.lyy_cdz_insurance_buy_card` | 保险周卡、保险月卡、V会员保险月卡、星会员保险月卡 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 20 | 充电桩 | `advert.lyy_cdz_insurance_order` | 投保订单记录 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 21 | 充电桩 | `advert.lyy_cdz_activity_black_list` | 用户、场地、商家黑名单 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 22 | 充电桩 | `advert.cdz_debit_order` | 星会员签约表 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 23 | 充电桩 | `advert.automatic_debit_order` | V会员签约表 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 24 | 充电桩 | `advert.lyy_cdz_member_card` | V会员、星会员卡表 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 25 | 充电桩 | `advert.lyy_cdz_insurance_equipment_order_detail` | 设备整桩投保记录 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 26 | 充电桩 | `advert.lyy_distributor_advertise_coupon` | 用户广告红包权益 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 27 | 充电桩 | `commercial_charges.system_charge_equipment_bill` | 收费规则 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 28 | 充电桩 | `commercial_charges.system_charge_equipment_bill_flow` | 收费流水 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 29 | 充电桩 | `commercial_charges.system_charge_equipment` | 收费设备 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 30 | 充电桩 | `commercial_charges.system_charge_config` | 收费配置 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 31 | 汽充桩 | `carcharging.infra_station` | 站点 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 32 | 汽充桩 | `carcharging.order_charge` | 订单 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 33 | 汽充桩 | `carcharging.family_equipment_vip` | 家充设备活动表 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 34 | 汽充桩 | `carcharging.member_user_info` | 用户表 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 35 | 中台 | `commercial_charges.merchant_product` | saas、ai经营分析账单 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 36 | 中台 | `commercial_charges.receipt_bill` | saas、ai经营分析收款账单 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 37 | 中台 | `commercial_charges.receipt_bill_detail` | 查询账单明细 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 38 | 中台 | `commercial_charges.receipt_bill_pay_trans` | 查询账单支付交易表 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 39 | 中台 | `commercial_charges.receipt_bill_pay_trans_detail` | 查询账单支付交易详情表 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 40 | 中台 | `commercial_charges.receipt_bill_refund_trans` | 账单退款表 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 41 | 中台 | `commercial_charges.receipt_bill_refund_trans_detail` | 账单退款明细表 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 42 | 中台 | `commercial_charges.merchant_message_config` | 经营快报 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 43 | 中台 | `user_member.um_account_record` | 会员流水 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 44 | 中台 | `user_member.um_account` | 总权益 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 45 | 中台 | `user_member.um_account_benefit` | 权益明细 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 46 | 中台 | `user_member.um_benefit_scope` | 权益范围 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 47 | 中台 | `user_member.um_benefit` | 权益类型 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 48 | 中台 | `selectdb_payment.dwd_payment_payment_record_trade` | 查询每个订单在移动端报表内实际增加和退款金额 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 49 | 中台 | `selectdb_payment.dwd_payment_refund_record_trade` | 查询退款交易 | ok | ok | ok | ⚠️ 存疑 | 降级 | ✅ 匹配 |
| 50 | 中台 | `selectdb_payment.ads_order_info_agg` | 查询订单信息 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 51 | 中台 | `selectdb_payment.ods_unified_redeem_order` | 经营统计查抖音核销数据 | ok | ok | ok | ❌ 不匹配 | 人工 | ✅ 匹配（手误表名已统一） |
| 52 | 中台 | `selectdb_payment.ods_unified_redeem_order` | 经营统计查美团核销数据 | ok | ok | doubtful | ⚠️ 存疑 | 降级 | ✅ 匹配 |
| 53 | 中台 | `selectdb_payment.ads_payment_equipment_record_di` | 经营统计每日的收入概览、启动概览、储值概览、每日经营趋势、收款金额趋势、 | ok | ok | ok | ⚠️ 存疑 | 降级 | ✅ 匹配 |
| 54 | 洗水 | `cmember.wash_dimension_user_info` | 查洗水商创活动退款、投诉记录 | ok | ok | ok | ❌ 不匹配 | 人工 | ✅ 匹配（activity_info 为聚合字段） |
| 55 | 洗水 | `cmember.promotion_activity_merchant` | 查洗水商家维度商创活动 | bad | ok | doubtful | ❌ 不匹配 | 降级 | ✅ 匹配 |
| 56 | 洗水 | `cmember.wash_product_order` | 查洗水商创产品 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 57 | 洗水 | `merchant.merchant_equipment_board` | 查设备属于XYJ还是XYJY | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 58 | 洗水 | `middle_stage.ticket` | 查工单 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 59 | 洗水 | `massage_chair.lyy_ic_card` | 查ic卡信息 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 60 | 洗水 | `massage_chair.lyy_ic_card_flow` | 查ic卡流水 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 61 | 洗水 | `massage_chair.ic_card_limit_config` | 查ic卡限额信息 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 62 | 洗水 | `lyy_infor.xiaole_user_points_record` | 查app用户积分记录 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 63 | 洗水 | `lyy_infor.xiaole_life_user` | 查app用户信息 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 64 | 洗水 | `lyy_infor.xiaole_life_user_relate` | 查app用户与lyy、ls系统用户关联关系 | ok | ok | doubtful | ⚠️ 存疑 | 降级 | ✅ 匹配 |
| 65 | 洗水 | `lyy_infor.xiaole_black_user` | 查不跳转app用户黑名单 | ok | ok | doubtful | ⚠️ 存疑 | 降级 | ✅ 匹配 |
| 66 | 洗水 | `lyy_infor.xiaole_user_no_app_request` | 查app不使用申请黑名单 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 67 | 洗水 | `order.order_info` | 查订单信息 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 68 | 洗水 | `order.refund_order_info` | 查订单退款信息 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 69 | 设备 | `equipment.device` | 查设备初始化 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 70 | 设备 | `equipment.iot_equipment` | 查设备信息 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 71 | 设备 | `equipment.iot_equipment_setting` | 查设备对应的协议 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 72 | 设备 | `equipment.iot_equipment_docking` | 查安卓设备信息 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 73 | 设备 | `master.lyy_equipment_private_key` | 查设备密钥 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 74 | 支付 | `master.payment_fee_deduction_equipment` | 查手续费外扣 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 75 | 支付 | `master.experience_merchant_list` | 查体验期 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 76 | 支付 | `master.lyy_merchant_info` | 查商户信息 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 77 | 支付 | `master.lyy_divide_merchant_info` | 查分账用户信息 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 78 | 支付 | `master.lyy_swiftpass_merchant_detail` | 查商家资料 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 79 | 支付 | `master.lyy_payment` | 查提现情况 | ok | ok | ok | ⚠️ 存疑 | 人工 | ✅ 匹配（业务方确认无需变更） |
| 80 | 支付 | `master.payment_info_config` | 查appid路由配置 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 81 | 按摩 | `advert.insurance_user_benefit_card` | 权益表 | ok | bad→ok | ok | ❌ 不匹配 | 维持 | ✅ 匹配（已修正列名） |
| 82 | 按摩 | `advert.insurance_order` | 权益订单表 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 83 | 按摩 | `advert.automatic_debit_order` | 代扣订单 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 84 | 按摩 | `advert.automatic_debit_receive_record` | 代扣记录 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 85 | 按摩 | `cmember.massage_automatic_debit` | 领取福利记录 | ok | ok | ok | ⚠️ 存疑 | 人工 | ✅ 匹配（业务方确认无需变更） |
| 86 | 按摩 | `cmember.jd_insurance_start_record` | 京东权益领取记录 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 87 | 按摩 | `cmember.promotion_activity_user` | （空） | ok | ok | unknown | ⚠️ 存疑 | 降级 | ✅ 匹配 |

## 四、逐条明细

### #2 `cmember.tiktok_activity_order` — ✅ 已修正

- **查询说明**：查询抖音订单
- **原文位置**：`生产环境客服问题常用数据库表copy.md` 第 67 行起
- **建表 SQL**：`tables/cmember/tiktok_activity_order.sql`

**问题**：SQL 的过滤条件写成 `skuId`（驼峰），而 DDL 中列名为 `sku_id`（character varying(40)，注释「商品sku_id」）。PostgreSQL 会将未加引号的标识符折叠为小写，`skuId` 被解析为 `skuid`，执行报 `column "skuid" does not exist`。

**修正**：`生产环境客服问题常用数据库表copy.md` 第 68 行、`生产环境客服问题常用数据库表.md` 第 243 行均已改为：

```sql
select * from tiktok_activity_order where sku_id='7284593202361796669'
```

**业务方说明**：该表是抖音活动订单表，记录抖音活动相关订单，可按 `sku_id` 查询，也可按 `lyy_user_id` 查询。示例值 `7284593202361796669` 与 `poi_id` 示例相同，只是测试随手取的参考值，**无实际业务意义**，不构成问题。

### #51 `selectdb_payment.ds_unified_redeem_order` — ✅ 已修正

- **查询说明**：经营统计查抖音核销数据
- **原文位置**：`生产环境客服问题常用数据库表copy.md` 第 384 行起

**原判定**：no-ddl、semantic-mismatch、table-name-mismatch

**业务方说明与处理**：

1. `ds_unified_redeem_order` 是**录入手误**，实际表名就是 `ods_unified_redeem_order`，两处指同一张表。全仓引用已统一改为 `ods_unified_redeem_order`，手误文件 `tables/selectdb_payment/ds_unified_redeem_order.sql` 已删除。
2. 建表语句**已补齐**：`tables/selectdb_payment/ods_unified_redeem_order.sql`，共 26 个字段，`distributor_id`、`day`、`channel` 均存在。
3. 该表是 SelectDB 侧对**多个实际数据库的聚合表**，主要用于记录**团购核销记录**。
4. 抖音与美团核销数据**同表存储**，按 `channel` 字段区分（`tiktok` / `meituan`）。因此示例 SQL 的 `FROM ods_unified_redeem_order` 本身正确，不需要拆成两张表。

**结论**：原判定的 table-name-mismatch 与 semantic-mismatch 均不成立，no-ddl 已消除。

### #54 `cmember.wash_dimension_user_info` — ✅ 匹配

- **查询说明**：查洗水商创活动退款、投诉记录
- **建表 SQL**：`tables/cmember/wash_dimension_user_info.sql`

**原判定**：questionable-field、semantic-mismatch

**业务方说明**：`activity_info` 是**聚合字段**，内部记录了退款及投诉次数。用它来承载「洗水商创活动退款、投诉记录」的查询语义是正确的，SQL 无须修改。

**结论**：semantic-mismatch 与 questionable-field 均不成立。

### #79 `master.lyy_payment` — ✅ 匹配

- **查询说明**：查提现情况
- **建表 SQL**：`tables/master/lyy_payment.sql`

**原判定**：questionable-field

**业务方说明**：按 `ad_org_id` 查询提现情况是客服的现有用法，**不需要变更**。

**结论**：questionable-field 不成立。

### #81 `advert.insurance_user_benefit_card` — ✅ 已修正

- **查询说明**：权益表
- **原文位置**：`生产环境客服问题常用数据库表copy.md` 第 596 行起
- **建表 SQL**：`tables/advert/insurance_user_benefit_card.sql`

**问题**：SQL 的 WHERE 条件使用 `lyy_user_id`，但本表 DDL 中没有这一列，实际列名为 `user_id`（numeric(11,0)，注释「用户ID」，且有索引 `idx_insurance_user_benefit_card_user_id`）。

**修正**：`生产环境客服问题常用数据库表copy.md` 第 1270 行、`生产环境客服问题常用数据库表.md` 第 5717 行均已改为：

```sql
select * from insurance_user_benefit_card where user_id in(2200020344) and created >= '2026-10-10';
```

**业务方说明**：该权益相关 SQL 本身没错，通过 `user_id` 查询权益记录是正确的业务用法。

### #85 `cmember.massage_automatic_debit` — ✅ 匹配

- **查询说明**：领取福利记录
- **建表 SQL**：`tables/cmember/massage_automatic_debit.sql`

**原判定**：questionable-field、semantic-mismatch

**业务方说明**：该 SQL 是查询领取福利记录的常用写法，**不需要变更**。

**结论**：semantic-mismatch 与 questionable-field 均不成立。

## 五、复核推翻的误报（附记录）

首轮判定有问题、经独立复核确认不成立，最终计为匹配。列出以便追溯，也说明这些点容易被误判。

| # | 库.表 | 首轮误判 | 复核推翻理由 |
| --- | --- | --- | --- |
| 4 | `cmember.tiktok_activity_coupon` | ⚠️ 存疑 | tiktok_activity_coupon 就是「商户门店 POI → 抖音套餐 SKU → 发放权益（coins）」的授权/映射配置，用 poi_id + sku_id + isactive='Y' 查单条有效授权是该表最自然的写法，语义成立；status 是 poi 投放状态（0 投放中/1 已终止）而非授权状态，说明未要求查「投放中」，不补 status=0 不算缺陷；其证据行号（status 第17行、注释第49行）也与实际  |
| 11 | `master.ad_org` | ⚠️ 存疑 | 说明仅为「查询商家ID」，未限定按手机号过滤；ad_org 正是商家/组织主表，value 是唯一的商家账号/编号（experience_merchant_list.ad_org_value 注释为「运营商账号」），客服按账号查询并用 select * 取 ad_org_id 完全能达成目的，故「应改用 telephone」的推断不成立。 |
| 49 | `selectdb_payment.dwd_payment_refund_record_trade` | ⚠️ 存疑 | SQL 查的正是文档声明的 dwd_payment_refund_record_trade（SELECT * 并按分区 ds 及 distributor_id/e_code 过滤），与「查询退款交易」说明一致，表名与语义均无问题；无建表语句并非该 SQL 的缺陷，而是文档第 355 行已明确声明的既知限制（同库 6 张表全部如此），据此判 suspect 属误报。 |
| 52 | `selectdb_payment.ods_unified_redeem_order` | ⚠️ 存疑 | 原结论不成立——第 52 条 SQL 的 FROM 表 ods_unified_redeem_order 与文档声明的表名完全一致，查该表即查美团核销数据。「缺少平台字段」的质疑不成立，因为抖音与美团核销数据同表存储、按 `channel` 字段区分（DDL 已补齐，`channel` 字段存在）。 |
| 53 | `selectdb_payment.ads_payment_equipment_record_di` | ⚠️ 存疑 | 表名、过滤维度与查询说明均一致，建表语句缺失是该文档已明确披露的收集缺口（第 355 行及 tables/INDEX.md「未收集到建表语句」章节），属于覆盖度限制而非 SQL 与说明不匹配，不构成问题。 |
| 55 | `cmember.promotion_activity_merchant` | ❌ 不匹配 | 文档第 402 行已明确注解「wash_activity_rule_equipment（Excel 表名列写作 promotion_activity_merchant）」，SQL 的 FROM 与该记录指定的 DDL 文件 wash_activity_rule_equipment.sql 完全一致，标签【promotion_activity_merchant】只是源 Excel 列名转录错误的沿袭；SQL 用到的 12 个列在 DDL  |
| 64 | `lyy_infor.xiaole_life_user_relate` | ⚠️ 存疑 | 表名 xiaole_life_user_relate 与 DDL 及记录声明一致，SQL 用到的 platform_user_id、subject_platform、create_time 三列在 tables/lyy_infor/xiaole_life_user_relate.sql 第 15/8/17 行均存在；platform_user_id 的列注释本身即「关联的乐摇摇体系下的用户Id」（第 35 行），按它过滤并叠加 subj |
| 65 | `lyy_infor.xiaole_black_user` | ⚠️ 存疑 | 表名与 black_type 列均与 DDL 一致，按 black_type 过滤正是「查某一类黑名单」场景的唯一可用字段；DDL 注释未列枚举值属注释缺失而非字段用错，且说明未提「有效/未删除」，不过滤 deleted 与文档同类查询写法一致，两条 issue 均不成立。 |
| 87 | `cmember.promotion_activity_user` | ⚠️ 存疑 | 该条记录确实没有单独写「使用场景」（文档表格第 615 行与 DDL 第 4 行均为「—」，SQL 上方第 624 行注释只写表名），但「无说明」并不构成 SQL 与说明不匹配的缺陷；SQL 表名、列名全部与 DDL 一致，仅按 lyy_user_id + lyy_distributor_id + created 查询某用户在某商户下的活动记录，与表注释「用户活动领取记录表」及字段语义（用户ID/商户ID/记录创建时间）相符，属于合理的 |

## 六、核查方法与局限

1. 核对完全基于文档与 `tables/` 下的建表语句**静态比对**，未连接数据库、未执行任何 SQL；结论反映的是「SQL 与文档/DDL 是否自洽」，不代表生产数据的实际情况。
2. 核对时 `selectdb_payment` 库 6 张表**均无建表语句**，列存在性只能标 `unknown`。该缺口现已补齐（5 张表 DDL 已录入，`ds_unified_redeem_order` 为 `ods_unified_redeem_order` 的手误，已合并）。
3. 文档原已标注的 2 处表名不一致（#51 `ds_unified_redeem_order`、#55 `promotion_activity_merchant`）：#51 确认为录入手误，已统一为 `ods_unified_redeem_order`；#55 经复核确认属 Excel 列名转录错误，SQL 本身正确。
4. 最终经业务方裁决，**87 条 SQL 全部匹配**。其中 2 条修正了列名（#2 `skuId`→`sku_id`、#81 `lyy_user_id`→`user_id`），其余 4 条原判定的问题均属核对规则过度解读，SQL 与说明无需变更。
5. 原始数据 `生产环境客服问题常用数据库表收集.xlsx` 是测试同学为解决客服问题整理的常用查询表，其 SQL 为**泛用示例**，示例值仅作格式参考，不代表真实业务数据；判断语义是否匹配时应以此为前提。
