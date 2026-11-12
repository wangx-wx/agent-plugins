-- xiaole_life_user_relate
-- 库：lyy_infor
-- 业务分类：洗水
-- 使用场景：查app用户与lyy、ls系统用户关联关系

CREATE TABLE xiaole_life_user_relate (
    id bigint NOT NULL,
    subject_platform character varying(20),
    subject_app_id character varying(64),
    subject_app_name character varying(64),
    subject_app_secret character varying(64),
    main_user_id bigint NOT NULL,
    open_id character varying(64),
    open_user_avatar character varying(255),
    platform_user_id character varying(64),
    status smallint NOT NULL,
    create_time timestamp without time zone NOT NULL,
    created_by character varying(20) NOT NULL,
    update_time timestamp without time zone NOT NULL,
    updated_by character varying(20) NOT NULL,
    deleted boolean NOT NULL,
    client_type character varying(64) NOT NULL DEFAULT 'wechat'::character varying,
    mark_singled boolean DEFAULT false,
    is_default boolean,
    open_nickname character varying(100)
);
COMMENT ON COLUMN xiaole_life_user_relate.id is 'ID';
COMMENT ON COLUMN xiaole_life_user_relate.subject_platform is '接入主体所在平台:微信、支付宝、抖音等';
COMMENT ON COLUMN xiaole_life_user_relate.subject_app_id is '接入主体应用id';
COMMENT ON COLUMN xiaole_life_user_relate.subject_app_name is '接入主体应用名称';
COMMENT ON COLUMN xiaole_life_user_relate.subject_app_secret is '接入主体应用密钥';
COMMENT ON COLUMN xiaole_life_user_relate.main_user_id is '小乐应用主平台Id';
COMMENT ON COLUMN xiaole_life_user_relate.open_id is '开放平台用户Id';
COMMENT ON COLUMN xiaole_life_user_relate.open_user_avatar is '开放平台用户头像';
COMMENT ON COLUMN xiaole_life_user_relate.platform_user_id is '关联的乐摇摇体系下的用户Id';
COMMENT ON COLUMN xiaole_life_user_relate.status is '记录状态';
COMMENT ON COLUMN xiaole_life_user_relate.create_time is '创建时间';
COMMENT ON COLUMN xiaole_life_user_relate.created_by is '创建人';
COMMENT ON COLUMN xiaole_life_user_relate.update_time is '更新时间';
COMMENT ON COLUMN xiaole_life_user_relate.updated_by is '更新人';
COMMENT ON COLUMN xiaole_life_user_relate.deleted is '是否删除';
COMMENT ON COLUMN xiaole_life_user_relate.client_type is '客户端,wechat,alipay';
COMMENT ON COLUMN xiaole_life_user_relate.mark_singled is '是否已标记单通道';
COMMENT ON COLUMN xiaole_life_user_relate.is_default is '是否默认记录';
COMMENT ON COLUMN xiaole_life_user_relate.open_nickname is '第三方昵称';
COMMENT ON TABLE xiaole_life_user_relate is '小乐用户关联平台用户记录表';
CREATE UNIQUE INDEX xiaole_life_user_relate_pkey ON xiaole_life_user_relate USING btree (id);
CREATE INDEX idx_xiaole_life_user_relate_pdctime ON xiaole_life_user_relate USING btree (platform_user_id, deleted, create_time);
CREATE INDEX idx_user_relate_platform_id ON xiaole_life_user_relate USING btree (platform_user_id);
CREATE INDEX idx_user_relate_multi_id ON xiaole_life_user_relate USING btree (main_user_id, platform_user_id, subject_platform);
CREATE INDEX idx_user_relate_user ON xiaole_life_user_relate USING btree (main_user_id, subject_platform);
CREATE INDEX idx_user_relate_platform_user ON xiaole_life_user_relate USING btree (platform_user_id, subject_platform);
