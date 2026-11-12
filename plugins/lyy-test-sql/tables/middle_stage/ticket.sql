-- ticket
-- 库：middle_stage
-- 业务分类：洗水
-- 使用场景：查工单

CREATE TABLE ticket (
    id numeric(12,0) NOT NULL,
    code character varying(50),
    title character varying(50),
    category_id numeric(12,0) NOT NULL,
    group_id numeric(12,0),
    status smallint,
    timeout_limit timestamp(6) without time zone,
    processor_id numeric(12,0),
    processor_group_id numeric(12,0),
    create_by_source smallint,
    is_active boolean DEFAULT true,
    create_time timestamp(6) without time zone NOT NULL,
    update_time timestamp(6) without time zone NOT NULL,
    create_by numeric(12,0),
    update_by numeric(12,0),
    close_timeout_limit timestamp(6) without time zone,
    reply_timeout_limit timestamp(6) without time zone,
    merchant_id numeric(12,0) NOT NULL,
    participants numeric(12,0)[],
    description character varying(255),
    business_system smallint
);
COMMENT ON COLUMN ticket.id is '主键id';
COMMENT ON COLUMN ticket.code is '工单编号';
COMMENT ON COLUMN ticket.title is '工单标题';
COMMENT ON COLUMN ticket.category_id is '工单分类id';
COMMENT ON COLUMN ticket.group_id is '场地id';
COMMENT ON COLUMN ticket.status is '工单状态：0-初始化，1-待处理，2-处理中，3-已关闭';
COMMENT ON COLUMN ticket.timeout_limit is '超时截止时间';
COMMENT ON COLUMN ticket.processor_id is '当前处理人';
COMMENT ON COLUMN ticket.processor_group_id is '当前处理组';
COMMENT ON COLUMN ticket.create_by_source is '创建人来源：0-系统用户，1-C端用户，2-B端用户';
COMMENT ON COLUMN ticket.is_active is '设备类型编号';
COMMENT ON COLUMN ticket.create_time is '创建时间';
COMMENT ON COLUMN ticket.update_time is '更新时间';
COMMENT ON COLUMN ticket.create_by is '创建人';
COMMENT ON COLUMN ticket.update_by is '更新人';
COMMENT ON COLUMN ticket.close_timeout_limit is '关闭超时时间';
COMMENT ON COLUMN ticket.reply_timeout_limit is '自动回复超时时间';
COMMENT ON COLUMN ticket.merchant_id is '商家ID';
COMMENT ON COLUMN ticket.participants is '商家参与者';
COMMENT ON COLUMN ticket.description is '工单描述';
COMMENT ON COLUMN ticket.business_system is '业务系统(null或者1 代表乐摇摇默认的, 2代表多金宝)';
COMMENT ON TABLE ticket is '工单表';
CREATE UNIQUE INDEX ticket_pk ON ticket USING btree (id);
CREATE INDEX idx_ticket_merchant_id_create_time ON ticket USING btree (merchant_id, create_time);
CREATE INDEX idx_ticket_merchant_id_group_id_create_time ON ticket USING btree (group_id, merchant_id, create_time);
