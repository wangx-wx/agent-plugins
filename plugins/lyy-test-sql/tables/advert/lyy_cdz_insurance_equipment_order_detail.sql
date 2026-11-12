-- lyy_cdz_insurance_equipment_order_detail
-- 库：advert
-- 业务分类：充电桩
-- 使用场景：设备整桩投保记录

CREATE TABLE lyy_cdz_insurance_equipment_order_detail (
    lyy_cdz_insurance_equipment_order_detail_id bigint NOT NULL,
    out_trade_no character varying(32) NOT NULL,
    lyy_distributor_id bigint,
    equipment_value character varying(32) NOT NULL,
    equipment_port integer NOT NULL,
    lyy_equipment_id bigint NOT NULL,
    lyy_equipment_group_id bigint,
    insurance_amount numeric(10,2) DEFAULT NULL::numeric,
    policy_no character varying(128) DEFAULT NULL::character varying,
    total_actual_premium numeric(10,2) DEFAULT NULL::numeric,
    total_insured_amount numeric(10,2) DEFAULT NULL::numeric,
    insurance_begin_date timestamp(6) without time zone DEFAULT NULL::timestamp without time zone,
    insurance_end_date timestamp(6) without time zone DEFAULT NULL::timestamp without time zone,
    insurance_status integer,
    insurance_describe character varying(128) DEFAULT NULL::character varying,
    created timestamp(6) without time zone NOT NULL,
    createdby bigint NOT NULL,
    updated timestamp(6) without time zone,
    updatedby bigint
);
COMMENT ON COLUMN lyy_cdz_insurance_equipment_order_detail.lyy_cdz_insurance_equipment_order_detail_id is '主键ID';
COMMENT ON COLUMN lyy_cdz_insurance_equipment_order_detail.out_trade_no is '订单表';
COMMENT ON COLUMN lyy_cdz_insurance_equipment_order_detail.lyy_distributor_id is '关联商家ID';
COMMENT ON COLUMN lyy_cdz_insurance_equipment_order_detail.equipment_value is '设备value';
COMMENT ON COLUMN lyy_cdz_insurance_equipment_order_detail.equipment_port is '端口号';
COMMENT ON COLUMN lyy_cdz_insurance_equipment_order_detail.lyy_equipment_id is '关联设备ID';
COMMENT ON COLUMN lyy_cdz_insurance_equipment_order_detail.lyy_equipment_group_id is '关联设备场地ID';
COMMENT ON COLUMN lyy_cdz_insurance_equipment_order_detail.insurance_amount is '保单金额';
COMMENT ON COLUMN lyy_cdz_insurance_equipment_order_detail.policy_no is '保单号';
COMMENT ON COLUMN lyy_cdz_insurance_equipment_order_detail.total_actual_premium is '保费';
COMMENT ON COLUMN lyy_cdz_insurance_equipment_order_detail.total_insured_amount is '保额';
COMMENT ON COLUMN lyy_cdz_insurance_equipment_order_detail.insurance_begin_date is '保险起期';
COMMENT ON COLUMN lyy_cdz_insurance_equipment_order_detail.insurance_end_date is '保险止期';
COMMENT ON COLUMN lyy_cdz_insurance_equipment_order_detail.insurance_status is 'FAIL(0, "失败"),
SUCCESS(1, "生效中（成功）"),
EXPIRE(2, "失效（过期）"),
REFUND(3, "已退保");
';
COMMENT ON COLUMN lyy_cdz_insurance_equipment_order_detail.insurance_describe is '描述';
COMMENT ON COLUMN lyy_cdz_insurance_equipment_order_detail.created is '创建时间';
COMMENT ON COLUMN lyy_cdz_insurance_equipment_order_detail.createdby is '创建人ID';
COMMENT ON COLUMN lyy_cdz_insurance_equipment_order_detail.updated is '更新时间';
COMMENT ON COLUMN lyy_cdz_insurance_equipment_order_detail.updatedby is '更新人ID';
COMMENT ON TABLE lyy_cdz_insurance_equipment_order_detail is '整桩投保订单详情表';
CREATE INDEX lyy_cdz_insurance_equipment_order_detail_equipment_group_idx ON lyy_cdz_insurance_equipment_order_detail USING btree (lyy_equipment_group_id);
CREATE UNIQUE INDEX lyy_cdz_insurance_equipment_order_detail_pk ON lyy_cdz_insurance_equipment_order_detail USING btree (lyy_cdz_insurance_equipment_order_detail_id);
CREATE INDEX lyy_cdz_insurance_equipment_order_detail_equipment_value_index ON lyy_cdz_insurance_equipment_order_detail USING btree (equipment_value);
CREATE INDEX lyy_cdz_insurance_equipment_order_detail_out_trade_no_index ON lyy_cdz_insurance_equipment_order_detail USING btree (out_trade_no);
