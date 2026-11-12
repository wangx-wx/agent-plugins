-- ad_org
-- 库：master
-- 业务分类：充电桩
-- 使用场景：查询商家ID

CREATE TABLE adempiere.ad_org (
    ad_org_id numeric(10,0) NOT NULL,
    ad_client_id numeric(10,0) NOT NULL,
    isactive character(1) NOT NULL DEFAULT 'Y'::bpchar,
    created timestamp without time zone NOT NULL DEFAULT now(),
    createdby numeric(12,0) NOT NULL,
    updated timestamp without time zone NOT NULL DEFAULT now(),
    updatedby numeric(12,0) NOT NULL,
    value character varying(40) NOT NULL,
    name character varying(60) NOT NULL,
    description character varying(255),
    issummary character(1) NOT NULL DEFAULT 'N'::bpchar,
    ad_replicationstrategy_id numeric(10,0),
    is_internal_orders_enabled character(1) DEFAULT 'N'::bpchar,
    c_bpartner_id numeric(10,0),
    balance numeric(10,2),
    total numeric(12,2),
    address character varying(256),
    alipay_account character varying(40),
    card_holder character varying(30),
    bank_account character varying(60),
    bank_name character varying(30),
    sub_bank character varying(250),
    type character varying(2) NOT NULL DEFAULT NULL::bpchar,
    default_price numeric,
    alipay_name character varying(20) DEFAULT NULL::character varying,
    cooperation_mode character varying(6) DEFAULT NULL::character varying,
    contact character varying(64) DEFAULT NULL::character varying,
    telephone character varying(21) DEFAULT NULL::character varying,
    lyy_staff_id numeric(10,0) DEFAULT NULL::numeric,
    lyy_district_id numeric(10,0) DEFAULT NULL::numeric,
    has_income character(1) DEFAULT NULL::bpchar,
    sub_total numeric DEFAULT '0'::numeric,
    sub_merchant character(1) DEFAULT 'N'::bpchar,
    merchant_number character varying(16) DEFAULT NULL::character varying,
    sub_created timestamp without time zone,
    api_key character varying(60) DEFAULT NULL::character varying,
    secret_key character varying(60) DEFAULT NULL::character varying,
    cib_total numeric DEFAULT '0'::numeric,
    cib_merchant character(1) DEFAULT 'N'::bpchar,
    cib_number character varying(16) DEFAULT NULL::character varying,
    cib_key character varying(32) DEFAULT NULL::character varying,
    cib_created timestamp without time zone,
    isadvertise character(1) DEFAULT 'Y'::bpchar,
    min_ad_price numeric DEFAULT 0.6,
    min_equipment_count numeric(10,0) DEFAULT '300'::numeric,
    ad_percent numeric DEFAULT 0.1,
    customer_service_number character varying(20),
    business_name character varying(50),
    default_discount numeric(10,2) DEFAULT 10,
    agent_number character varying(20),
    can_owe character(1),
    can_owe_fee numeric(10,2),
    agent_id numeric(10,0),
    advert_price numeric(10,2),
    distributorpart numeric(10,2),
    is_member_card_enable character(1) DEFAULT 'Y'::bpchar,
    avatar character varying(255),
    third_pay_service_code character varying(255),
    wechat_pay_flag character(1) DEFAULT 'N'::bpchar,
    ispopadwindow character(1) DEFAULT 'N'::bpchar,
    isopenintegral character(1),
    balance_alias character(3),
    cib_balance numeric DEFAULT '0'::numeric,
    country_code character varying(8) NOT NULL DEFAULT 'CN'::character varying,
    wechat_facepay_sign_flag character(1),
    allow_pay numeric(1,0) DEFAULT 0,
    platform_user_id numeric(10,0),
    app_id character varying(64),
    merchant_logo character varying(255),
    FOREIGN KEY (ad_replicationstrategy_id) REFERENCES ad_replicationstrategy(ad_replicationstrategy_id) DEFERRABLE INITIALLY DEFERRED,
    CHECK ((has_income = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CHECK ((isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CHECK ((isadvertise = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CHECK ((sub_merchant = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    FOREIGN KEY (ad_client_id) REFERENCES ad_client(ad_client_id) DEFERRABLE INITIALLY DEFERRED,
    UNIQUE (value)
);
COMMENT ON COLUMN adempiere.ad_org.ad_org_id is '主键id';
COMMENT ON COLUMN adempiere.ad_org.value is '编号';
COMMENT ON COLUMN adempiere.ad_org.name is '名称';
COMMENT ON COLUMN adempiere.ad_org.description is '备注';
COMMENT ON COLUMN adempiere.ad_org.issummary is '没用';
COMMENT ON COLUMN adempiere.ad_org.ad_replicationstrategy_id is '没用';
COMMENT ON COLUMN adempiere.ad_org.is_internal_orders_enabled is '没用';
COMMENT ON COLUMN adempiere.ad_org.c_bpartner_id is '没用';
COMMENT ON COLUMN adempiere.ad_org.balance is '收益余额';
COMMENT ON COLUMN adempiere.ad_org.total is '收益总额';
COMMENT ON COLUMN adempiere.ad_org.address is '没用';
COMMENT ON COLUMN adempiere.ad_org.alipay_account is '没用';
COMMENT ON COLUMN adempiere.ad_org.card_holder is '没用';
COMMENT ON COLUMN adempiere.ad_org.bank_account is '没用';
COMMENT ON COLUMN adempiere.ad_org.bank_name is '没用';
COMMENT ON COLUMN adempiere.ad_org.sub_bank is '没用';
COMMENT ON COLUMN adempiere.ad_org.type is '类型：D-商家 F-工厂 DE-经销商';
COMMENT ON COLUMN adempiere.ad_org.default_price is '没用';
COMMENT ON COLUMN adempiere.ad_org.alipay_name is '没用';
COMMENT ON COLUMN adempiere.ad_org.cooperation_mode is '摇摇车合作模式-已没用';
COMMENT ON COLUMN adempiere.ad_org.contact is '没用';
COMMENT ON COLUMN adempiere.ad_org.telephone is '手机号码';
COMMENT ON COLUMN adempiere.ad_org.lyy_staff_id is '关联的职工id-已没用';
COMMENT ON COLUMN adempiere.ad_org.lyy_district_id is '区域id-已没用';
COMMENT ON COLUMN adempiere.ad_org.has_income is '没用';
COMMENT ON COLUMN adempiere.ad_org.sub_total is '子商户收益总额-已没用';
COMMENT ON COLUMN adempiere.ad_org.sub_merchant is '是否子商户-已没用';
COMMENT ON COLUMN adempiere.ad_org.merchant_number is '子商户号-已没用';
COMMENT ON COLUMN adempiere.ad_org.sub_created is '子商户创建时间-已没用';
COMMENT ON COLUMN adempiere.ad_org.api_key is '没用';
COMMENT ON COLUMN adempiere.ad_org.secret_key is '没用';
COMMENT ON COLUMN adempiere.ad_org.cib_total is '特约商户收益总额';
COMMENT ON COLUMN adempiere.ad_org.cib_merchant is '是否特约商户';
COMMENT ON COLUMN adempiere.ad_org.cib_number is '特约商户号';
COMMENT ON COLUMN adempiere.ad_org.cib_key is '没用';
COMMENT ON COLUMN adempiere.ad_org.cib_created is '特约商户生效时间';
COMMENT ON COLUMN adempiere.ad_org.isadvertise is '是否开启广告';
COMMENT ON COLUMN adempiere.ad_org.min_ad_price is '广告最低价格';
COMMENT ON COLUMN adempiere.ad_org.min_equipment_count is '没用';
COMMENT ON COLUMN adempiere.ad_org.ad_percent is '工厂广告分成比例';
COMMENT ON COLUMN adempiere.ad_org.customer_service_number is '客服电话';
COMMENT ON COLUMN adempiere.ad_org.business_name is '商户名称';
COMMENT ON COLUMN adempiere.ad_org.default_discount is '没用';
COMMENT ON COLUMN adempiere.ad_org.agent_number is '代理商编码';
COMMENT ON COLUMN adempiere.ad_org.can_owe is '是否允许欠费';
COMMENT ON COLUMN adempiere.ad_org.can_owe_fee is '可欠费金额';
COMMENT ON COLUMN adempiere.ad_org.agent_id is '广告主类型组织所属的代理商主键';
COMMENT ON COLUMN adempiere.ad_org.advert_price is '广告默认单价';
COMMENT ON COLUMN adempiere.ad_org.distributorpart is '投放商分成，用于代理商所属广告任务分成';
COMMENT ON COLUMN adempiere.ad_org.is_member_card_enable is '会员卡开关';
COMMENT ON COLUMN adempiere.ad_org.avatar is '头像地址';
COMMENT ON COLUMN adempiere.ad_org.third_pay_service_code is '支付服务，例：浦发支付，则为"spdb"';
COMMENT ON COLUMN adempiere.ad_org.wechat_pay_flag is '是否可使用微信原生支付Y:是 N:否 F:禁用';
COMMENT ON COLUMN adempiere.ad_org.ispopadwindow is '是否已读广告弹窗 Y:已读 N:未读';
COMMENT ON COLUMN adempiere.ad_org.isopenintegral is '是否开通积分商城：Y=是';
COMMENT ON COLUMN adempiere.ad_org.balance_alias is '商户游戏币显示名称';
COMMENT ON COLUMN adempiere.ad_org.cib_balance is '电子秤特约商户账户余额';
COMMENT ON COLUMN adempiere.ad_org.country_code is '国家编码';
COMMENT ON COLUMN adempiere.ad_org.wechat_facepay_sign_flag is '微信刷脸签约状态 Y-已签约  N-未签约';
COMMENT ON COLUMN adempiere.ad_org.allow_pay is '支付状态：null /0 允许，1不允许';
COMMENT ON COLUMN adempiere.ad_org.platform_user_id is '平台用户id';
COMMENT ON COLUMN adempiere.ad_org.merchant_logo is '品牌logo';
COMMENT ON TABLE adempiere.ad_org is '商家工厂表';
CREATE UNIQUE INDEX ad_org_pkey ON adempiere.ad_org USING btree (ad_org_id);
CREATE INDEX idx_ad_org_ctime ON adempiere.ad_org USING btree (created);
CREATE UNIQUE INDEX uni_org_value ON adempiere.ad_org USING btree (value);
CREATE INDEX ad_org_api_key_idx1 ON adempiere.ad_org USING hash (api_key) WHERE (api_key IS NOT NULL);
CREATE INDEX ad_org_name_type_idx ON adempiere.ad_org USING btree (name, type);
CREATE UNIQUE INDEX ad_org_value ON adempiere.ad_org USING btree (ad_client_id, value);
CREATE INDEX idx_ad_org_cooperation_mode ON adempiere.ad_org USING btree (cooperation_mode);
