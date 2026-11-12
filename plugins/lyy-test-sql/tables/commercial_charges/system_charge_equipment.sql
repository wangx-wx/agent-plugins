-- system_charge_equipment
-- 库：commercial_charges
-- 业务分类：充电桩
-- 使用场景：收费设备

CREATE TABLE system_charge_equipment (
    system_charge_equipment_id numeric(10,0) NOT NULL DEFAULT NULL::numeric,
    system_charge_rule_id numeric(10,0) DEFAULT NULL::numeric,
    agent_user_id numeric(10,0) DEFAULT NULL::numeric,
    lyy_distributor_id numeric(10,0) DEFAULT NULL::numeric,
    lyy_equipment_group_id numeric(10,0) DEFAULT NULL::numeric,
    lyy_equipment_type_id numeric(10,0) DEFAULT NULL::numeric,
    lyy_equipment_id numeric(10,0) NOT NULL,
    equipment_value character varying(32) NOT NULL,
    first_registration_date timestamp(6) without time zone NOT NULL,
    end_date date NOT NULL,
    created timestamp(6) without time zone NOT NULL,
    updated timestamp(6) without time zone NOT NULL,
    flow_card_end_date timestamp(6) without time zone,
    is_confirm smallint DEFAULT 0
);
COMMENT ON COLUMN system_charge_equipment.system_charge_rule_id is '对应系统收费规则表ID';
COMMENT ON COLUMN system_charge_equipment.agent_user_id is '代理商ID';
COMMENT ON COLUMN system_charge_equipment.lyy_distributor_id is '商家ID';
COMMENT ON COLUMN system_charge_equipment.lyy_equipment_group_id is '场地ID';
COMMENT ON COLUMN system_charge_equipment.lyy_equipment_type_id is '设备类型ID';
COMMENT ON COLUMN system_charge_equipment.lyy_equipment_id is '设备ID';
COMMENT ON COLUMN system_charge_equipment.equipment_value is '设备编号';
COMMENT ON COLUMN system_charge_equipment.first_registration_date is '设备首次注册时间';
COMMENT ON COLUMN system_charge_equipment.end_date is '设备过期日期';
COMMENT ON COLUMN system_charge_equipment.flow_card_end_date is '流量卡到期时间';
COMMENT ON COLUMN system_charge_equipment.is_confirm is '是否确认(0:未确认,1:已确认)';
COMMENT ON TABLE system_charge_equipment is '系统收费设备表';
CREATE UNIQUE INDEX charge_equipment_combination_pkey ON system_charge_equipment USING btree (system_charge_equipment_id);
CREATE UNIQUE INDEX system_charge_equipment_unqidx ON system_charge_equipment USING btree (lyy_equipment_id);
CREATE INDEX system_charge_equipment_agent_idx ON system_charge_equipment USING btree (agent_user_id, end_date);
CREATE INDEX system_charge_equipment_distributor_idx ON system_charge_equipment USING btree (lyy_distributor_id, end_date);
CREATE INDEX system_charge_equipment_equipment_idx ON system_charge_equipment USING btree (lyy_equipment_id, end_date);
CREATE INDEX system_charge_equipment_value_idx ON system_charge_equipment USING hash (equipment_value);
