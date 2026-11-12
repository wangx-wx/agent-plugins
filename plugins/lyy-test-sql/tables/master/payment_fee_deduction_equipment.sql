-- payment_fee_deduction_equipment
-- 库：master
-- 业务分类：支付
-- 使用场景：查手续费外扣

CREATE TABLE adempiere.payment_fee_deduction_equipment (
    id bigint NOT NULL,
    distributor_id numeric(11,0) NOT NULL,
    distributor_name character varying(32),
    equipment_value character varying(40),
    equipment_type_value character varying(32),
    deduction_merchant_code character varying(32) NOT NULL,
    fee_member_id_code character varying(32),
    fee_member_principal_name character varying(40),
    out_app_id character varying(64),
    status smallint NOT NULL,
    create_time timestamp(6) without time zone NOT NULL,
    update_time timestamp(6) without time zone NOT NULL,
    create_by bigint,
    update_by bigint
);
COMMENT ON COLUMN adempiere.payment_fee_deduction_equipment.id is 'id, 主键';
COMMENT ON COLUMN adempiere.payment_fee_deduction_equipment.distributor_id is '商户id';
COMMENT ON COLUMN adempiere.payment_fee_deduction_equipment.distributor_name is '运营商名称,注册时的商户名称';
COMMENT ON COLUMN adempiere.payment_fee_deduction_equipment.equipment_value is '设备编号';
COMMENT ON COLUMN adempiere.payment_fee_deduction_equipment.equipment_type_value is '设备类型编码';
COMMENT ON COLUMN adempiere.payment_fee_deduction_equipment.deduction_merchant_code is '外扣商户号';
COMMENT ON COLUMN adempiere.payment_fee_deduction_equipment.fee_member_id_code is '手续费承担方证件id';
COMMENT ON COLUMN adempiere.payment_fee_deduction_equipment.fee_member_principal_name is '手续费承担方主体名称';
COMMENT ON COLUMN adempiere.payment_fee_deduction_equipment.out_app_id is '接入方outAppId';
COMMENT ON COLUMN adempiere.payment_fee_deduction_equipment.status is '状态 0-不可用 1-可用';
 
CREATE UNIQUE INDEX payment_fee_deduction_equipment_pkey ON adempiere.payment_fee_deduction_equipment USING btree (id);
CREATE UNIQUE INDEX payment_fee_deduction_equipment_value_merchant_code_unique_idx ON adempiere.payment_fee_deduction_equipment USING btree (equipment_value, deduction_merchant_code);
