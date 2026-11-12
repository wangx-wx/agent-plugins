-- um_account_record
-- 库：user_member
-- 业务分类：中台
-- 使用场景：会员流水

CREATE TABLE um_account_record (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    user_id bigint NOT NULL,
    merchant_user_id bigint NOT NULL,
    merchant_id numeric(12,0) NOT NULL,
    store_id numeric(12,0),
    equipment_id numeric(12,0),
    benefit_classify smallint NOT NULL,
    benefit_id bigint NOT NULL,
    initial_benefit numeric(10,2) NOT NULL,
    original_benefit numeric(10,2) NOT NULL,
    actual_benefit numeric(10,2) NOT NULL,
    out_trade_no character varying(64),
    order_no character varying(64),
    mode smallint NOT NULL,
    create_time timestamp(3) without time zone NOT NULL,
    resource character varying(200),
    description character varying(200),
    trade_type smallint,
    trade_amount numeric(12,2),
    commodity_name character varying(64),
    store_name character varying(120),
    equipment_type_name character varying(16),
    equipment_value character varying(16),
    equipment_type_id numeric(12,0),
    record_type smallint,
    sort integer,
    account_benefit_id bigint,
    createdby numeric(10,0),
    create_name character varying(50),
    card_no character varying(50),
    refund_no character varying(64),
    goods_id numeric(10,0),
    goods_type smallint,
    goods_classify numeric(10,0),
    goods_classify_name character varying(20),
    goods_num numeric(6,0),
    discounts_amount numeric(12,2),
    operation_equipment_name character varying(32),
    equipment_name character varying(32),
    terminal_name character varying(32),
    merchant_benefit_classify_id numeric(10,0),
    merchant_benefit_classify_name character varying(32),
    operation_type smallint,
    operation_channel smallint,
    consume_type smallint,
    sub_order_no character varying(64),
    actual_value numeric(12,2),
    group_number numeric(10,0),
    goods_type_id bigint,
    goods_price numeric(12,2),
    goods_type_name character varying(64),
    account_initial_balance numeric(12,2),
    account_initial_num numeric(12,2)
)
PARTITION BY LIST (mod(merchant_id, (128)::numeric));
COMMENT ON COLUMN um_account_record.id is ' 流水号';
COMMENT ON COLUMN um_account_record.account_id is ' 账户ID';
COMMENT ON COLUMN um_account_record.user_id is '  平台用户ID';
COMMENT ON COLUMN um_account_record.merchant_user_id is ' 商户用户ID';
COMMENT ON COLUMN um_account_record.merchant_id is '  商户';
COMMENT ON COLUMN um_account_record.store_id is ' 店铺';
COMMENT ON COLUMN um_account_record.equipment_id is ' 设备';
COMMENT ON COLUMN um_account_record.benefit_classify is ' 权益类型';
COMMENT ON COLUMN um_account_record.benefit_id is ' 权益ID';
COMMENT ON COLUMN um_account_record.initial_benefit is '  期初权益';
COMMENT ON COLUMN um_account_record.original_benefit is ' 权益';
COMMENT ON COLUMN um_account_record.actual_benefit is ' 实际权益';
COMMENT ON COLUMN um_account_record.out_trade_no is ' 交易单号';
COMMENT ON COLUMN um_account_record.order_no is ' 业务单号';
COMMENT ON COLUMN um_account_record.mode is ' 方式1=加，2=减';
COMMENT ON COLUMN um_account_record.create_time is '  时间';
COMMENT ON COLUMN um_account_record.resource is ' 来源';
COMMENT ON COLUMN um_account_record.description is '  备注';
COMMENT ON COLUMN um_account_record.trade_type is '交易类型';
COMMENT ON COLUMN um_account_record.trade_amount is '交易金额';
COMMENT ON COLUMN um_account_record.commodity_name is '商品名称';
COMMENT ON COLUMN um_account_record.store_name is '场地/店铺名称';
COMMENT ON COLUMN um_account_record.equipment_type_name is '设备类型名称';
COMMENT ON COLUMN um_account_record.equipment_value is '设备编号';
COMMENT ON COLUMN um_account_record.equipment_type_id is '设备类型id';
COMMENT ON COLUMN um_account_record.record_type is '流水自定义类型';
COMMENT ON COLUMN um_account_record.sort is '消费使用排序';
COMMENT ON COLUMN um_account_record.account_benefit_id is '账号权益明细id';
COMMENT ON COLUMN um_account_record.createdby is '操作人';
COMMENT ON COLUMN um_account_record.create_name is '操作人名称';
COMMENT ON COLUMN um_account_record.card_no is '卡号';
COMMENT ON COLUMN um_account_record.refund_no is '退兑换单号';
COMMENT ON COLUMN um_account_record.goods_id is '商品id';
COMMENT ON COLUMN um_account_record.goods_type is '商品类型';
COMMENT ON COLUMN um_account_record.goods_classify is '商品所属分类';
COMMENT ON COLUMN um_account_record.goods_classify_name is '商品所属分类名称';
COMMENT ON COLUMN um_account_record.goods_num is '商品数量';
COMMENT ON COLUMN um_account_record.discounts_amount is '优惠金额';
COMMENT ON COLUMN um_account_record.operation_equipment_name is '操作设备名称';
COMMENT ON COLUMN um_account_record.equipment_name is '设备名称';
COMMENT ON COLUMN um_account_record.terminal_name is '终端名称';
COMMENT ON COLUMN um_account_record.merchant_benefit_classify_id is '商家自定义权益id';
COMMENT ON COLUMN um_account_record.merchant_benefit_classify_name is '商家自定义权益名称';
COMMENT ON COLUMN um_account_record.operation_type is '记录类型（1.商品购买记录 2.商品兑换记录；3.商品回收记录；4.储值变更记录（储值变更记录包括设备消费记录））';
COMMENT ON COLUMN um_account_record.operation_channel is '操作渠道（1.微信小程序；2.桌面收银台；3.移动收银台）';
COMMENT ON COLUMN um_account_record.consume_type is '消费方式 （1.刷卡消费 2.微信小程序；3.桌面收银台；4.移动收银台）';
COMMENT ON COLUMN um_account_record.sub_order_no is '子单号';
COMMENT ON COLUMN um_account_record.actual_value is '权益实际价值';
COMMENT ON COLUMN um_account_record.group_number is '机台号';
COMMENT ON COLUMN um_account_record.goods_type_id is '商品类型id';
COMMENT ON COLUMN um_account_record.goods_price is '商品单价';
COMMENT ON COLUMN um_account_record.goods_type_name is '商品类型名称';
COMMENT ON COLUMN um_account_record.account_initial_balance is '账号下权益初始总数（总次数）';
COMMENT ON COLUMN um_account_record.account_initial_num is '账号下频次卡权益初始总张数';
COMMENT ON TABLE um_account_record is '账户流水记录表';
