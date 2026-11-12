-- lyy_cdz_member_card
-- 库：advert
-- 业务分类：充电桩
-- 使用场景：V会员、星会员卡表

CREATE TABLE lyy_cdz_member_card (
    id bigint NOT NULL,
    lyy_user_id bigint NOT NULL,
    lyy_user_name character varying(64),
    lyy_distributor_id bigint NOT NULL,
    out_trade_no character varying(64),
    third_order_no character varying(64) NOT NULL,
    pay_status smallint,
    card_status smallint NOT NULL,
    amount numeric(10,2),
    order_source smallint,
    order_position smallint,
    agent_user_id bigint,
    agent_user_name character varying(64),
    user_phone character varying(32),
    start_time timestamp(6) without time zone,
    end_time timestamp(6) without time zone,
    discount_rate integer,
    single_limit_amount numeric(10,2),
    month_limit_amount numeric(10,2),
    current_limit_amount numeric(10,2),
    callback_json character varying(500),
    created timestamp(6) without time zone,
    createdby character varying(64),
    updated timestamp(6) without time zone,
    updatedby character varying(64),
    tip_flag smallint,
    open_id character varying(64),
    channel_code character varying(32),
    refund_reason character varying(256),
    refund_type smallint,
    refund_time timestamp(6) without time zone
);
COMMENT ON COLUMN lyy_cdz_member_card.id is '主键ID';
COMMENT ON COLUMN lyy_cdz_member_card.lyy_user_id is '关联用户ID';
COMMENT ON COLUMN lyy_cdz_member_card.lyy_user_name is '用户昵称';
COMMENT ON COLUMN lyy_cdz_member_card.lyy_distributor_id is '关联商家ID';
COMMENT ON COLUMN lyy_cdz_member_card.out_trade_no is '乐摇摇订单号';
COMMENT ON COLUMN lyy_cdz_member_card.third_order_no is '第三方订单号';
COMMENT ON COLUMN lyy_cdz_member_card.pay_status is '支付状态 0：待支付、1：已支付、2：已退款';
COMMENT ON COLUMN lyy_cdz_member_card.card_status is '卡状态 0：代生效、1：生效中、2：已过期、3：已退卡';
COMMENT ON COLUMN lyy_cdz_member_card.amount is '支付金额';
COMMENT ON COLUMN lyy_cdz_member_card.order_source is '订单来源 0：微信 1：支付宝';
COMMENT ON COLUMN lyy_cdz_member_card.order_position is '订单触发位置：0：首页弹窗';
COMMENT ON COLUMN lyy_cdz_member_card.agent_user_id is '代理商ID';
COMMENT ON COLUMN lyy_cdz_member_card.agent_user_name is '代理商名称';
COMMENT ON COLUMN lyy_cdz_member_card.user_phone is '用户手机号';
COMMENT ON COLUMN lyy_cdz_member_card.start_time is '生效开始时间';
COMMENT ON COLUMN lyy_cdz_member_card.end_time is '生效结束时间';
COMMENT ON COLUMN lyy_cdz_member_card.discount_rate is '折扣比例';
COMMENT ON COLUMN lyy_cdz_member_card.single_limit_amount is '单次折扣上限';
COMMENT ON COLUMN lyy_cdz_member_card.month_limit_amount is '每月折扣累计上限';
COMMENT ON COLUMN lyy_cdz_member_card.current_limit_amount is '当前累计';
COMMENT ON COLUMN lyy_cdz_member_card.callback_json is '回调信息：用于自动续费成功订单创建订单信息';
COMMENT ON COLUMN lyy_cdz_member_card.created is '创建时间';
COMMENT ON COLUMN lyy_cdz_member_card.createdby is '创建人';
COMMENT ON COLUMN lyy_cdz_member_card.updated is '更新时间';
COMMENT ON COLUMN lyy_cdz_member_card.updatedby is '更新人';
COMMENT ON COLUMN lyy_cdz_member_card.tip_flag is '是否已弹窗提示:0-否;1-是';
COMMENT ON COLUMN lyy_cdz_member_card.open_id is '支付宝openId';
COMMENT ON COLUMN lyy_cdz_member_card.channel_code is '渠道编码';
COMMENT ON COLUMN lyy_cdz_member_card.refund_reason is '退款类型';
COMMENT ON COLUMN lyy_cdz_member_card.refund_type is '退款类型，1 用户取消、2：后台取消';
COMMENT ON COLUMN lyy_cdz_member_card.refund_time is '退款时间';
COMMENT ON TABLE lyy_cdz_member_card is '充电桩自动续费会员卡';
CREATE INDEX lyy_cdz_member_card_created_idx ON lyy_cdz_member_card USING btree (created);
CREATE UNIQUE INDEX lyy_cdz_member_card_pkey ON lyy_cdz_member_card USING btree (id);
CREATE INDEX lyy_distributor_id ON lyy_cdz_member_card USING btree (lyy_distributor_id);
CREATE INDEX lyy_user_id_index ON lyy_cdz_member_card USING btree (lyy_user_id);
CREATE INDEX m_card_third_order_no_index ON lyy_cdz_member_card USING btree (third_order_no);
CREATE INDEX open_id_index ON lyy_cdz_member_card USING btree (open_id);
CREATE INDEX out_trade_no_index ON lyy_cdz_member_card USING btree (out_trade_no);
CREATE INDEX idx_lyy_cdz_member_card_channel_ctime ON lyy_cdz_member_card USING btree (channel_code, created);
