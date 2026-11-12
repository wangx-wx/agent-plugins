-- xiaole_black_user
-- 库：lyy_infor
-- 业务分类：洗水
-- 使用场景：查不跳转app用户黑名单

CREATE TABLE xiaole_black_user (
    id bigint NOT NULL,
    black_type integer NOT NULL,
    telephone character varying(20) NOT NULL,
    create_time timestamp without time zone NOT NULL,
    created_by character varying(20) NOT NULL,
    update_time timestamp without time zone NOT NULL,
    updated_by character varying(20) NOT NULL,
    deleted boolean NOT NULL
);
COMMENT ON COLUMN xiaole_black_user.black_type is '黑名单类型';
COMMENT ON COLUMN xiaole_black_user.telephone is '手机号';
COMMENT ON TABLE xiaole_black_user is '小乐生活黑名单用户';
CREATE UNIQUE INDEX xiaole_black_user_pkey ON xiaole_black_user USING btree (id);
