-- xiaole_user_no_app_request
-- 库：lyy_infor
-- 业务分类：洗水
-- 使用场景：查app不使用申请黑名单

CREATE TABLE xiaole_user_no_app_request (
    id bigint NOT NULL,
    platform_user_id character varying(64) NOT NULL,
    subject_platform character varying(20) NOT NULL,
    telephone character varying(20) NOT NULL,
    reason character varying(255) NOT NULL,
    status smallint NOT NULL DEFAULT 0,
    create_time timestamp without time zone NOT NULL,
    created_by character varying(20) NOT NULL,
    update_time timestamp without time zone NOT NULL,
    updated_by character varying(20) NOT NULL,
    deleted boolean NOT NULL
);
COMMENT ON COLUMN xiaole_user_no_app_request.platform_user_id is '平台用户Id';
COMMENT ON COLUMN xiaole_user_no_app_request.subject_platform is '平台';
COMMENT ON COLUMN xiaole_user_no_app_request.telephone is '手机号';
COMMENT ON COLUMN xiaole_user_no_app_request.reason is '提交原因';
COMMENT ON COLUMN xiaole_user_no_app_request.status is '审核状态，0：未审核，1：已审核';
COMMENT ON TABLE xiaole_user_no_app_request is '用户提交不要app的申请';
CREATE UNIQUE INDEX xiaole_user_no_app_request_pkey ON xiaole_user_no_app_request USING btree (id);
