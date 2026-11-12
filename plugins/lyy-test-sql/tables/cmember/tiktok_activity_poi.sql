-- tiktok_activity_poi
-- 库：cmember
-- 业务分类：娱乐
-- 使用场景：查询抖音商户门店

CREATE TABLE tiktok_activity_poi (
    tiktok_activity_poi_id numeric(11,0) NOT NULL,
    lyy_distributor_name character varying(40),
    lyy_distributor_id numeric(10,0),
    poi_id character varying(40),
    poi_name character varying(40),
    address character varying(200),
    latitude numeric(12,8),
    longitude numeric(12,8),
    show_switch smallint DEFAULT 1,
    created timestamp(6) without time zone,
    updated timestamp(6) without time zone,
    createdby numeric(10,0),
    updatedby numeric(10,0),
    isactive character(1) DEFAULT 'Y'::bpchar,
    account_id character varying(40)
);
COMMENT ON COLUMN tiktok_activity_poi.tiktok_activity_poi_id is '抖音活动POI';
COMMENT ON COLUMN tiktok_activity_poi.lyy_distributor_name is '商家名称';
COMMENT ON COLUMN tiktok_activity_poi.lyy_distributor_id is '商家ID';
COMMENT ON COLUMN tiktok_activity_poi.poi_id is '抖音poi';
COMMENT ON COLUMN tiktok_activity_poi.poi_name is '店名';
COMMENT ON COLUMN tiktok_activity_poi.address is '地址';
COMMENT ON COLUMN tiktok_activity_poi.latitude is '纬度';
COMMENT ON COLUMN tiktok_activity_poi.longitude is '经度';
COMMENT ON COLUMN tiktok_activity_poi.show_switch is '展示开关 0 关闭 1 开启';
COMMENT ON COLUMN tiktok_activity_poi.created is '创建时间';
COMMENT ON COLUMN tiktok_activity_poi.updated is '更新时间';
COMMENT ON COLUMN tiktok_activity_poi.createdby is '创建人';
COMMENT ON COLUMN tiktok_activity_poi.updatedby is '更新人';
COMMENT ON COLUMN tiktok_activity_poi.isactive is '是否有效 Y 有效 N 无效';
COMMENT ON COLUMN tiktok_activity_poi.account_id is '商家抖音账号id';
COMMENT ON TABLE tiktok_activity_poi is '抖音POI活动';
CREATE UNIQUE INDEX tiktok_activity_poi_pkey ON tiktok_activity_poi USING btree (tiktok_activity_poi_id);
CREATE INDEX tiktok_activity_poi_lyy_distributor_id_account_id_index ON tiktok_activity_poi USING btree (lyy_distributor_id, account_id);
