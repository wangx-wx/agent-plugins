-- xiaole_life_user
-- 库：lyy_infor
-- 业务分类：洗水
-- 使用场景：查app用户信息

CREATE TABLE xiaole_life_user (
    id bigint NOT NULL,
    telephone character varying(20),
    nickname character varying(64),
    head_img character varying(255),
    gender smallint NOT NULL,
    birthday timestamp without time zone,
    status smallint NOT NULL DEFAULT 1,
    last_cancel_time timestamp without time zone,
    total_points numeric NOT NULL DEFAULT 0,
    app_version character varying(64),
    app_endpoint character varying(20),
    mobile_model character varying(32),
    create_time timestamp without time zone NOT NULL,
    created_by character varying(20) NOT NULL,
    update_time timestamp without time zone NOT NULL,
    updated_by character varying(20) NOT NULL,
    deleted boolean NOT NULL,
    sign_notify smallint NOT NULL DEFAULT 0,
    device_id character varying(64),
    password character varying(64),
    source smallint,
    app_name character varying(64) NOT NULL DEFAULT 'xiaolelife'::character varying
);
COMMENT ON COLUMN xiaole_life_user.id is 'ID';
COMMENT ON COLUMN xiaole_life_user.telephone is '手机号码';
COMMENT ON COLUMN xiaole_life_user.nickname is '昵称';
COMMENT ON COLUMN xiaole_life_user.head_img is '头像';
COMMENT ON COLUMN xiaole_life_user.gender is ' 性别 1-男 2-女 0-未知';
COMMENT ON COLUMN xiaole_life_user.birthday is '生日';
COMMENT ON COLUMN xiaole_life_user.status is '用户状态';
COMMENT ON COLUMN xiaole_life_user.last_cancel_time is '上次注销时间';
COMMENT ON COLUMN xiaole_life_user.total_points is '用户总积分';
COMMENT ON COLUMN xiaole_life_user.app_version is '应用版本';
COMMENT ON COLUMN xiaole_life_user.app_endpoint is '应用终端';
COMMENT ON COLUMN xiaole_life_user.mobile_model is '移动端型号';
COMMENT ON COLUMN xiaole_life_user.create_time is '创建时间';
COMMENT ON COLUMN xiaole_life_user.created_by is '创建人';
COMMENT ON COLUMN xiaole_life_user.update_time is '更新时间';
COMMENT ON COLUMN xiaole_life_user.updated_by is '更新人';
COMMENT ON COLUMN xiaole_life_user.deleted is '是否删除';
COMMENT ON COLUMN xiaole_life_user.sign_notify is '签到通知';
COMMENT ON COLUMN xiaole_life_user.device_id is '设备ID';
COMMENT ON COLUMN xiaole_life_user.password is '登录密码';
COMMENT ON COLUMN xiaole_life_user.source is '用户来源，1、微信，2、支付宝';
COMMENT ON COLUMN xiaole_life_user.app_name is '应用名称';
COMMENT ON TABLE xiaole_life_user is '小乐生活APP用户表';
CREATE UNIQUE INDEX xiaole_life_user_pkey ON xiaole_life_user USING btree (id);
CREATE INDEX idx_user_telephone ON xiaole_life_user USING btree (telephone);
CREATE INDEX idx_xiaole_life_user_user_telephone ON xiaole_life_user USING btree (telephone);
