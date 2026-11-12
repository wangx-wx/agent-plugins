-- lyy_payment
-- 库：master
-- 业务分类：支付
-- 使用场景：查提现情况

CREATE TABLE adempiere.lyy_payment (
    lyy_payment_id numeric(10,0) NOT NULL,
    payto_org_id numeric(10,0),
    documentno character varying(30),
    docaction character varying(2),
    c_doctype_id character varying(10),
    processed character(1),
    docstatus character varying(30),
    status character varying(16) NOT NULL,
    description character varying(255),
    ad_org_id numeric(10,0) NOT NULL,
    ad_client_id numeric(10,0) NOT NULL,
    isactive character(1) NOT NULL,
    created timestamp without time zone NOT NULL,
    createdby numeric(10,0) NOT NULL,
    updated timestamp without time zone NOT NULL,
    updatedby numeric(10,0) NOT NULL,
    payment_date timestamp without time zone,
    amount numeric(8,2) NOT NULL,
    payment_type character(1) DEFAULT NULL::bpchar,
    wx_billno character varying(64) DEFAULT NULL::character varying,
    service_fee numeric,
    actual_pay numeric,
    bank_name character varying(60) DEFAULT NULL::character varying,
    type character(1) DEFAULT '1'::bpchar,
    source_type smallint,
    pay_channel_id numeric(10,0),
    receive_account character varying(64),
    receive_name character varying(64),
    remark character varying(255),
    transfer_remark character varying(64),
    channel_code smallint,
    merchant_code character varying(255),
    receive_org_id numeric(11,0),
    receive_org_type character varying(10),
    settle_no character varying(64),
    receive_identity_type character varying(36),
    transfer_account character varying(64),
    check_query_count smallint,
    wallet_id numeric(12,0) DEFAULT NULL::numeric,
    wallet_account_name character varying(64) DEFAULT NULL::character varying,
    wallet_uid bigint,
    receive_card_id bigint,
    withdraw_method smallint,
    batch_no character varying(64),
    common_extend jsonb,
    transfer_settlement_type character varying(32),
    funding_disburse_type smallint,
    payment_no character varying(32),
    withdraw_payment_no character varying(32),
    FOREIGN KEY (payto_org_id) REFERENCES ad_org(ad_org_id) ON UPDATE RESTRICT ON DELETE RESTRICT
);
COMMENT ON COLUMN adempiere.lyy_payment.lyy_payment_id is '主键id';
COMMENT ON COLUMN adempiere.lyy_payment.payto_org_id is '提现商家';
COMMENT ON COLUMN adempiere.lyy_payment.documentno is '提现单号';
COMMENT ON COLUMN adempiere.lyy_payment.docaction is '废弃';
COMMENT ON COLUMN adempiere.lyy_payment.c_doctype_id is '废弃';
COMMENT ON COLUMN adempiere.lyy_payment.processed is '废弃';
COMMENT ON COLUMN adempiere.lyy_payment.docstatus is '废弃';
COMMENT ON COLUMN adempiere.lyy_payment.status is 'Apply-初始 Finished-成功 Refuse-已拒绝';
COMMENT ON COLUMN adempiere.lyy_payment.description is '描述';
COMMENT ON COLUMN adempiere.lyy_payment.ad_org_id is '废弃';
COMMENT ON COLUMN adempiere.lyy_payment.payment_date is '提现成功时间';
COMMENT ON COLUMN adempiere.lyy_payment.amount is '提现金额';
COMMENT ON COLUMN adempiere.lyy_payment.payment_type is 'A-支付宝 B-银行卡 W-微信';
COMMENT ON COLUMN adempiere.lyy_payment.wx_billno is '微信单号';
COMMENT ON COLUMN adempiere.lyy_payment.service_fee is '手续费';
COMMENT ON COLUMN adempiere.lyy_payment.actual_pay is '实际到账金额';
COMMENT ON COLUMN adempiere.lyy_payment.bank_name is '银行名称';
COMMENT ON COLUMN adempiere.lyy_payment.type is '1:支付收益 2:广告收益 3:电子秤的收益 4:二清支付收益';
COMMENT ON COLUMN adempiere.lyy_payment.source_type is '申请单来源类型,空或1:商户申请 2:签署协议后自动生成 3:人工导出 4:人工导入';
COMMENT ON COLUMN adempiere.lyy_payment.pay_channel_id is '打款渠道id';
COMMENT ON COLUMN adempiere.lyy_payment.receive_account is '收款人账号,可以是openId 支付宝账号  银行卡号';
COMMENT ON COLUMN adempiere.lyy_payment.receive_name is '收款人姓名';
COMMENT ON COLUMN adempiere.lyy_payment.remark is '说明';
COMMENT ON COLUMN adempiere.lyy_payment.transfer_remark is '转账备注,送往微信或支付宝或银联';
COMMENT ON COLUMN adempiere.lyy_payment.channel_code is '渠道编号';
COMMENT ON COLUMN adempiere.lyy_payment.merchant_code is '渠道商户号';
COMMENT ON COLUMN adempiere.lyy_payment.receive_org_id is '收款人商户ID';
COMMENT ON COLUMN adempiere.lyy_payment.receive_org_type is '收款人类型 空默认主商户,DIV:分成方';
COMMENT ON COLUMN adempiere.lyy_payment.settle_no is '结算单号 type=4时有值';
COMMENT ON COLUMN adempiere.lyy_payment.receive_identity_type is '接收方身份类型 支付宝的会员ID=ALIPAY_USER_ID，支付宝登录号=ALIPAY_LOGON_ID 支付宝openid=ALIPAY_OPEN_ID 微信openId=WECHAT_OPEN_ID 银行卡=BANK_CARD_NO';
COMMENT ON COLUMN adempiere.lyy_payment.transfer_account is '付款账号';
COMMENT ON COLUMN adempiere.lyy_payment.check_query_count is '回查次数';
COMMENT ON COLUMN adempiere.lyy_payment.wallet_id is '钱包id';
COMMENT ON COLUMN adempiere.lyy_payment.wallet_account_name is '钱包名称';
COMMENT ON COLUMN adempiere.lyy_payment.wallet_uid is '钱包用户id';
COMMENT ON COLUMN adempiere.lyy_payment.receive_card_id is '收款人资料id';
COMMENT ON COLUMN adempiere.lyy_payment.withdraw_method is '1-自动提现 2-手动提现  默认1';
COMMENT ON COLUMN adempiere.lyy_payment.batch_no is '提现批次号';
COMMENT ON COLUMN adempiere.lyy_payment.common_extend is '通用扩展信息';
COMMENT ON COLUMN adempiere.lyy_payment.transfer_settlement_type is '付款类型：FLEXIBLE_EMPLOYMENT-灵活用工 / WECHAT_TO_BALANCE-微信转账到余额 / ALIPAY_TO_BALANCE-支付宝转账到余额 / ALIPAY_TO_BANKCARD-支付宝转账到银行卡 / GLOBAL_FUND_PAYMENT-全域资金付款 / BALANCE_PAY-余额支付 / DM_WITHDRAW-dm取现';
COMMENT ON COLUMN adempiere.lyy_payment.funding_disburse_type is '资金拨付类型 1-仅付款 2-仅提现 3-付款+提现';
COMMENT ON COLUMN adempiere.lyy_payment.payment_no is '关联付款单号（类型1/3 时指向 clearing_payment_record.payment_no，类型2 时为 null）';
COMMENT ON COLUMN adempiere.lyy_payment.withdraw_payment_no is '提现单号（WD 前缀，类型2/3 时有值，类型1 时为 null）';
COMMENT ON TABLE adempiere.lyy_payment is '提现记录表';
CREATE UNIQUE INDEX pk_lyy_payment ON adempiere.lyy_payment USING btree (lyy_payment_id);
CREATE INDEX lyy_payment_payto_org_status_idx ON adempiere.lyy_payment USING btree (payto_org_id, status);
CREATE INDEX lyy_payment_wx_billno_idx ON adempiere.lyy_payment USING btree (wx_billno);
CREATE INDEX lyy_payment_idx_settle_no ON adempiere.lyy_payment USING btree (settle_no);
CREATE INDEX lyy_payment_idx_created ON adempiere.lyy_payment USING btree (created);
CREATE INDEX lyy_payment_idx_batch_no ON adempiere.lyy_payment USING btree (batch_no);
