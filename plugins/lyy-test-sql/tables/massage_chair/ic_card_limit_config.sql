-- ic_card_limit_config
-- 库：massage_chair
-- 业务分类：洗水
-- 使用场景：查ic卡限额信息

CREATE TABLE ic_card_limit_config (
    id numeric(12,0) NOT NULL,
    merchant_id numeric(12,0) NOT NULL,
    store_id numeric(12,0) NOT NULL,
    day_limit_amount numeric(11,2),
    month_limit_amount numeric(11,2),
    create_time timestamp without time zone NOT NULL,
    update_time timestamp without time zone,
    update_by numeric(12,0) NOT NULL,
    create_by numeric(12,0) NOT NULL,
    deleted boolean NOT NULL DEFAULT false
);
COMMENT ON COLUMN ic_card_limit_config.merchant_id is '商家ID';
COMMENT ON COLUMN ic_card_limit_config.store_id is '场地ID';
COMMENT ON COLUMN ic_card_limit_config.day_limit_amount is '日限制使用金额';
COMMENT ON COLUMN ic_card_limit_config.month_limit_amount is '日限制使用金额';
COMMENT ON COLUMN ic_card_limit_config.create_time is '创建时间';
COMMENT ON COLUMN ic_card_limit_config.update_time is '更新时间';
COMMENT ON COLUMN ic_card_limit_config.create_by is '创建人';
COMMENT ON TABLE ic_card_limit_config is 'ic卡使用限制配置表';
CREATE UNIQUE INDEX ic_card_limit_config_pk ON ic_card_limit_config USING btree (id);
CREATE INDEX ic_card_limit_config_store_id ON ic_card_limit_config USING btree (store_id);
