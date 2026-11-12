-- system_charge_equipment_bill_flow
-- 库：commercial_charges
-- 业务分类：充电桩
-- 使用场景：收费流水

CREATE TABLE system_charge_equipment_bill_flow (
    system_charge_equipment_bill_flow_id numeric(11,0) NOT NULL,
    system_charge_equipment_bill_id numeric(11,0) NOT NULL,
    out_trade_no character varying(64) NOT NULL,
    channel_code smallint NOT NULL,
    merchant_code character varying(32) NOT NULL,
    time_end timestamp(6) without time zone,
    payment_amount numeric(10,0) NOT NULL,
    amount numeric(10,0) NOT NULL,
    ratio numeric(4,2) NOT NULL,
    status integer NOT NULL,
    agent_user_id numeric(10,0),
    lyy_distributor_id numeric(10,0) NOT NULL,
    from_equipment_id numeric(10,0) NOT NULL,
    from_equipment_group_id numeric(10,0) NOT NULL,
    from_distributor_id numeric(10,0) NOT NULL,
    from_agent_user_id numeric(10,0),
    created timestamp(6) without time zone NOT NULL,
    updated timestamp(6) without time zone NOT NULL
);
COMMENT ON COLUMN system_charge_equipment_bill_flow.system_charge_equipment_bill_id is '设备缴费单表ID';
COMMENT ON COLUMN system_charge_equipment_bill_flow.out_trade_no is '支付订单号';
COMMENT ON COLUMN system_charge_equipment_bill_flow.channel_code is '支付渠道号';
COMMENT ON COLUMN system_charge_equipment_bill_flow.merchant_code is '支付商户号';
COMMENT ON COLUMN system_charge_equipment_bill_flow.time_end is '支付完成时间';
COMMENT ON COLUMN system_charge_equipment_bill_flow.payment_amount is '支付金额';
COMMENT ON COLUMN system_charge_equipment_bill_flow.amount is '流水金额（分）';
COMMENT ON COLUMN system_charge_equipment_bill_flow.ratio is '扣减比例';
COMMENT ON COLUMN system_charge_equipment_bill_flow.status is '状态：0未支付；1待支付；2已支付；3退款';
COMMENT ON COLUMN system_charge_equipment_bill_flow.agent_user_id is '代理商ID';
COMMENT ON COLUMN system_charge_equipment_bill_flow.lyy_distributor_id is '商家ID';
COMMENT ON COLUMN system_charge_equipment_bill_flow.from_equipment_id is '来源设备ID';
COMMENT ON COLUMN system_charge_equipment_bill_flow.from_equipment_group_id is '来源场地ID';
COMMENT ON COLUMN system_charge_equipment_bill_flow.from_distributor_id is '来源商家ID';
COMMENT ON COLUMN system_charge_equipment_bill_flow.from_agent_user_id is '来源代理商ID';
COMMENT ON TABLE system_charge_equipment_bill_flow is '设备缴费流水表';
CREATE UNIQUE INDEX system_charge_equipment_bill_flow_pkey ON system_charge_equipment_bill_flow USING btree (system_charge_equipment_bill_flow_id);
CREATE INDEX system_charge_equipment_bill_flow_distributor_time_end_idx ON system_charge_equipment_bill_flow USING btree (lyy_distributor_id, time_end);
CREATE INDEX system_charge_equipment_bill_flow_distributor_created_idx ON system_charge_equipment_bill_flow USING btree (created, lyy_distributor_id);
CREATE INDEX system_charge_equipment_bill_flow_out_trade_no_idx ON system_charge_equipment_bill_flow USING hash (out_trade_no);
CREATE INDEX system_charge_equipment_bill_flow_distributor_idx ON system_charge_equipment_bill_flow USING btree (from_distributor_id, time_end);
CREATE INDEX system_charge_equipment_bill_equipment_bill_idx ON system_charge_equipment_bill_flow USING hash (system_charge_equipment_bill_id);
CREATE INDEX idx_system_charge_equipment_bill_flow_stauts ON system_charge_equipment_bill_flow USING btree (status);
