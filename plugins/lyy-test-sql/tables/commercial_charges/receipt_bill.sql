-- receipt_bill
-- 库：commercial_charges
-- 业务分类：中台
-- 使用场景：saas、ai经营分析收款账单

CREATE TABLE receipt_bill (
    id bigint NOT NULL,
    merchant_id numeric(12,0) NOT NULL,
    merchant_type smallint DEFAULT 1,
    charge_type character varying(2) DEFAULT '2'::character varying,
    pay_type character varying(64) NOT NULL,
    product_code character varying(64),
    status character varying(2) DEFAULT '1'::character varying,
    close_time timestamp(6) without time zone,
    settlement_completed_time timestamp(6) without time zone,
    receivable_amount numeric(10,2) DEFAULT 0,
    received_amount numeric(10,2) DEFAULT 0,
    owed_amount numeric(10,2) DEFAULT 0,
    refund_amount numeric(10,2) DEFAULT 0,
    refund_status character varying(2) NOT NULL DEFAULT '1'::character varying,
    sort smallint DEFAULT 0,
    bill_payment_start_time timestamp(6) without time zone,
    created timestamp(6) without time zone NOT NULL,
    createdby numeric(10,0) NOT NULL,
    updated timestamp(6) without time zone,
    updatedby numeric(10,0),
    account_id numeric(12,0),
    merchant_product_id numeric(12,0),
    marketing_config jsonb,
    func_config jsonb
);
COMMENT ON COLUMN receipt_bill.id is '收款账单id';
COMMENT ON COLUMN receipt_bill.merchant_id is '商户id';
COMMENT ON COLUMN receipt_bill.merchant_type is '商户类型 0=运营商 1=代理商';
COMMENT ON COLUMN receipt_bill.charge_type is '收费类型 1:预付费,2:后付费';
COMMENT ON COLUMN receipt_bill.pay_type is '支付方式 1:主动缴费,2:线下缴费,3:平台代扣,4:自动缴费,5:代理商缴费';
COMMENT ON COLUMN receipt_bill.product_code is '产品编码';
COMMENT ON COLUMN receipt_bill.status is '状态 1:已出账 2:部分结清 3:已结清';
COMMENT ON COLUMN receipt_bill.close_time is '账单关闭时间';
COMMENT ON COLUMN receipt_bill.settlement_completed_time is '账单结清时间';
COMMENT ON COLUMN receipt_bill.receivable_amount is '应收金额';
COMMENT ON COLUMN receipt_bill.received_amount is '实收金额';
COMMENT ON COLUMN receipt_bill.owed_amount is '欠费金额';
COMMENT ON COLUMN receipt_bill.refund_amount is '退款金额';
COMMENT ON COLUMN receipt_bill.refund_status is '退款状态 1未退款 2部分退款 3已退款';
COMMENT ON COLUMN receipt_bill.sort is '扣款优先级，数值越小越优先';
COMMENT ON COLUMN receipt_bill.bill_payment_start_time is '账单缴费开始时间';
COMMENT ON COLUMN receipt_bill.created is '创建时间';
COMMENT ON COLUMN receipt_bill.createdby is '创建人';
COMMENT ON COLUMN receipt_bill.updated is '更新时间';
COMMENT ON COLUMN receipt_bill.updatedby is '更新人';
COMMENT ON COLUMN receipt_bill.account_id is '账号id';
COMMENT ON COLUMN receipt_bill.merchant_product_id is '商家产品记录id';
COMMENT ON COLUMN receipt_bill.marketing_config is '营销配置';
COMMENT ON COLUMN receipt_bill.func_config is '服务功能配置';
COMMENT ON TABLE receipt_bill is '收款账单表';
CREATE UNIQUE INDEX pk_receipt_bill ON receipt_bill USING btree (id);
CREATE INDEX idx_receipt_bill_mi ON receipt_bill USING btree (merchant_id);
CREATE INDEX idx_receipt_bill_status ON receipt_bill USING btree (status);
CREATE INDEX idx_receipt_bill_ct_pt ON receipt_bill USING btree (charge_type, pay_type);
CREATE INDEX receipt_bill_merchant_product_id_idx ON receipt_bill USING btree (merchant_product_id);
