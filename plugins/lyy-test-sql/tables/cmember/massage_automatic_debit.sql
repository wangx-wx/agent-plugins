-- massage_automatic_debit
-- 库：cmember
-- 业务分类：按摩
-- 使用场景：领取福利记录

CREATE TABLE massage_automatic_debit (
    id numeric(12,0) NOT NULL,
    order_no character varying(64),
    parent_id numeric(12,0),
    user_id numeric(11,0),
    wechat_user_id numeric(11,0),
    merchant_id numeric(11,0),
    store_id numeric(11,0),
    equipment_value character varying(32),
    equipment_type numeric(11,0),
    product_type smallint,
    phone_number character varying(32),
    first_pay_amount numeric(10,2),
    first_debit_time timestamp(6) without time zone,
    debit_amount numeric(10,2),
    debit_time timestamp(6) without time zone,
    start_time timestamp(6) without time zone,
    end_time timestamp(6) without time zone,
    cancel_time timestamp(6) without time zone,
    status smallint,
    third_order_no character varying(64),
    promotion_activity_id numeric(11,0),
    order_source smallint,
    order_position smallint,
    reward_config jsonb,
    extend_info jsonb,
    deleted boolean NOT NULL DEFAULT false,
    created timestamp(6) without time zone NOT NULL DEFAULT NULL::timestamp without time zone,
    createdby bigint,
    updated timestamp(6) without time zone NOT NULL DEFAULT NULL::timestamp without time zone,
    updatedby bigint,
    sign_channel character varying(20),
    client character varying(20),
    sign_user_id numeric(11,0),
    refund_status smallint
);
COMMENT ON COLUMN massage_automatic_debit.order_no is '乐摇摇订单号';
COMMENT ON COLUMN massage_automatic_debit.parent_id is '父扣费流水ID';
COMMENT ON COLUMN massage_automatic_debit.user_id is '乐摇摇支付宝用户id';
COMMENT ON COLUMN massage_automatic_debit.wechat_user_id is '乐摇摇微信用户ID';
COMMENT ON COLUMN massage_automatic_debit.merchant_id is '商家id';
COMMENT ON COLUMN massage_automatic_debit.store_id is '场地id';
COMMENT ON COLUMN massage_automatic_debit.equipment_value is '设备编号';
COMMENT ON COLUMN massage_automatic_debit.equipment_type is '设备类型';
COMMENT ON COLUMN massage_automatic_debit.product_type is '产品类型：1=超级VIP ';
COMMENT ON COLUMN massage_automatic_debit.phone_number is '手机号码';
COMMENT ON COLUMN massage_automatic_debit.first_pay_amount is '首笔金额';
COMMENT ON COLUMN massage_automatic_debit.first_debit_time is '首次签约时间';
COMMENT ON COLUMN massage_automatic_debit.debit_amount is '扣费金额';
COMMENT ON COLUMN massage_automatic_debit.debit_time is '扣费时间';
COMMENT ON COLUMN massage_automatic_debit.start_time is '开始时间';
COMMENT ON COLUMN massage_automatic_debit.end_time is '到期时间';
COMMENT ON COLUMN massage_automatic_debit.cancel_time is '解约时间';
COMMENT ON COLUMN massage_automatic_debit.status is '0=未支付(签约未扣款) 1-支付成功(扣款成功) 2-支付失败(扣款失败)';
COMMENT ON COLUMN massage_automatic_debit.third_order_no is '渠道订单号';
COMMENT ON COLUMN massage_automatic_debit.promotion_activity_id is '活动ID';
COMMENT ON COLUMN massage_automatic_debit.order_source is '订单来源 0：微信 1：支付宝';
COMMENT ON COLUMN massage_automatic_debit.order_position is '订单触发位置：0：首页弹窗 1:首页套餐位置';
COMMENT ON COLUMN massage_automatic_debit.reward_config is '奖励配置';
COMMENT ON COLUMN massage_automatic_debit.extend_info is '扩展信息';
COMMENT ON COLUMN massage_automatic_debit.sign_channel is '签约渠道';
COMMENT ON COLUMN massage_automatic_debit.client is '签约用户权益客户端';
COMMENT ON COLUMN massage_automatic_debit.sign_user_id is '签约用户ID';
COMMENT ON COLUMN massage_automatic_debit.refund_status is '退款状态 0或者空=未退款 1=退款中 2=已退款 3=退款失败';
 
CREATE UNIQUE INDEX massage_automatic_debit_pkey ON massage_automatic_debit USING btree (id);
CREATE INDEX mad_wechat_user_id_idx ON massage_automatic_debit USING btree (wechat_user_id);
CREATE INDEX mad_merchant_id_idx ON massage_automatic_debit USING btree (merchant_id);
CREATE INDEX mad_order_no_idx ON massage_automatic_debit USING btree (order_no);
CREATE INDEX mad_created_idx ON massage_automatic_debit USING btree (created);
CREATE INDEX idx_mad_sign_user_id ON massage_automatic_debit USING btree (sign_user_id);
CREATE INDEX idx_mad_order_no_id_desc ON massage_automatic_debit USING btree (order_no, id DESC);
