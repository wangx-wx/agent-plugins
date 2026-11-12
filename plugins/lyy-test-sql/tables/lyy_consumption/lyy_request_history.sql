-- lyy_request_history
-- 库：lyy_consumption
-- 业务分类：商创
-- 使用场景：查询商家风控补贴明细

CREATE TABLE lyy_request_history (
    lyy_request_history_id numeric(10,0) NOT NULL,
    lyy_equipment_id numeric(11,0),
    lyy_fans_id numeric(12,0),
    lyy_task_id numeric(11,0),
    amount numeric,
    distributorpart numeric,
    shopkeeperpart numeric,
    price numeric(8,2),
    code character varying(32),
    ad_org_id numeric(10,0),
    ad_client_id numeric(10,0),
    isactive character(1),
    created timestamp(6) without time zone,
    createdby numeric(10,0),
    updated timestamp(6) without time zone,
    updatedby numeric(10,0),
    yxb_incid character varying(16) DEFAULT NULL::character varying,
    lyy_trade_transaction_id numeric(10,0) DEFAULT NULL::numeric,
    agent_price numeric(8,2),
    lyy_equipment_group_id numeric(10,0) DEFAULT NULL::numeric,
    factorypart numeric(6,2),
    isvalid character(1) DEFAULT 'Y'::bpchar,
    lyy_factory_id numeric(10,0),
    lyy_online_coins_history_id numeric(12,0),
    is_statistics character(1),
    out_trade_no character varying(32),
    agentpart numeric(6,2),
    is_agent_statistics character(1),
    agent_user_id numeric(10,0),
    online_subsidy boolean,
    card_id bigint,
    settle_type smallint,
    main_distributor bigint,
    store_id numeric(12,0),
    wallet_user_id numeric(12,0),
    settlement_way character varying(20),
    receive_pay_account character varying(30)
)
PARTITION BY RANGE (created);
COMMENT ON COLUMN lyy_request_history.is_statistics is '是否已算入工厂收益（Y/N）';
COMMENT ON COLUMN lyy_request_history.out_trade_no is '广告收益所属订单';
COMMENT ON COLUMN lyy_request_history.online_subsidy is '是否在线补贴';
COMMENT ON COLUMN lyy_request_history.card_id is '资料ID';
COMMENT ON COLUMN lyy_request_history.settle_type is '结算方式';
COMMENT ON COLUMN lyy_request_history.main_distributor is '主营商家';
COMMENT ON COLUMN lyy_request_history.store_id is '多金宝门店id';
COMMENT ON COLUMN lyy_request_history.wallet_user_id is '多金宝钱包id';
COMMENT ON COLUMN lyy_request_history.settlement_way is '清分结算方式，wallet,channel';
COMMENT ON COLUMN lyy_request_history.receive_pay_account is '清分商户号';
