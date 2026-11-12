-- lyy_charging_equipment_port
-- 库：massage_chair
-- 业务分类：充电桩
-- 使用场景：设备端口

CREATE TABLE lyy_charging_equipment_port (
    id bigint NOT NULL,
    merchant_id bigint NOT NULL,
    station_id bigint NOT NULL,
    lyy_equipment_id bigint NOT NULL,
    unique_code character varying(32) NOT NULL,
    mode_type smallint DEFAULT 0,
    login_flag integer,
    port smallint NOT NULL,
    port_status smallint,
    created timestamp(6) without time zone,
    created_by character varying(32),
    updated timestamp(6) without time zone,
    updated_by character varying(32),
    port_operator_status smallint
);
COMMENT ON COLUMN lyy_charging_equipment_port.id is '主键';
COMMENT ON COLUMN lyy_charging_equipment_port.merchant_id is '商户ID';
COMMENT ON COLUMN lyy_charging_equipment_port.station_id is '站点ID';
COMMENT ON COLUMN lyy_charging_equipment_port.lyy_equipment_id is '设备ID';
COMMENT ON COLUMN lyy_charging_equipment_port.unique_code is '设备唯一编码';
COMMENT ON COLUMN lyy_charging_equipment_port.mode_type is '0、普通设备，统计端口，1：脉冲设备，不统计端口';
COMMENT ON COLUMN lyy_charging_equipment_port.login_flag is '登陆标识、冗余字段';
COMMENT ON COLUMN lyy_charging_equipment_port.port is '端口号';
COMMENT ON COLUMN lyy_charging_equipment_port.port_status is '端口状态
IDLE(1, "空闲"),
CHARGING(2, "充电中"),
FAULT(3, "故障"),
DISABLE(4, "禁用"),
OFFLINE(5, "离线"),
UN_KNOW(255, "未知"),
';
COMMENT ON COLUMN lyy_charging_equipment_port.created is '创建时间';
COMMENT ON COLUMN lyy_charging_equipment_port.created_by is '创建人';
COMMENT ON COLUMN lyy_charging_equipment_port.updated is '更新时间';
COMMENT ON COLUMN lyy_charging_equipment_port.updated_by is '更新人';
COMMENT ON COLUMN lyy_charging_equipment_port.port_operator_status is '服务端端口的操作状态 0:启用 1:禁用';
COMMENT ON TABLE lyy_charging_equipment_port is '二轮充电桩端口信息表';
CREATE UNIQUE INDEX lyy_charging_equipment_port_pkey ON lyy_charging_equipment_port USING btree (id);
CREATE INDEX "stationId_index" ON lyy_charging_equipment_port USING btree (station_id);
CREATE INDEX lyy_charging_equipment_port_merchant_id_index ON lyy_charging_equipment_port USING btree (merchant_id);
CREATE INDEX unique_code_port_index ON lyy_charging_equipment_port USING btree (unique_code);
CREATE INDEX idx_lyy_charging_equipment_port_mucode ON lyy_charging_equipment_port USING btree (unique_code, merchant_id);
CREATE INDEX idx_lyy_charging_equipment_port_mcport ON lyy_charging_equipment_port USING btree (unique_code, port);
