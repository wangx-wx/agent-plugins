-- um_account
-- 库：user_member
-- 业务分类：中台
-- 使用场景：总权益

CREATE TABLE um_account (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    merchant_id numeric(12,0) NOT NULL,
    total numeric(12,2) NOT NULL,
    balance numeric(12,2) NOT NULL,
    classify smallint NOT NULL,
    status smallint NOT NULL,
    description character varying(200),
    create_time timestamp(3) without time zone NOT NULL,
    create_by numeric(12,0),
    update_time timestamp(3) without time zone NOT NULL,
    update_by numeric(12,0),
    merchant_user_id numeric(19,0),
    card_no character varying(50),
    parent_account_id bigint,
    store_id bigint,
    down_time timestamp(3) without time zone,
    deposit numeric(6,2),
    default_flag boolean,
    frozen_amount numeric(10,2)
)
PARTITION BY LIST (mod(merchant_id, (128)::numeric));
COMMENT ON COLUMN um_account.id is '	账户ID';
COMMENT ON COLUMN um_account.user_id is '	用户ID';
COMMENT ON COLUMN um_account.merchant_id is '	商户ID';
COMMENT ON COLUMN um_account.total is '	总权益';
COMMENT ON COLUMN um_account.balance is '	剩余权益';
COMMENT ON COLUMN um_account.classify is '	权益类型';
COMMENT ON COLUMN um_account.status is '状态：1=正常，2=禁用3=挂失，4=过期';
COMMENT ON COLUMN um_account.description is '	备注';
COMMENT ON COLUMN um_account.create_time is '	创建时间';
COMMENT ON COLUMN um_account.create_by is '创建人id';
COMMENT ON COLUMN um_account.update_time is '	更新时间';
COMMENT ON COLUMN um_account.update_by is '	更新人';
COMMENT ON COLUMN um_account.merchant_user_id is '商家用户id';
COMMENT ON COLUMN um_account.card_no is '卡号';
COMMENT ON COLUMN um_account.parent_account_id is '父权益id';
COMMENT ON COLUMN um_account.store_id is '所属门店id';
COMMENT ON COLUMN um_account.down_time is '卡有效期';
COMMENT ON COLUMN um_account.deposit is '押金';
COMMENT ON COLUMN um_account.default_flag is '是否是默认卡账户 true:是，false：否';
COMMENT ON COLUMN um_account.frozen_amount is '冻结金额';
COMMENT ON TABLE um_account is '会员账户表';
