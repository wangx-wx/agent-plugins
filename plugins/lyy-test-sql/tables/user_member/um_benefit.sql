-- um_benefit
-- 库：user_member
-- 业务分类：中台
-- 使用场景：权益类型

CREATE TABLE um_benefit (
    id bigint NOT NULL,
    merchant_id numeric,
    title character varying(32),
    sub_title character varying(32),
    code character varying(32),
    classify smallint,
    benefit_count numeric,
    expiry_date_category smallint NOT NULL,
    up_time character varying(32),
    down_time character varying(32),
    show_date_category smallint,
    show_up_time character varying(32),
    show_down_time character varying(32),
    is_active boolean,
    create_time timestamp(0) without time zone,
    update_time timestamp(0) without time zone
);
COMMENT ON COLUMN um_benefit.id is '主键id';
COMMENT ON COLUMN um_benefit.merchant_id is '商户ID';
COMMENT ON COLUMN um_benefit.title is '标题
';
COMMENT ON COLUMN um_benefit.sub_title is '副标题';
COMMENT ON COLUMN um_benefit.code is '权益编码
';
COMMENT ON COLUMN um_benefit.classify is '权益分类
';
COMMENT ON COLUMN um_benefit.benefit_count is '权益数量';
COMMENT ON COLUMN um_benefit.expiry_date_category is '可用有效期类型 0、无限期 1、日期区间可用 2、单日时间区间可用';
COMMENT ON COLUMN um_benefit.up_time is '上线时间';
COMMENT ON COLUMN um_benefit.down_time is '下线时间';
COMMENT ON COLUMN um_benefit.show_date_category is '可见有效期类型
0、无限期  1、日期区间可用 2、单日时间区间可用';
COMMENT ON COLUMN um_benefit.show_up_time is '可见上线时间';
COMMENT ON COLUMN um_benefit.show_down_time is '可见下线时间';
COMMENT ON COLUMN um_benefit.is_active is '是否可用';
COMMENT ON COLUMN um_benefit.create_time is '创建时间';
COMMENT ON COLUMN um_benefit.update_time is '更新时间';
COMMENT ON TABLE um_benefit is '权益表';
CREATE INDEX um_benefit_merchant_classify__idx ON um_benefit USING btree (merchant_id, classify, up_time, down_time);
CREATE INDEX um_benefit_merchant_classify_expiry_date_category_active_idx ON um_benefit USING btree (merchant_id, classify, expiry_date_category, is_active);
CREATE UNIQUE INDEX pk_um_benfit ON um_benefit USING btree (id);
