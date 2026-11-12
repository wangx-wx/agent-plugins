-- device
-- 库：equipment
-- 业务分类：设备
-- 使用场景：查设备初始化

CREATE TABLE device (
    id numeric(12,0) NOT NULL,
    device_id character varying(32) NOT NULL,
    product_key character varying(64) NOT NULL,
    createdby character varying(32),
    updatedby character varying(32),
    created timestamp without time zone,
    updated timestamp without time zone,
    tenant_id character varying(30) NOT NULL DEFAULT '1131907415637544960'::character varying,
    auth_org_id character varying(30) NOT NULL DEFAULT '0'::character varying,
    unique_code character varying(32),
    disabled boolean NOT NULL DEFAULT false,
    is_active boolean DEFAULT true,
    transferred boolean DEFAULT false,
    gateway integer DEFAULT 7
);
COMMENT ON COLUMN device.device_id is '设备唯一标识';
COMMENT ON COLUMN device.product_key is '产品标识符';
COMMENT ON COLUMN device.createdby is '创建者';
COMMENT ON COLUMN device.updatedby is '更新者';
COMMENT ON COLUMN device.created is '创建时间';
COMMENT ON COLUMN device.updated is '更新时间';
COMMENT ON COLUMN device.tenant_id is '租户ID';
COMMENT ON COLUMN device.auth_org_id is '组织ID';
COMMENT ON COLUMN device.unique_code is '业务唯一编码';
COMMENT ON COLUMN device.disabled is '是否封禁，默认否';
COMMENT ON COLUMN device.is_active is '虚拟删除';
COMMENT ON COLUMN device.transferred is '设备是否被转移';
COMMENT ON COLUMN device.gateway is '网关类型 
0：LMQ
1:  NettyGateway
2:  2.0Gateway
3:  ExtendGateway
4:  OpenGateway
5:  BlueTooth
6:  PanguGateway
7:  EMQX';
COMMENT ON TABLE device is '设备表';
CREATE UNIQUE INDEX device_id_pk ON device USING btree (id);
CREATE UNIQUE INDEX idxi_product_key_device_id_pk ON device USING btree (device_id, product_key);
CREATE INDEX device_unique_code_idx ON device USING btree (unique_code);
CREATE INDEX idx_device_product_key ON device USING btree (product_key);
