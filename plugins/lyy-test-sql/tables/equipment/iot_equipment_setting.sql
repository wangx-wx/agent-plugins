-- iot_equipment_setting
-- 库：equipment
-- 业务分类：设备
-- 使用场景：查设备对应的协议

CREATE TABLE iot_equipment_setting (
    id numeric(12,0) NOT NULL,
    equipment_id numeric(12,0),
    product_number character varying(32),
    system_version character varying(50),
    is_pulse character(1),
    app_version character varying(50),
    signal integer,
    pulse_interval smallint,
    interface_baud_rate character varying(6),
    pulse_width_one numeric(12,0),
    pulse_width_two numeric(12,0),
    standby_status character varying(2),
    support_grip character varying(2),
    support_gift character varying(2),
    paper_model character varying(6),
    pulse_duration_ratio smallint,
    gateway_equipment_value character varying(32),
    factory_brand character varying(32),
    created timestamp without time zone,
    updated timestamp without time zone,
    is_active boolean,
    createdby numeric(12,0),
    updatedby numeric(12,0),
    standby_level smallint,
    pulse_width smallint,
    other_standby_level smallint,
    other_pulse_width smallint,
    other_pulse_interval smallint,
    pulse_interval_one numeric,
    pulse_interval_two numeric,
    protocol_id character varying(20),
    gps_support smallint,
    return_ability jsonb,
    low_power boolean
);
COMMENT ON COLUMN iot_equipment_setting.equipment_id is '设备ID';
COMMENT ON COLUMN iot_equipment_setting.product_number is '主板产品编号';
COMMENT ON COLUMN iot_equipment_setting.system_version is '系统版本号';
COMMENT ON COLUMN iot_equipment_setting.is_pulse is '是否开启脉冲间隔 / isinterval';
COMMENT ON COLUMN iot_equipment_setting.app_version is 'app版本号';
COMMENT ON COLUMN iot_equipment_setting.signal is '信号值';
COMMENT ON COLUMN iot_equipment_setting.pulse_interval is '脉冲间隔';
COMMENT ON COLUMN iot_equipment_setting.interface_baud_rate is '接口波特率';
COMMENT ON COLUMN iot_equipment_setting.pulse_duration_ratio is '脉冲转换率';
COMMENT ON COLUMN iot_equipment_setting.gateway_equipment_value is '网关设备号';
COMMENT ON COLUMN iot_equipment_setting.factory_brand is '工厂品牌';
COMMENT ON COLUMN iot_equipment_setting.created is '创建时间';
COMMENT ON COLUMN iot_equipment_setting.updated is '更新时间';
COMMENT ON COLUMN iot_equipment_setting.is_active is '是否可用';
COMMENT ON COLUMN iot_equipment_setting.createdby is '创建者';
COMMENT ON COLUMN iot_equipment_setting.updatedby is '更新者';
COMMENT ON COLUMN iot_equipment_setting.standby_level is '待机电平,0 常开 1常闭';
COMMENT ON COLUMN iot_equipment_setting.pulse_width is '脉冲宽度';
COMMENT ON COLUMN iot_equipment_setting.other_standby_level is '额外设备-待机电平 ';
COMMENT ON COLUMN iot_equipment_setting.other_pulse_width is '额外设备-脉冲宽度 ';
COMMENT ON COLUMN iot_equipment_setting.other_pulse_interval is '额外设置-脉冲间隔';
COMMENT ON COLUMN iot_equipment_setting.pulse_interval_one is '脉冲间隔one';
COMMENT ON COLUMN iot_equipment_setting.pulse_interval_two is '脉冲间隔two';
COMMENT ON COLUMN iot_equipment_setting.protocol_id is '所属协议id';
COMMENT ON COLUMN iot_equipment_setting.gps_support is '是否支持GPS: 0-不支持, 1-支持, NULL-未知';
COMMENT ON COLUMN iot_equipment_setting.return_ability is '设备还车能力';
COMMENT ON COLUMN iot_equipment_setting.low_power is '是否低功耗';
COMMENT ON TABLE iot_equipment_setting is '设备设置参数';
CREATE UNIQUE INDEX iot_equipment_setting_pkey ON iot_equipment_setting USING btree (id);
CREATE INDEX iot_equipment_setting_equipment_id_idx ON iot_equipment_setting USING hash (equipment_id);
