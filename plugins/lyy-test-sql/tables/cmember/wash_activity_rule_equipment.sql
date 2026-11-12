-- wash_activity_rule_equipment
-- 库：cmember
-- 业务分类：洗水
-- 使用场景：查洗水商家维度商创活动（Excel 表名列写作 promotion_activity_merchant）

CREATE TABLE lyy.wash_activity_rule_equipment (
    id numeric(12,0) NOT NULL DEFAULT nextval('wash_activity_rule_equipment_seq'::regclass),
    merchant_id numeric(10,0) NOT NULL,
    equipment_value character varying(40) NOT NULL,
    product_type smallint NOT NULL,
    scene smallint NOT NULL,
    type smallint NOT NULL,
    remark character varying(32),
    created_time timestamp without time zone NOT NULL,
    updated_time timestamp without time zone NOT NULL,
    deleted boolean DEFAULT false,
    created_by numeric(10,0) NOT NULL,
    updated_by numeric(10,0) NOT NULL
);
COMMENT ON COLUMN lyy.wash_activity_rule_equipment.id is 'ID';
COMMENT ON COLUMN lyy.wash_activity_rule_equipment.merchant_id is '商家ID';
COMMENT ON COLUMN lyy.wash_activity_rule_equipment.equipment_value is '设备编号';
COMMENT ON COLUMN lyy.wash_activity_rule_equipment.product_type is '洗水活动类型';
COMMENT ON COLUMN lyy.wash_activity_rule_equipment.scene is '场景码';
COMMENT ON COLUMN lyy.wash_activity_rule_equipment.type is '0白名单 1黑名单';
COMMENT ON COLUMN lyy.wash_activity_rule_equipment.remark is '备注';
COMMENT ON COLUMN lyy.wash_activity_rule_equipment.created_time is '创建时间';
COMMENT ON COLUMN lyy.wash_activity_rule_equipment.updated_time is '更新时间';
COMMENT ON COLUMN lyy.wash_activity_rule_equipment.deleted is 'true表示已删除';
COMMENT ON COLUMN lyy.wash_activity_rule_equipment.created_by is '创建人';
COMMENT ON COLUMN lyy.wash_activity_rule_equipment.updated_by is '更新人';
COMMENT ON TABLE lyy.wash_activity_rule_equipment is '洗水活动规则-设备名单';
CREATE UNIQUE INDEX pk_wash_activity_rule_equipment ON lyy.wash_activity_rule_equipment USING btree (id);
CREATE INDEX idx_wash_activity_rule_equipment_merchant_id_equipment_value ON lyy.wash_activity_rule_equipment USING btree (merchant_id, equipment_value, type, deleted);
