-- coins_saver_order
-- 库：massage_chair
-- 业务分类：娱乐
-- 使用场景：查询机器存币记录

CREATE TABLE coins_saver_order (
    id numeric(12,0) NOT NULL,
    order_id character varying(32) NOT NULL,
    equipment_value character varying(40) NOT NULL,
    equipment_id numeric(12,0) NOT NULL,
    store_id numeric(12,0) NOT NULL,
    merchant_id numeric(12,0) NOT NULL,
    equipment_type_id numeric(12,0) NOT NULL,
    equipment_type_value character varying(16) NOT NULL,
    coins numeric(10,0) NOT NULL,
    user_id numeric(12,0) NOT NULL,
    device_status smallint NOT NULL DEFAULT 0,
    order_status smallint NOT NULL DEFAULT 0,
    description character varying(512),
    created timestamp(6) without time zone NOT NULL,
    updated timestamp(6) without time zone NOT NULL,
    equity_type smallint
);
COMMENT ON COLUMN coins_saver_order.order_id is '业务单号';
COMMENT ON COLUMN coins_saver_order.equipment_value is '设备编码';
COMMENT ON COLUMN coins_saver_order.equipment_id is '设备id';
COMMENT ON COLUMN coins_saver_order.store_id is '场地id';
COMMENT ON COLUMN coins_saver_order.merchant_id is '商户id';
COMMENT ON COLUMN coins_saver_order.equipment_type_id is '设备类型id';
COMMENT ON COLUMN coins_saver_order.equipment_type_value is '设备类型标识';
COMMENT ON COLUMN coins_saver_order.coins is '存分数量';
COMMENT ON COLUMN coins_saver_order.user_id is '用户id';
COMMENT ON COLUMN coins_saver_order.device_status is '设备状态';
COMMENT ON COLUMN coins_saver_order.order_status is '订单状态';
COMMENT ON COLUMN coins_saver_order.description is '描述';
COMMENT ON COLUMN coins_saver_order.equity_type is '权益类型 1:积分';
COMMENT ON TABLE coins_saver_order is '存分业务订单表';
CREATE INDEX idx_coins_saver_order_uid_ev_utime ON coins_saver_order USING btree (user_id, equipment_value, device_status, updated);
CREATE UNIQUE INDEX coins_saver_order_pkey ON coins_saver_order USING btree (id);
CREATE INDEX saver_equipment_id_nox ON coins_saver_order USING btree (equipment_id);
CREATE INDEX idx_coins_saver_order_smctime ON coins_saver_order USING btree (store_id, merchant_id, created DESC);
CREATE UNIQUE INDEX coins_saver_order_order_id_equipment_value_uindex ON coins_saver_order USING btree (order_id, equipment_value);
