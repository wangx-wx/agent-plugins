-- wash_product_order
-- 库：cmember
-- 业务分类：洗水
-- 使用场景：查洗水商创产品

CREATE TABLE wash_product_order (
    id numeric(11,0) NOT NULL,
    product_type smallint NOT NULL,
    out_trade_no character varying(32) NOT NULL,
    order_source character varying(30) NOT NULL,
    status smallint NOT NULL,
    merchant_id numeric(11,0) NOT NULL,
    user_id numeric(11,0) NOT NULL,
    equipment_value character varying(32) NOT NULL,
    store_id numeric(11,0) NOT NULL,
    pay_detail jsonb NOT NULL,
    equipment_detail jsonb,
    product_detail jsonb NOT NULL,
    refund_time timestamp without time zone,
    refund_amount numeric(11,2),
    created_time timestamp without time zone NOT NULL,
    updated_time timestamp without time zone NOT NULL,
    deleted boolean DEFAULT false,
    created_by numeric(10,0) NOT NULL,
    updated_by numeric(10,0)
);
COMMENT ON COLUMN wash_product_order.product_type is '产品类型';
COMMENT ON COLUMN wash_product_order.out_trade_no is '订单编号';
COMMENT ON COLUMN wash_product_order.order_source is '订单来源';
COMMENT ON COLUMN wash_product_order.status is '订单状态  1 已支付 2 已退款 ';
COMMENT ON COLUMN wash_product_order.merchant_id is '商家ID';
COMMENT ON COLUMN wash_product_order.user_id is '用户ID';
COMMENT ON COLUMN wash_product_order.equipment_value is '设备编号';
COMMENT ON COLUMN wash_product_order.store_id is '场地ID';
COMMENT ON COLUMN wash_product_order.pay_detail is '支付详情';
COMMENT ON COLUMN wash_product_order.equipment_detail is '设备详情';
COMMENT ON COLUMN wash_product_order.product_detail is '产品详情';
COMMENT ON COLUMN wash_product_order.refund_time is '退款时间';
COMMENT ON TABLE wash_product_order is '洗水产品订单表';
CREATE INDEX wash_product_order_userid ON wash_product_order USING btree (user_id, status, product_type, created_time);
CREATE INDEX idx_wash_product_order_psctime ON wash_product_order USING btree (product_type, status, created_time DESC);
CREATE UNIQUE INDEX wash_product_order_pk ON wash_product_order USING btree (id);
CREATE INDEX idx_wash_product_order_oid ON wash_product_order USING btree (out_trade_no);
