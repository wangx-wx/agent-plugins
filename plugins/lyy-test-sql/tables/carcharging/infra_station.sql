-- infra_station
-- 库：carcharging
-- 业务分类：汽充桩
-- 使用场景：站点

CREATE TABLE infra_station (
    id bigint NOT NULL,
    operator_code character(9),
    platform_origin_id integer DEFAULT 1,
    merchant_id bigint NOT NULL,
    station_id bigint NOT NULL,
    business_hours_type integer NOT NULL DEFAULT 1,
    business_hours_desc character varying(255),
    station_tel character varying(50),
    service_tel character varying(50),
    park_num integer,
    park_fee_desc character varying(255),
    guide character varying(255),
    invoice_type integer NOT NULL DEFAULT 0,
    images character varying,
    station_name character varying(50) NOT NULL,
    province_id numeric NOT NULL,
    city_id numeric(10,2) NOT NULL,
    district_id numeric NOT NULL,
    district_code character(12) NOT NULL,
    address character varying(255) NOT NULL,
    station_operate_status smallint NOT NULL,
    lng numeric(12,8),
    lat numeric(12,8),
    remark character varying(255),
    station_visible smallint NOT NULL DEFAULT 1,
    price_model_id bigint,
    created timestamp without time zone NOT NULL,
    created_by bigint NOT NULL,
    updated timestamp without time zone,
    updated_by bigint,
    organization_id bigint,
    deleted boolean NOT NULL DEFAULT false,
    ext_resource text,
    platform_origin_merchant_id character varying(64),
    station_type integer DEFAULT 0,
    hlht_platform_operator_id character varying(32),
    hlht_merchant_operator_id character varying(32),
    hlht_station_id character varying(32),
    hlht_extend_info text
);
COMMENT ON COLUMN infra_station.id is '主键Id，雪花算法生成';
COMMENT ON COLUMN infra_station.operator_code is '组织机构代码，去掉前八位和最后一位';
COMMENT ON COLUMN infra_station.platform_origin_id is '平台来源Id';
COMMENT ON COLUMN infra_station.merchant_id is '商户Id';
COMMENT ON COLUMN infra_station.station_id is '关联中台站场Id';
COMMENT ON COLUMN infra_station.business_hours_type is '运营时间类型
0：7*24小时
1：非7*24小时';
COMMENT ON COLUMN infra_station.business_hours_desc is '运营时间';
COMMENT ON COLUMN infra_station.station_tel is '站点电话';
COMMENT ON COLUMN infra_station.service_tel is '服务电话；平台服务电话';
COMMENT ON COLUMN infra_station.park_num is '车位数量';
COMMENT ON COLUMN infra_station.park_fee_desc is '停车费用描述';
COMMENT ON COLUMN infra_station.guide is '站点引导，描述性文字';
COMMENT ON COLUMN infra_station.invoice_type is '开票方式';
COMMENT ON COLUMN infra_station.images is '站场图片';
COMMENT ON COLUMN infra_station.station_name is '站场名称';
COMMENT ON COLUMN infra_station.province_id is '省Id';
COMMENT ON COLUMN infra_station.city_id is '城市Id';
COMMENT ON COLUMN infra_station.district_id is '区域Id';
COMMENT ON COLUMN infra_station.district_code is '区域行政编码';
COMMENT ON COLUMN infra_station.address is '地址';
COMMENT ON COLUMN infra_station.station_operate_status is '站场运营状态';
COMMENT ON COLUMN infra_station.lng is '经度';
COMMENT ON COLUMN infra_station.lat is '纬度';
COMMENT ON COLUMN infra_station.remark is '备注';
COMMENT ON COLUMN infra_station.station_visible is 'App可见不可见
INVISIBLE(0, "不可见")
VISIBLE(1, "可见")';
COMMENT ON COLUMN infra_station.price_model_id is '最新计费模型Id';
COMMENT ON COLUMN infra_station.created is '创建时间';
COMMENT ON COLUMN infra_station.created_by is '创建人';
COMMENT ON COLUMN infra_station.updated is '修改时间';
COMMENT ON COLUMN infra_station.updated_by is '更新人';
COMMENT ON COLUMN infra_station.organization_id is '组织Id';
COMMENT ON COLUMN infra_station.deleted is '软删除';
COMMENT ON COLUMN infra_station.ext_resource is '特殊资源';
COMMENT ON COLUMN infra_station.platform_origin_merchant_id is '平台来源商户Id';
COMMENT ON COLUMN infra_station.station_type is '场地类型，0：默认，1：支持校园一卡通，2：支持并充';
COMMENT ON COLUMN infra_station.hlht_platform_operator_id is '互联互通平台组织机构代码';
COMMENT ON COLUMN infra_station.hlht_merchant_operator_id is '互联互通商户组织机构代码';
COMMENT ON COLUMN infra_station.hlht_station_id is '互联互通第三方场地id';
COMMENT ON COLUMN infra_station.hlht_extend_info is '互联互通推送站点额外信息json格式';
COMMENT ON TABLE infra_station is '充电站基础信息';
CREATE UNIQUE INDEX station_pk ON infra_station USING btree (id);
CREATE INDEX infra_station_station_id_deleted_index ON infra_station USING btree (station_id DESC, deleted);
