-- automatic_debit_receive_record
-- 库：advert
-- 业务分类：按摩
-- 使用场景：代扣记录

CREATE TABLE automatic_debit_receive_record (
    id bigint NOT NULL,
    user_id numeric(11,0),
    distributor_id numeric(11,0),
    group_id numeric(11,0),
    equipment_id numeric(11,0),
    equipment_value character varying(32),
    equipment_type numeric(11,0),
    track_no character varying(32),
    receive_amount character varying(32),
    created timestamp(6) without time zone NOT NULL DEFAULT NULL::timestamp without time zone,
    createdby bigint,
    updated timestamp(6) without time zone NOT NULL DEFAULT NULL::timestamp without time zone,
    updatedby bigint,
    deleted boolean
);
COMMENT ON COLUMN automatic_debit_receive_record.user_id is '用户id';
COMMENT ON COLUMN automatic_debit_receive_record.distributor_id is '商家id';
COMMENT ON COLUMN automatic_debit_receive_record.group_id is '场地id';
COMMENT ON COLUMN automatic_debit_receive_record.equipment_id is '设备id';
COMMENT ON COLUMN automatic_debit_receive_record.equipment_value is '设备编号';
COMMENT ON COLUMN automatic_debit_receive_record.equipment_type is '设备类型';
COMMENT ON COLUMN automatic_debit_receive_record.track_no is '扣费流水单号';
COMMENT ON COLUMN automatic_debit_receive_record.receive_amount is '领取金额';
COMMENT ON COLUMN automatic_debit_receive_record.deleted is '逻辑删除，false-未删除';
COMMENT ON TABLE automatic_debit_receive_record is '自动扣费领取记录表';
CREATE UNIQUE INDEX automatic_debit_receive_record_pk ON automatic_debit_receive_record USING btree (id);
