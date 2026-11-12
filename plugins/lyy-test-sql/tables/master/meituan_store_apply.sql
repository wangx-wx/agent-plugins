-- MEITUAN_STORE_APPLY
-- 库：master
-- 业务分类：娱乐
-- 使用场景：查询美团授权记录

CREATE TABLE adempiere.meituan_store_apply (
    meituan_store_apply_id numeric(10,0) NOT NULL,
    lyy_distributor_id numeric(10,0) NOT NULL,
    lyy_equipment_group_id numeric(10,0) NOT NULL,
    meituan_store_id character varying(64),
    pay_status character varying(16) NOT NULL,
    meituan_store_order_id numeric(10,0),
    apply_status character varying(16) NOT NULL,
    store_name character varying(32) NOT NULL,
    lyy_district_id numeric(10,0) NOT NULL,
    district_info character varying(64) NOT NULL,
    address character varying(64) NOT NULL,
    phone_number character varying(11) NOT NULL,
    package_info jsonb,
    store_img jsonb,
    remark character varying(100),
    created timestamp(3) without time zone NOT NULL,
    createdby numeric(10,0) NOT NULL,
    updated timestamp(3) without time zone NOT NULL,
    is_del character(1) NOT NULL DEFAULT 'N'::bpchar,
    branch_store_name character varying(20) DEFAULT NULL::character varying,
    business_time jsonb,
    is_await_pay character(1) DEFAULT 'N'::bpchar,
    channel character(1) DEFAULT 0,
    bid character varying(64),
    migrate_status smallint,
    op_poi_id character varying(64),
    op_customer_id character varying(64),
    multi_point smallint,
    meituan_shop_id numeric(30,0)
);
COMMENT ON COLUMN adempiere.meituan_store_apply.lyy_distributor_id is '商户id';
COMMENT ON COLUMN adempiere.meituan_store_apply.lyy_equipment_group_id is '场地id';
COMMENT ON COLUMN adempiere.meituan_store_apply.meituan_store_id is '美团店铺id';
COMMENT ON COLUMN adempiere.meituan_store_apply.pay_status is '支付状态：Prepare待支付，Pay已支付';
COMMENT ON COLUMN adempiere.meituan_store_apply.meituan_store_order_id is '业务订单id';
COMMENT ON COLUMN adempiere.meituan_store_apply.apply_status is '申请状态：Applying申请中，Refuse审核不通过，Pass已通过';
COMMENT ON COLUMN adempiere.meituan_store_apply.lyy_district_id is '地区id';
COMMENT ON COLUMN adempiere.meituan_store_apply.district_info is '地区信息';
COMMENT ON COLUMN adempiere.meituan_store_apply.address is '商户地址';
COMMENT ON COLUMN adempiere.meituan_store_apply.phone_number is '商户电话';
COMMENT ON COLUMN adempiere.meituan_store_apply.package_info is '套餐信息数组';
COMMENT ON COLUMN adempiere.meituan_store_apply.store_img is '店铺图片url数组';
COMMENT ON COLUMN adempiere.meituan_store_apply.remark is '备注';
COMMENT ON COLUMN adempiere.meituan_store_apply.is_del is '是否删除：Y/N';
COMMENT ON COLUMN adempiere.meituan_store_apply.branch_store_name is '分店名称';
COMMENT ON COLUMN adempiere.meituan_store_apply.business_time is '营业时间：记录{开始时间:startTime,结束时间:endTime}';
COMMENT ON COLUMN adempiere.meituan_store_apply.is_await_pay is '是否待支付';
COMMENT ON COLUMN adempiere.meituan_store_apply.channel is '0 旧核销，1 新核销';
COMMENT ON COLUMN adempiere.meituan_store_apply.bid is '美团商家Id';
COMMENT ON COLUMN adempiere.meituan_store_apply.migrate_status is '1:已迁移美团op';
COMMENT ON COLUMN adempiere.meituan_store_apply.op_poi_id is '美团op门店id';
COMMENT ON COLUMN adempiere.meituan_store_apply.op_customer_id is '美团op客户id';
COMMENT ON COLUMN adempiere.meituan_store_apply.multi_point is '1:多经点位';
COMMENT ON COLUMN adempiere.meituan_store_apply.meituan_shop_id is '美团门店shop_id';
COMMENT ON TABLE adempiere.meituan_store_apply is '美团店铺申请表';
CREATE INDEX idx_meituan_store_apply_op_poi_id ON adempiere.meituan_store_apply USING btree (op_poi_id);
CREATE INDEX idx_meituan_store_apply_district_id ON adempiere.meituan_store_apply USING btree (lyy_district_id);
CREATE UNIQUE INDEX meituan_store_apply_pkey ON adempiere.meituan_store_apply USING btree (meituan_store_apply_id);
CREATE INDEX meituan_store_apply_group_status_idx ON adempiere.meituan_store_apply USING btree (lyy_equipment_group_id, apply_status);
CREATE INDEX idx_meituan_store_apply_lyy_distributor_id ON adempiere.meituan_store_apply USING btree (lyy_distributor_id);
