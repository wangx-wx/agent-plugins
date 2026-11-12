-- jd_insurance_start_record
-- 库：cmember
-- 业务分类：按摩
-- 使用场景：京东权益领取记录

CREATE TABLE jd_insurance_start_record (
    id numeric(12,0) NOT NULL DEFAULT nextval('jd_insurance_start_record_seq'::regclass),
    user_id numeric(12,0) NOT NULL,
    merchant_id numeric(11,0),
    store_id numeric(11,0),
    equipment_value character varying(24),
    phone character varying(16),
    reward_value numeric(10,2),
    subsidy_amount numeric(10,2),
    use_time timestamp without time zone,
    use_status smallint,
    start_time timestamp without time zone,
    start_status smallint,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted boolean NOT NULL DEFAULT false,
    order_no character varying(32),
    reward_type smallint DEFAULT 1,
    extend_info jsonb
);
COMMENT ON COLUMN jd_insurance_start_record.id is '主键ID';
COMMENT ON COLUMN jd_insurance_start_record.user_id is '用户ID';
COMMENT ON COLUMN jd_insurance_start_record.merchant_id is '商家ID';
COMMENT ON COLUMN jd_insurance_start_record.store_id is '场地ID';
COMMENT ON COLUMN jd_insurance_start_record.equipment_value is '设备编号';
COMMENT ON COLUMN jd_insurance_start_record.phone is '手机号';
COMMENT ON COLUMN jd_insurance_start_record.reward_value is '奖励值';
COMMENT ON COLUMN jd_insurance_start_record.subsidy_amount is '补贴金额';
COMMENT ON COLUMN jd_insurance_start_record.use_time is '使用核销时间';
COMMENT ON COLUMN jd_insurance_start_record.use_status is '使用核销状态 0=初始化 1=核销成功 2=核销失败';
COMMENT ON COLUMN jd_insurance_start_record.start_time is '启动时间';
COMMENT ON COLUMN jd_insurance_start_record.start_status is '启动状态 0=初始化 1=启动成功 2=启动失败 ';
COMMENT ON COLUMN jd_insurance_start_record.create_time is '创建时间';
COMMENT ON COLUMN jd_insurance_start_record.update_time is '更新时间';
COMMENT ON COLUMN jd_insurance_start_record.created_by is '创建人';
COMMENT ON COLUMN jd_insurance_start_record.updated_by is '修改人';
COMMENT ON COLUMN jd_insurance_start_record.deleted is '是否删除';
COMMENT ON COLUMN jd_insurance_start_record.order_no is '订单号';
COMMENT ON COLUMN jd_insurance_start_record.reward_type is '奖励类型 1=设备启动 2=券奖励';
COMMENT ON COLUMN jd_insurance_start_record.extend_info is '扩展信息字段';
COMMENT ON TABLE jd_insurance_start_record is '京东保险核销启动记录表';
CREATE UNIQUE INDEX jd_insurance_start_record_pkey ON jd_insurance_start_record USING btree (id);
CREATE INDEX jd_insurance_start_record_use_time_idx ON jd_insurance_start_record USING btree (use_time);
CREATE INDEX jd_insurance_start_record_user_id_idx ON jd_insurance_start_record USING btree (user_id);
CREATE INDEX jd_insurance_start_record_phone_idx ON jd_insurance_start_record USING btree (phone);
