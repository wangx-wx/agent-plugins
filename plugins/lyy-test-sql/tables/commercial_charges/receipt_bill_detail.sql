-- receipt_bill_detail
-- 库：commercial_charges
-- 业务分类：中台
-- 使用场景：查询账单明细

CREATE TABLE receipt_bill_detail (
    id bigint NOT NULL,
    receipt_bill_id bigint,
    merchant_id numeric(12,0) NOT NULL,
    merchant_type smallint DEFAULT 1,
    batch_no character varying(32) NOT NULL,
    product_id bigint,
    product_code character varying(64) NOT NULL,
    product_name character varying(64),
    product_charging_policy_id bigint,
    pay_type character varying(64),
    charge_type character varying(2) DEFAULT '2'::character varying,
    bill_start_time timestamp(6) without time zone,
    bill_end_time timestamp(6) without time zone,
    bill_close_time timestamp(6) without time zone,
    bill_deadline timestamp(6) without time zone,
    original_amount numeric(10,2) DEFAULT 0,
    discount_amount numeric(10,2) DEFAULT 0,
    receivable_amount numeric(10,2) DEFAULT 0,
    received_amount numeric(10,2) DEFAULT 0,
    owed_amount numeric(10,2) DEFAULT 0,
    refund_amount numeric(10,2),
    bill_status character varying(2) DEFAULT '1'::character varying,
    description character varying(64),
    remark character varying(64),
    created timestamp(6) without time zone NOT NULL,
    createdby numeric(10,0) NOT NULL,
    updated timestamp(6) without time zone,
    updatedby numeric(10,0)
);
COMMENT ON COLUMN receipt_bill_detail.id is '账单明细详情id';
COMMENT ON COLUMN receipt_bill_detail.receipt_bill_id is '收款账单id';
COMMENT ON COLUMN receipt_bill_detail.merchant_id is '商户id';
COMMENT ON COLUMN receipt_bill_detail.merchant_type is '商户类型 0=运营商 1=代理商';
COMMENT ON COLUMN receipt_bill_detail.batch_no is '批次号';
COMMENT ON COLUMN receipt_bill_detail.product_id is '产品id';
COMMENT ON COLUMN receipt_bill_detail.product_code is '产品code';
COMMENT ON COLUMN receipt_bill_detail.product_name is '产品名称';
COMMENT ON COLUMN receipt_bill_detail.product_charging_policy_id is '计费规则id';
COMMENT ON COLUMN receipt_bill_detail.pay_type is '支付方式 1:主动缴费,2:线下缴费,3:平台代扣,4:自动缴费,5:代理商缴费';
COMMENT ON COLUMN receipt_bill_detail.charge_type is '收费类型 1:预付费,2:后付费';
COMMENT ON COLUMN receipt_bill_detail.bill_start_time is '账单开始时间';
COMMENT ON COLUMN receipt_bill_detail.bill_end_time is '账单结束时间';
COMMENT ON COLUMN receipt_bill_detail.bill_close_time is '账单关闭时间';
COMMENT ON COLUMN receipt_bill_detail.bill_deadline is '账单截止时间';
COMMENT ON COLUMN receipt_bill_detail.original_amount is '原始金额';
COMMENT ON COLUMN receipt_bill_detail.discount_amount is '优惠金额';
COMMENT ON COLUMN receipt_bill_detail.receivable_amount is '应收金额';
COMMENT ON COLUMN receipt_bill_detail.received_amount is '实收金额';
COMMENT ON COLUMN receipt_bill_detail.owed_amount is '欠费金额';
COMMENT ON COLUMN receipt_bill_detail.refund_amount is '退款金额';
COMMENT ON COLUMN receipt_bill_detail.bill_status is '状态 0:出账中 1:已出账 2:部分结清 3:已结清';
COMMENT ON COLUMN receipt_bill_detail.description is '描述信息';
COMMENT ON COLUMN receipt_bill_detail.remark is '备注';
COMMENT ON COLUMN receipt_bill_detail.created is '创建时间';
COMMENT ON COLUMN receipt_bill_detail.createdby is '创建人';
COMMENT ON COLUMN receipt_bill_detail.updated is '更新时间';
COMMENT ON COLUMN receipt_bill_detail.updatedby is '更新人';
COMMENT ON TABLE receipt_bill_detail is '账单明细表';
CREATE UNIQUE INDEX pk_receipt_bill_detail ON receipt_bill_detail USING btree (id);
CREATE INDEX idx_receipt_bill_detail_rbi ON receipt_bill_detail USING btree (receipt_bill_id);
CREATE INDEX idx_receipt_bill_detail_mi ON receipt_bill_detail USING btree (merchant_id);
CREATE INDEX idx_receipt_bill_detail_status ON receipt_bill_detail USING btree (bill_status);
CREATE INDEX idx_receipt_bill_detail_st_et ON receipt_bill_detail USING btree (bill_start_time, bill_end_time);
