-- payment_info_config
-- 库：master
-- 业务分类：支付
-- 使用场景：查appid路由配置

CREATE TABLE adempiere.payment_info_config (
    id bigint NOT NULL,
    distributor_id bigint NOT NULL,
    channel_code smallint NOT NULL,
    merchant_code character varying(255) NOT NULL,
    config_value character varying(255) NOT NULL,
    config_type smallint NOT NULL,
    status smallint NOT NULL,
    card_id bigint,
    out_app_id character varying(64),
    extend_info jsonb,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    created_by bigint,
    updated_by bigint,
    deleted boolean DEFAULT false
);
COMMENT ON COLUMN adempiere.payment_info_config.distributor_id is '商户id';
COMMENT ON COLUMN adempiere.payment_info_config.channel_code is '渠道编号';
COMMENT ON COLUMN adempiere.payment_info_config.merchant_code is '渠道商户号';
COMMENT ON COLUMN adempiere.payment_info_config.config_value is '配置的值';
COMMENT ON COLUMN adempiere.payment_info_config.config_type is '配置类型 1=appid配置 2=支付目录配置';
COMMENT ON COLUMN adempiere.payment_info_config.status is '状态 0=初始 1=处理中 2=成功 3=失败 4=无效';
COMMENT ON COLUMN adempiere.payment_info_config.card_id is '商户资料id';
COMMENT ON COLUMN adempiere.payment_info_config.out_app_id is '接入方系统id';
COMMENT ON COLUMN adempiere.payment_info_config.extend_info is '扩展信息，json 格式';
COMMENT ON COLUMN adempiere.payment_info_config.created is '创建时间';
COMMENT ON COLUMN adempiere.payment_info_config.updated is '修改时间';
COMMENT ON COLUMN adempiere.payment_info_config.created_by is '创建人';
COMMENT ON COLUMN adempiere.payment_info_config.updated_by is '修改人';
COMMENT ON COLUMN adempiere.payment_info_config.deleted is '逻辑删除标识 false=有效 true=删除';
COMMENT ON TABLE adempiere.payment_info_config is '支付信息配置表';
CREATE INDEX payment_info_config_idx ON adempiere.payment_info_config USING btree (channel_code, config_value, config_type);
CREATE UNIQUE INDEX payment_info_config_pkey ON adempiere.payment_info_config USING btree (id);
CREATE UNIQUE INDEX payment_info_config_unique_idx ON adempiere.payment_info_config USING btree (distributor_id, channel_code, merchant_code, config_value, config_type);
