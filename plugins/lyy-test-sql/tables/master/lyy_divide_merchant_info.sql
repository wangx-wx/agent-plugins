-- lyy_divide_merchant_info
-- 库：master
-- 业务分类：支付
-- 使用场景：查分账用户信息

CREATE TABLE adempiere.lyy_divide_merchant_info (
    id bigint NOT NULL,
    ad_org_id bigint NOT NULL,
    lyy_swiftpass_merchant_id bigint,
    merchant_code character varying(64),
    channel_code smallint NOT NULL,
    channel_parent_merchant_code character varying(64),
    channel_data jsonb,
    status integer NOT NULL,
    deleted integer DEFAULT 0,
    create_time timestamp without time zone,
    create_by bigint,
    update_time timestamp without time zone,
    update_by bigint,
    auto_settle character varying(30),
    withdraw_default boolean
);
COMMENT ON COLUMN adempiere.lyy_divide_merchant_info.id is '主键';
COMMENT ON COLUMN adempiere.lyy_divide_merchant_info.ad_org_id is '分成方商户ID';
COMMENT ON COLUMN adempiere.lyy_divide_merchant_info.lyy_swiftpass_merchant_id is '资料ID';
COMMENT ON COLUMN adempiere.lyy_divide_merchant_info.merchant_code is '分成方商户号';
COMMENT ON COLUMN adempiere.lyy_divide_merchant_info.channel_code is '渠道编号';
COMMENT ON COLUMN adempiere.lyy_divide_merchant_info.channel_parent_merchant_code is '渠道父级商户号或代理商号';
COMMENT ON COLUMN adempiere.lyy_divide_merchant_info.channel_data is '渠道商户号附加数据';
COMMENT ON COLUMN adempiere.lyy_divide_merchant_info.status is '状态 1-正常 其他不可用';
COMMENT ON COLUMN adempiere.lyy_divide_merchant_info.deleted is '逻辑删除 1-删除 0-未删除';
COMMENT ON COLUMN adempiere.lyy_divide_merchant_info.create_time is '创建时间';
COMMENT ON COLUMN adempiere.lyy_divide_merchant_info.create_by is '创建人';
COMMENT ON COLUMN adempiere.lyy_divide_merchant_info.update_time is '修改时间';
COMMENT ON COLUMN adempiere.lyy_divide_merchant_info.update_by is '修改人';
COMMENT ON COLUMN adempiere.lyy_divide_merchant_info.auto_settle is '结算类型 auto:自动结算 manual:手动结算';
COMMENT ON COLUMN adempiere.lyy_divide_merchant_info.withdraw_default is 'true-是 false-否';
 
CREATE UNIQUE INDEX lyy_divide_merchant_info_pk ON adempiere.lyy_divide_merchant_info USING btree (id);
CREATE INDEX idx_lyy_divide_merchant_info_ad_org_id ON adempiere.lyy_divide_merchant_info USING btree (ad_org_id);
CREATE UNIQUE INDEX uidx_lyy_divide_merchant_info_alcpa ON adempiere.lyy_divide_merchant_info USING btree (ad_org_id, lyy_swiftpass_merchant_id, channel_code, channel_parent_merchant_code, auto_settle);
