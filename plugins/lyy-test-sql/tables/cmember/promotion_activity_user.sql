-- promotion_activity_user
-- 库：cmember
-- 业务分类：按摩
-- 使用场景：—

CREATE TABLE promotion_activity_user (
    promotion_activity_user_id numeric(10,0) NOT NULL,
    promotion_activity_id numeric(10,0),
    lyy_user_id numeric(12,0),
    lyy_distributor_id numeric(10,0),
    lyy_equipment_group_id numeric(10,0),
    lyy_equipment_type_id numeric(10,0),
    reward_type smallint NOT NULL,
    reward_details jsonb,
    end_time timestamp(3) without time zone,
    status smallint NOT NULL,
    winning smallint NOT NULL DEFAULT 0,
    created timestamp(3) without time zone NOT NULL,
    updated timestamp(3) without time zone NOT NULL,
    start_time timestamp(3) without time zone,
    equipment_id numeric(10,0),
    receive_time timestamp(6) without time zone
)
PARTITION BY RANGE (created);
COMMENT ON COLUMN promotion_activity_user.promotion_activity_user_id is '主键ID';
COMMENT ON COLUMN promotion_activity_user.promotion_activity_id is '活动ID';
COMMENT ON COLUMN promotion_activity_user.lyy_user_id is '用户ID';
COMMENT ON COLUMN promotion_activity_user.lyy_distributor_id is '商户ID';
COMMENT ON COLUMN promotion_activity_user.lyy_equipment_group_id is '场地ID';
COMMENT ON COLUMN promotion_activity_user.lyy_equipment_type_id is '设备类型ID';
COMMENT ON COLUMN promotion_activity_user.reward_type is '
0, 充值满赠支付立减券（随机金额）
1, 充值满赠支付立减券（固定金额）
2, 充值满赠充值送币券（随机币数）
3, 充值满赠充值送币券（固定币数）
4, 随机金额立减
5, 固定金额立减
6, 满赠送币机会（随机币）
7, 满赠送币机会（固定币）
8, 限时优惠（现有场地套餐打折）
9, 限时优惠（自定义限时套餐)
10, 新用户特惠（首单打折）
11, 新用户特惠（首单扣减固定金额）
12, 通行证激励金（平台）
13, 乐摇摇平台券
14, 摇奖免单券(随机立减)
15, 免单券 
16, 赠送券 
17, 体验券 
18, 广告红包,
19, 限时折扣活动配置
20,礼品兑换券
21,体验折扣券
22,充值满赠支付折扣券
23,新用户特惠(自定义新用户专享套餐)
24,广告打折活动
25,平台随机立减活动(金额)
26,平台随机立减活动(比例)';
COMMENT ON COLUMN promotion_activity_user.reward_details is '奖品属性 json串';
COMMENT ON COLUMN promotion_activity_user.end_time is '过期时间';
COMMENT ON COLUMN promotion_activity_user.status is '
(1, "待支付"),
(2, "待使用"),
(3, "已使用"),
(4, "已过期");';
COMMENT ON COLUMN promotion_activity_user.winning is '抽奖状态';
COMMENT ON COLUMN promotion_activity_user.created is '记录创建时间';
COMMENT ON COLUMN promotion_activity_user.updated is '记录更新时间';
COMMENT ON COLUMN promotion_activity_user.start_time is '开始时间';
COMMENT ON COLUMN promotion_activity_user.equipment_id is '记录对应设备id';
COMMENT ON COLUMN promotion_activity_user.receive_time is '领取时间';
COMMENT ON TABLE promotion_activity_user is '用户活动领取记录表';
