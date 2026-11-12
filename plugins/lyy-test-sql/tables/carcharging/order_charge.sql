-- order_charge
-- 库：carcharging
-- 业务分类：汽充桩
-- 使用场景：订单

CREATE TABLE order_charge (
    id bigint NOT NULL,
    member_id bigint NOT NULL,
    merchant_member_id bigint NOT NULL,
    merchant_id bigint NOT NULL,
    out_trade_id character varying(32) NOT NULL,
    pay_id character varying(32),
    out_side_order_no character varying(64),
    station_id bigint NOT NULL,
    equipment_code character varying(20) NOT NULL,
    socket_code character varying(22) NOT NULL,
    socket_num integer NOT NULL,
    unique_code character varying(20) NOT NULL,
    pay_mode smallint,
    total_amount numeric(15,2),
    actual_amount numeric(15,2),
    reduce_amount numeric(15,2),
    total_charge_fee numeric(15,2),
    total_service_fee numeric(15,2),
    total_power numeric(15,4),
    total_time integer,
    end_reason character varying(255),
    pay_status smallint,
    order_status smallint NOT NULL,
    order_origin smallint NOT NULL,
    order_mode smallint NOT NULL,
    station_name character varying(64),
    pay_time timestamp without time zone,
    price_model_id bigint NOT NULL,
    equipment_statute_type bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    created_by bigint NOT NULL,
    updated timestamp without time zone,
    updated_by bigint,
    organization_id bigint,
    deleted boolean NOT NULL DEFAULT false,
    nickname character varying(50),
    price_data text,
    open_id character varying(64),
    app_id character varying(64),
    start_amount numeric(15,2),
    start_mode smallint,
    finish_time timestamp without time zone,
    license_plate character varying(20),
    platform_id character varying(15) DEFAULT '1'::character varying,
    operator_id character varying(15),
    equipment_id bigint,
    equipment_type integer,
    card_no character varying(30),
    order_mode_param numeric(15,2),
    es_flag boolean DEFAULT false,
    pay_version smallint DEFAULT 1,
    pay_need boolean DEFAULT false,
    delay_status integer,
    end_reason_code character varying(20),
    normal_flag integer,
    hlht_socket_code character varying(40),
    car_team_id bigint,
    car_team_name character varying(30),
    vin_code character varying(32),
    order_type integer,
    hlht_platform_operator_id character varying(20),
    hlht_merchant_operator_id character varying(20),
    delay_flag integer
) WITH (fillfactor=100);
COMMENT ON COLUMN order_charge.id is '主键Id，雪花算法生成';
COMMENT ON COLUMN order_charge.member_id is '会员Id';
COMMENT ON COLUMN order_charge.merchant_member_id is '商户会员Id';
COMMENT ON COLUMN order_charge.merchant_id is '商户Id';
COMMENT ON COLUMN order_charge.out_trade_id is '交易单号';
COMMENT ON COLUMN order_charge.pay_id is '支付单号';
COMMENT ON COLUMN order_charge.out_side_order_no is '第三方交易订单号';
COMMENT ON COLUMN order_charge.station_id is '站id';
COMMENT ON COLUMN order_charge.equipment_code is '充电桩编码';
COMMENT ON COLUMN order_charge.socket_code is '充电枪编码';
COMMENT ON COLUMN order_charge.socket_num is '枪序号';
COMMENT ON COLUMN order_charge.unique_code is '设备唯一码';
COMMENT ON COLUMN order_charge.pay_mode is '
    WECHAT("wechat", 1, "Wechat"),
    WX_MINI("wxMini", 2, "Wechat"),
    ALI_PAY("aliPay", 3, "Alipay"),
    ALI_MINI("aliMini", 4, "Alipay"),
    BALANCED("Balanced", 90, "Balanced"),
    UNKNOWN("Unknown", 99, "Unknown"),
';
COMMENT ON COLUMN order_charge.total_amount is '总金额';
COMMENT ON COLUMN order_charge.actual_amount is '实付金额';
COMMENT ON COLUMN order_charge.reduce_amount is '优惠金额';
COMMENT ON COLUMN order_charge.total_charge_fee is '总电费';
COMMENT ON COLUMN order_charge.total_service_fee is '总服务费';
COMMENT ON COLUMN order_charge.total_power is '总充电量，单位度';
COMMENT ON COLUMN order_charge.total_time is '总充电时长，单位分钟';
COMMENT ON COLUMN order_charge.end_reason is '结束原因';
COMMENT ON COLUMN order_charge.pay_status is 'UN_PAY(1, 待支付),
PAYING(2, 支付中),
PAY_SUCCESS(3, 支付成功),
PAY_FAIL(4, 支付失败),
PAY_CANCEL(5, "支付取消"),;
';
COMMENT ON COLUMN order_charge.order_status is 'RUNNING(1,"启动中"),
RUN_FAIL(2,"启动失败"),
CHARGING(3,"（启动成功）充电中"),
PEND(4,"(停止失败)结算中"),
FINISH(5,"充电完成"),
;';
COMMENT ON COLUMN order_charge.order_origin is 'customer(1, "c端"),
card(2, "刷卡"),
vin(3, "vin码"),';
COMMENT ON COLUMN order_charge.order_mode is 'AUTO(1,"自动充满"),
money(2,"按金额"),
ele(3,"按电量"),
time(4,"按时间"),';
COMMENT ON COLUMN order_charge.station_name is '场地名称';
COMMENT ON COLUMN order_charge.pay_time is '支付时间';
COMMENT ON COLUMN order_charge.price_model_id is '当时使用的计费模型id';
COMMENT ON COLUMN order_charge.equipment_statute_type is '充电规约类型';
COMMENT ON COLUMN order_charge.created is '创建时间';
COMMENT ON COLUMN order_charge.created_by is '创建时间';
COMMENT ON COLUMN order_charge.updated is '结束时间';
COMMENT ON COLUMN order_charge.updated_by is '更新人';
COMMENT ON COLUMN order_charge.organization_id is '组织Id';
COMMENT ON COLUMN order_charge.deleted is '软删除';
COMMENT ON COLUMN order_charge.nickname is '用户昵称';
COMMENT ON COLUMN order_charge.price_data is '价格数据（冗余计费模型）';
COMMENT ON COLUMN order_charge.open_id is '微信openid';
COMMENT ON COLUMN order_charge.app_id is '微信的appid';
COMMENT ON COLUMN order_charge.start_amount is '启动金额';
COMMENT ON COLUMN order_charge.start_mode is '启动方式';
COMMENT ON COLUMN order_charge.finish_time is '完结时间';
COMMENT ON COLUMN order_charge.license_plate is '车牌号';
COMMENT ON COLUMN order_charge.platform_id is '平台ID';
COMMENT ON COLUMN order_charge.operator_id is '商户组织机构代码';
COMMENT ON COLUMN order_charge.equipment_id is '中台的设备ID';
COMMENT ON COLUMN order_charge.equipment_type is '设备类型';
COMMENT ON COLUMN order_charge.card_no is '刷卡启动的卡号';
COMMENT ON COLUMN order_charge.order_mode_param is '充电方式参数
自动充满为空
按时长充电：是时长
按电量充电：是电量
按金额充电：是金额';
COMMENT ON COLUMN order_charge.es_flag is 'es标志';
COMMENT ON COLUMN order_charge.pay_version is '支付版本，1-旧支付，2-新支付';
COMMENT ON COLUMN order_charge.pay_need is '是否需要拉起支付标识，true是，false否';
COMMENT ON COLUMN order_charge.delay_status is '延迟结算状态 0-待确认 1-成功 2-失败 3-无结果 999-确认异常';
COMMENT ON COLUMN order_charge.end_reason_code is '结束原因编码';
COMMENT ON COLUMN order_charge.normal_flag is '是否正常单表示，0：正常单，1：异常单';
COMMENT ON COLUMN order_charge.hlht_socket_code is '互联互通枪编号';
COMMENT ON COLUMN order_charge.car_team_id is '车队ID';
COMMENT ON COLUMN order_charge.car_team_name is '车队名称';
COMMENT ON COLUMN order_charge.vin_code is 'vin码';
COMMENT ON COLUMN order_charge.order_type is '2：放电订单，为空是充电订单';
COMMENT ON COLUMN order_charge.hlht_platform_operator_id is '外部设备平台id';
COMMENT ON COLUMN order_charge.hlht_merchant_operator_id is '外部设备商户id';
COMMENT ON COLUMN order_charge.delay_flag is '延迟结算标识';
COMMENT ON TABLE order_charge is '充电订单表';
CREATE INDEX idx_order_charge_eftime ON order_charge USING btree (equipment_code, finish_time DESC);
CREATE INDEX idx_order_charge_member_id ON order_charge USING btree (member_id);
CREATE UNIQUE INDEX pk_lyy_order_charge ON order_charge USING btree (id);
CREATE INDEX idx_order_charge_tmp_out_side_order_no ON order_charge USING btree (out_side_order_no);
CREATE INDEX order_charge_tmpmerchant_order_member_status_index ON order_charge USING btree (merchant_member_id, created);
CREATE INDEX order_charge_tmpmerchant_order_merchant_member_status_index ON order_charge USING btree (merchant_member_id, order_status);
CREATE INDEX order_charge_tmpmerchant_order_status_index ON order_charge USING btree (merchant_id, order_status);
CREATE UNIQUE INDEX order_charge_tmp_out_trade_id_uindex ON order_charge USING btree (out_trade_id);
CREATE INDEX order_charge_tmp_pay_id_index ON order_charge USING btree (pay_id);
CREATE INDEX order_charge_tmp_socket_code_created_index ON order_charge USING btree (socket_code, created);
CREATE INDEX order_charge_tmp_updated_index ON order_charge USING btree (updated);
CREATE INDEX idx_order_charge_sid_mid ON order_charge USING btree (station_id, merchant_id, order_status);
