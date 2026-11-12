-- t_merchant_card
-- 库：small_venue
-- 业务分类：多金宝
-- 使用场景：多金宝查询某个会员卡号信息

CREATE TABLE t_merchant_card (
    id integer NOT NULL,
    merchant_id numeric(10,0),
    code character varying(100),
    card_no character varying(50),
    create_time date,
    update_time date,
    deleted smallint,
    remark character varying(50),
    status smallint,
    password character varying(255),
    out_trade_no character varying(50),
    initial_card_no character varying(50),
    card_id character varying(50),
    store_id bigint,
    user_id bigint,
    UNIQUE (code, card_no)
);
COMMENT ON COLUMN t_merchant_card.id is '主键id';
COMMENT ON COLUMN t_merchant_card.merchant_id is '商户id';
COMMENT ON COLUMN t_merchant_card.code is '商户编码';
COMMENT ON COLUMN t_merchant_card.card_no is '会员卡号';
COMMENT ON COLUMN t_merchant_card.create_time is '创建时间';
COMMENT ON COLUMN t_merchant_card.update_time is '更新时间';
COMMENT ON COLUMN t_merchant_card.deleted is '是否删除';
COMMENT ON COLUMN t_merchant_card.remark is '备注';
COMMENT ON COLUMN t_merchant_card.status is '卡状态：1.待制作，2.已制卡，3.已绑定';
COMMENT ON COLUMN t_merchant_card.password is '卡密码';
COMMENT ON COLUMN t_merchant_card.out_trade_no is '订单编号';
COMMENT ON COLUMN t_merchant_card.initial_card_no is '初始卡号';
COMMENT ON COLUMN t_merchant_card.card_id is '卡id';
COMMENT ON COLUMN t_merchant_card.store_id is '开卡门店';
COMMENT ON COLUMN t_merchant_card.user_id is '用户id';
 
CREATE UNIQUE INDEX t_merchant_card_pkey ON t_merchant_card USING btree (id);
CREATE UNIQUE INDEX key_code_card ON t_merchant_card USING btree (code, card_no);
CREATE INDEX idx_card_card_no ON t_merchant_card USING btree (card_no);
CREATE INDEX idx_card_merchant_code ON t_merchant_card USING btree (code);
CREATE INDEX idx_card_merchant_id ON t_merchant_card USING hash (merchant_id);
CREATE INDEX idx_t_merchant_card_ono ON t_merchant_card USING btree (out_trade_no);
