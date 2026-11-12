-- lyy_charging_order
-- 库：massage_chair
-- 业务分类：充电桩
-- 使用场景：充电业务订单

CREATE TABLE lyy_charging_order (
    id numeric(10,0) NOT NULL,
    lyy_equipment_id numeric(12,0),
    lyy_equipment_group_id numeric(12,0),
    group_service_id numeric(12,0),
    passage_way numeric(4,0),
    coins numeric(10,0),
    money numeric(12,2),
    openid character varying(128),
    lyy_user_id numeric(12,0),
    durings numeric(10,0),
    start_time timestamp without time zone,
    pause_start_time timestamp without time zone,
    pause_during_time numeric(10,0),
    device_status numeric,
    is_send_user numeric(4,0),
    order_status numeric,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    deleted numeric(4,0),
    value character varying(16),
    username character varying(64) DEFAULT NULL::character varying,
    description character varying(255),
    lyy_distributor_id numeric(10,0),
    refund_money numeric(10,2),
    lyy_online_coins_history_id numeric(12,0),
    main_order_id numeric(10,0),
    parent_id numeric(10,0),
    service_durings numeric(10,0),
    group_number numeric(10,0),
    actual_time numeric(10,0) DEFAULT 0,
    close_action smallint DEFAULT 0,
    out_trade_no character varying(32),
    hardware_minutes numeric(10,0),
    service_money numeric(10,2),
    login_flag numeric(10,0),
    agent_user_id numeric(11,0),
    group_service_cost_way character varying(20),
    device_status_name character varying(30),
    refund_type smallint,
    limit_time smallint,
    refund_way numeric(1,0),
    time_or_electric numeric(10,0),
    ic_card_no character varying(32),
    attach_info character varying(3000),
    end_power integer,
    pay_score_type smallint,
    start_type smallint,
    extend_param character varying(500),
    app_id character varying(128),
    pay_order_no character varying(64),
    order_no character varying(32),
    pay_way smallint,
    delay_confirm_time timestamp without time zone,
    delay_flag smallint,
    delay_status smallint,
    extra_param text
)
PARTITION BY RANGE (create_time);
COMMENT ON COLUMN lyy_charging_order.id is '订单ID';
COMMENT ON COLUMN lyy_charging_order.lyy_equipment_id is '设备ID';
COMMENT ON COLUMN lyy_charging_order.lyy_equipment_group_id is '场地ID';
COMMENT ON COLUMN lyy_charging_order.group_service_id is '套餐ID';
COMMENT ON COLUMN lyy_charging_order.passage_way is '通道';
COMMENT ON COLUMN lyy_charging_order.coins is '模拟投币数';
COMMENT ON COLUMN lyy_charging_order.money is '价格';
COMMENT ON COLUMN lyy_charging_order.openid is '用户openid';
COMMENT ON COLUMN lyy_charging_order.lyy_user_id is '用户id';
COMMENT ON COLUMN lyy_charging_order.durings is '时长';
COMMENT ON COLUMN lyy_charging_order.start_time is '订单开始时间';
COMMENT ON COLUMN lyy_charging_order.pause_start_time is '暂时开始时间';
COMMENT ON COLUMN lyy_charging_order.pause_during_time is '暂停多少时长';
COMMENT ON COLUMN lyy_charging_order.device_status is '设备状态';
COMMENT ON COLUMN lyy_charging_order.is_send_user is '是否发送用户';
COMMENT ON COLUMN lyy_charging_order.order_status is '订单状态';
COMMENT ON COLUMN lyy_charging_order.create_time is '创建时间';
COMMENT ON COLUMN lyy_charging_order.update_time is '更新时间/结束时间';
COMMENT ON COLUMN lyy_charging_order.deleted is '是否删除';
COMMENT ON COLUMN lyy_charging_order.value is '设备编号';
COMMENT ON COLUMN lyy_charging_order.username is '用户昵称';
COMMENT ON COLUMN lyy_charging_order.description is '描述';
COMMENT ON COLUMN lyy_charging_order.refund_money is '退款金额 ';
COMMENT ON COLUMN lyy_charging_order.lyy_online_coins_history_id is '消费记录总表id-废弃';
COMMENT ON COLUMN lyy_charging_order.main_order_id is '主订单id';
COMMENT ON COLUMN lyy_charging_order.parent_id is '上一次订单id';
COMMENT ON COLUMN lyy_charging_order.service_durings is '服务套餐时长,单位:分钟';
COMMENT ON COLUMN lyy_charging_order.group_number is '设备机台号';
COMMENT ON COLUMN lyy_charging_order.actual_time is '实际充电时长';
COMMENT ON COLUMN lyy_charging_order.close_action is '订单关闭来源, 0正常关闭，1商家远程停止, 2用户手动结束, 3设备启动失败, 4设备故障, 5订单未激活, 6订单服务时长为空, 7同一通道号重复下单关闭 8设备或端口异常，被迫停止 9瞬时功率过大，停止充电 10未接充电器 11机箱内出现烟雾，电源关闭 12充电过程中出现短路故障 13充电过程中出现过载故障 14设备意外断电或者意外复位导致停止充电';
COMMENT ON COLUMN lyy_charging_order.out_trade_no is '支付订单编号   0：余额启动，1：月卡启动,其他值 有支付订单 ';
COMMENT ON COLUMN lyy_charging_order.hardware_minutes is '主板剩余时长(分钟)';
COMMENT ON COLUMN lyy_charging_order.service_money is '服务套餐金额';
COMMENT ON COLUMN lyy_charging_order.login_flag is '登录标识';
COMMENT ON COLUMN lyy_charging_order.agent_user_id is '代理商ID';
COMMENT ON COLUMN lyy_charging_order.group_service_cost_way is '计费模式';
COMMENT ON COLUMN lyy_charging_order.device_status_name is '上报状态';
COMMENT ON COLUMN lyy_charging_order.refund_type is '退款规则：0:不退款，1:实时退款，2限时退款';
COMMENT ON COLUMN lyy_charging_order.limit_time is '限时退款 限制时间（分钟）';
COMMENT ON COLUMN lyy_charging_order.refund_way is '退款方式：（1退余额，2原路退款）';
COMMENT ON COLUMN lyy_charging_order.time_or_electric is '电量或者时长';
COMMENT ON COLUMN lyy_charging_order.ic_card_no is 'ic卡号';
COMMENT ON COLUMN lyy_charging_order.attach_info is '附加信息';
COMMENT ON COLUMN lyy_charging_order.end_power is '充电功率';
COMMENT ON COLUMN lyy_charging_order.pay_score_type is '支付分状态:-1不存在,0未支付,1待支付,2已支付,3已取消,4已失效';
COMMENT ON COLUMN lyy_charging_order.start_type is '启动方式: 0余额启动,1:月卡启动, 2:投币, 3:刷卡,4:支付启动 ,5:支付分启动, 6:先充后付,7:服务端时长套餐，8:服务端金额套餐';
COMMENT ON COLUMN lyy_charging_order.extend_param is '订单扩展信息，用于显示';
COMMENT ON COLUMN lyy_charging_order.app_id is '微信appid(支付分需要回传)';
COMMENT ON COLUMN lyy_charging_order.pay_order_no is '支付订单号';
COMMENT ON COLUMN lyy_charging_order.order_no is '新支付订单号';
COMMENT ON COLUMN lyy_charging_order.pay_way is '支付方式';
COMMENT ON COLUMN lyy_charging_order.delay_confirm_time is '延迟结算订单确认时间';
COMMENT ON COLUMN lyy_charging_order.delay_flag is '是否走延迟结算标识，0:否，1:是';
COMMENT ON COLUMN lyy_charging_order.delay_status is '延迟结算状态，0：待确认，1：已确认，2：确认失败，3：无结果';
COMMENT ON COLUMN lyy_charging_order.extra_param is '额外一些参数';
