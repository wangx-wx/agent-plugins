-- lyy_distributor_advertise_coupon
-- 库：advert
-- 业务分类：充电桩
-- 使用场景：用户广告红包权益

CREATE TABLE lyy_distributor_advertise_coupon (
    lyy_distributor_advertise_coupon_id numeric NOT NULL,
    lyy_user_id numeric NOT NULL,
    ad_org_id numeric NOT NULL,
    lyy_equipment_id numeric NOT NULL,
    lyy_equipment_group_id numeric NOT NULL,
    lyy_fans_id numeric NOT NULL,
    coupon_fee numeric NOT NULL,
    balance numeric NOT NULL,
    isactive character(1),
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    created timestamp without time zone,
    createdby numeric,
    updated timestamp without time zone,
    updatedby numeric,
    task_id numeric,
    task_price numeric,
    coupon_type integer NOT NULL DEFAULT 0
);
COMMENT ON COLUMN lyy_distributor_advertise_coupon.lyy_distributor_advertise_coupon_id is '主键ID';
COMMENT ON COLUMN lyy_distributor_advertise_coupon.lyy_user_id is '关联用户ID';
COMMENT ON COLUMN lyy_distributor_advertise_coupon.ad_org_id is '商家ID';
COMMENT ON COLUMN lyy_distributor_advertise_coupon.lyy_equipment_id is '关联设备ID';
COMMENT ON COLUMN lyy_distributor_advertise_coupon.lyy_equipment_group_id is '关联设备场地ID';
COMMENT ON COLUMN lyy_distributor_advertise_coupon.lyy_fans_id is '关联粉丝ID';
COMMENT ON COLUMN lyy_distributor_advertise_coupon.coupon_fee is '优惠券金额';
COMMENT ON COLUMN lyy_distributor_advertise_coupon.balance is '余额';
COMMENT ON COLUMN lyy_distributor_advertise_coupon.isactive is '是否激活';
COMMENT ON COLUMN lyy_distributor_advertise_coupon.start_time is '开始时间';
COMMENT ON COLUMN lyy_distributor_advertise_coupon.end_time is '结束时间';
COMMENT ON COLUMN lyy_distributor_advertise_coupon.created is '创建时间';
COMMENT ON COLUMN lyy_distributor_advertise_coupon.createdby is '创建人ID';
COMMENT ON COLUMN lyy_distributor_advertise_coupon.updated is '更新时间';
COMMENT ON COLUMN lyy_distributor_advertise_coupon.updatedby is '更新人ID';
COMMENT ON COLUMN lyy_distributor_advertise_coupon.task_id is '关联任务ID';
COMMENT ON COLUMN lyy_distributor_advertise_coupon.task_price is '任务价格';
COMMENT ON COLUMN lyy_distributor_advertise_coupon.coupon_type is '优惠券类型';
COMMENT ON TABLE lyy_distributor_advertise_coupon is '商家广告红包表';
CREATE UNIQUE INDEX lyy_distributor_advertise_coupon_pkey ON lyy_distributor_advertise_coupon USING btree (lyy_distributor_advertise_coupon_id);
CREATE INDEX lyy_distributor_advertise_coupon_user_fans_idx ON lyy_distributor_advertise_coupon USING btree (lyy_user_id, lyy_fans_id);
CREATE INDEX lyy_distributor_advertise_coupon_org_user_idx ON lyy_distributor_advertise_coupon USING btree (ad_org_id, lyy_user_id);
