-- merchant_equipment
-- 库：master
-- 业务分类：充电桩
-- 使用场景：商家设备表

CREATE TABLE adempiere.merchant_equipment (
    id numeric(12,0) NOT NULL,
    merchant_id numeric(12,0),
    factory_id numeric(12,0),
    equipment_id numeric(12,0) NOT NULL,
    equipment_value character varying(40) NOT NULL,
    unique_code character varying(32),
    equipment_type_id numeric(12,0),
    store_id numeric(12,0),
    equipment_name character varying(120),
    remarks character varying(256),
    register_date timestamp without time zone,
    group_number numeric(10,0),
    status character varying(12),
    cloudcode_flag boolean,
    detail_switch boolean,
    auto_refund boolean,
    show_charging boolean DEFAULT false,
    auto_restart boolean DEFAULT false,
    open_show boolean,
    group_service_cost_way character varying(20),
    unit_price numeric(10,2),
    gift_price numeric(10,2),
    display_mode smallint DEFAULT 0,
    stock integer DEFAULT 0,
    charge_before_pay_status boolean,
    charge_before_pay_min_money numeric(5,2),
    charge_before_pay_max_money numeric(5,2),
    distributorpart numeric(10,4),
    factorypart numeric(10,4),
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    createdby numeric(10,0) NOT NULL,
    updatedby numeric(10,0) NOT NULL,
    is_active boolean DEFAULT true,
    description character varying(255),
    amount numeric(6,2) DEFAULT 0,
    mer_ble_switch_value boolean,
    server_compute_prop character varying(2000),
    register_system character varying(12),
    city_id numeric,
    district_id numeric,
    address character varying(256),
    sim_longitude numeric(10,7),
    sim_latitude numeric(10,7),
    login_flag numeric(10,0) DEFAULT NULL::numeric,
    business_type smallint,
    firmware_version character varying(32) DEFAULT NULL::character varying,
    device_type character varying(10),
    business_version_no character varying(32),
    factory_brand character varying(32),
    initial_time timestamp without time zone,
    firmware_business_no character varying(64),
    gateway smallint,
    third_factory character varying(20),
    protocol_id character varying(20),
    mac character varying(60),
    terminal_value character varying(64),
    imei_value character varying(64),
    third_platform character varying(20),
    ant_flag boolean,
    ant_mode smallint
);
COMMENT ON COLUMN adempiere.merchant_equipment.id is '主键';
COMMENT ON COLUMN adempiere.merchant_equipment.merchant_id is '商户ID';
COMMENT ON COLUMN adempiere.merchant_equipment.factory_id is '工厂ID';
COMMENT ON COLUMN adempiere.merchant_equipment.equipment_id is '设备ID';
COMMENT ON COLUMN adempiere.merchant_equipment.equipment_value is '设备编号';
COMMENT ON COLUMN adempiere.merchant_equipment.unique_code is '设备唯一码';
COMMENT ON COLUMN adempiere.merchant_equipment.equipment_type_id is '设备类型ID';
COMMENT ON COLUMN adempiere.merchant_equipment.store_id is '店铺/场地ID';
COMMENT ON COLUMN adempiere.merchant_equipment.equipment_name is '设备名称';
COMMENT ON COLUMN adempiere.merchant_equipment.remarks is '备注';
COMMENT ON COLUMN adempiere.merchant_equipment.register_date is '注册时间';
COMMENT ON COLUMN adempiere.merchant_equipment.group_number is '机台号';
COMMENT ON COLUMN adempiere.merchant_equipment.status is '状态 1.注册 2.禁用 3.解绑';
COMMENT ON COLUMN adempiere.merchant_equipment.cloudcode_flag is '是否注册到云码 0-否 1-是';
COMMENT ON COLUMN adempiere.merchant_equipment.detail_switch is '商品详情开关 0-关闭 1-开启';
COMMENT ON COLUMN adempiere.merchant_equipment.auto_refund is '是否自动退款 0=不自动退款，非0表示自动退款';
COMMENT ON COLUMN adempiere.merchant_equipment.show_charging is '是否显示充电倒计时页面 0 否 1 是';
COMMENT ON COLUMN adempiere.merchant_equipment.auto_restart is '是否断电自动重启 0=不自动重启，1=自动重启';
COMMENT ON COLUMN adempiere.merchant_equipment.open_show is '只针对洗衣机,是否显示开启暂停终止功能的控制开关 1是显示';
COMMENT ON COLUMN adempiere.merchant_equipment.group_service_cost_way is '计费模式';
COMMENT ON COLUMN adempiere.merchant_equipment.unit_price is '启动单价';
COMMENT ON COLUMN adempiere.merchant_equipment.gift_price is '礼品单价';
COMMENT ON COLUMN adempiere.merchant_equipment.display_mode is '商品展示方式 0-按商品顺序展示 1-按货道顺序同类商品合并展示 2-按货道顺序(不合并)';
COMMENT ON COLUMN adempiere.merchant_equipment.stock is '库存数量';
COMMENT ON COLUMN adempiere.merchant_equipment.charge_before_pay_status is '先充后付状态 0:关闭,1:打开';
COMMENT ON COLUMN adempiere.merchant_equipment.charge_before_pay_min_money is '最低余额使用限制(最小为1)';
COMMENT ON COLUMN adempiere.merchant_equipment.charge_before_pay_max_money is '最高余额使用限制';
COMMENT ON COLUMN adempiere.merchant_equipment.distributorpart is '商家分成比例';
COMMENT ON COLUMN adempiere.merchant_equipment.factorypart is '广告工厂分成比例';
COMMENT ON COLUMN adempiere.merchant_equipment.created is '创建时间';
COMMENT ON COLUMN adempiere.merchant_equipment.updated is '更新时间';
COMMENT ON COLUMN adempiere.merchant_equipment.createdby is '创建者';
COMMENT ON COLUMN adempiere.merchant_equipment.updatedby is '更新者';
COMMENT ON COLUMN adempiere.merchant_equipment.is_active is '是否可用 0:不可用；1:可用';
COMMENT ON COLUMN adempiere.merchant_equipment.description is '描述';
COMMENT ON COLUMN adempiere.merchant_equipment.amount is '启动金额';
COMMENT ON COLUMN adempiere.merchant_equipment.mer_ble_switch_value is '商家4G+蓝牙开关';
COMMENT ON COLUMN adempiere.merchant_equipment.server_compute_prop is '服务端计费属性';
COMMENT ON COLUMN adempiere.merchant_equipment.register_system is '注册系统标记：1.0 , 2.0 , 3.0';
COMMENT ON COLUMN adempiere.merchant_equipment.city_id is '城市ID';
COMMENT ON COLUMN adempiere.merchant_equipment.district_id is '地区id';
COMMENT ON COLUMN adempiere.merchant_equipment.address is '地址';
COMMENT ON COLUMN adempiere.merchant_equipment.sim_longitude is 'sim经度';
COMMENT ON COLUMN adempiere.merchant_equipment.sim_latitude is 'sim纬度';
COMMENT ON COLUMN adempiere.merchant_equipment.login_flag is '登录标识';
COMMENT ON COLUMN adempiere.merchant_equipment.business_type is '1=福袋机，2=口红机，3=自动售货机，4=冰淇淋机，5=星座机，6=按摩垫1+N，7=功德箱 8=电子烟，9=兑币机, 11=豆浆机 ,12=咖啡机,13=格子机,14=混合货道机，15=萌盒机,16=综合售货机，17=汽车充电桩';
COMMENT ON COLUMN adempiere.merchant_equipment.firmware_version is '固件版本号, lyy_equipment的versionno';
COMMENT ON COLUMN adempiere.merchant_equipment.device_type is '设备类型 LYY/LYY2';
COMMENT ON COLUMN adempiere.merchant_equipment.business_version_no is '业务版本号';
COMMENT ON COLUMN adempiere.merchant_equipment.factory_brand is '工厂品牌';
COMMENT ON COLUMN adempiere.merchant_equipment.initial_time is '初始时间';
COMMENT ON COLUMN adempiere.merchant_equipment.firmware_business_no is '硬件业务版本/firmware_no';
COMMENT ON COLUMN adempiere.merchant_equipment.gateway is '网关';
COMMENT ON COLUMN adempiere.merchant_equipment.third_factory is '对接第三方工厂';
COMMENT ON COLUMN adempiere.merchant_equipment.protocol_id is '所属协议id';
COMMENT ON COLUMN adempiere.merchant_equipment.mac is 'mac地址';
COMMENT ON COLUMN adempiere.merchant_equipment.terminal_value is '终端码';
COMMENT ON COLUMN adempiere.merchant_equipment.imei_value is 'imei编码';
COMMENT ON COLUMN adempiere.merchant_equipment.third_platform is '第三方平台code，第三平台迁移过来的设备标记，东晙code: DJ';
COMMENT ON COLUMN adempiere.merchant_equipment.ant_flag is '是否注册到蚂蚁链';
COMMENT ON COLUMN adempiere.merchant_equipment.ant_mode is '蚂蚁链补贴模式，0：重模式即单通，1：轻模式即双通';
COMMENT ON TABLE adempiere.merchant_equipment is '商户设备表';
CREATE UNIQUE INDEX merchant_equipment_pk ON adempiere.merchant_equipment USING btree (id);
CREATE INDEX idx_merchant_equipment_ucode ON adempiere.merchant_equipment USING btree (unique_code, is_active);
CREATE INDEX idx_merchant_equipment_fversion ON adempiere.merchant_equipment USING btree (firmware_version);
CREATE INDEX merchant_equipment_imei_value_index ON adempiere.merchant_equipment USING btree (imei_value);
CREATE UNIQUE INDEX merchant_equipment_equipment_id_unqidx ON adempiere.merchant_equipment USING btree (equipment_id);
CREATE INDEX merchant_equipment_merchant_idx ON adempiere.merchant_equipment USING hash (merchant_id) WHERE (merchant_id IS NOT NULL);
CREATE INDEX merchant_equipment_store_eqtype_idx ON adempiere.merchant_equipment USING btree (store_id, equipment_type_id) WHERE (store_id IS NOT NULL);
CREATE UNIQUE INDEX merchant_equipment_equipment_value_unqidx ON adempiere.merchant_equipment USING btree (equipment_value);
CREATE INDEX merchant_equipment_terminal_value_index ON adempiere.merchant_equipment USING btree (terminal_value);
CREATE INDEX merchant_equipment_lower_terminal_value_idx ON adempiere.merchant_equipment USING btree (lower((terminal_value)::text)) WHERE (lower((terminal_value)::text) IS NOT NULL);
CREATE INDEX merchant_equipment_lower_imei_value_idx ON adempiere.merchant_equipment USING btree (lower((imei_value)::text)) WHERE (lower((imei_value)::text) IS NOT NULL);
CREATE INDEX merchant_equipment_device_type_idx ON adempiere.merchant_equipment USING btree (unique_code text_pattern_ops) WHERE ((device_type)::text = ANY ((ARRAY['EXT'::character varying, 'LYY2'::character varying])::text[]));
CREATE INDEX idx_merchant_equipment_et_id ON adempiere.merchant_equipment USING btree (equipment_type_id);
CREATE INDEX idx_merchant_equipment_sid_mid ON adempiere.merchant_equipment USING btree (store_id, merchant_id);
CREATE INDEX idx_merchant_equipment_ftbt ON adempiere.merchant_equipment USING btree (third_factory, business_type);
