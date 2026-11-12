-- lyy_equipment_private_key
-- 库：master
-- 业务分类：设备
-- 使用场景：查设备密钥

CREATE TABLE adempiere.lyy_equipment_private_key (
    lyy_equipment_private_key_id numeric(10,0) NOT NULL,
    unique_code character varying(16) NOT NULL,
    private_key character varying(64) NOT NULL,
    password character varying(32) NOT NULL,
    ad_org_id numeric(10,0) NOT NULL,
    ad_client_id numeric(10,0) NOT NULL,
    isactive character(1) NOT NULL,
    created timestamp(6) without time zone NOT NULL,
    createdby numeric(10,0) NOT NULL,
    updated timestamp(6) without time zone NOT NULL,
    updatedby numeric(10,0) NOT NULL
);
COMMENT ON COLUMN adempiere.lyy_equipment_private_key.lyy_equipment_private_key_id is '主键id';
COMMENT ON COLUMN adempiere.lyy_equipment_private_key.unique_code is '唯一码';
COMMENT ON COLUMN adempiere.lyy_equipment_private_key.private_key is '私钥';
COMMENT ON COLUMN adempiere.lyy_equipment_private_key.password is '密码';
COMMENT ON COLUMN adempiere.lyy_equipment_private_key.ad_org_id is '废弃';
COMMENT ON TABLE adempiere.lyy_equipment_private_key is '设备密钥';
CREATE UNIQUE INDEX pk_lyy_equipment_private_key ON adempiere.lyy_equipment_private_key USING btree (lyy_equipment_private_key_id);
CREATE UNIQUE INDEX idxi_equipment_privite_key_uniquecode ON adempiere.lyy_equipment_private_key USING btree (unique_code);
