-- tiktok_activity_coupon
-- 库：cmember
-- 业务分类：娱乐
-- 使用场景：查询抖音商户授权

CREATE TABLE tiktok_activity_coupon (
    tiktok_activity_coupon_id numeric(11,0) NOT NULL,
    tiktok_activity_poi_id numeric(11,0) NOT NULL,
    poi_id character varying(40),
    sku_id character varying(40),
    title character varying(40),
    price numeric(10,2),
    coins integer DEFAULT 0,
    status smallint DEFAULT 0,
    created timestamp(6) without time zone,
    updated timestamp(6) without time zone,
    createdby numeric(10,0),
    updatedby numeric(10,0),
    isactive character(1) DEFAULT 'Y'::bpchar,
    use_type smallint,
    auth_created_by character varying(20),
    auth_updated_by character varying(20),
    order_no smallint,
    display_on_coin_exchange boolean,
    equipment_type_value character varying[],
    redeem_mode smallint,
    recharge_type smallint,
    expire_date jsonb,
    mock_coins integer
);
COMMENT ON COLUMN tiktok_activity_coupon.tiktok_activity_coupon_id is '抖音套餐映射Id';
COMMENT ON COLUMN tiktok_activity_coupon.tiktok_activity_poi_id is '抖音活动Id';
COMMENT ON COLUMN tiktok_activity_coupon.poi_id is '门店poi_id';
COMMENT ON COLUMN tiktok_activity_coupon.sku_id is '抖音sku_id';
COMMENT ON COLUMN tiktok_activity_coupon.title is '套餐名称';
COMMENT ON COLUMN tiktok_activity_coupon.price is '价格';
COMMENT ON COLUMN tiktok_activity_coupon.coins is '获取权益,use_type=null或1时表示(币数),  user_type=2时表示需要给用户派发商家派发金额(分)';
COMMENT ON COLUMN tiktok_activity_coupon.status is 'poi状态,默认 0:投放中, 1:已终止';
COMMENT ON COLUMN tiktok_activity_coupon.created is '创建时间';
COMMENT ON COLUMN tiktok_activity_coupon.updated is '更新时间';
COMMENT ON COLUMN tiktok_activity_coupon.createdby is '创建人';
COMMENT ON COLUMN tiktok_activity_coupon.updatedby is '更新人';
COMMENT ON COLUMN tiktok_activity_coupon.isactive is '是否有效 Y 有效 N 无效';
COMMENT ON COLUMN tiktok_activity_coupon.use_type is '适用类型: null或1表示娃娃机与兑币机适用  2表示洗车机';
COMMENT ON COLUMN tiktok_activity_coupon.auth_created_by is 'createdby=-10000时展示,sp操作人';
COMMENT ON COLUMN tiktok_activity_coupon.auth_updated_by is 'updatedby=-10000时展示,sp操作人';
COMMENT ON COLUMN tiktok_activity_coupon.order_no is '排序编号';
COMMENT ON COLUMN tiktok_activity_coupon.display_on_coin_exchange is '在兑币机上展示';
COMMENT ON COLUMN tiktok_activity_coupon.equipment_type_value is '设备类型，use_type=4时使用';
COMMENT ON COLUMN tiktok_activity_coupon.redeem_mode is '核销方式：1直接使用/启动设备，2充值到会员账户';
COMMENT ON COLUMN tiktok_activity_coupon.recharge_type is '充值类型：1余额，2余币，仅redeem_mode=2时生效';
COMMENT ON COLUMN tiktok_activity_coupon.expire_date is '有效期配置：category为0或null表示无期限，1表示自定义';
COMMENT ON COLUMN tiktok_activity_coupon.mock_coins is '模拟投币数';
COMMENT ON TABLE tiktok_activity_coupon is '抖音套餐映射';
CREATE INDEX tiktok_activity_coupon_sku_activity_created_idx ON tiktok_activity_coupon USING btree (sku_id, tiktok_activity_poi_id, created);
CREATE UNIQUE INDEX tiktok_activity_coupon_pkey ON tiktok_activity_coupon USING btree (tiktok_activity_coupon_id);
