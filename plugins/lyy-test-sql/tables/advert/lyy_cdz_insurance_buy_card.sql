-- lyy_cdz_insurance_buy_card
-- 库：advert
-- 业务分类：充电桩
-- 使用场景：保险周卡、保险月卡、V会员保险月卡、星会员保险月卡

CREATE TABLE lyy_cdz_insurance_buy_card (
    lyy_cdz_insurance_buy_card_id numeric(11,0) NOT NULL,
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
    ad_org_id numeric(11,0) DEFAULT NULL::numeric,
    ad_split_type numeric(2,0) DEFAULT NULL::numeric,
    distributor_amount numeric(11,0) DEFAULT NULL::numeric,
    lyy_amount numeric(11,0) DEFAULT NULL::numeric,
    unionid character varying(64) DEFAULT NULL::character varying,
    name character varying(64) DEFAULT NULL::character varying,
    invalid_flag numeric(2,0) NOT NULL DEFAULT 0,
    invalid_date timestamp without time zone,
    trade_type character varying(12) DEFAULT NULL::character varying,
    tip_flag character varying(1) DEFAULT NULL::character varying,
    order_type character varying(2) DEFAULT NULL::character varying,
    created timestamp without time zone NOT NULL,
    createdby numeric(10,0) DEFAULT NULL::numeric,
    updated timestamp without time zone,
    updatedby numeric(10,0) DEFAULT NULL::numeric,
    card_type integer DEFAULT 1,
    effect_date timestamp without time zone,
    complaint_flag character varying(2),
    complaint_remark character varying(200),
    refund_type smallint
);
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.lyy_cdz_insurance_buy_card_id is '主键id';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.lyy_user_id is '用户id';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.lyy_distributor_id is '商家id';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.lyy_equipment_id is '设备id';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.lyy_equipment_type_id is '设备类型id';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.lyy_equipment_group_id is '设备场地id';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.out_trade_no is '乐摇摇订单号';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.third_trxid is '第三方订单号';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.status is '状态：1-待支付，2-已支付，3-自动退款';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.pay_amount is '实际支付金额';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.purchase_time is '支付成功时间';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.ad_org_id is '支付虚拟商户';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.ad_split_type is '类型：5-充电桩保险月卡';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.distributor_amount is '商户分得总额';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.lyy_amount is '乐摇摇分得总额';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.unionid is '玩家unionid';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.name is '玩家昵称';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.invalid_flag is '是否失效：0-否；1-是';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.invalid_date is '失效时间';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.trade_type is '支付渠道：aliPay-支付宝；JSAPI-微信';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.tip_flag is '是否已弹窗提示:0-否;1-是';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.order_type is '订单来源:1-banner弹窗;2扫码弹窗;3-购物车弹窗';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.created is '创建时间';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.createdby is '创建人ID';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.updated is '更新时间';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.updatedby is '更新人ID';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.card_type is '卡类别：1月卡；2-周卡';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.effect_date is '生效时间';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.complaint_flag is '是否投诉：0-否；1-是';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.complaint_remark is '投诉原因';
COMMENT ON COLUMN lyy_cdz_insurance_buy_card.refund_type is '退款来源：1-平台（默认）；2-用户';
COMMENT ON TABLE lyy_cdz_insurance_buy_card is '充电桩保险购卡表';
CREATE UNIQUE INDEX pk_lyy_lyy_cdz_insurance_buy_card_new ON lyy_cdz_insurance_buy_card USING btree (lyy_cdz_insurance_buy_card_id);
CREATE INDEX insurance_buy_order2_index ON lyy_cdz_insurance_buy_card USING btree (out_trade_no);
CREATE INDEX insurance_buy_user2_index ON lyy_cdz_insurance_buy_card USING btree (lyy_user_id);
CREATE INDEX lyy_cdz_insurance_buy_card_new_ptime_status_idx ON lyy_cdz_insurance_buy_card USING btree (purchase_time, status);
CREATE INDEX idx_lyy_cdz_insurance_buy_card_created ON lyy_cdz_insurance_buy_card USING btree (created);
