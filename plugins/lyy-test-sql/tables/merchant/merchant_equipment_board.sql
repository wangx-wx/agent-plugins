-- merchant_equipment_board
-- 库：merchant
-- 业务分类：洗水
-- 使用场景：查设备属于XYJ还是XYJY

CREATE TABLE merchant_equipment_board (
    id numeric(12,0) NOT NULL,
    merchant_id numeric(12,0),
    equipment_id numeric(12,0),
    parent_equipment_id numeric(12,0) DEFAULT 0,
    store_id numeric(12,0),
    store_name character varying(255),
    group_number numeric(12,0),
    physical_tag_ids numeric(12,0)[],
    unique_code character varying(32),
    equipment_value character varying(40),
    equipment_status smallint,
    equipment_work_status smallint,
    description character varying(255),
    offline_time timestamp without time zone,
    signal numeric(10,0),
    equipment_type_id numeric(12,0),
    equipment_type_value character varying(20),
    equipment_type_name character varying(40),
    factory_brand character varying(30),
    remarks character varying(255),
    created timestamp without time zone,
    updated timestamp without time zone,
    created_by numeric(12,0) DEFAULT 0,
    updated_by numeric(12,0),
    is_active boolean,
    status character varying(100),
    login_flag numeric(8,0),
    business_type numeric(8,0),
    channel_id character varying(20),
    skb_connect_status numeric(8,0),
    expire_at numeric(16,0) DEFAULT 0,
    related_status smallint,
    related_device_type smallint,
    subsidy_status smallint,
    health_status smallint,
    agent_user_id bigint,
    current_agent_user_id bigint,
    door_lock_state smallint,
    human_presence smallint
) WITH (fillfactor=100, autovacuum_vacuum_threshold=2000, autovacuum_vacuum_scale_factor=0.5);
COMMENT ON COLUMN merchant_equipment_board.id is '主键';
COMMENT ON COLUMN merchant_equipment_board.merchant_id is '商户id';
COMMENT ON COLUMN merchant_equipment_board.equipment_id is '设备ID';
COMMENT ON COLUMN merchant_equipment_board.parent_equipment_id is '上级设备ID';
COMMENT ON COLUMN merchant_equipment_board.store_id is '场地id';
COMMENT ON COLUMN merchant_equipment_board.store_name is '场地名称';
COMMENT ON COLUMN merchant_equipment_board.group_number is '场地内编号';
COMMENT ON COLUMN merchant_equipment_board.physical_tag_ids is '物理标签';
COMMENT ON COLUMN merchant_equipment_board.unique_code is '设备唯一码';
COMMENT ON COLUMN merchant_equipment_board.equipment_value is '设备编号';
COMMENT ON COLUMN merchant_equipment_board.equipment_status is '设备状态 1=在线   0=离线';
COMMENT ON COLUMN merchant_equipment_board.equipment_work_status is '设备工作状态    1=工作中  2= 空闲    0=故障';
COMMENT ON COLUMN merchant_equipment_board.description is '离线原因/故障原因';
COMMENT ON COLUMN merchant_equipment_board.offline_time is '离线时间';
COMMENT ON COLUMN merchant_equipment_board.signal is '信号值';
COMMENT ON COLUMN merchant_equipment_board.equipment_type_id is '设备类型id';
COMMENT ON COLUMN merchant_equipment_board.equipment_type_value is '设备类型值';
COMMENT ON COLUMN merchant_equipment_board.equipment_type_name is '设备类型名称';
COMMENT ON COLUMN merchant_equipment_board.factory_brand is '工厂品牌';
COMMENT ON COLUMN merchant_equipment_board.remarks is '设备备注';
COMMENT ON COLUMN merchant_equipment_board.created is '创建日期';
COMMENT ON COLUMN merchant_equipment_board.updated is '更新日期';
COMMENT ON COLUMN merchant_equipment_board.created_by is '创建人';
COMMENT ON COLUMN merchant_equipment_board.updated_by is '更新人';
COMMENT ON COLUMN merchant_equipment_board.is_active is '是否可用';
COMMENT ON COLUMN merchant_equipment_board.status is ' 设备状态(启用:非disabled字段均可，默认使用1Normal   禁用:disabled)';
COMMENT ON COLUMN merchant_equipment_board.login_flag is '登录标识';
COMMENT ON COLUMN merchant_equipment_board.business_type is '业务类型';
COMMENT ON COLUMN merchant_equipment_board.channel_id is '通道ID';
COMMENT ON COLUMN merchant_equipment_board.skb_connect_status is '刷卡版链接状态  0=无链接 1=通讯正常';
COMMENT ON COLUMN merchant_equipment_board.expire_at is '会话时间';
COMMENT ON COLUMN merchant_equipment_board.related_status is '关联的加液机状态';
COMMENT ON COLUMN merchant_equipment_board.related_device_type is '关联的加液机类型';
COMMENT ON COLUMN merchant_equipment_board.subsidy_status is '补贴状态(0=不补贴,1=补贴 目前为支付宝补贴设备使用）';
COMMENT ON COLUMN merchant_equipment_board.health_status is '健康检测连接状态(null=无连接 1=通讯正常)';
COMMENT ON COLUMN merchant_equipment_board.door_lock_state is '门锁状态(0=关闭 1=开启 NULL=从未上报，来源：iot_equipment_extension 经 device-event-hub 同步)';
COMMENT ON COLUMN merchant_equipment_board.human_presence is '人体感应(0=无人 1=有人 NULL=从未上报，来源同上)';
COMMENT ON TABLE merchant_equipment_board is '设备IOT宽表';
CREATE UNIQUE INDEX pk_lyy_merchant_equipment_board_new ON merchant_equipment_board USING btree (id);
CREATE INDEX idx_merchant_equipment_board_new_evalue_pequipment_id ON merchant_equipment_board USING btree (parent_equipment_id, equipment_value);
CREATE INDEX idx_merchant_equipment_board_new_mid_ev ON merchant_equipment_board USING btree (merchant_id, equipment_value, equipment_type_id);
CREATE INDEX merchant_equipment_board_new_equipment_id_idx ON merchant_equipment_board USING btree (equipment_id);
CREATE INDEX merchant_equipment_board_new_equipment_value_idx ON merchant_equipment_board USING btree (equipment_value);
CREATE INDEX merchant_equipment_board_new_store_id_idx ON merchant_equipment_board USING btree (store_id) WHERE (store_id IS NOT NULL);
CREATE UNIQUE INDEX merchant_equipment_board_new_unique_code_idx ON merchant_equipment_board USING btree (unique_code);
