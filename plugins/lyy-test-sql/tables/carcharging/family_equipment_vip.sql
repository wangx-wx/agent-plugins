-- family_equipment_vip
-- 库：carcharging
-- 业务分类：汽充桩
-- 使用场景：家充设备活动表

CREATE TABLE family_equipment_vip (
    id bigint NOT NULL,
    equipment_code character varying(64),
    register_time timestamp without time zone,
    factory_id bigint,
    vip_start_time timestamp without time zone NOT NULL,
    vip_end_time timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL DEFAULT now(),
    created_by bigint NOT NULL DEFAULT '-1'::integer,
    updated timestamp without time zone,
    updated_by bigint,
    organization_id bigint,
    deleted boolean NOT NULL DEFAULT false,
    insurance_type integer,
    insurance_start_time timestamp without time zone,
    insurance_end_time timestamp without time zone,
    guarantee_start_time timestamp without time zone,
    guarantee_end_time timestamp without time zone,
    extended_warranty_start_time timestamp without time zone,
    extended_warranty_end_time timestamp without time zone,
    vip_template_id bigint
);
COMMENT ON COLUMN family_equipment_vip.id is '主键id';
COMMENT ON COLUMN family_equipment_vip.equipment_code is '设备号';
COMMENT ON COLUMN family_equipment_vip.register_time is '注册时间';
COMMENT ON COLUMN family_equipment_vip.factory_id is '工厂id';
COMMENT ON COLUMN family_equipment_vip.vip_start_time is 'vip开始时间';
COMMENT ON COLUMN family_equipment_vip.vip_end_time is 'vip过期时间';
COMMENT ON COLUMN family_equipment_vip.created is '创建时间';
COMMENT ON COLUMN family_equipment_vip.created_by is '创建人';
COMMENT ON COLUMN family_equipment_vip.updated is '修改时间';
COMMENT ON COLUMN family_equipment_vip.updated_by is '创建人';
COMMENT ON COLUMN family_equipment_vip.organization_id is '组织Id';
COMMENT ON COLUMN family_equipment_vip.deleted is '软删除';
COMMENT ON COLUMN family_equipment_vip.insurance_type is '保险类型 0无1次卡2日卡,3月卡,4年卡';
COMMENT ON COLUMN family_equipment_vip.insurance_start_time is '保险开始时间';
COMMENT ON COLUMN family_equipment_vip.insurance_end_time is '保险结束时间';
COMMENT ON COLUMN family_equipment_vip.guarantee_start_time is '质保开始时间';
COMMENT ON COLUMN family_equipment_vip.guarantee_end_time is '质保结束时间';
COMMENT ON COLUMN family_equipment_vip.extended_warranty_start_time is '维修开始时间';
COMMENT ON COLUMN family_equipment_vip.extended_warranty_end_time is '维修结束时间';
COMMENT ON COLUMN family_equipment_vip.vip_template_id is 'vip收费模板id';
COMMENT ON TABLE family_equipment_vip is '家充设备收费';
CREATE UNIQUE INDEX family_equipment_vip_pkey ON family_equipment_vip USING btree (id);
CREATE UNIQUE INDEX family_equipment_vip_equipment_code_uindex ON family_equipment_vip USING btree (equipment_code);
