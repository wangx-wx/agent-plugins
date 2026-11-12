-- lyy_ic_card
-- 库：massage_chair
-- 业务分类：充电桩、洗水
-- 使用场景：IC卡表、查ic卡信息

CREATE TABLE lyy_ic_card (
    lyy_ic_card_id numeric(11,0) NOT NULL DEFAULT NULL::numeric,
    merchant_id numeric(11,0) DEFAULT NULL::numeric,
    factory_id numeric(11,0) DEFAULT NULL::numeric,
    card_no character varying(32) DEFAULT NULL::character varying,
    amount numeric(8,2) NOT NULL DEFAULT NULL::numeric,
    create_time timestamp(6) without time zone NOT NULL DEFAULT NULL::timestamp without time zone,
    modify_time timestamp(6) without time zone NOT NULL DEFAULT NULL::timestamp without time zone,
    memo character varying(256) DEFAULT NULL::character varying,
    user_name character varying(64),
    phone numeric(11,0),
    status smallint DEFAULT 1,
    type smallint DEFAULT 0,
    user_id numeric(12,0),
    lyy_group_id numeric(11,0),
    school_id numeric(10,0),
    class_id numeric(10,0),
    sub_type smallint,
    contact_name character varying(32),
    charge_mode character varying(64),
    output_water_type character varying(64),
    single_water_amount numeric(6,0),
    water_work_mode smallint,
    bind_time timestamp(6) without time zone,
    expiration_date date,
    present numeric(8,2),
    remark character varying(32),
    third_user_id character varying(32),
    third_platform character varying(16) DEFAULT '0'::character varying,
    grade_id numeric(10,0),
    limit_status smallint,
    limit_type smallint,
    prestore_status numeric(4,0),
    support_member_card smallint,
    charging_count_limit smallint,
    day_limit_amount numeric(11,2),
    month_limit_amount numeric(11,2)
);
COMMENT ON COLUMN lyy_ic_card.lyy_ic_card_id is '主键ID';
COMMENT ON COLUMN lyy_ic_card.merchant_id is 'ad_org表的用户';
COMMENT ON COLUMN lyy_ic_card.factory_id is '工厂ID';
COMMENT ON COLUMN lyy_ic_card.card_no is '卡号';
COMMENT ON COLUMN lyy_ic_card.amount is '卡余额';
COMMENT ON COLUMN lyy_ic_card.create_time is '创建时间';
COMMENT ON COLUMN lyy_ic_card.modify_time is '修改时间';
COMMENT ON COLUMN lyy_ic_card.memo is '说明';
COMMENT ON COLUMN lyy_ic_card.user_name is '用户姓名';
COMMENT ON COLUMN lyy_ic_card.phone is '手机号';
COMMENT ON COLUMN lyy_ic_card.status is '卡状态：0-禁用，1-正常，2-挂失，3-未绑定';
COMMENT ON COLUMN lyy_ic_card.type is ' 卡类型，默认为0 0-离线卡，1-在线卡';
COMMENT ON COLUMN lyy_ic_card.user_id is '用户ID';
COMMENT ON COLUMN lyy_ic_card.lyy_group_id is '场地id';
COMMENT ON COLUMN lyy_ic_card.school_id is '学校ID';
COMMENT ON COLUMN lyy_ic_card.class_id is '班级ID';
COMMENT ON COLUMN lyy_ic_card.sub_type is '1为水杯，2为ic卡';
COMMENT ON COLUMN lyy_ic_card.contact_name is '联系人名称';
COMMENT ON COLUMN lyy_ic_card.charge_mode is '计费方式';
COMMENT ON COLUMN lyy_ic_card.output_water_type is '出水方式';
COMMENT ON COLUMN lyy_ic_card.single_water_amount is '单次取水量';
COMMENT ON COLUMN lyy_ic_card.water_work_mode is '售水机工作方式(1 在线 2离线)';
COMMENT ON COLUMN lyy_ic_card.bind_time is '绑定时间';
COMMENT ON COLUMN lyy_ic_card.expiration_date is '过期日期';
COMMENT ON COLUMN lyy_ic_card.present is '赠送金额';
COMMENT ON COLUMN lyy_ic_card.remark is '备注';
COMMENT ON COLUMN lyy_ic_card.third_user_id is '第三方平台ID';
COMMENT ON COLUMN lyy_ic_card.third_platform is '第三方平台枚举 0:乐摇摇 DJ:东晙';
COMMENT ON COLUMN lyy_ic_card.grade_id is '年级ID';
COMMENT ON COLUMN lyy_ic_card.limit_status is '限制状态 0=未限制 1=已限额 2=手动解除限额';
COMMENT ON COLUMN lyy_ic_card.limit_type is '限制类型 0= 日限额 1= 月限额';
COMMENT ON COLUMN lyy_ic_card.prestore_status is '预存状态:0待领取,1已领取';
COMMENT ON COLUMN lyy_ic_card.support_member_card is '支持会员卡类型：0或null=不支持，1=次卡';
COMMENT ON COLUMN lyy_ic_card.charging_count_limit is '每日充电笔数限制，0或null表示不限制';
COMMENT ON COLUMN lyy_ic_card.day_limit_amount is '单日使用限制金额';
COMMENT ON COLUMN lyy_ic_card.month_limit_amount is '月使用限制金额';
 
CREATE UNIQUE INDEX lyy_ic_card_pkey ON lyy_ic_card USING btree (lyy_ic_card_id);
CREATE INDEX lyy_ic_card_index_user_name ON lyy_ic_card USING btree (user_name);
CREATE INDEX fk_index_merchant_id_card_no ON lyy_ic_card USING btree (merchant_id, card_no);
CREATE INDEX idx_lyy_ic_card_uid_mid ON lyy_ic_card USING btree (user_id, merchant_id);
CREATE INDEX lyy_ic_card_index_phone ON lyy_ic_card USING btree (phone);
CREATE INDEX lyy_ic_card_index_card_no ON lyy_ic_card USING btree (card_no);
CREATE INDEX lyy_ic_card_user_idx ON lyy_ic_card USING hash (user_id);
CREATE INDEX idx_lyy_ic_card_school_id ON lyy_ic_card USING btree (school_id);
