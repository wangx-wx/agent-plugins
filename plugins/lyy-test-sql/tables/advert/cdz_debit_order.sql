-- cdz_debit_order
-- 库：advert
-- 业务分类：充电桩
-- 使用场景：星会员签约表

CREATE TABLE cdz_debit_order (
    id numeric(11,0) NOT NULL,
    order_no character varying(64),
    user_id numeric(11,0),
    distributor_id numeric(11,0),
    group_id numeric(11,0),
    equipment_id numeric(11,0),
    equipment_value character varying(32),
    equipment_type numeric(11,0),
    client character varying(16),
    app_id character varying(64),
    debit_type smallint,
    phone_number character varying(32),
    first_pay_amount numeric(10,2),
    debit_amount numeric(10,2),
    last_debit_amount numeric(10,2),
    execute_time character varying(32),
    period character varying(32),
    sign_status smallint,
    deduction_status smallint,
    created timestamp(6) without time zone NOT NULL DEFAULT NULL::timestamp without time zone,
    createdby bigint,
    updated timestamp(6) without time zone NOT NULL DEFAULT NULL::timestamp without time zone,
    updatedby bigint,
    channel_order_no character varying(64),
    extra_info jsonb,
    business_order_no character varying(64),
    last_debit_date character varying(32),
    fail_reason character varying(200),
    platform_user_id character varying(64),
    debit_config_id numeric(11,0),
    channel_code character varying(32),
    next_deduct_time character varying(32),
    unsign_time character varying(32),
    contract_id character varying(64),
    fail_count smallint,
    deleted boolean DEFAULT false
);
COMMENT ON COLUMN cdz_debit_order.order_no is '乐摇摇订单号';
COMMENT ON COLUMN cdz_debit_order.user_id is '用户id';
COMMENT ON COLUMN cdz_debit_order.distributor_id is '商家id';
COMMENT ON COLUMN cdz_debit_order.group_id is '场地id';
COMMENT ON COLUMN cdz_debit_order.equipment_id is '设备id';
COMMENT ON COLUMN cdz_debit_order.equipment_value is '设备编号';
COMMENT ON COLUMN cdz_debit_order.equipment_type is '设备类型';
COMMENT ON COLUMN cdz_debit_order.client is '客户端';
COMMENT ON COLUMN cdz_debit_order.debit_type is '扣费方式';
COMMENT ON COLUMN cdz_debit_order.phone_number is '手机号码';
COMMENT ON COLUMN cdz_debit_order.first_pay_amount is '首笔金额';
COMMENT ON COLUMN cdz_debit_order.debit_amount is '扣费金额';
COMMENT ON COLUMN cdz_debit_order.execute_time is '执行时间';
COMMENT ON COLUMN cdz_debit_order.period is '执行间隔时间';
COMMENT ON COLUMN cdz_debit_order.sign_status is ' 签约状态 0-未处理,1-签约成功,2-签约取消,3-签约失败';
COMMENT ON COLUMN cdz_debit_order.deduction_status is ' 扣款状态 0-未处理,1-扣款成功,2-扣款处理中,3-扣款失败';
COMMENT ON COLUMN cdz_debit_order.channel_order_no is '渠道订单号（签约）';
COMMENT ON COLUMN cdz_debit_order.extra_info is '透传信息';
COMMENT ON COLUMN cdz_debit_order.business_order_no is '业务订单号（扣款）';
COMMENT ON COLUMN cdz_debit_order.last_debit_date is '最近扣款时间';
COMMENT ON COLUMN cdz_debit_order.fail_reason is '失败原因';
COMMENT ON COLUMN cdz_debit_order.platform_user_id is '第三方平台用户ID';
COMMENT ON COLUMN cdz_debit_order.channel_code is '渠道编码';
COMMENT ON COLUMN cdz_debit_order.next_deduct_time is '下次扣费时间';
COMMENT ON COLUMN cdz_debit_order.unsign_time is '解约时间';
COMMENT ON COLUMN cdz_debit_order.contract_id is '委托代扣协议id';
COMMENT ON COLUMN cdz_debit_order.fail_count is '扣费失败重试次数';
COMMENT ON COLUMN cdz_debit_order.deleted is '是否删除,true:已删除';
COMMENT ON TABLE cdz_debit_order is '充电桩扣款订单表';
CREATE UNIQUE INDEX cdz_debit_order_pkey ON cdz_debit_order USING btree (id);
CREATE INDEX idx_cdz_debit_order_user_id ON cdz_debit_order USING btree (user_id);
CREATE UNIQUE INDEX udx_cdz_debit_order_channel_order_no ON cdz_debit_order USING btree (channel_order_no);
CREATE UNIQUE INDEX udx_cdz_debit_order_order_no ON cdz_debit_order USING btree (order_no);
CREATE INDEX idx_cdz_debit_user_order_ctime ON cdz_debit_order USING btree (user_id, order_no, created);
CREATE INDEX idx_cdz_debit_order_created ON cdz_debit_order USING btree (created);
