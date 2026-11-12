-- um_benefit_scope
-- 库：user_member
-- 业务分类：中台
-- 使用场景：权益范围

CREATE TABLE um_benefit_scope (
    id bigint NOT NULL,
    benefit_id bigint,
    applicable smallint,
    associated_id numeric,
    create_time timestamp(0) without time zone,
    update_time timestamp(0) without time zone,
    merchant_id numeric
);
COMMENT ON COLUMN um_benefit_scope.id is '主键id';
COMMENT ON COLUMN um_benefit_scope.benefit_id is '权益ID
';
COMMENT ON COLUMN um_benefit_scope.applicable is '适用类型 1 品类 2 场地 3 设备 4 商品';
COMMENT ON COLUMN um_benefit_scope.associated_id is '关联ID';
COMMENT ON COLUMN um_benefit_scope.create_time is '创建时间';
COMMENT ON COLUMN um_benefit_scope.update_time is '更新时间';
COMMENT ON COLUMN um_benefit_scope.merchant_id is '商户Id';
COMMENT ON TABLE um_benefit_scope is '权益范围表';
CREATE UNIQUE INDEX pk_um_benfit_scope ON um_benefit_scope USING btree (id);
CREATE INDEX um_benefit_scope_merchant_benefit_idx ON um_benefit_scope USING btree (merchant_id, benefit_id);
CREATE INDEX um_benefit_scope_associated_applicable_idx ON um_benefit_scope USING btree (associated_id, applicable);
CREATE INDEX um_benefit_scope_benefit_idx ON um_benefit_scope USING hash (benefit_id);
