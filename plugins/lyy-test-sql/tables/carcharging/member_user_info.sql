-- member_user_info
-- 库：carcharging
-- 业务分类：汽充桩
-- 使用场景：用户表

CREATE TABLE member_user_info (
    id bigint NOT NULL,
    member_id bigint NOT NULL,
    merchant_member_id bigint NOT NULL,
    merchant_id bigint NOT NULL,
    name character varying(32),
    phone bigint,
    agreement_id character varying(32),
    head_image character varying(255),
    sign_flag smallint,
    created timestamp(6) without time zone NOT NULL,
    updated timestamp(6) without time zone,
    created_by bigint NOT NULL,
    updated_by bigint,
    deleted boolean DEFAULT false,
    organization_id bigint,
    last_start_mode smallint,
    last_select_insurance boolean,
    phone_updated timestamp without time zone,
    phone_station_id bigint
);
COMMENT ON COLUMN member_user_info.id is 'ID';
COMMENT ON COLUMN member_user_info.member_id is '中台全局用户ID';
COMMENT ON COLUMN member_user_info.merchant_member_id is '商户用户ID';
COMMENT ON COLUMN member_user_info.merchant_id is '商户ID';
COMMENT ON COLUMN member_user_info.name is '昵称';
COMMENT ON COLUMN member_user_info.phone is '手机号';
COMMENT ON COLUMN member_user_info.agreement_id is '协议ID';
COMMENT ON COLUMN member_user_info.head_image is '头像地址';
COMMENT ON COLUMN member_user_info.sign_flag is '是否已签约：0 未签约， 1 签约成功，2 签约失败';
COMMENT ON COLUMN member_user_info.created is '创建时间';
COMMENT ON COLUMN member_user_info.updated is '修改时间';
COMMENT ON COLUMN member_user_info.created_by is '创建人';
COMMENT ON COLUMN member_user_info.updated_by is '修改人';
COMMENT ON COLUMN member_user_info.deleted is '软删除标志';
COMMENT ON COLUMN member_user_info.organization_id is '组织Id';
COMMENT ON COLUMN member_user_info.last_start_mode is '记录用户上次启动方式';
COMMENT ON COLUMN member_user_info.last_select_insurance is '记录用户上次是否勾选保险';
COMMENT ON COLUMN member_user_info.phone_updated is '手机号更新时间';
COMMENT ON COLUMN member_user_info.phone_station_id is '绑定手机号关联的场地';
COMMENT ON TABLE member_user_info is 'C端用户信息';
CREATE UNIQUE INDEX member_user_info_pkey ON member_user_info USING btree (id);
CREATE UNIQUE INDEX merchant_member_id_and_merchant ON member_user_info USING btree (merchant_member_id, merchant_id);
CREATE UNIQUE INDEX member_id_and_merchant_id ON member_user_info USING btree (member_id, merchant_id);
CREATE INDEX member_user_info_phone_merchant_idx ON member_user_info USING btree (phone, merchant_id);
