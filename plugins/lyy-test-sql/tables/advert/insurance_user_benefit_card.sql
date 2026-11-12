-- insurance_user_benefit_card
-- 库：advert
-- 业务分类：按摩
-- 使用场景：权益表

CREATE TABLE insurance_user_benefit_card (
    id numeric(11,0) NOT NULL,
    card_sku_id character varying(64) NOT NULL,
    card_name character varying(64) NOT NULL,
    config_id numeric(11,0) NOT NULL,
    distributor_id numeric(11,0) NOT NULL,
    status smallint NOT NULL,
    user_id numeric(11,0) NOT NULL,
    card_code character varying(30) NOT NULL,
    card_pass character varying(64) NOT NULL,
    out_trade_no character varying(64) NOT NULL,
    created timestamp(6) without time zone NOT NULL DEFAULT NULL::timestamp without time zone,
    updated timestamp(6) without time zone NOT NULL DEFAULT NULL::timestamp without time zone,
    price numeric(9,2) NOT NULL,
    equipment_type character varying(20) NOT NULL,
    equipment_id numeric(11,0) NOT NULL,
    equipment_group_id numeric(11,0) NOT NULL,
    equipment_group_name character varying(32) NOT NULL,
    open_id character varying(64) NOT NULL,
    order_source smallint NOT NULL,
    order_channel smallint NOT NULL,
    deleted smallint NOT NULL DEFAULT 0,
    subsidies_amount numeric(10,2),
    third_reward_type smallint,
    piao_piao_type character varying(24),
    commodity_id numeric(11,0),
    use_status smallint,
    use_phone character varying(12),
    remark character varying(128),
    parent_id numeric(11,0),
    product_type smallint
);
COMMENT ON COLUMN insurance_user_benefit_card.id is '主键id';
COMMENT ON COLUMN insurance_user_benefit_card.card_sku_id is '权益卡商品ID';
COMMENT ON COLUMN insurance_user_benefit_card.card_name is '权益卡名称';
COMMENT ON COLUMN insurance_user_benefit_card.config_id is '配置Id';
COMMENT ON COLUMN insurance_user_benefit_card.distributor_id is '商家ID';
COMMENT ON COLUMN insurance_user_benefit_card.status is '状态';
COMMENT ON COLUMN insurance_user_benefit_card.user_id is '用户ID';
COMMENT ON COLUMN insurance_user_benefit_card.card_code is '卡码';
COMMENT ON COLUMN insurance_user_benefit_card.card_pass is '卡密';
COMMENT ON COLUMN insurance_user_benefit_card.out_trade_no is '订单号';
COMMENT ON COLUMN insurance_user_benefit_card.created is '创建时间';
COMMENT ON COLUMN insurance_user_benefit_card.updated is '更新时间';
COMMENT ON COLUMN insurance_user_benefit_card.price is '权益卡金额';
COMMENT ON COLUMN insurance_user_benefit_card.equipment_type is '设备类型';
COMMENT ON COLUMN insurance_user_benefit_card.equipment_id is '设备Id';
COMMENT ON COLUMN insurance_user_benefit_card.equipment_group_id is '设备场地Id';
COMMENT ON COLUMN insurance_user_benefit_card.equipment_group_name is '设备场地名称';
COMMENT ON COLUMN insurance_user_benefit_card.open_id is 'open_id';
COMMENT ON COLUMN insurance_user_benefit_card.order_source is '订单来源';
COMMENT ON COLUMN insurance_user_benefit_card.order_channel is '订单渠道';
COMMENT ON COLUMN insurance_user_benefit_card.deleted is '是否删除';
COMMENT ON COLUMN insurance_user_benefit_card.subsidies_amount is '补贴金额（元）';
COMMENT ON COLUMN insurance_user_benefit_card.third_reward_type is '权益来源';
COMMENT ON COLUMN insurance_user_benefit_card.piao_piao_type is '权益类型';
COMMENT ON COLUMN insurance_user_benefit_card.commodity_id is '商品ID';
COMMENT ON COLUMN insurance_user_benefit_card.use_status is '使用状态 领取状态 0、未领取 1、领取中 2、已领取';
COMMENT ON COLUMN insurance_user_benefit_card.use_phone is '使用手机号';
COMMENT ON COLUMN insurance_user_benefit_card.remark is '备注';
COMMENT ON COLUMN insurance_user_benefit_card.parent_id is '关联父ID';
COMMENT ON COLUMN insurance_user_benefit_card.product_type is '产品类型用于区分商创业务1=保障 2=权益卡 3=附带商品';
COMMENT ON TABLE insurance_user_benefit_card is '权益用户卡记录表';
CREATE INDEX idx_iubc_parent_id ON insurance_user_benefit_card USING btree (parent_id);
CREATE INDEX idx_insurance_user_benefit_card_created ON insurance_user_benefit_card USING btree (created);
CREATE INDEX idx_insurance_user_benefit_card_osetp ON insurance_user_benefit_card USING btree (order_source, equipment_type, product_type);
CREATE UNIQUE INDEX insurance_user_benefit_card_pkey ON insurance_user_benefit_card USING btree (id);
CREATE INDEX idx_insurance_user_benefit_card_out_trade_no ON insurance_user_benefit_card USING btree (out_trade_no);
CREATE INDEX idx_insurance_user_benefit_card_card_code ON insurance_user_benefit_card USING btree (card_code);
CREATE INDEX idx_insurance_user_benefit_card_distributor_id ON insurance_user_benefit_card USING btree (distributor_id);
CREATE INDEX idx_insurance_user_benefit_card_user_id ON insurance_user_benefit_card USING btree (user_id);
