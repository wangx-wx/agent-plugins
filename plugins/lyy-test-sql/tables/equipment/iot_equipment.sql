-- iot_equipment
-- 库：equipment
-- 业务分类：设备
-- 使用场景：查设备信息

CREATE TABLE iot_equipment (
    id numeric(12,0) NOT NULL,
    value character varying(40),
    unique_code character varying(32),
    iccid character varying(32),
    imei character varying(64),
    login_flag numeric(10,0),
    factory numeric(12,0),
    mainboard_factory numeric(12,0),
    mainboard_model character varying(255),
    factory_model character varying(255),
    hardware_model character varying(255),
    hardware_project numeric(12,0),
    interface_type character varying(6),
    bluetooth_mac character varying(60),
    mac character varying(60),
    firmware_version character varying(32),
    business_version_no character varying(30),
    initial_time timestamp without time zone,
    factory_type numeric(12,0),
    device_type character varying(10),
    status character varying(12) DEFAULT NULL::character varying,
    hardware_flag numeric(6,0),
    gateway smallint,
    category integer[],
    firmware_business_no character varying(64),
    firmware_underlay_no character varying(64),
    created timestamp without time zone,
    updated timestamp without time zone,
    is_active boolean,
    createdby numeric(12,0),
    updatedby numeric(12,0),
    private_key character varying(64),
    pkey_password character varying(32),
    bluetooth_key character varying(64)
);
COMMENT ON COLUMN iot_equipment.id is '设备ID';
COMMENT ON COLUMN iot_equipment.value is '设备编号';
COMMENT ON COLUMN iot_equipment.unique_code is '设备唯一码';
COMMENT ON COLUMN iot_equipment.iccid is 'iccid卡号';
COMMENT ON COLUMN iot_equipment.imei is 'imei码';
COMMENT ON COLUMN iot_equipment.login_flag is '登录标识';
COMMENT ON COLUMN iot_equipment.factory is '生产工厂';
COMMENT ON COLUMN iot_equipment.mainboard_factory is '主板工厂';
COMMENT ON COLUMN iot_equipment.mainboard_model is '主板型号';
COMMENT ON COLUMN iot_equipment.factory_model is '生产工厂设备型号';
COMMENT ON COLUMN iot_equipment.hardware_model is '硬件网关编号';
COMMENT ON COLUMN iot_equipment.hardware_project is '硬件产品';
COMMENT ON COLUMN iot_equipment.interface_type is '接口类型';
COMMENT ON COLUMN iot_equipment.bluetooth_mac is '蓝牙mac地址';
COMMENT ON COLUMN iot_equipment.mac is 'mac地址';
COMMENT ON COLUMN iot_equipment.firmware_version is '固件版本号/version_no';
COMMENT ON COLUMN iot_equipment.business_version_no is '业务版本号/business_version_no';
COMMENT ON COLUMN iot_equipment.initial_time is '初始时间';
COMMENT ON COLUMN iot_equipment.factory_type is '出厂设备类型';
COMMENT ON COLUMN iot_equipment.device_type is '设备类型 LYY/LYY2';
COMMENT ON COLUMN iot_equipment.status is '设备状态(启用:非disabled字段均可，默认使用1Normal   禁用:disabled)';
COMMENT ON COLUMN iot_equipment.hardware_flag is '设备底层标识';
COMMENT ON COLUMN iot_equipment.gateway is '网关';
COMMENT ON COLUMN iot_equipment.category is '设备形态(array格式) / 蓝牙、刷脸、反扫
(1、反扫
2、刷脸
3、蓝牙)';
COMMENT ON COLUMN iot_equipment.firmware_business_no is '硬件业务版本/firmware_no';
COMMENT ON COLUMN iot_equipment.firmware_underlay_no is '硬件底层版本';
COMMENT ON COLUMN iot_equipment.created is '创建时间';
COMMENT ON COLUMN iot_equipment.updated is '更新时间';
COMMENT ON COLUMN iot_equipment.is_active is '是否可用';
COMMENT ON COLUMN iot_equipment.createdby is '创建者';
COMMENT ON COLUMN iot_equipment.updatedby is '更新者';
COMMENT ON COLUMN iot_equipment.private_key is '设备私钥';
COMMENT ON COLUMN iot_equipment.pkey_password is '私钥密码';
COMMENT ON COLUMN iot_equipment.bluetooth_key is '蓝牙密钥';
 
CREATE UNIQUE INDEX iot_equipment_pkey ON iot_equipment USING btree (id);
CREATE INDEX iot_equipment_mac_idx ON iot_equipment USING btree (mac, is_active) WHERE (mac IS NOT NULL);
CREATE INDEX iot_equipment_iccid_idx ON iot_equipment USING btree (iccid);
CREATE UNIQUE INDEX iot_equipment_unique_code_unqidx ON iot_equipment USING btree (unique_code);
CREATE UNIQUE INDEX iot_equipment_value_qunidx ON iot_equipment USING btree (value);
CREATE INDEX iot_equipment_login_flag_idx ON iot_equipment USING btree (login_flag);
CREATE INDEX idx_iot_equipment_fversion ON iot_equipment USING btree (firmware_version);
