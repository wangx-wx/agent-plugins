# 客服查询 SQL 与查询说明一致性核对报告

> **核对对象**：`生产环境客服问题常用数据库表copy.md`，共 87 条查询 SQL。
> **核对方式**：每条 SQL 独立派一个子 agent，对照 `tables/{库名}/{表名}.sql` 建表语句，核对**表名 / 列存在性 / 语义匹配**三项；首轮判定为「存疑」「不匹配」的条目再派独立复核 agent 二次确认，最后由人工对复核分歧逐条裁决。
> **核对结果**：87/87 条全部完成，**匹配 81 条、存疑 2 条、不匹配 4 条**。
> **首轮 vs 复核**：首轮 agent 判定 匹配 72 / 存疑 10 / 不匹配 5；复核推翻 9 条误报后，问题数由 15 条收敛到 6 条。

## 一、必须修的问题（不匹配）

按现状执行会报错或结果与说明不符。

| # | 库.表 | 问题类型 | 结论与修法 |
| --- | --- | --- | --- |
| **2** | `cmember.tiktok_activity_order` | missing-column、questionable-field | 修改 copy.md 第 68 行 SQL 为：select * from tiktok_activity_order where sku_id='<实际商品sku_id>'；示例值建议改成与 coupon 示例一致的 sku_id（如 '1838044671248384'），避免与 poi_id 示例混用造成误查。 |
| **51** | `selectdb_payment.ds_unified_redeem_order` | no-ddl、semantic-mismatch、table-name-mismatch | 修改 SQL（推荐）：将第385行改为 select * from ds_unified_redeem_order where distributor_id ='1073579' and `day` ='2026-07-16'。若实际业务就是要查美团数据，则改记录和文档表格中的表名为 ods_unified_redeem_order、说明改为「查美团核销数据」，但需与抖音那一条区分。补采两表 DDL 以便校验 distributor_id、day 列。 |
| **54** | `cmember.wash_dimension_user_info` | questionable-field、semantic-mismatch | 建议改说明或补 SQL：若场景确实要查退款记录，应改用 wash_product_order（status=2 已退款，配合 refund_time/refund_amount），说明改为「查洗水商创产品退款订单」；若要保留 wash_dimension_user_info，则说明应改为「查洗水商家参与商创活动的维度信息（activity_info）」，并补充 activity_info 中需要关注的 jsonb key 及查询条件，不要再用笼统的 select *。 |
| **81** | `advert.insurance_user_benefit_card` | missing-column、questionable-field、semantic-mismatch | 把示例 SQL 改为 select * from insurance_user_benefit_card where user_id in (2200020344) and created >= '2026-10-10'；如只关心权益卡，可追加 and product_type = 2 and deleted = 0。建议顺带检查第 600 行 insurance_order 的示例（该表确有 lyy_user_id，无需改）。 |

## 二、建议关注的问题（存疑）

表名和列名都能对上，但字段选择、过滤条件或表语义与查询说明存在疑问。

| # | 库.表 | 问题类型 | 建议 |
| --- | --- | --- | --- |
| **79** | `master.lyy_payment` | questionable-field | 建议把 SQL 改为按提现商家过滤：where payto_org_id = 1036475 order by created desc，并同时加 status 条件（Apply/Finished/Refuse）以便「查提现情况」时区分结果；若客服实际习惯按 ad_org_id 查询（历史数据仍以该字段填充），则应在查询说明中注明「按废弃组织字段查询，仅作兜底」，并优先验证 payto_org_id 数据是否正确。 |
| **85** | `cmember.massage_automatic_debit` | questionable-field、semantic-mismatch | 建议改 SQL（而非改说明）：补上业务过滤，例如 `select * from massage_automatic_debit where user_id = 2200012720 and created >= '2026-3-3' and deleted = false and product_type = 1 and promotion_activity_id is not null order by created desc;`，若福利确实以活动/奖励形式发放，则用 promotion_activity_id 或 reward_config 限定；若客服实际只想查「用户签约/代扣情况」，则应把说明改为「按摩自动扣费（签约）记录」，避免口径误解。 |

## 三、逐条核对总表

> 三列取值：`ok` 通过、`bad` 不通过、`doubtful` 存疑、`unknown` 无建表语句无法核对。「复核」列：`—` 首轮即判定匹配未复核、`维持` 复核认同、`降级` 复核推翻后改判、`人工` 人工裁决。

| # | 业务分类 | 库.表 | 查询说明 | 表名 | 列 | 语义 | 首轮 | 复核 | 最终结论 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 商创 | `lyy_consumption.lyy_request_history` | 查询商家风控补贴明细 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 2 | 娱乐 | `cmember.tiktok_activity_order` | 查询抖音订单 | ok | bad | ok | ❌ 不匹配 | 维持 | ❌ 不匹配 |
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
| 48 | 中台 | `selectdb_payment.dwd_payment_payment_record_trade` | 查询每个订单在移动端报表内实际增加和退款金额 | ok | unknown | ok | ✅ 匹配 | — | ✅ 匹配 |
| 49 | 中台 | `selectdb_payment.dwd_payment_refund_record_trade` | 查询退款交易 | ok | unknown | ok | ⚠️ 存疑 | 降级 | ✅ 匹配 |
| 50 | 中台 | `selectdb_payment.ads_order_info_agg` | 查询订单信息 | ok | unknown | ok | ✅ 匹配 | — | ✅ 匹配 |
| 51 | 中台 | `selectdb_payment.ds_unified_redeem_order` | 经营统计查抖音核销数据 | bad | unknown | bad | ❌ 不匹配 | 维持 | ❌ 不匹配 |
| 52 | 中台 | `selectdb_payment.ods_unified_redeem_order` | 经营统计查美团核销数据 | ok | unknown | doubtful | ⚠️ 存疑 | 降级 | ✅ 匹配 |
| 53 | 中台 | `selectdb_payment.ads_payment_equipment_record_di` | 经营统计每日的收入概览、启动概览、储值概览、每日经营趋势、收款金额趋势、 | ok | unknown | ok | ⚠️ 存疑 | 降级 | ✅ 匹配 |
| 54 | 洗水 | `cmember.wash_dimension_user_info` | 查洗水商创活动退款、投诉记录 | ok | ok | bad | ❌ 不匹配 | 维持 | ❌ 不匹配 |
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
| 79 | 支付 | `master.lyy_payment` | 查提现情况 | ok | ok | doubtful | ⚠️ 存疑 | 维持 | ⚠️ 存疑 |
| 80 | 支付 | `master.payment_info_config` | 查appid路由配置 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 81 | 按摩 | `advert.insurance_user_benefit_card` | 权益表 | ok | bad | doubtful | ❌ 不匹配 | 维持 | ❌ 不匹配 |
| 82 | 按摩 | `advert.insurance_order` | 权益订单表 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 83 | 按摩 | `advert.automatic_debit_order` | 代扣订单 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 84 | 按摩 | `advert.automatic_debit_receive_record` | 代扣记录 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 85 | 按摩 | `cmember.massage_automatic_debit` | 领取福利记录 | ok | ok | doubtful | ⚠️ 存疑 | 人工 | ⚠️ 存疑 |
| 86 | 按摩 | `cmember.jd_insurance_start_record` | 京东权益领取记录 | ok | ok | ok | ✅ 匹配 | — | ✅ 匹配 |
| 87 | 按摩 | `cmember.promotion_activity_user` | （空） | ok | ok | unknown | ⚠️ 存疑 | 降级 | ✅ 匹配 |

## 四、问题明细

### #2 `cmember.tiktok_activity_order` — ❌ 不匹配

- **查询说明**：查询抖音订单
- **原文位置**：`生产环境客服问题常用数据库表copy.md` 第 67 行起
- **建表 SQL**：`tables/cmember/tiktok_activity_order.sql`

**结论**：复核确认：表名与语义（按商品 sku 查抖音订单）匹配，但 SQL 中的 skuId 在 DDL 中确实不存在，正确列名应为 sku_id，属列名错误，原核对员的 missing-column 结论成立；其第二条「示例值疑似复制」成立为可疑但不可证实，仅作低置信度提示。

**问题清单**：

- `missing-column` — SQL 的过滤条件使用 skuId（驼峰），但该表 DDL 中并无此列；实际列名为 sku_id（character varying(40)，注释「商品sku_id」）。PostgreSQL 对未加双引号的标识符会折叠为小写，skuId 会被解析为 skuid，执行会报 column "skuid" does not exist。
  - 依据：SQL: where skuId='7284593202361796669'；DDL 第 21 行 sku_id character varying(40)，第 39 行 COMMENT '商品sku_id'，全表无 skuId/skuid 列
- `questionable-field` — 示例值 '7284593202361796669' 与同文档中 tiktok_activity_poi 的 poi_id、tiktok_activity_coupon 的示例值完全相同，疑似从门店示例复制而来。若实际传入的是 poi_id 而非 sku_id，即便把列名改成 sku_id 也查不到订单。
  - 依据：原文第 70-77 行三处示例均使用 7284593202361796669（分别作为 skuId、poi_id、poi_id）
- `missing-column` — SQL 的 WHERE 条件使用 skuId（驼峰），而 tiktok_activity_order 的 DDL 中没有该列，实际列名为 sku_id（character varying(40)，注释「商品sku_id」）。PostgreSQL 对未加双引号的标识符会折叠为小写，skuId 将被解析为 skuid，执行时会报 column "skuid" does not exist，查询无法运行。
  - 依据：copy.md 第 68 行：select * from tiktok_activity_order where skuId='7284593202361796669'；tables/cmember/tiktok_activity_order.sql 第 21 行 sku_id character varying(40)、第 39 行 COMMENT '商品sku_id'；全文件无 skuId/skuid 列
- `questionable-field` — 示例过滤值 '7284593202361796669' 与同文档 tiktok_activity_poi 的 poi_id、tiktok_activity_coupon 的 poi_id 示例完全相同，疑似由门店示例复制而来。同一文档里 coupon 的 sku_id 示例却是 '1838044671248384'。若实际误把 poi_id 当作 sku_id 查询，即使改成 sku_id 列名也可能查不到订单。此项仅为文本层面的可疑点，无数据可佐证，属低置信度提示。
  - 依据：copy.md 第 68 行 skuId='7284593202361796669'、第 71 行 poi_id='7284593202361796669'、第 74 行 poi_id='7284593202361796669' 且 sku_id='1838044671248384'

**建议**：修改 copy.md 第 68 行 SQL 为：select * from tiktok_activity_order where sku_id='<实际商品sku_id>'；示例值建议改成与 coupon 示例一致的 sku_id（如 '1838044671248384'），避免与 poi_id 示例混用造成误查。

### #51 `selectdb_payment.ds_unified_redeem_order` — ❌ 不匹配

- **查询说明**：经营统计查抖音核销数据
- **原文位置**：`生产环境客服问题常用数据库表copy.md` 第 384 行起
- **建表 SQL**：`tables/selectdb_payment/ds_unified_redeem_order.sql`（**无建表语句**，仅占位注释）

**结论**：复核确认：原核对员结论成立。第 51 条记录声明表为抖音核销表 ds_unified_redeem_order，SQL 却 FROM 美团核销表 ods_unified_redeem_order，属复制粘贴串表；两表均无 DDL，列无法核对。

**问题清单**：

- `table-name-mismatch` — 记录与文档表格声明的表是 ds_unified_redeem_order（抖音核销），示例 SQL 的 FROM 却是 ods_unified_redeem_order（文档中该表对应美团核销）。表名不一致。
  - 依据：原文第 384 行注释【ds_unified_redeem_order】经营统计查抖音核销数据；第 385 行 SQL：select * from ods_unified_redeem_order ...；文档第 351-352 行分别声明 ds_unified_redeem_order=抖音、ods_unified_redeem_order=美团
- `semantic-mismatch` — 查询说明要求查抖音核销数据，但 SQL 查询的是美团核销对应的 ods_unified_redeem_order 表，渠道业务对象与说明不符。且第 385 行与紧邻的第 387-388 行「ods_unified_redeem_order 查美团核销数据」几乎完全相同（仅 day 值不同），疑为复制粘贴串行。
  - 依据：ods_unified_redeem_order.sql 头部注释：使用场景：经营统计查美团核销数据；第 388 行 select * from ods_unified_redeem_order ... `day`='2026-07-17'
- `no-ddl` — ds_unified_redeem_order 与 ods_unified_redeem_order 的建表 SQL 均只有占位注释「未收集到建表语句」，无法核对 distributor_id、day 等列是否存在。
  - 依据：tables/selectdb_payment/ds_unified_redeem_order.sql:6 与 ods_unified_redeem_order.sql:6 均为「-- 未收集到建表语句」；文档第 355 行也标注未收集
- `table-name-mismatch` — 记录/文档声明的表是 ds_unified_redeem_order，示例 SQL 的 FROM 却是 ods_unified_redeem_order，表名不一致。
  - 依据：rec-051.md 声明表名 ds_unified_redeem_order；copy.md 第384行注释【ds_unified_redeem_order】，第385行 SQL：select * from ods_unified_redeem_order ...；同文件第349-352行表格声明 ds_unified_redeem_order=抖音核销、ods_unified_redeem_order=美团核销
- `semantic-mismatch` — 查询说明要求「经营统计查抖音核销数据」，但 SQL 查的是文档中标注为美团核销的 ods_unified_redeem_order，渠道业务对象与说明不符；且与紧邻的美团核销示例（仅 day 值不同）几乎完全相同，明显是复制粘贴后未改表名。
  - 依据：ods_unified_redeem_order.sql 第4行「业务分类：中台 使用场景：经营统计查美团核销数据」；copy.md 第387-388行【ods_unified_redeem_order】... `day`='2026-07-17'，与第385行仅日期不同
- `no-ddl` — ds_unified_redeem_order 与 ods_unified_redeem_order 均无建表语句，distributor_id、`day` 两列是否存在无法静态核对，故 columns=unknown。
  - 依据：tables/selectdb_payment/ds_unified_redeem_order.sql:6 与 ods_unified_redeem_order.sql:6 均为「-- 未收集到建表语句」；copy.md 第355行也标注未收集

**建议**：修改 SQL（推荐）：将第385行改为 select * from ds_unified_redeem_order where distributor_id ='1073579' and `day` ='2026-07-16'。若实际业务就是要查美团数据，则改记录和文档表格中的表名为 ods_unified_redeem_order、说明改为「查美团核销数据」，但需与抖音那一条区分。补采两表 DDL 以便校验 distributor_id、day 列。

### #54 `cmember.wash_dimension_user_info` — ❌ 不匹配

- **查询说明**：查洗水商创活动退款、投诉记录
- **原文位置**：`生产环境客服问题常用数据库表copy.md` 第 406 行起
- **建表 SQL**：`tables/cmember/wash_dimension_user_info.sql`

**结论**：复核确认原结论成立：表名与列核对无问题，但说明声称查退款/投诉记录，而该表仅是商家维度的活动信息表，无任何退款或投诉字段，示例 SQL 也未做任何过滤或 jsonb 解析，语义确实不匹配。

**问题清单**：

- `semantic-mismatch` — 查询说明称该 SQL 用于「查洗水商创活动退款、投诉记录」，但 wash_dimension_user_info 是洗水用户维度信息表，仅记录 user_id(商家ID) 与 activity_info(jsonb)，全表没有任何退款或投诉相关字段（无退款状态、退款金额、退款时间、投诉单号等），无法实现说明描述的业务目的。
  - 依据：tables/cmember/wash_dimension_user_info.sql 第 6-19 行字段仅 id/user_id/activity_info/created_time/updated_time/deleted/created_by/updated_by；COMMENT ON TABLE 为「洗水用户维度信息表」；退款字段实际在 tables/cmember/wash_product_order.sql 第 19-20 行 refund_time、refund_amount，第 30 行 status 注释「2 已退款」
- `questionable-field` — 即使退一步用 activity_info(jsonb) 承载退款/投诉信息，说明也未指明需从 jsonb 中取哪些 key，示例 SQL 也未做任何过滤或解析，与「查询说明」之间缺少可验证的对应关系。
  - 依据：wash_dimension_user_info.activity_info 注释为「活动相关信息」；示例 SQL 无 WHERE / jsonb 取值表达式
- `semantic-mismatch` — 查询说明为「查洗水商创活动退款、投诉记录」，但 wash_dimension_user_info 是「洗水用户维度信息表」，字段只有 id/user_id(商家ID)/activity_info(活动相关信息)/创建更新时间/deleted/创建更新人，全表没有任何退款或投诉字段（无退款状态、退款金额、退款时间、投诉单号、投诉标记），无法独立实现说明描述的业务目的。示例 SQL 只是 select * 全表导出，也没有任何过滤或 jsonb 取值。
  - 依据：tables/cmember/wash_dimension_user_info.sql 第 6-15 行仅 8 个字段；第 18 行 activity_info 注释「活动相关信息」；第 24 行表注释「洗水用户维度信息表」。退款字段实际在 tables/cmember/wash_product_order.sql 第 19 行 refund_time、第 20 行 refund_amount，第 24 行 status 注释「1 已支付 2 已退款」
- `questionable-field` — 即便退一步认为 activity_info(jsonb) 中承载退款/投诉信息，说明也未指明需要取哪些 key，示例 SQL 未做任何 jsonb 解析或过滤，无法验证 SQL 与说明的对应关系。
  - 依据：wash_dimension_user_info.activity_info 注释仅「活动相关信息」；文档第 406-407 行为 select * from wash_dimension_user_info，无 WHERE、无 jsonb 取值表达式

**建议**：建议改说明或补 SQL：若场景确实要查退款记录，应改用 wash_product_order（status=2 已退款，配合 refund_time/refund_amount），说明改为「查洗水商创产品退款订单」；若要保留 wash_dimension_user_info，则说明应改为「查洗水商家参与商创活动的维度信息（activity_info）」，并补充 activity_info 中需要关注的 jsonb key 及查询条件，不要再用笼统的 select *。

### #79 `master.lyy_payment` — ⚠️ 存疑

- **查询说明**：查提现情况
- **原文位置**：`生产环境客服问题常用数据库表copy.md` 第 574 行起
- **建表 SQL**：`tables/master/lyy_payment.sql`

**结论**：复核确认：表名与列名均正确，但 SQL 按已废弃的 ad_org_id 过滤提现记录，而表内标识提现商家的字段是 payto_org_id，语义存疑，原结论成立。

**问题清单**：

- `questionable-field` — 查询说明「查提现情况」要求按商家维度查提现记录，但 SQL 用 ad_org_id 过滤。DDL 中 ad_org_id 的注释为「废弃」，而真正标识提现商家的是 payto_org_id（注释「提现商家」），且表上专门建了 (payto_org_id, status) 联合索引而不是 ad_org_id 索引。按废弃字段过滤很可能查不到数据或命中错误的组织维度。
  - 依据：DDL 第 16 行 ad_org_id numeric(10,0)；第 67 行 COMMENT ad_org_id is '废弃'；第 8 行 payto_org_id；第 59 行 COMMENT payto_org_id is '提现商家'；第 103 行 lyy_payment_payto_org_status_idx ON (payto_org_id, status)；SQL 为 where ad_org_id in (1036475)
- `questionable-field` — 查询说明「查提现情况」按商家维度过滤提现记录，但 SQL 用 ad_org_id 过滤。该字段在 lyy_payment 的 DDL 中注释为「废弃」，而表注释为「提现记录表」、真正标识提现商家的是 payto_org_id（注释「提现商家」，外键指向 ad_org，且有 (payto_org_id, status) 联合索引）。按已废弃字段过滤，可能查不到数据或命中错误的组织维度。
  - 依据：tables/master/lyy_payment.sql:16 ad_org_id numeric(10,0)；:67 COMMENT ad_org_id is '废弃'；:8 payto_org_id numeric(10,0)；:59 COMMENT payto_org_id is '提现商家'；:101 COMMENT ON TABLE is '提现记录表'；:103 lyy_payment_payto_org_status_idx ON (payto_org_id, status)；SQL 为 where ad_org_id in (1036475)，无 payto_org_id 条件

**建议**：建议把 SQL 改为按提现商家过滤：where payto_org_id = 1036475 order by created desc，并同时加 status 条件（Apply/Finished/Refuse）以便「查提现情况」时区分结果；若客服实际习惯按 ad_org_id 查询（历史数据仍以该字段填充），则应在查询说明中注明「按废弃组织字段查询，仅作兜底」，并优先验证 payto_org_id 数据是否正确。

### #81 `advert.insurance_user_benefit_card` — ❌ 不匹配

- **查询说明**：权益表
- **原文位置**：`生产环境客服问题常用数据库表copy.md` 第 596 行起
- **建表 SQL**：`tables/advert/insurance_user_benefit_card.sql`

**结论**：复核成立：表名与 created 字段无误，但 WHERE 中的 lyy_user_id 在本表不存在（应为 user_id），SQL 无法执行，判定 mismatch。

**问题清单**：

- `missing-column` — SQL 的 WHERE 条件使用了 lyy_user_id，但本表 DDL 中没有这一列。该表只有 user_id 表示用户 ID（DDL 第 13 行，注释『用户ID』在第 44 行）。lyy_user_id 是 advert 库其他表（如 insurance_order、lyy_cdz_insurance_buy_card）的字段，疑似从旁边那条 insurance_order 的查询直接复制过来。
  - 依据：SQL: where lyy_user_id in(2200020344)；DDL 第 13 行 user_id numeric(11,0)，全表无 lyy_user_id
- `semantic-mismatch` — 查询说明为『权益表』，目的是按用户+时间查该用户的权益卡记录，但用户过滤字段用错了名字，实际会报列不存在错误，无法实现查询目的。
  - 依据：生产环境客服问题常用数据库表copy.md 第 596-597 行；DDL 第 44 行 COMMENT user_id is '用户ID'
- `questionable-field` — 表有软删除字段 deleted（DDL 第 27 行，默认 0），查询未加 deleted = 0 过滤，客服排查时可能带出已删除数据；同时未限制 product_type（第 30 行，2=权益卡）或 use_status，若本表混存保障/附带商品记录，结果会不纯。属于可改进项，不算硬错误。
  - 依据：DDL 第 27 行 deleted smallint NOT NULL DEFAULT 0；第 30 行 product_type 注释『1=保障 2=权益卡 3=附带商品』
- `missing-column` — SQL 的 WHERE 条件使用 lyy_user_id，但 insurance_user_benefit_card 的 DDL 中不存在该列。该表只有 user_id（DDL 第 13 行 user_id numeric(11,0) NOT NULL，第 44 行注释『用户ID』）。lyy_user_id 属于同库其他表（insurance_order 第 15 行、lyy_cdz_insurance_buy_card 第 8 行、lyy_distributor_advertise_coupon 第 8 行），本条查询紧邻 insurance_order 的示例，明显是复制时未改字段名。执行会报 column does not exist。
  - 依据：SQL: where lyy_user_id in(2200020344)；tables/advert/insurance_user_benefit_card.sql 第 13 行仅 user_id numeric(11,0)，第 44 行 COMMENT ... user_id is '用户ID'，全表无 lyy_user_id；对比 tables/advert/insurance_order.sql 第 15 行 lyy_user_id numeric(11,0)
- `semantic-mismatch` — 查询说明为『权益表』，意图是按用户+创建时间查该用户的权益卡记录；用户过滤字段名写错导致 SQL 无法执行，谈不上达成查询目的。修正后语义可成立（本表即权益用户卡记录表，有 user_id 索引 idx_insurance_user_benefit_card_user_id）。
  - 依据：生产环境客服问题常用数据库表copy.md 第 596-597 行；DDL 第 68 行 COMMENT ON TABLE ... is '权益用户卡记录表'，第 76 行 idx_insurance_user_benefit_card_user_id 基于 user_id
- `questionable-field` — 表有软删除字段 deleted（DDL 第 27 行，NOT NULL DEFAULT 0），查询未加 deleted = 0；且 product_type 注释为『1=保障 2=权益卡 3=附带商品』（第 67 行），本表混存保障/附带商品记录，未限定 product_type = 2 或 use_status，客服排查时可能带出已删除或非权益卡数据。属可改进项，不是硬错误。
  - 依据：DDL 第 27 行 deleted smallint NOT NULL DEFAULT 0；第 36 行 product_type smallint；第 67 行 product_type 注释『1=保障 2=权益卡 3=附带商品』；第 32 行 use_status

**建议**：把示例 SQL 改为 select * from insurance_user_benefit_card where user_id in (2200020344) and created >= '2026-10-10'；如只关心权益卡，可追加 and product_type = 2 and deleted = 0。建议顺带检查第 600 行 insurance_order 的示例（该表确有 lyy_user_id，无需改）。

### #85 `cmember.massage_automatic_debit` — ⚠️ 存疑

- **查询说明**：领取福利记录
- **原文位置**：`生产环境客服问题常用数据库表copy.md` 第 618 行起
- **建表 SQL**：`tables/cmember/massage_automatic_debit.sql`

**结论**：表名与列名均与 DDL 一致，但该表是按摩自动扣费/签约流水，SQL 只按 user_id + created 过滤，缺少能标识「领取福利」的字段条件（product_type/promotion_activity_id/reward_config），语义只能勉强对应。

> **人工裁决**：复核以「DDL 第 4 行标注使用场景=领取福利记录」为由推翻，但该行是文档文件头的元数据注释（`-- 使用场景：...`），并非数据库表注释；本表无 COMMENT ON TABLE。表中实际字段为签约代扣流水（debit_amount / debit_time / cancel_time / refund_status / promotion_activity_id），说明文字与文档同源，属循环论证，维持存疑。

**问题清单**：

- `semantic-mismatch` — 查询说明是「领取福利记录」，但从表结构看 massage_automatic_debit 是按摩自动扣费/签约流水（含 order_no/debit_amount/debit_time/cancel_time/status 扣款状态字段），SQL 未加任何能区分「福利领取」的过滤条件（如 product_type=1 超级VIP、promotion_activity_id、reward_config、status），查出来的是该用户全部代扣/签约流水，混入扣费成功/失败、解约等记录，与「领取福利」不是同一业务语义。注意：该表在 DDL 中**没有 COMMENT ON TABLE**，无法用数据库表注释直接佐证业务归属，此判断依据是字段构成。
  - 依据：SQL: select * from massage_automatic_debit where created >= '2026-3-3' and user_id = 2200012720; 字段注释 line 54: debit_amount='扣费金额'、line 50 product_type='产品类型：1=超级VIP'、line 61 promotion_activity_id='活动ID'、line 64 reward_config='奖励配置'；表无 COMMENT ON TABLE
- `questionable-field` — 未过滤软删除标记 deleted，把 deleted=true 的记录也当福利领取记录返回；同时未限定 user_id 所属渠道（该列为「乐摇摇支付宝用户id」），若客服手上是微信/签约用户 ID 需用 wechat_user_id 或 sign_user_id，否则可能查不到或查错人。
  - 依据：DDL line 32: deleted boolean NOT NULL DEFAULT false；line 44: user_id is '乐摇摇支付宝用户id'；line 45 wechat_user_id、line 68 sign_user_id 均存在

**建议**：建议改 SQL（而非改说明）：补上业务过滤，例如 `select * from massage_automatic_debit where user_id = 2200012720 and created >= '2026-3-3' and deleted = false and product_type = 1 and promotion_activity_id is not null order by created desc;`，若福利确实以活动/奖励形式发放，则用 promotion_activity_id 或 reward_config 限定；若客服实际只想查「用户签约/代扣情况」，则应把说明改为「按摩自动扣费（签约）记录」，避免口径误解。

**复核意见（未被采纳）**：复核推翻：DDL 第 4 行本身就标注「使用场景：领取福利记录」，表名与文档声明、DDL 文件名完全一致，user_id / created 两列均存在；该表即「活动领福利（签约代扣）」业务表，promotion_activity_id / reward_config 只是记录维度而非必需的过滤条件，按 user_id + created 取该用户全部领取流水在客服排查场景下是成立的，不存在「说明查 A、SQL 查 B」的语义错位。

## 五、复核推翻的误报（附记录）

首轮判定有问题、经独立复核确认不成立，最终计为匹配。列出以便追溯，也说明这些点容易被误判。

| # | 库.表 | 首轮误判 | 复核推翻理由 |
| --- | --- | --- | --- |
| 4 | `cmember.tiktok_activity_coupon` | ⚠️ 存疑 | tiktok_activity_coupon 就是「商户门店 POI → 抖音套餐 SKU → 发放权益（coins）」的授权/映射配置，用 poi_id + sku_id + isactive='Y' 查单条有效授权是该表最自然的写法，语义成立；status 是 poi 投放状态（0 投放中/1 已终止）而非授权状态，说明未要求查「投放中」，不补 status=0 不算缺陷；其证据行号（status 第17行、注释第49行）也与实际  |
| 11 | `master.ad_org` | ⚠️ 存疑 | 说明仅为「查询商家ID」，未限定按手机号过滤；ad_org 正是商家/组织主表，value 是唯一的商家账号/编号（experience_merchant_list.ad_org_value 注释为「运营商账号」），客服按账号查询并用 select * 取 ad_org_id 完全能达成目的，故「应改用 telephone」的推断不成立。 |
| 49 | `selectdb_payment.dwd_payment_refund_record_trade` | ⚠️ 存疑 | SQL 查的正是文档声明的 dwd_payment_refund_record_trade（SELECT * 并按分区 ds 及 distributor_id/e_code 过滤），与「查询退款交易」说明一致，表名与语义均无问题；无建表语句并非该 SQL 的缺陷，而是文档第 355 行已明确声明的既知限制（同库 6 张表全部如此），据此判 suspect 属误报。 |
| 52 | `selectdb_payment.ods_unified_redeem_order` | ⚠️ 存疑 | 原结论不成立——第 52 条 SQL 的 FROM 表 ods_unified_redeem_order 与文档第 352/387 行声明的表名完全一致，且按文档映射表「ods_unified_redeem_order = 美团核销、ds_unified_redeem_order = 抖音核销」，查该表即查美团核销数据，平台区分体现在表上而非过滤字段，故「缺少平台字段」的质疑不成立；无 DDL 仅导致列无法核对（unknown），按规则 |
| 53 | `selectdb_payment.ads_payment_equipment_record_di` | ⚠️ 存疑 | 表名、过滤维度与查询说明均一致，建表语句缺失是该文档已明确披露的收集缺口（第 355 行及 tables/INDEX.md「未收集到建表语句」章节），属于覆盖度限制而非 SQL 与说明不匹配，不构成问题。 |
| 55 | `cmember.promotion_activity_merchant` | ❌ 不匹配 | 文档第 402 行已明确注解「wash_activity_rule_equipment（Excel 表名列写作 promotion_activity_merchant）」，SQL 的 FROM 与该记录指定的 DDL 文件 wash_activity_rule_equipment.sql 完全一致，标签【promotion_activity_merchant】只是源 Excel 列名转录错误的沿袭；SQL 用到的 12 个列在 DDL  |
| 64 | `lyy_infor.xiaole_life_user_relate` | ⚠️ 存疑 | 表名 xiaole_life_user_relate 与 DDL 及记录声明一致，SQL 用到的 platform_user_id、subject_platform、create_time 三列在 tables/lyy_infor/xiaole_life_user_relate.sql 第 15/8/17 行均存在；platform_user_id 的列注释本身即「关联的乐摇摇体系下的用户Id」（第 35 行），按它过滤并叠加 subj |
| 65 | `lyy_infor.xiaole_black_user` | ⚠️ 存疑 | 表名与 black_type 列均与 DDL 一致，按 black_type 过滤正是「查某一类黑名单」场景的唯一可用字段；DDL 注释未列枚举值属注释缺失而非字段用错，且说明未提「有效/未删除」，不过滤 deleted 与文档同类查询写法一致，两条 issue 均不成立。 |
| 87 | `cmember.promotion_activity_user` | ⚠️ 存疑 | 该条记录确实没有单独写「使用场景」（文档表格第 615 行与 DDL 第 4 行均为「—」，SQL 上方第 624 行注释只写表名），但「无说明」并不构成 SQL 与说明不匹配的缺陷；SQL 表名、列名全部与 DDL 一致，仅按 lyy_user_id + lyy_distributor_id + created 查询某用户在某商户下的活动记录，与表注释「用户活动领取记录表」及字段语义（用户ID/商户ID/记录创建时间）相符，属于合理的 |

## 六、核查方法与局限

1. 核对完全基于文档与 `tables/` 下的建表语句**静态比对**，未连接数据库、未执行任何 SQL；结论反映的是「SQL 与文档/DDL 是否自洽」，不代表生产数据的实际情况。
2. **6 张表缺建表语句**，只能核对表名与语义，列存在性标 `unknown`：`selectdb_payment` 库的 `dwd_payment_payment_record_trade`、`dwd_payment_refund_record_trade`、`ads_order_info_agg`、`ds_unified_redeem_order`、`ods_unified_redeem_order`、`ads_payment_equipment_record_di`。
3. 文档第四节原已标注的 2 处表名不一致（#51 `ds_unified_redeem_order`、#55 `promotion_activity_merchant`）本次均涉及：#51 确认为真实错误，#55 经复核确认属 Excel 列名转录错误、SQL 本身正确。
4. 「存疑」类问题多为**软删除字段未过滤**（`deleted`）、**废弃字段未替换**、**枚举取值无法静态确认**等，不影响 SQL 可执行性，但会影响排查结果的准确度。
