-- insurance_order
-- 库：advert
-- 业务分类：按摩
-- 使用场景：权益订单表

CREATE TABLE insurance_order (
    id numeric(11,0) NOT NULL,
    order_time timestamp(6) without time zone DEFAULT NULL::timestamp without time zone,
    end_time timestamp(6) without time zone DEFAULT NULL::timestamp without time zone,
    out_trade_no character varying(64) NOT NULL,
    insurance_no character varying(64),
    equipment_type character varying(8) NOT NULL,
    equipment_value character varying(16) NOT NULL,
    equipment_id numeric(11,0),
    lyy_user_id numeric(11,0),
    distributor_id numeric(11,0),
    equipment_group_id numeric(11,0),
    equipment_group_name character varying(255),
    order_source smallint,
    open_id character varying(64) NOT NULL,
    user_name character varying(64),
    router_id numeric(11,0) NOT NULL,
    insurance_name character varying(64) NOT NULL,
    insurance_price numeric(5,2) NOT NULL,
    order_channel smallint,
    equip_status smallint NOT NULL,
    order_status smallint NOT NULL,
    insurance_status smallint NOT NULL,
    created timestamp(6) without time zone NOT NULL DEFAULT NULL::timestamp without time zone,
    updated timestamp(6) without time zone NOT NULL DEFAULT NULL::timestamp without time zone,
    click_status smallint,
    vertical smallint,
    provider character varying(20),
    benefit_name character varying(20),
    config_id numeric(11,0),
    sku_id character varying(64),
    brand character varying(20)
)
PARTITION BY RANGE (created);
COMMENT ON COLUMN insurance_order.id is '主键id';
COMMENT ON COLUMN insurance_order.order_time is '下单时间';
COMMENT ON COLUMN insurance_order.end_time is '结束时间';
COMMENT ON COLUMN insurance_order.out_trade_no is '订单号';
COMMENT ON COLUMN insurance_order.insurance_no is '保单号';
COMMENT ON COLUMN insurance_order.equipment_type is '设备类型';
COMMENT ON COLUMN insurance_order.equipment_value is '设备编码';
COMMENT ON COLUMN insurance_order.equipment_id is '设备Id';
COMMENT ON COLUMN insurance_order.lyy_user_id is '用户Id';
COMMENT ON COLUMN insurance_order.distributor_id is '商家Id';
COMMENT ON COLUMN insurance_order.equipment_group_id is '设备场地id';
COMMENT ON COLUMN insurance_order.equipment_group_name is '设备场地名称';
COMMENT ON COLUMN insurance_order.order_source is '订单来源';
COMMENT ON COLUMN insurance_order.open_id is '用户openId';
COMMENT ON COLUMN insurance_order.user_name is '用户名';
COMMENT ON COLUMN insurance_order.router_id is '路由Id';
COMMENT ON COLUMN insurance_order.insurance_name is '保险名称';
COMMENT ON COLUMN insurance_order.insurance_price is '保险金额';
COMMENT ON COLUMN insurance_order.order_channel is '订单渠道';
COMMENT ON COLUMN insurance_order.equip_status is '设备状态';
COMMENT ON COLUMN insurance_order.order_status is '订单状态';
COMMENT ON COLUMN insurance_order.insurance_status is '保单状态';
COMMENT ON COLUMN insurance_order.created is '创建时间';
COMMENT ON COLUMN insurance_order.updated is '更新时间';
COMMENT ON COLUMN insurance_order.click_status is '订单勾选状态';
COMMENT ON COLUMN insurance_order.vertical is '是否竖版';
COMMENT ON COLUMN insurance_order.provider is '保险提供商';
COMMENT ON COLUMN insurance_order.benefit_name is '保险权益名称';
COMMENT ON COLUMN insurance_order.config_id is '配置ID';
COMMENT ON COLUMN insurance_order.sku_id is '商品ID';
COMMENT ON COLUMN insurance_order.brand is '设备品牌';
