-- receipt_bill_refund_trans_detail
-- 库：commercial_charges
-- 业务分类：中台
-- 使用场景：账单退款明细表

CREATE TABLE receipt_bill_refund_trans_detail (
    id bigint NOT NULL,
    receipt_bill_refund_trans_id bigint NOT NULL,
    receipt_bill_id bigint NOT NULL,
    receipt_bill_detail_id bigint NOT NULL,
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
COMMENT ON COLUMN receipt_bill_refund_trans_detail.id is '交易id';
COMMENT ON COLUMN receipt_bill_refund_trans_detail.receipt_bill_refund_trans_id is '收款账单退款id';
COMMENT ON COLUMN receipt_bill_refund_trans_detail.receipt_bill_id is '收款账单id';
COMMENT ON COLUMN receipt_bill_refund_trans_detail.receipt_bill_detail_id is '收款账单详情id';
COMMENT ON COLUMN receipt_bill_refund_trans_detail.refund_no is '退款单号';
COMMENT ON COLUMN receipt_bill_refund_trans_detail.merchant_id is '商家id';
COMMENT ON COLUMN receipt_bill_refund_trans_detail.refund_amount is '退款金额';
COMMENT ON COLUMN receipt_bill_refund_trans_detail.finished_time is '完成时间';
COMMENT ON COLUMN receipt_bill_refund_trans_detail.trans_no is '交易单号';
COMMENT ON COLUMN receipt_bill_refund_trans_detail.status is '状态 1:退款中 2:已退款 3:退款失败';
COMMENT ON COLUMN receipt_bill_refund_trans_detail.created is '创建时间';
COMMENT ON COLUMN receipt_bill_refund_trans_detail.createdby is '创建人';
COMMENT ON COLUMN receipt_bill_refund_trans_detail.updated is '更新时间';
COMMENT ON COLUMN receipt_bill_refund_trans_detail.updatedby is '更新人';
COMMENT ON COLUMN receipt_bill_refund_trans_detail.remark is '备注';
COMMENT ON COLUMN receipt_bill_refund_trans_detail.refund_type is '退款类型 1订单退款 2手动退款';
COMMENT ON TABLE receipt_bill_refund_trans_detail is '收款账单退款交易明细表';
CREATE UNIQUE INDEX pk_receipt_bill_refund_trans_detail ON receipt_bill_refund_trans_detail USING btree (id);
CREATE INDEX idx_receipt_bill_refund_trans_detail_mc ON receipt_bill_refund_trans_detail USING btree (merchant_id, created);
CREATE INDEX idx_receipt_bill_refund_trans_detail_rbi ON receipt_bill_refund_trans_detail USING btree (receipt_bill_id);
CREATE INDEX idx_receipt_bill_refund_trans_detail_rbdi ON receipt_bill_refund_trans_detail USING btree (receipt_bill_detail_id);
CREATE INDEX idx_receipt_bill_refund_trans_detail_tn ON receipt_bill_refund_trans_detail USING btree (trans_no);
