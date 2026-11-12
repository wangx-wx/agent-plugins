-- wash_dimension_user_info
-- 库：cmember
-- 业务分类：洗水
-- 使用场景：查洗水商创活动退款、投诉记录

CREATE TABLE wash_dimension_user_info (
    id numeric(12,0) NOT NULL DEFAULT nextval('wash_dimension_user_info_seq'::regclass),
    user_id numeric(10,0) NOT NULL,
    activity_info jsonb,
    created_time timestamp without time zone NOT NULL,
    updated_time timestamp without time zone NOT NULL,
    deleted boolean DEFAULT false,
    created_by numeric(10,0) NOT NULL,
    updated_by numeric(10,0) NOT NULL
);
COMMENT ON COLUMN wash_dimension_user_info.id is 'ID';
COMMENT ON COLUMN wash_dimension_user_info.user_id is '商家ID';
COMMENT ON COLUMN wash_dimension_user_info.activity_info is '活动相关信息';
COMMENT ON COLUMN wash_dimension_user_info.created_time is '创建时间';
COMMENT ON COLUMN wash_dimension_user_info.updated_time is '更新时间';
COMMENT ON COLUMN wash_dimension_user_info.deleted is 'true表示已删除';
COMMENT ON COLUMN wash_dimension_user_info.created_by is '创建人';
COMMENT ON COLUMN wash_dimension_user_info.updated_by is '更新人';
COMMENT ON TABLE wash_dimension_user_info is '洗水用户维度信息表';
CREATE UNIQUE INDEX pk_wash_dimension_user_info ON wash_dimension_user_info USING btree (id);
CREATE UNIQUE INDEX idx_wash_dimension_user_info_user_id ON wash_dimension_user_info USING btree (user_id);
