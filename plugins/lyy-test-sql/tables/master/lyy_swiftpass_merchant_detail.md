---
table: adempiere.lyy_swiftpass_merchant_detail
database: master
domain: 支付
dbDictId: 10099
description: 特约商户信息表
use_cases:
  - 查商家资料
---

# lyy_swiftpass_merchant_detail

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| lyy_swiftpass_merchant_detail_id | numeric(10,0) | 待补充 |
| ad_org_id | numeric(10,0) | 待补充 |
| ad_client_id | numeric(10,0) | 待补充 |
| isactive | character(1) | 待补充 |
| created | timestamp(6) without time zone | 待补充 |
| createdby | numeric(10,0) | 待补充 |
| updated | timestamp(6) without time zone | 待补充 |
| updatedby | numeric(10,0) | 待补充 |
| lyy_swiftpass_merchant_id | numeric(10,0) | 待补充 |
| merchant_short_name | character varying(64) | 商户简称 简称在微信、 支付宝、 QQ 钱包是通用的， 请不要使用带有具体支付类型的简称 |
| lyy_swiftpass_industr_id | numeric(10,0) | 行业类别 |
| province_id | numeric(10,0) | 省份 |
| city_id | numeric(10,0) | 城市 |
| address | character varying(128) | 地址 |
| tel | character varying(64) | 电话 |
| email | character varying(64) | 邮箱 |
| legal_person | character varying(64) | 企业法人 |
| customer_phone | character varying(128) | 客服电话 |
| principal | character varying(64) | 负责人 |
| principal_mobile | character varying(128) | 待补充 |
| id_code | character varying(128) | 负责人身份证 |
| indentity_photo | character varying(265) | 身份证图片 调用银行图片上传接口获取， 多张以;分割 |
| local_indentity_photo | character varying(265) | 身份证图片 调用本地图片上传接口获取， 多张以;分割 |
| license_photo | character varying(265) | 营业执照 调用银行图片上传接口获取， 多张以;分割 |
| local_license_photo | character varying(265) | 营业执照 调用本地图片上传接口获取， 多张以;分割 |
| protocol_photo | character varying(265) | 商户协议照 调用银行图片上传接口获取， 多张以;分割 |
| local_protocol_photo | character varying(265) | 商户协议照 调用本地图片上传接口获取， 多张以;分割 |
| org_photo | character varying(265) | 组织机构代码照 调用银行图片上传接口获取， 多张以;分割 |
| local_org_photo | character varying(265) | 组织机构代码照 调用本地图片上传接口获取， 多张以;分割 |
| country_id | numeric(10,0) | 区县id |
| business_license | character varying(32) | 营业执照 |
| province_code | character varying(10) | 待补充 |
| city_code | character varying(10) | 待补充 |
| country_code | character varying(10) | 待补充 |
| industr_code | character varying(6) | 待补充 |
| id_card_face_hand_img | character varying(255) | 手持身份证人面像照（反面） |
| id_card_national_hand_img | character varying(255) | 手持身份证国徽面照（正面） |
| shop_img | character varying(255) | 商店门头照片 |
| equipment_img | character varying(255) | 设备照片 |
| addtion_description | character varying(255) | 补充信息描述（审核反馈） |
| addtion_submit_time | timestamp(0) without time zone | 补充信息提交时间 |
| addtion_audit_time | timestamp(0) without time zone | 补充信息审核时间 |
| equipment_fault_phone | character varying(60) | 机台故障电话 |
| main_photo | character varying(265) | 门头照 银行图片上传接口获取，多张以;分割 |
| id_code_type | character(1) | 证件类型，没有时默认进件传1，1大陆身份证，2护照，3港澳居民来往内地通行证，4台湾居民来往内地通行证，5其他 |
| group_use_img | character varying(255) | 场地使用证明 |
| enterprise_info_img | character varying(255) | 企业信息截图 |
| id_code_expire | character varying(60) | 身份证有效期 如：1999-08-08,2029-08-08 |
| license_expire | character varying(60) | 营业执照有效期 如：1999-08-08,2029-08-08 |
| inner_img | character varying(255) | 内景照 |
| alipay_logon_id | character varying(60) | 商户实名支付宝账号 |
| contact_name | character varying(64) | 联系人姓名 |
| contact_phone | character varying(32) | 联系人手机 |
| contact_id_code | character varying(32) | 联系人身份证号码 |
| contact_id_code_expire | character varying(32) | 联系人身份证有效期,例如2020-01-01,2030-01-01 |
| contact_id_card_face_img | character varying(255) | 联系人身份证人面像照（反面） |
| contact_id_card_national_img | character varying(255) | 联系人身份证人面像照（反面） |
| cert_type | character varying(2) | 登记证书类型，1事业单位法人证书 2统一社会信用代码证书 3有偿服务许可证（军队医院适用） 4医疗机构执业许可证（军队医院适用） 5企业营业执照（挂靠企业的党组织适用） 6组织机构代码证（政府机关适用） 7社会团体法人登记证书 8民办非企业单位登记证书 9基金会法人登记证书 10慈善组织公开募捐资格证书 11农民专业合作社法人营业执照 12宗教活动场所登记证 13其他证书/批文/证明 |
| company_cert_img | character varying(255) | 单位证明函 |
| industry_type_code | character varying(32) | 商户所属行业机构类型CODE |
| industry_qualification_img | character varying(255) | 商户所属行业机构特殊资质图片,可多张用,分割 |
| identity_address | character varying(255) | 身份证地址 |
| business_authorization_letter_img | character varying(255) | 业务办理授权函 |
| business_authorization_letter_alipay_img | character varying(255) | 支付宝业务办理授权函 |
| company_cert_alipay_img | character varying(255) | 支付宝单位证明函 |
| payable_sms_flag | smallint | 支付开通短信提醒标识，二进制下标0：未发送 1：已发送，例如数值23转换二进制10111表示：京东已发送，支付宝未发送，微信已发送，微信小程序已发送，云闪付已发送 |
| id_code_expire_end | date | 法人身份有效结束日期 |
| license_expire_end | date | 营业执照有效期结束日期 |
| contact_id_code_expire_end | date | 联系人身份证有效期接收日期 |
| business_category | smallint | 经营类目,微信支付宝实名用到,1:门店场所 2:流动经营/便民服务 3:线上商品/服 |

## 查询规则

- 待补充

## 索引

- PK: lyy_swiftpass_merchant_detail_id
- INDEX: ad_org_id
- INDEX: lyy_swiftpass_merchant_id
