-- lyy_cdz_activity_black_list
-- 库：advert
-- 业务分类：充电桩
-- 使用场景：用户、场地、商家黑名单

CREATE TABLE lyy_cdz_activity_black_list (
    lyy_cdz_activity_black_list_id numeric(13,0) NOT NULL,
    business_type numeric(4,0) NOT NULL,
    business_id numeric(13,0) NOT NULL,
    business_name character varying(64),
    merchant_id numeric(13,0),
    phone character varying(32),
    activity_id numeric(4,0) NOT NULL,
    activity_name character varying(64),
    operate_id numeric(13,0),
    operate_name character varying(64),
    create_by numeric(13,0) NOT NULL,
    update_by numeric(13,0),
    create_time timestamp(6) without time zone NOT NULL,
    update_time timestamp(6) without time zone,
    deleted boolean NOT NULL,
    UNIQUE (business_type, business_id, activity_id)
);
COMMENT ON COLUMN lyy_cdz_activity_black_list.lyy_cdz_activity_black_list_id is '充电桩活动黑名单ID';
COMMENT ON COLUMN lyy_cdz_activity_black_list.business_type is '业务类型(1:用户,2:场地,3:商户)';
COMMENT ON COLUMN lyy_cdz_activity_black_list.business_id is '业务类型ID';
COMMENT ON COLUMN lyy_cdz_activity_black_list.business_name is '业务类型名称';
COMMENT ON COLUMN lyy_cdz_activity_black_list.merchant_id is '商家ID';
COMMENT ON COLUMN lyy_cdz_activity_black_list.phone is '手机号';
COMMENT ON COLUMN lyy_cdz_activity_black_list.activity_id is '活动类型ID:(1:保险次卡,2:1元保险月卡)';
COMMENT ON COLUMN lyy_cdz_activity_black_list.activity_name is '活动类型名称';
COMMENT ON COLUMN lyy_cdz_activity_black_list.operate_id is '操作人ID';
COMMENT ON COLUMN lyy_cdz_activity_black_list.operate_name is '操作人名称';
COMMENT ON COLUMN lyy_cdz_activity_black_list.create_by is '创建人';
COMMENT ON COLUMN lyy_cdz_activity_black_list.update_by is '更新人';
COMMENT ON COLUMN lyy_cdz_activity_black_list.create_time is '创建时间';
COMMENT ON COLUMN lyy_cdz_activity_black_list.update_time is '更新时间';
COMMENT ON COLUMN lyy_cdz_activity_black_list.deleted is '是否删除';
 
CREATE UNIQUE INDEX lyy_cdz_activity_black_list_pkey ON lyy_cdz_activity_black_list USING btree (lyy_cdz_activity_black_list_id);
CREATE UNIQUE INDEX udx_lyy_cdz_activity_black_list_bt_bi_ai ON lyy_cdz_activity_black_list USING btree (business_type, business_id, activity_id);
CREATE INDEX idx_lyy_cdz_activity_black_list_business_id ON lyy_cdz_activity_black_list USING btree (business_id);
CREATE INDEX idx_lyy_cdz_activity_black_list_merchant_id ON lyy_cdz_activity_black_list USING btree (merchant_id);
