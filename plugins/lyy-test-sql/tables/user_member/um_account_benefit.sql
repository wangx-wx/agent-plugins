-- um_account_benefit
-- 库：user_member
-- 业务分类：中台
-- 使用场景：权益明细

CREATE TABLE um_account_benefit (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    user_id bigint NOT NULL,
    benefit_id bigint NOT NULL,
    total numeric(12,2) NOT NULL,
    balance numeric(12,2) NOT NULL,
    classify smallint NOT NULL,
    status smallint NOT NULL,
    expiry_date_category smallint,
    up_time character varying(32),
    down_time character varying(32),
    create_time timestamp(3) without time zone NOT NULL,
    create_by numeric(12,0),
    update_time timestamp(3) without time zone NOT NULL,
    update_by numeric(12,0),
    resource smallint,
    resource_id bigint,
    merchant_id numeric NOT NULL,
    merchant_user_id numeric(19,0),
    merchant_benefit_classify_id numeric(10,0),
    use_rule_id bigint,
    store_id bigint,
    value_type smallint,
    frozen_amount numeric(10,2)
)
PARTITION BY LIST (mod(merchant_id, (128)::numeric));
COMMENT ON COLUMN um_account_benefit.id is '  标识';
COMMENT ON COLUMN um_account_benefit.account_id is '  账户ID';
COMMENT ON COLUMN um_account_benefit.user_id is '用户id';
COMMENT ON COLUMN um_account_benefit.benefit_id is '  权益ID';
COMMENT ON COLUMN um_account_benefit.total is ' 总权益';
COMMENT ON COLUMN um_account_benefit.balance is ' 剩余权益';
COMMENT ON COLUMN um_account_benefit.classify is '  权益类型';
COMMENT ON COLUMN um_account_benefit.status is '  状态：1=正常，2=过期， 3=已消耗';
COMMENT ON COLUMN um_account_benefit.expiry_date_category is ' 有效期类型:0、无限期,1、日期区间可用,2、单日时间区间可用';
COMMENT ON COLUMN um_account_benefit.up_time is ' 上线时间

如果是类型1(日期区间)，字段内容格式是:  yyyy-MM-dd HH:mm:ss
如果是类型2(时间区间)，字段内容格式是:  HH:mm:ss';
COMMENT ON COLUMN um_account_benefit.down_time is ' 下线时间

如果是类型1(日期区间)，字段内容格式是:  yyyy-MM-dd HH:mm:ss
如果是类型2(时间区间)，字段内容格式是:  HH:mm:ss';
COMMENT ON COLUMN um_account_benefit.create_time is ' 创建时间';
COMMENT ON COLUMN um_account_benefit.create_by is '创建人id';
COMMENT ON COLUMN um_account_benefit.update_time is ' 更新时间';
COMMENT ON COLUMN um_account_benefit.update_by is '更新人id';
COMMENT ON COLUMN um_account_benefit.resource is '权益来源类型：1=会员升级，2=权益规则触发';
COMMENT ON COLUMN um_account_benefit.resource_id is '权益来源关联的业务id';
COMMENT ON COLUMN um_account_benefit.merchant_id is '商户id';
COMMENT ON COLUMN um_account_benefit.merchant_user_id is '商家用户id';
COMMENT ON COLUMN um_account_benefit.merchant_benefit_classify_id is '商家自定义权益id';
COMMENT ON COLUMN um_account_benefit.use_rule_id is '使用规则id';
COMMENT ON COLUMN um_account_benefit.store_id is '所属门店';
COMMENT ON COLUMN um_account_benefit.value_type is '权益值类型，1：额度类型，2：频次类型';
COMMENT ON COLUMN um_account_benefit.frozen_amount is '冻结金额';
COMMENT ON TABLE um_account_benefit is '会员账户明细表';
