-- receipt_bill_pay_trans
-- 库：commercial_charges
-- 业务分类：中台
-- 使用场景：查询账单支付交易表

CREATE TABLE receipt_bill_pay_trans (
    id bigint NOT NULL,
    trans_no character varying(32) NOT NULL,
    merchant_id numeric(12,0) NOT NULL,
    amount numeric(10,2) DEFAULT 0,
    trans_finished_time timestamp(6) without time zone,
    pay_order_no character varying(32),
    pay_type character varying(2),
    status character varying(2) DEFAULT '1'::character varying,
    created timestamp(6) without time zone NOT NULL,
    createdby numeric(10,0) NOT NULL,
    updated timestamp(6) without time zone,
    updatedby numeric(10,0),
    remark character varying(512)
);
COMMENT ON COLUMN receipt_bill_pay_trans.id is '交易id';
COMMENT ON COLUMN receipt_bill_pay_trans.trans_no is '交易单号';
COMMENT ON COLUMN receipt_bill_pay_trans.merchant_id is '商家id';
COMMENT ON COLUMN receipt_bill_pay_trans.amount is '交易金额';
COMMENT ON COLUMN receipt_bill_pay_trans.trans_finished_time is '交易完成时间';
COMMENT ON COLUMN receipt_bill_pay_trans.pay_order_no is '账单支付渠道单号';
COMMENT ON COLUMN receipt_bill_pay_trans.pay_type is '支付方式 1:主动缴费,2:线下缴费,3:平台代扣,4:自动缴费,5:代理商缴费';
COMMENT ON COLUMN receipt_bill_pay_trans.status is '状态 1:支付中 2:已支付 3:支付失败';
COMMENT ON COLUMN receipt_bill_pay_trans.created is '创建时间';
COMMENT ON COLUMN receipt_bill_pay_trans.createdby is '创建人';
COMMENT ON COLUMN receipt_bill_pay_trans.updated is '更新时间';
COMMENT ON COLUMN receipt_bill_pay_trans.updatedby is '更新人';
COMMENT ON COLUMN receipt_bill_pay_trans.remark is '备注';
COMMENT ON TABLE receipt_bill_pay_trans is '收款账单支付交易表';
CREATE UNIQUE INDEX pk_receipt_bill_pay_trans ON receipt_bill_pay_trans USING btree (id);
CREATE INDEX idx_receipt_bill_pay_trans_mc ON receipt_bill_pay_trans USING btree (merchant_id, created);
CREATE INDEX idx_receipt_bill_pay_trans_tn ON receipt_bill_pay_trans USING btree (trans_no);
