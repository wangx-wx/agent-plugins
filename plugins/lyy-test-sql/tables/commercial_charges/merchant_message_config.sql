-- merchant_message_config
-- 库：commercial_charges
-- 业务分类：中台
-- 使用场景：经营快报

CREATE TABLE merchant_message_config (
    id integer NOT NULL,
    merchant_id numeric(12,0) NOT NULL,
    receive_way integer[],
    ad_user_id numeric(12,0)
);
COMMENT ON COLUMN merchant_message_config.id is '主键id';
COMMENT ON COLUMN merchant_message_config.merchant_id is '商户id';
COMMENT ON COLUMN merchant_message_config.receive_way is '支持的消息接收方式,1:微信公众号 2:站内信 3:短信';
COMMENT ON COLUMN merchant_message_config.ad_user_id is '账号id';
COMMENT ON TABLE merchant_message_config is '商家消息配置';
CREATE UNIQUE INDEX merchant_message_config_pk ON merchant_message_config USING btree (id);
CREATE INDEX merchant_message_config_ad_user_id_merchant_id_idx ON merchant_message_config USING btree (merchant_id, ad_user_id);
