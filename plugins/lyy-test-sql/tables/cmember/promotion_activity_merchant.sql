-- promotion_activity_merchant
-- 库：cmember
-- 业务分类：洗水
-- 使用场景：查洗水商家维度商创活动

CREATE TABLE promotion_activity_merchant (
    promotion_activity_merchant_id numeric(10,0) NOT NULL,
    merchant_id numeric(10,0) NOT NULL,
    merchant_name character varying(128),
    merchant_phone character varying(64) NOT NULL,
    activity_id numeric(10,0) NOT NULL,
    activity_type integer NOT NULL,
    is_unique smallint NOT NULL,
    created timestamp(3) without time zone,
    updated timestamp(3) without time zone,
    createdby numeric(10,0),
    updatedby numeric(10,0),
    createdby_name character varying(64),
    merchant_config jsonb,
    status smallint
);
COMMENT ON COLUMN promotion_activity_merchant.merchant_id is '商户id';
COMMENT ON COLUMN promotion_activity_merchant.merchant_name is '商户名称';
COMMENT ON COLUMN promotion_activity_merchant.merchant_phone is '商户账号';
COMMENT ON COLUMN promotion_activity_merchant.activity_id is '活动id';
COMMENT ON COLUMN promotion_activity_merchant.activity_type is '活动类型';
COMMENT ON COLUMN promotion_activity_merchant.is_unique is '是否互斥1-是，2-否';
COMMENT ON COLUMN promotion_activity_merchant.merchant_config is '商户配置';
COMMENT ON COLUMN promotion_activity_merchant.status is 'null或0表示开启   1关闭状态';
 
CREATE UNIQUE INDEX promotion_activity_merchant_pkey ON promotion_activity_merchant USING btree (promotion_activity_merchant_id);
CREATE INDEX promotion_activity_merchant_activity_idx ON promotion_activity_merchant USING btree (activity_id, merchant_id);
CREATE INDEX idx_promotion_activity_merchant_mid_atype ON promotion_activity_merchant USING btree (merchant_id, activity_type);
