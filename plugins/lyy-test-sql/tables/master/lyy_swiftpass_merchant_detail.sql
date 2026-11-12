-- lyy_swiftpass_merchant_detail
-- 库：master
-- 业务分类：支付
-- 使用场景：查商家资料

CREATE TABLE adempiere.lyy_swiftpass_merchant_detail (
    lyy_swiftpass_merchant_detail_id numeric(10,0) NOT NULL,
    ad_org_id numeric(10,0),
    ad_client_id numeric(10,0),
    isactive character(1) DEFAULT 'Y'::bpchar,
    created timestamp(6) without time zone,
    createdby numeric(10,0),
    updated timestamp(6) without time zone,
    updatedby numeric(10,0),
    lyy_swiftpass_merchant_id numeric(10,0) NOT NULL,
    merchant_short_name character varying(64),
    lyy_swiftpass_industr_id numeric(10,0),
    province_id numeric(10,0),
    city_id numeric(10,0),
    address character varying(128),
    tel character varying(64),
    email character varying(64),
    legal_person character varying(64) NOT NULL,
    customer_phone character varying(128) NOT NULL,
    principal character varying(64) NOT NULL,
    principal_mobile character varying(128) NOT NULL,
    id_code character varying(128) NOT NULL,
    indentity_photo character varying(265),
    local_indentity_photo character varying(265) NOT NULL,
    license_photo character varying(265),
    local_license_photo character varying(265),
    protocol_photo character varying(265),
    local_protocol_photo character varying(265),
    org_photo character varying(265),
    local_org_photo character varying(265),
    country_id numeric(10,0),
    business_license character varying(32),
    province_code character varying(10),
    city_code character varying(10),
    country_code character varying(10),
    industr_code character varying(6),
    id_card_face_hand_img character varying(255),
    id_card_national_hand_img character varying(255),
    shop_img character varying(255),
    equipment_img character varying(255),
    addtion_description character varying(255),
    addtion_submit_time timestamp(0) without time zone,
    addtion_audit_time timestamp(0) without time zone,
    equipment_fault_phone character varying(60),
    main_photo character varying(265),
    id_code_type character(1),
    group_use_img character varying(255),
    enterprise_info_img character varying(255),
    id_code_expire character varying(60),
    license_expire character varying(60),
    inner_img character varying(255),
    alipay_logon_id character varying(60),
    contact_name character varying(64),
    contact_phone character varying(32),
    contact_id_code character varying(32),
    contact_id_code_expire character varying(32),
    contact_id_card_face_img character varying(255),
    contact_id_card_national_img character varying(255),
    cert_type character varying(2),
    company_cert_img character varying(255),
    industry_type_code character varying(32),
    industry_qualification_img character varying(255),
    identity_address character varying(255),
    business_authorization_letter_img character varying(255),
    business_authorization_letter_alipay_img character varying(255),
    company_cert_alipay_img character varying(255),
    payable_sms_flag smallint DEFAULT 0,
    id_code_expire_end date,
    license_expire_end date,
    contact_id_code_expire_end date,
    business_category smallint
);
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.merchant_short_name is '商户简称 简称在微信、 支付宝、 QQ 钱包是通用的， 请不要使用带有具体支付类型的简称';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.lyy_swiftpass_industr_id is '行业类别';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.province_id is '省份';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.city_id is '城市';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.address is '地址';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.tel is '电话';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.email is '邮箱';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.legal_person is '企业法人';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.customer_phone is '客服电话';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.principal is '负责人';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.id_code is '负责人身份证';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.indentity_photo is '身份证图片 调用银行图片上传接口获取， 多张以;分割';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.local_indentity_photo is '身份证图片 调用本地图片上传接口获取， 多张以;分割';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.license_photo is '营业执照 调用银行图片上传接口获取， 多张以;分割';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.local_license_photo is '营业执照 调用本地图片上传接口获取， 多张以;分割';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.protocol_photo is '商户协议照 调用银行图片上传接口获取， 多张以;分割';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.local_protocol_photo is '商户协议照 调用本地图片上传接口获取， 多张以;分割';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.org_photo is '组织机构代码照 调用银行图片上传接口获取， 多张以;分割';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.local_org_photo is '组织机构代码照 调用本地图片上传接口获取， 多张以;分割';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.country_id is '区县id';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.business_license is '营业执照';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.id_card_face_hand_img is '手持身份证人面像照（反面）';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.id_card_national_hand_img is '手持身份证国徽面照（正面）';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.shop_img is '商店门头照片';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.equipment_img is '设备照片';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.addtion_description is '补充信息描述（审核反馈）';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.addtion_submit_time is '补充信息提交时间';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.addtion_audit_time is '补充信息审核时间';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.equipment_fault_phone is '机台故障电话';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.main_photo is '门头照 银行图片上传接口获取，多张以;分割';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.id_code_type is '证件类型，没有时默认进件传1，1大陆身份证，2护照，3港澳居民来往内地通行证，4台湾居民来往内地通行证，5其他';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.group_use_img is '场地使用证明';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.enterprise_info_img is '企业信息截图';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.id_code_expire is '身份证有效期 如：1999-08-08,2029-08-08';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.license_expire is '营业执照有效期 如：1999-08-08,2029-08-08';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.inner_img is '内景照';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.alipay_logon_id is '商户实名支付宝账号';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.contact_name is '联系人姓名';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.contact_phone is '联系人手机';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.contact_id_code is '联系人身份证号码';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.contact_id_code_expire is '联系人身份证有效期,例如2020-01-01,2030-01-01';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.contact_id_card_face_img is '联系人身份证人面像照（反面）';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.contact_id_card_national_img is '联系人身份证人面像照（反面）';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.cert_type is '登记证书类型，1事业单位法人证书 2统一社会信用代码证书 3有偿服务许可证（军队医院适用） 4医疗机构执业许可证（军队医院适用） 5企业营业执照（挂靠企业的党组织适用） 6组织机构代码证（政府机关适用） 7社会团体法人登记证书 8民办非企业单位登记证书 9基金会法人登记证书 10慈善组织公开募捐资格证书 11农民专业合作社法人营业执照 12宗教活动场所登记证 13其他证书/批文/证明';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.company_cert_img is '单位证明函';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.industry_type_code is '商户所属行业机构类型CODE';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.industry_qualification_img is '商户所属行业机构特殊资质图片,可多张用,分割';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.identity_address is '身份证地址';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.business_authorization_letter_img is '业务办理授权函';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.business_authorization_letter_alipay_img is '支付宝业务办理授权函';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.company_cert_alipay_img is '支付宝单位证明函';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.payable_sms_flag is '支付开通短信提醒标识，二进制下标0：未发送 1：已发送，例如数值23转换二进制10111表示：京东已发送，支付宝未发送，微信已发送，微信小程序已发送，云闪付已发送';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.id_code_expire_end is '法人身份有效结束日期';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.license_expire_end is '营业执照有效期结束日期';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.contact_id_code_expire_end is '联系人身份证有效期接收日期';
COMMENT ON COLUMN adempiere.lyy_swiftpass_merchant_detail.business_category is '经营类目,微信支付宝实名用到,1:门店场所 2:流动经营/便民服务 3:线上商品/服';
 
CREATE UNIQUE INDEX lyy_swiftpass_merchant_detail_pkey ON adempiere.lyy_swiftpass_merchant_detail USING btree (lyy_swiftpass_merchant_detail_id);
CREATE INDEX lyy_swiftpass_merchant_detail_org_idx ON adempiere.lyy_swiftpass_merchant_detail USING btree (ad_org_id);
CREATE INDEX lyy_swiftpass_merchant_detail_parent_id_idx ON adempiere.lyy_swiftpass_merchant_detail USING btree (lyy_swiftpass_merchant_id);
