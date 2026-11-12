-- agent_equipment
-- 库：master
-- 业务分类：充电桩
-- 使用场景：代理商设备表

CREATE TABLE adempiere.agent_equipment (
    agent_equipment_id numeric(10,0) NOT NULL,
    lyy_equipment_id numeric(10,0) NOT NULL,
    ad_user_id numeric(10,0),
    agent_user_id numeric(10,0) NOT NULL,
    ad_org_id numeric(10,0),
    unique_code character varying(64),
    equipment_value character varying(32),
    equipment_type_name character varying(32),
    equipment_type_value character varying(16),
    created timestamp(6) without time zone NOT NULL DEFAULT now(),
    createdby numeric(10,0) NOT NULL,
    updated timestamp(6) without time zone NOT NULL DEFAULT now(),
    updatedby numeric(10,0) NOT NULL,
    bd_id numeric(10,0),
    secord_agent_user_id numeric(10,0),
    agent_equipment_status character varying(8),
    merchant_authority numeric(2,0) DEFAULT 1,
    remark character varying(200),
    current_agent_user_id numeric(10,0)
);
COMMENT ON COLUMN adempiere.agent_equipment.remark is '备注';
COMMENT ON COLUMN adempiere.agent_equipment.current_agent_user_id is '设备当前所属代理商id';
 
CREATE UNIQUE INDEX agent_equipment_pkey ON adempiere.agent_equipment USING btree (agent_equipment_id);
CREATE INDEX agent_equipment_current_agent_user_id_idx ON adempiere.agent_equipment USING btree (current_agent_user_id);
CREATE INDEX agent_equipment_code_idx ON adempiere.agent_equipment USING hash (unique_code);
CREATE INDEX agent_equipment_eqid_idx ON adempiere.agent_equipment USING btree (lyy_equipment_id);
CREATE INDEX agent_equipment_org_idx ON adempiere.agent_equipment USING btree (ad_org_id);
CREATE INDEX agent_equipment_secord_agent_user_idx ON adempiere.agent_equipment USING hash (secord_agent_user_id) WHERE (secord_agent_user_id IS NOT NULL);
CREATE UNIQUE INDEX agent_equipment_value_unqidx ON adempiere.agent_equipment USING btree (equipment_value);
CREATE INDEX agent_equipment_user_equipment_idx ON adempiere.agent_equipment USING btree (agent_user_id, agent_equipment_id);
