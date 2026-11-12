-- experience_merchant_list
-- 库：master
-- 业务分类：支付
-- 使用场景：查体验期

CREATE TABLE adempiere.experience_merchant_list (
    experience_merchant_list_id integer NOT NULL,
    ad_org_id numeric(11,0) NOT NULL,
    ad_org_value character varying(40),
    app_id character varying(60),
    lyy_swiftpass_merchant_id numeric(11,0) NOT NULL,
    submit_entry_time timestamp(6) without time zone NOT NULL,
    created timestamp(6) without time zone,
    updated timestamp(6) without time zone,
    created_by numeric(12,0),
    updated_by numeric(12,0),
    is_active boolean,
    workday smallint,
    open_time timestamp(6) without time zone,
    channel_code smallint,
    close_time timestamp(6) without time zone,
    effective_time_end timestamp(6) without time zone,
    merchant_name character varying(60),
    merchant_code character varying(60),
    remark character varying(255),
    real_name_show_dialog smallint,
    status smallint,
    expire_notice_day smallint DEFAULT 7,
    support_group_divide boolean,
    ignore_real_name_codes character varying(128),
    support_client_check boolean,
    wechat_client_status smallint,
    alipay_client_status smallint
);
COMMENT ON COLUMN adempiere.experience_merchant_list.experience_merchant_list_id is 'id';
COMMENT ON COLUMN adempiere.experience_merchant_list.ad_org_id is '运营商id';
COMMENT ON COLUMN adempiere.experience_merchant_list.ad_org_value is '运营商账号';
COMMENT ON COLUMN adempiere.experience_merchant_list.app_id is 'app_id';
COMMENT ON COLUMN adempiere.experience_merchant_list.lyy_swiftpass_merchant_id is '商户资料id';
COMMENT ON COLUMN adempiere.experience_merchant_list.submit_entry_time is '提交进件时间';
COMMENT ON COLUMN adempiere.experience_merchant_list.workday is '工作日';
COMMENT ON COLUMN adempiere.experience_merchant_list.open_time is '体验期开启时间';
COMMENT ON COLUMN adempiere.experience_merchant_list.channel_code is '渠道code 4-汇付(已废弃)';
COMMENT ON COLUMN adempiere.experience_merchant_list.close_time is '体验期关闭时间';
COMMENT ON COLUMN adempiere.experience_merchant_list.effective_time_end is '有效期结束时间';
COMMENT ON COLUMN adempiere.experience_merchant_list.merchant_name is '商户全称';
COMMENT ON COLUMN adempiere.experience_merchant_list.merchant_code is '渠道商户号(已废弃)';
COMMENT ON COLUMN adempiere.experience_merchant_list.remark is '备注';
COMMENT ON COLUMN adempiere.experience_merchant_list.real_name_show_dialog is '实名弹窗 0-不弹窗  1-弹窗';
COMMENT ON COLUMN adempiere.experience_merchant_list.status is '状态 0 初始 1 有效 2-失效';
COMMENT ON COLUMN adempiere.experience_merchant_list.expire_notice_day is '过期通知天数';
COMMENT ON COLUMN adempiere.experience_merchant_list.support_group_divide is '是否支持场地分账（v4.0 新增）。TRUE=走 MerchantGroupDivideRule 新链路；FALSE/NULL=走 ExperienceMerchantDivideRule 旧链路（默认）。NULL 表示从未开启过。';
COMMENT ON COLUMN adempiere.experience_merchant_list.ignore_real_name_codes is '体验期关闭时忽略实名的渠道编码，多个渠道用英文逗号分隔';
COMMENT ON COLUMN adempiere.experience_merchant_list.support_client_check is '是否支持支付端检查体验期';
COMMENT ON COLUMN adempiere.experience_merchant_list.wechat_client_status is '微信端是否在体验期 0=否 1=是';
COMMENT ON COLUMN adempiere.experience_merchant_list.alipay_client_status is '支付宝端是否在体验期 0=否 1=是';
COMMENT ON TABLE adempiere.experience_merchant_list is '体验期商户清单';
CREATE UNIQUE INDEX experience_merchant_list_pkey ON adempiere.experience_merchant_list USING btree (experience_merchant_list_id);
CREATE INDEX experience_merchant_list_ad_org_id_idx ON adempiere.experience_merchant_list USING btree (ad_org_id);
CREATE UNIQUE INDEX experience_merchant_list_ad_org_id_swiftpass_merchant_id_idx ON adempiere.experience_merchant_list USING btree (ad_org_id, lyy_swiftpass_merchant_id);
