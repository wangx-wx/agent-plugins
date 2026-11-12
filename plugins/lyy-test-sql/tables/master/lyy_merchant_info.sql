-- lyy_merchant_info
-- 库：master
-- 业务分类：支付
-- 使用场景：查商户信息

CREATE TABLE adempiere.lyy_merchant_info (
    lyy_merchant_info_id numeric(10,0) NOT NULL,
    merchant_code character varying(255) NOT NULL,
    ad_org_id numeric(10,0) NOT NULL,
    channel_code smallint NOT NULL,
    goods_type_code character varying(32),
    open_pay_type jsonb,
    fee_rate double precision NOT NULL,
    status smallint NOT NULL DEFAULT 1,
    created timestamp(6) without time zone,
    updated timestamp(6) without time zone,
    remark character varying(255),
    support_client_type jsonb,
    divide_type smallint NOT NULL DEFAULT 0,
    settlement_type smallint DEFAULT 0,
    real_name_status smallint DEFAULT 0,
    lyy_swiftpass_merchant_id numeric(10,0),
    alipay_real_name_status smallint DEFAULT 0,
    settlement_period smallint,
    channel_entry_type smallint,
    common_extend jsonb
);
COMMENT ON COLUMN adempiere.lyy_merchant_info.lyy_merchant_info_id is '主键';
COMMENT ON COLUMN adempiere.lyy_merchant_info.merchant_code is '进件后颁发的商户code';
COMMENT ON COLUMN adempiere.lyy_merchant_info.ad_org_id is '商户id';
COMMENT ON COLUMN adempiere.lyy_merchant_info.channel_code is '渠道code 1:威富通;2:富友;3:网商;4:云闪付';
COMMENT ON COLUMN adempiere.lyy_merchant_info.goods_type_code is '商品类型code，兼容有设备的和无设备的';
COMMENT ON COLUMN adempiere.lyy_merchant_info.open_pay_type is '开通的支付类型 0:未开通，1:已开通无子商户号，其他值:已开通该值为商户号，微信(WechatPay)、支付宝(AliPay)、小程序(WechatMiniPay)、云闪付(UnionPay)子商户id';
COMMENT ON COLUMN adempiere.lyy_merchant_info.fee_rate is '进件费率';
COMMENT ON COLUMN adempiere.lyy_merchant_info.status is '商户状态枚举 1:正常;2:冻结(可解冻使用);3:禁用(永久不可用)';
COMMENT ON COLUMN adempiere.lyy_merchant_info.created is '创建时间';
COMMENT ON COLUMN adempiere.lyy_merchant_info.updated is '修改时间';
COMMENT ON COLUMN adempiere.lyy_merchant_info.remark is '备注';
COMMENT ON COLUMN adempiere.lyy_merchant_info.support_client_type is '支持的客户端类型';
COMMENT ON COLUMN adempiere.lyy_merchant_info.divide_type is '分账属性类型,0:无分账权限 1:有分账权限 2:有但暂停分账权限';
COMMENT ON COLUMN adempiere.lyy_merchant_info.settlement_type is '1正常结算 2延迟结算';
COMMENT ON COLUMN adempiere.lyy_merchant_info.real_name_status is '是否已实名认证 0:未实名 1已实名';
COMMENT ON COLUMN adempiere.lyy_merchant_info.alipay_real_name_status is '支付宝是否已实名认证 0:未实名 1已实名';
COMMENT ON COLUMN adempiere.lyy_merchant_info.settlement_period is '结算周期,默认D+1 0:手动 1:D+1';
COMMENT ON COLUMN adempiere.lyy_merchant_info.channel_entry_type is '渠道进件类型 1=商户进件 2=用户进件';
COMMENT ON COLUMN adempiere.lyy_merchant_info.common_extend is '扩展字段';
COMMENT ON TABLE adempiere.lyy_merchant_info is '进件后的商户表';
CREATE UNIQUE INDEX lyy_merchant_info_pkey ON adempiere.lyy_merchant_info USING btree (lyy_merchant_info_id);
CREATE INDEX lyy_merchant_info_merchant_code_idx1 ON adempiere.lyy_merchant_info USING btree (merchant_code varchar_pattern_ops);
CREATE UNIQUE INDEX lyy_merchant_info_org_code_channel ON adempiere.lyy_merchant_info USING btree (ad_org_id, merchant_code, channel_code);
CREATE INDEX lyy_merchant_info_org_id_status_idx ON adempiere.lyy_merchant_info USING btree (ad_org_id, status);
CREATE INDEX idx_lyy_merchant_info_updated ON adempiere.lyy_merchant_info USING btree (updated);
CREATE INDEX idx_lyy_merchant_info_sid_ccode ON adempiere.lyy_merchant_info USING btree (lyy_swiftpass_merchant_id, channel_code);
