-- receipt_bill_refund_trans
-- 库：commercial_charges
-- 业务分类：中台
-- 使用场景：账单退款表

CREATE TABLE receipt_bill_refund_trans (
    id bigint NOT NULL,
    refund_no character varying(32) NOT NULL,
    merchant_id numeric(12,0) NOT NULL,
    refund_amount numeric(10,2) DEFAULT 0,
    finished_time timestamp(6) without time zone,
    trans_no character varying(32),
    status character varying(2) DEFAULT '1'::character varying,
    created timestamp(6) without time zone NOT NULL,
    createdby numeric(10,0) NOT NULL,
    updated timestamp(6) without time zone,
    updatedby numeric(10,0),
    remark character varying(512),
    refund_type character varying(64)
);
COMMENT ON COLUMN receipt_bill_refund_trans.id is '交易id';
COMMENT ON COLUMN receipt_bill_refund_trans.refund_no is '退款单号';
COMMENT ON COLUMN receipt_bill_refund_trans.merchant_id is '商家id';
COMMENT ON COLUMN receipt_bill_refund_trans.refund_amount is '退款金额';
COMMENT ON COLUMN receipt_bill_refund_trans.finished_time is '交易完成时间';
COMMENT ON COLUMN receipt_bill_refund_trans.trans_no is '交易单号';
COMMENT ON COLUMN receipt_bill_refund_trans.status is '状态 1:退款中 2:已退款 3:退款失败';
COMMENT ON COLUMN receipt_bill_refund_trans.created is '创建时间';
COMMENT ON COLUMN receipt_bill_refund_trans.createdby is '创建人';
COMMENT ON COLUMN receipt_bill_refund_trans.updated is '更新时间';
COMMENT ON COLUMN receipt_bill_refund_trans.updatedby is '更新人';
COMMENT ON COLUMN receipt_bill_refund_trans.remark is '备注';
COMMENT ON COLUMN receipt_bill_refund_trans.refund_type is '退款类型 1订单退款 2手动退款';
COMMENT ON TABLE receipt_bill_refund_trans is '收款账单退款交易表';
CREATE UNIQUE INDEX pk_receipt_bill_refund_trans ON receipt_bill_refund_trans USING btree (id);
CREATE INDEX idx_receipt_bill_refund_trans_mc ON receipt_bill_refund_trans USING btree (merchant_id, created);
CREATE INDEX idx_receipt_bill_refund_trans_tn ON receipt_bill_refund_trans USING btree (trans_no);
CREATE INDEX idx_receipt_bill_refund_trans_rn ON receipt_bill_refund_trans USING btree (refund_no);
