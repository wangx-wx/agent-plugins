-- lyy_cdz_insurance_order
-- 库：advert
-- 业务分类：充电桩
-- 使用场景：投保订单记录

CREATE TABLE lyy_cdz_insurance_order (
    lyy_cdz_insurance_order_id numeric(11,0) NOT NULL,
    lyy_user_id numeric(12,0) NOT NULL,
    lyy_distributor_id numeric(11,0) NOT NULL,
    lyy_equipment_id numeric(11,0) NOT NULL,
    lyy_equipment_type_id numeric(11,0) NOT NULL,
    lyy_equipment_group_id numeric(11,0) NOT NULL,
    out_trade_no character varying(64) NOT NULL,
    third_trxid character varying(64) DEFAULT NULL::character varying,
    status numeric(2,0) DEFAULT NULL::numeric,
    pay_amount numeric(11,0) NOT NULL,
    purchase_time timestamp without time zone,
    ad_org_id numeric(11,0) NOT NULL,
    insurance_amount numeric(11,0) DEFAULT NULL::numeric,
    policy_no character varying(128) DEFAULT NULL::character varying,
    total_actual_premium numeric(11,0) DEFAULT NULL::numeric,
    total_insured_amount numeric(11,0) DEFAULT NULL::numeric,
    insurance_begin_date timestamp without time zone,
    insurance_end_date timestamp without time zone,
    insurance_status character varying(2) DEFAULT NULL::character varying,
    insurance_describe character varying(128) DEFAULT NULL::character varying,
    ad_split_type numeric(2,0) DEFAULT NULL::numeric,
    order_type character varying(2) DEFAULT '1'::character varying,
    tip_flag character varying(2) DEFAULT '0'::character varying,
    trade_type character varying(12) DEFAULT 'JSAPI'::character varying,
    distributor_amount numeric(11,0) DEFAULT NULL::numeric,
    lyy_amount numeric(11,0) DEFAULT NULL::numeric,
    unionid character varying(64) DEFAULT NULL::character varying,
    name character varying(64) DEFAULT NULL::character varying,
    created timestamp without time zone NOT NULL,
    createdby numeric(10,0) DEFAULT NULL::numeric,
    updated timestamp without time zone,
    updatedby numeric(10,0) DEFAULT NULL::numeric,
    insurance_type character varying(2) DEFAULT '1'::character varying,
    openid character varying(64),
    equipment_value character varying(64),
    order_source character varying(2) DEFAULT '1'::character varying,
    settlement_flag character varying(2),
    insure_platform smallint
)
PARTITION BY RANGE (created);
COMMENT ON COLUMN lyy_cdz_insurance_order.lyy_cdz_insurance_order_id is '主键id';
COMMENT ON COLUMN lyy_cdz_insurance_order.lyy_user_id is '用户id';
COMMENT ON COLUMN lyy_cdz_insurance_order.lyy_distributor_id is '商家id';
COMMENT ON COLUMN lyy_cdz_insurance_order.lyy_equipment_id is '设备id';
COMMENT ON COLUMN lyy_cdz_insurance_order.lyy_equipment_type_id is '设备类型id';
COMMENT ON COLUMN lyy_cdz_insurance_order.lyy_equipment_group_id is '设备场地id';
COMMENT ON COLUMN lyy_cdz_insurance_order.out_trade_no is '乐摇摇订单号';
COMMENT ON COLUMN lyy_cdz_insurance_order.third_trxid is '第三方订单号';
COMMENT ON COLUMN lyy_cdz_insurance_order.status is '状态：1-待支付，2-已支付，3-自动退款';
COMMENT ON COLUMN lyy_cdz_insurance_order.pay_amount is '实际支付金额';
COMMENT ON COLUMN lyy_cdz_insurance_order.purchase_time is '支付成功时间';
COMMENT ON COLUMN lyy_cdz_insurance_order.ad_org_id is '支付虚拟商户';
COMMENT ON COLUMN lyy_cdz_insurance_order.insurance_amount is '保单金额';
COMMENT ON COLUMN lyy_cdz_insurance_order.policy_no is '保单号';
COMMENT ON COLUMN lyy_cdz_insurance_order.total_actual_premium is '保费';
COMMENT ON COLUMN lyy_cdz_insurance_order.total_insured_amount is '保额';
COMMENT ON COLUMN lyy_cdz_insurance_order.insurance_begin_date is '保险起期';
COMMENT ON COLUMN lyy_cdz_insurance_order.insurance_end_date is '保险止期';
COMMENT ON COLUMN lyy_cdz_insurance_order.insurance_status is '保单状态：0-投保失败；1-投保成功;2-投保中;3-退保成功;4-退保失败';
COMMENT ON COLUMN lyy_cdz_insurance_order.insurance_describe is '描述';
COMMENT ON COLUMN lyy_cdz_insurance_order.ad_split_type is '分账类型：5-充电桩预充值';
COMMENT ON COLUMN lyy_cdz_insurance_order.order_type is '订单来源：1-首页充值启动';
COMMENT ON COLUMN lyy_cdz_insurance_order.tip_flag is '提示标志';
COMMENT ON COLUMN lyy_cdz_insurance_order.trade_type is '支付渠道：aliPay-支付宝；JSAPI-微信';
COMMENT ON COLUMN lyy_cdz_insurance_order.distributor_amount is '商户分得总额';
COMMENT ON COLUMN lyy_cdz_insurance_order.lyy_amount is '乐摇摇分得总额';
COMMENT ON COLUMN lyy_cdz_insurance_order.unionid is '玩家unionid';
COMMENT ON COLUMN lyy_cdz_insurance_order.name is '玩家昵称';
COMMENT ON COLUMN lyy_cdz_insurance_order.created is '创建时间';
COMMENT ON COLUMN lyy_cdz_insurance_order.createdby is '创建人ID';
COMMENT ON COLUMN lyy_cdz_insurance_order.updated is '更新时间';
COMMENT ON COLUMN lyy_cdz_insurance_order.updatedby is '更新人ID';
COMMENT ON COLUMN lyy_cdz_insurance_order.insurance_type is '保险类型：1-单次；2-月卡';
COMMENT ON COLUMN lyy_cdz_insurance_order.openid is '用户openid';
COMMENT ON COLUMN lyy_cdz_insurance_order.equipment_value is '设备号';
COMMENT ON COLUMN lyy_cdz_insurance_order.order_source is '订单来源：1-乐摇摇；2-东晙';
COMMENT ON COLUMN lyy_cdz_insurance_order.settlement_flag is '是否结算：0-否；1-是';
COMMENT ON COLUMN lyy_cdz_insurance_order.insure_platform is '0: 平安,1: 安心充 ';
COMMENT ON TABLE lyy_cdz_insurance_order is '充电桩保险订单表';
