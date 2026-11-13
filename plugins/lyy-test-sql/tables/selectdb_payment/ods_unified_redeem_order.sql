-- ods_unified_redeem_order
-- 库：selectdb payment库
-- 业务分类：中台
-- 使用场景：经营统计查抖音核销数据、经营统计查美团核销数据

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