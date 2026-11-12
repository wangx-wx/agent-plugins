-- ad_org_attach
-- 库：master
-- 业务分类：充电桩
-- 使用场景：查询是否资金池商家

CREATE TABLE adempiere.ad_org_attach (
    ad_org_attach_id numeric(11,0) NOT NULL,
    ad_org_id numeric(11,0) NOT NULL,
    customer_skin_version character varying(1),
    switch_data jsonb,
    banner_logo_path character varying(512),
    lyy_integral_switch smallint,
    equipment_value character varying(32),
    open_quick_replenish character(1),
    replenish_phone character varying(255),
    customer_topic_version jsonb,
    created timestamp(6) without time zone,
    updated timestamp(6) without time zone,
    draw_fee_limit smallint,
    third_balance_open jsonb,
    alias_name character varying(60),
    link_name character varying(30),
    primary_category character varying(128),
    is_wallet_settlement boolean DEFAULT false,
    business_scene_merchant_id numeric(11,0),
    business_scene_agent_user_id numeric(11,0),
    belong_agent_user_id numeric(11,0),
    belong_agent_merchant_id numeric(11,0),
    business_scene_type character varying(32)
);
COMMENT ON COLUMN adempiere.ad_org_attach.customer_skin_version is '1-旧版 2-新版';
COMMENT ON COLUMN adempiere.ad_org_attach.switch_data is '开关数据';
COMMENT ON COLUMN adempiere.ad_org_attach.banner_logo_path is '商家的自定义logo路径';
COMMENT ON COLUMN adempiere.ad_org_attach.lyy_integral_switch is '乐摇摇积分商城开关，null或0为关，1为开';
COMMENT ON COLUMN adempiere.ad_org_attach.equipment_value is '商家默认设备';
COMMENT ON COLUMN adempiere.ad_org_attach.open_quick_replenish is 'C端快捷补货入口开关 Y-开启 N-关闭';
COMMENT ON COLUMN adempiere.ad_org_attach.replenish_phone is '快捷补货人员手机号 多个手机号“,”分割';
COMMENT ON COLUMN adempiere.ad_org_attach.customer_topic_version is 'c端主题版本';
COMMENT ON COLUMN adempiere.ad_org_attach.created is '创建时间';
COMMENT ON COLUMN adempiere.ad_org_attach.updated is '更新时间';
COMMENT ON COLUMN adempiere.ad_org_attach.draw_fee_limit is '摇奖免单活动认证 0或null- 未认证  1-已认证';
COMMENT ON COLUMN adempiere.ad_org_attach.third_balance_open is '第三方会员导入开关
homePageNotify：导入余币余额首页强提醒开关设置：Y-开启，N-关闭
customerServiceAccess：导入余币余额客服入口开关设置：Y-开启，N-关闭';
COMMENT ON COLUMN adempiere.ad_org_attach.alias_name is '商家别名';
COMMENT ON COLUMN adempiere.ad_org_attach.link_name is '商家联系人';
COMMENT ON COLUMN adempiere.ad_org_attach.primary_category is '主营品类: 0:默认 1:电瓶车充电桩 2:自动售货机 3:按摩类 4:新能源汽车充电桩 5:洗衣水控类 6:游乐类';
COMMENT ON COLUMN adempiere.ad_org_attach.is_wallet_settlement is '是否资金池结算,true是,false否';
COMMENT ON COLUMN adempiere.ad_org_attach.business_scene_merchant_id is '经销商商户ID';
COMMENT ON COLUMN adempiere.ad_org_attach.business_scene_agent_user_id is '经销商代理商ID';
COMMENT ON COLUMN adempiere.ad_org_attach.belong_agent_user_id is '归属代理商ID';
COMMENT ON COLUMN adempiere.ad_org_attach.belong_agent_merchant_id is '归属商户ID';
COMMENT ON COLUMN adempiere.ad_org_attach.business_scene_type is 'dealer：经销商，brand：品牌商';
 
CREATE UNIQUE INDEX ad_org_attach_pkey ON adempiere.ad_org_attach USING btree (ad_org_attach_id);
CREATE UNIQUE INDEX ad_org_attach_org_id_index ON adempiere.ad_org_attach USING btree (ad_org_id);
