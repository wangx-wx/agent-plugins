-- automatic_debit_order
-- 库：advert
-- 业务分类：充电桩、按摩
-- 使用场景：V会员签约表、代扣订单

CREATE TABLE automatic_debit_order (
    id numeric(11,0) NOT NULL,
    order_no character varying(64),
    user_id numeric(11,0),
    distributor_id numeric(11,0),
    group_id numeric(11,0),
    equipment_id numeric(11,0),
    equipment_value character varying(32),
    equipment_type numeric(11,0),
    client character varying(16),
    channel_id character varying(64),
    debit_type smallint,
    phone_number character varying(32),
    first_pay_amount character varying(32),
    debit_amount character varying(32),
    execute_time character varying(32),
    period character varying(32),
    status smallint,
    created timestamp(6) without time zone NOT NULL DEFAULT NULL::timestamp without time zone,
    createdby bigint,
    updated timestamp(6) without time zone NOT NULL DEFAULT NULL::timestamp without time zone,
    updatedby bigint,
    channel_order_no character varying(64),
    extra_info jsonb,
    business_order_no character varying(64),
    alipay_user_id character varying(64),
    last_debit_amount character varying(32),
    last_debit_date character varying(32),
    fail_reason character varying(200),
    platform character varying(32),
    platform_user_id character varying(64),
    automatic_debit_config_id numeric(11,0),
    channel_code character varying(32),
    next_deduct_time character varying(32),
    unsign_time character varying(32),
    agreement_no character varying(64),
    first_debit_period character varying(20)
);
COMMENT ON COLUMN automatic_debit_order.id is '主键ID';
COMMENT ON COLUMN automatic_debit_order.order_no is '乐摇摇订单号';
COMMENT ON COLUMN automatic_debit_order.user_id is '用户id';
COMMENT ON COLUMN automatic_debit_order.distributor_id is '商家id';
COMMENT ON COLUMN automatic_debit_order.group_id is '场地id';
COMMENT ON COLUMN automatic_debit_order.equipment_id is '设备id';
COMMENT ON COLUMN automatic_debit_order.equipment_value is '设备编号';
COMMENT ON COLUMN automatic_debit_order.equipment_type is '设备类型';
COMMENT ON COLUMN automatic_debit_order.client is '客户端';
COMMENT ON COLUMN automatic_debit_order.channel_id is '渠道id';
COMMENT ON COLUMN automatic_debit_order.debit_type is '扣费方式';
COMMENT ON COLUMN automatic_debit_order.phone_number is '手机号码';
COMMENT ON COLUMN automatic_debit_order.first_pay_amount is '首笔金额';
COMMENT ON COLUMN automatic_debit_order.debit_amount is '扣费金额';
COMMENT ON COLUMN automatic_debit_order.execute_time is '执行时间';
COMMENT ON COLUMN automatic_debit_order.period is '执行时间';
COMMENT ON COLUMN automatic_debit_order.status is '0-未支付,1-支付完成,2-取消,3-签约成功，-1失败';
COMMENT ON COLUMN automatic_debit_order.created is '创建时间';
COMMENT ON COLUMN automatic_debit_order.createdby is '创建人';
COMMENT ON COLUMN automatic_debit_order.updated is '更新时间';
COMMENT ON COLUMN automatic_debit_order.updatedby is '更新人';
COMMENT ON COLUMN automatic_debit_order.channel_order_no is '渠道订单号';
COMMENT ON COLUMN automatic_debit_order.extra_info is '透传信息';
COMMENT ON COLUMN automatic_debit_order.business_order_no is '业务订单号';
COMMENT ON COLUMN automatic_debit_order.alipay_user_id is '支付宝用户ID';
COMMENT ON COLUMN automatic_debit_order.last_debit_amount is '最新扣费金额';
COMMENT ON COLUMN automatic_debit_order.last_debit_date is '最近扣款时间';
COMMENT ON COLUMN automatic_debit_order.fail_reason is '失败原因';
COMMENT ON COLUMN automatic_debit_order.platform is '平台标识';
COMMENT ON COLUMN automatic_debit_order.platform_user_id is '第三方平台用户ID';
COMMENT ON COLUMN automatic_debit_order.automatic_debit_config_id is '自动扣款配置ID';
COMMENT ON COLUMN automatic_debit_order.channel_code is '渠道编码';
COMMENT ON COLUMN automatic_debit_order.next_deduct_time is '下次扣费时间';
COMMENT ON COLUMN automatic_debit_order.unsign_time is '解约时间';
COMMENT ON COLUMN automatic_debit_order.agreement_no is '平台签约单号';
COMMENT ON COLUMN automatic_debit_order.first_debit_period is '首次扣费周期（天）';
COMMENT ON TABLE automatic_debit_order is '自动扣款订单表';
CREATE INDEX idx_automatic_debit_order_channel_next_status ON automatic_debit_order USING btree (channel_code, status, next_deduct_time);
CREATE INDEX idx_automatic_debit_user_ctime ON automatic_debit_order USING btree (user_id, created);
CREATE UNIQUE INDEX automatic_debit_order_pkey ON automatic_debit_order USING btree (id);
CREATE INDEX idx_automatic_debit_order_channel_order_no ON automatic_debit_order USING btree (channel_order_no);
CREATE INDEX idx_automatic_debit_order_userid ON automatic_debit_order USING btree (user_id, status);
CREATE INDEX idx_automatic_debit_order_orderno ON automatic_debit_order USING btree (order_no);
CREATE INDEX idx_auto_debit_order_covering ON automatic_debit_order USING btree (platform, channel_code, platform_user_id, status, id DESC);
CREATE INDEX idx_automatic_debit_order_phone_number ON automatic_debit_order USING btree (phone_number);
CREATE INDEX idx_automatic_debit_order_alipay_user_id ON automatic_debit_order USING btree (alipay_user_id);
CREATE INDEX idx_automatic_debit_order_channel_platform_created ON automatic_debit_order USING btree (channel_code, platform, created);
CREATE INDEX idx_automatic_debit_order_created ON automatic_debit_order USING btree (created);
CREATE INDEX idx_ad_order_platform_user_id ON automatic_debit_order USING btree (platform_user_id);
