-- xiaole_user_points_record
-- 库：lyy_infor
-- 业务分类：洗水
-- 使用场景：查app用户积分记录

CREATE TABLE xiaole_user_points_record (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    record_type smallint NOT NULL,
    p_from smallint,
    from_id bigint,
    p_to smallint,
    to_id bigint,
    points numeric NOT NULL,
    valid smallint NOT NULL,
    create_time timestamp without time zone NOT NULL,
    created_by character varying(20) NOT NULL,
    update_time timestamp without time zone NOT NULL,
    updated_by character varying(20) NOT NULL,
    deleted boolean NOT NULL
);
COMMENT ON COLUMN xiaole_user_points_record.id is '主键ID';
COMMENT ON COLUMN xiaole_user_points_record.user_id is '用户Id';
COMMENT ON COLUMN xiaole_user_points_record.record_type is '记录类型，获取、消耗';
COMMENT ON COLUMN xiaole_user_points_record.p_from is '积分来源';
COMMENT ON COLUMN xiaole_user_points_record.from_id is '如果from是PointsTask，就拿具体的task，签到的话，这个fromId就为空';
COMMENT ON COLUMN xiaole_user_points_record.p_to is '积分消耗处';
COMMENT ON COLUMN xiaole_user_points_record.to_id is '如果to是exchange，就拿具体的PointsCommodity的id，如果是过期的话，这个toId就为空';
COMMENT ON COLUMN xiaole_user_points_record.points is '积分值';
COMMENT ON COLUMN xiaole_user_points_record.valid is '这条记录拿到的积分是否还有效';
COMMENT ON COLUMN xiaole_user_points_record.create_time is '创建时间';
COMMENT ON COLUMN xiaole_user_points_record.created_by is '创建人';
COMMENT ON COLUMN xiaole_user_points_record.update_time is '更新时间';
COMMENT ON COLUMN xiaole_user_points_record.updated_by is '更新人';
COMMENT ON COLUMN xiaole_user_points_record.deleted is '是否删除';
COMMENT ON TABLE xiaole_user_points_record is '用户获取与消耗积分记录表';
CREATE UNIQUE INDEX xiaole_user_points_record_pkey ON xiaole_user_points_record USING btree (id);
CREATE INDEX idx_user_points_userid ON xiaole_user_points_record USING btree (user_id);
