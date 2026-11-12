-- merchant_product
-- 库：commercial_charges
-- 业务分类：中台
-- 使用场景：saas、ai经营分析账单

CREATE TABLE merchant_product (
    id bigint NOT NULL,
    merchant_id numeric(12,0) NOT NULL,
    merchant_type smallint DEFAULT 1,
    product_code character varying(64) NOT NULL,
    product_id bigint NOT NULL,
    policy_type character varying(2) NOT NULL,
    pre_notice_date date,
    func_downgrade_date date,
    auto_pay_style character varying(64),
    auto_pay character varying(2) NOT NULL,
    renewal_status character varying(2) DEFAULT '0'::character varying,
    status character varying(2) DEFAULT '0'::character varying,
    created timestamp(6) without time zone NOT NULL,
    createdby numeric(10,0) NOT NULL,
    updated timestamp(6) without time zone,
    updatedby numeric(10,0),
    remark character varying(512),
    account_id numeric(12,0),
    enjoy_service_account_id numeric(12,0),
    experience_end_time timestamp without time zone,
    subscribe_start_time timestamp without time zone,
    service_end_time timestamp without time zone,
    subscribe_end_time timestamp without time zone,
    func_config jsonb,
    product_config jsonb,
    max_bill_end_time timestamp without time zone,
    extend_info jsonb
);
COMMENT ON COLUMN merchant_product.id is 'id';
COMMENT ON COLUMN merchant_product.merchant_id is '商家id';
COMMENT ON COLUMN merchant_product.merchant_type is '商户类型 0:运营商 1:代理商';
COMMENT ON COLUMN merchant_product.product_code is '产品编码';
COMMENT ON COLUMN merchant_product.product_id is '产品id';
COMMENT ON COLUMN merchant_product.policy_type is '计费规则类型';
COMMENT ON COLUMN merchant_product.pre_notice_date is '提醒日期';
COMMENT ON COLUMN merchant_product.func_downgrade_date is '功能降级日期';
COMMENT ON COLUMN merchant_product.auto_pay_style is '自动扣款方式';
COMMENT ON COLUMN merchant_product.auto_pay is '自动扣费:0:是 1:否';
COMMENT ON COLUMN merchant_product.renewal_status is '续费状态 0:续费成功 1:续费失败 2:续费失败功能降级';
COMMENT ON COLUMN merchant_product.status is '状态 0:使用中 1:自然终止 2:主动终止';
COMMENT ON COLUMN merchant_product.created is '创建时间';
COMMENT ON COLUMN merchant_product.createdby is '创建人';
COMMENT ON COLUMN merchant_product.updated is '更新时间';
COMMENT ON COLUMN merchant_product.updatedby is '更新人';
COMMENT ON COLUMN merchant_product.remark is '备注';
COMMENT ON COLUMN merchant_product.account_id is '订阅账号id';
COMMENT ON COLUMN merchant_product.enjoy_service_account_id is '享受服务账号id';
COMMENT ON COLUMN merchant_product.experience_end_time is '体验结束时间';
COMMENT ON COLUMN merchant_product.subscribe_start_time is '订阅开始时间';
COMMENT ON COLUMN merchant_product.service_end_time is '服务结束时间';
COMMENT ON COLUMN merchant_product.subscribe_end_time is '订阅结束时间';
COMMENT ON COLUMN merchant_product.func_config is '服务功能配置';
COMMENT ON COLUMN merchant_product.product_config is '产品配置';
COMMENT ON COLUMN merchant_product.max_bill_end_time is '最大账单账期结束时间';
COMMENT ON COLUMN merchant_product.extend_info is '扩展信息，autoGray:自动转企业版，fallbackNormal:恢复普通版';
COMMENT ON TABLE merchant_product is '商家产品表';
CREATE UNIQUE INDEX pk_merchant_product ON merchant_product USING btree (id);
CREATE INDEX idx_merchant_product_mp ON merchant_product USING btree (merchant_id, product_code);
CREATE INDEX idx_merchant_product_pnd ON merchant_product USING btree (pre_notice_date);
CREATE INDEX idx_merchant_product_rpi ON merchant_product USING btree (product_id);
