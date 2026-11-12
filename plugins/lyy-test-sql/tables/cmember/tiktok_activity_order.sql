-- tiktok_activity_order
-- 库：cmember
-- 业务分类：娱乐
-- 使用场景：查询抖音订单

CREATE TABLE lyy.tiktok_activity_order (
    tiktok_activity_order_id numeric(10,0) NOT NULL,
    lyy_distributor_id numeric(10,0),
    lyy_equipment_group_id numeric(10,0),
    lyy_equipment_id numeric(10,0),
    lyy_equipment_type_id numeric(10,0),
    equipment_value character varying(40),
    tiktok_code character varying(40),
    title character varying(60),
    status smallint,
    details jsonb,
    created timestamp(6) without time zone,
    updated timestamp(6) without time zone,
    poi_id character varying(40),
    redeem_type smallint,
    sku_id character varying(40),
    lyy_user_id bigint
)
PARTITION BY RANGE (created);
COMMENT ON COLUMN lyy.tiktok_activity_order.tiktok_activity_order_id is '抖音POI活动订单ID';
COMMENT ON COLUMN lyy.tiktok_activity_order.lyy_distributor_id is '商家ID';
COMMENT ON COLUMN lyy.tiktok_activity_order.lyy_equipment_group_id is '场地ID';
COMMENT ON COLUMN lyy.tiktok_activity_order.lyy_equipment_id is '设备ID';
COMMENT ON COLUMN lyy.tiktok_activity_order.lyy_equipment_type_id is '设备类型ID';
COMMENT ON COLUMN lyy.tiktok_activity_order.equipment_value is '设备value';
COMMENT ON COLUMN lyy.tiktok_activity_order.tiktok_code is '券码';
COMMENT ON COLUMN lyy.tiktok_activity_order.title is '团单名称';
COMMENT ON COLUMN lyy.tiktok_activity_order.status is '状态 1 初始化 2 成功 3 失败';
COMMENT ON COLUMN lyy.tiktok_activity_order.details is '详情';
COMMENT ON COLUMN lyy.tiktok_activity_order.created is '创建时间';
COMMENT ON COLUMN lyy.tiktok_activity_order.updated is '更新时间';
COMMENT ON COLUMN lyy.tiktok_activity_order.poi_id is '商家poi_id';
COMMENT ON COLUMN lyy.tiktok_activity_order.redeem_type is '核销类型 null: 反扫核销; 2: 抖音套餐核销;';
COMMENT ON COLUMN lyy.tiktok_activity_order.sku_id is '商品sku_id';
COMMENT ON COLUMN lyy.tiktok_activity_order.lyy_user_id is '乐摇摇用户ID';
