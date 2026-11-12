-- iot_equipment_docking
-- 库：equipment
-- 业务分类：设备
-- 使用场景：查安卓设备信息

CREATE TABLE iot_equipment_docking (
    id numeric(12,0) NOT NULL,
    equipment_id numeric(12,0),
    equipment_value character varying(40),
    user_name character varying(25),
    phone character varying(25),
    screen_width smallint,
    screen_type smallint,
    screen_height smallint,
    resolution_height smallint,
    resolution_with smallint,
    screen_size character varying(64),
    resolution character varying(31),
    rolling_frequency smallint,
    app_id character varying(32),
    app_secret character varying(100),
    app_uuid character varying(64),
    switch_type smallint,
    face_equipment_type character varying(100),
    serial_unique_code character varying(200),
    app_type character varying(20),
    android_unique_code character varying(64),
    third_factory character varying(20),
    created timestamp without time zone,
    updated timestamp without time zone,
    is_active boolean,
    createdby numeric(12,0),
    updatedby numeric(12,0),
    connect_type smallint,
    connect_mode integer[],
    protocol_version character varying(32),
    mainboard_id numeric(12,0)
);
COMMENT ON COLUMN iot_equipment_docking.equipment_id is '设备ID';
COMMENT ON COLUMN iot_equipment_docking.equipment_value is '设备编号';
COMMENT ON COLUMN iot_equipment_docking.user_name is '管理员姓名';
COMMENT ON COLUMN iot_equipment_docking.phone is '管理员手机号码';
COMMENT ON COLUMN iot_equipment_docking.screen_width is '屏幕宽度';
COMMENT ON COLUMN iot_equipment_docking.screen_type is '屏幕类型
(1-福袋机屏,2-落地屏)';
COMMENT ON COLUMN iot_equipment_docking.screen_height is '屏幕高度';
COMMENT ON COLUMN iot_equipment_docking.resolution_height is '屏幕分辨率高度';
COMMENT ON COLUMN iot_equipment_docking.resolution_with is '屏幕分辨率宽度';
COMMENT ON COLUMN iot_equipment_docking.screen_size is '屏幕大小';
COMMENT ON COLUMN iot_equipment_docking.resolution is '分辨率';
COMMENT ON COLUMN iot_equipment_docking.rolling_frequency is '滚动频率';
COMMENT ON COLUMN iot_equipment_docking.app_id is '接入应用编码';
COMMENT ON COLUMN iot_equipment_docking.app_secret is '接入私钥';
COMMENT ON COLUMN iot_equipment_docking.app_uuid is '接入设备uuid';
COMMENT ON COLUMN iot_equipment_docking.switch_type is '接入方式( 0 接口接入 1 盒子接入)';
COMMENT ON COLUMN iot_equipment_docking.face_equipment_type is '刷脸设备型号';
COMMENT ON COLUMN iot_equipment_docking.serial_unique_code is '设备序列唯一码';
COMMENT ON COLUMN iot_equipment_docking.app_type is 'app 类型';
COMMENT ON COLUMN iot_equipment_docking.android_unique_code is 'android唯一码';
COMMENT ON COLUMN iot_equipment_docking.third_factory is '对接第三方工厂';
COMMENT ON COLUMN iot_equipment_docking.created is '创建时间';
COMMENT ON COLUMN iot_equipment_docking.updated is '更新时间';
COMMENT ON COLUMN iot_equipment_docking.is_active is '是否可用';
COMMENT ON COLUMN iot_equipment_docking.createdby is '创建者';
COMMENT ON COLUMN iot_equipment_docking.updatedby is '更新者';
COMMENT ON COLUMN iot_equipment_docking.protocol_version is '协议版本号，登陆时会更新，目前用于sdk设备';
COMMENT ON COLUMN iot_equipment_docking.mainboard_id is '主板id';
COMMENT ON TABLE iot_equipment_docking is '设备对接参数';
CREATE UNIQUE INDEX iot_equipment_docking_pkey ON iot_equipment_docking USING btree (id);
CREATE UNIQUE INDEX uidx_appid_uuid ON iot_equipment_docking USING btree (app_id, app_uuid);
CREATE INDEX iot_equipment_docking_equipment_id_idx ON iot_equipment_docking USING hash (equipment_id);
