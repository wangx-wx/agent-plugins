-- equipment_charging_type
-- 库：master
-- 业务分类：充电桩
-- 使用场景：场地配置信息

CREATE TABLE adempiere.equipment_charging_type (
    equipment_charging_type_id numeric(11,0) NOT NULL,
    lyy_equipment_group_id numeric(11,0) NOT NULL,
    charging_type smallint NOT NULL,
    refund_type smallint NOT NULL DEFAULT 0,
    limit_time smallint,
    time_out_refund boolean DEFAULT false
);
COMMENT ON COLUMN adempiere.equipment_charging_type.equipment_charging_type_id is '主键';
COMMENT ON COLUMN adempiere.equipment_charging_type.lyy_equipment_group_id is '场地ID';
COMMENT ON COLUMN adempiere.equipment_charging_type.charging_type is '充电桩类型';
COMMENT ON COLUMN adempiere.equipment_charging_type.refund_type is '是否退款：0:不退款，1:退款，2限时退款';
COMMENT ON COLUMN adempiere.equipment_charging_type.limit_time is '限制时间（分钟）';
COMMENT ON COLUMN adempiere.equipment_charging_type.time_out_refund is '是否开启超时退款';
 
CREATE UNIQUE INDEX equipment_charging_type_pkey ON adempiere.equipment_charging_type USING btree (equipment_charging_type_id);
CREATE INDEX equipment_charging_type_group_idx ON adempiere.equipment_charging_type USING hash (lyy_equipment_group_id);
CREATE UNIQUE INDEX equipment_charging_type_unqidx ON adempiere.equipment_charging_type USING btree (lyy_equipment_group_id, charging_type);
