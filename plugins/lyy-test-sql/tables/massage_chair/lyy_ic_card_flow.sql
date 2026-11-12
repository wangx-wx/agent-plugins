-- lyy_ic_card_flow
-- 库：massage_chair
-- 业务分类：充电桩、洗水
-- 使用场景：IC卡流水记录、查ic卡流水

CREATE TABLE lyy_ic_card_flow (
    lyy_ic_card_flow_id numeric(11,0) NOT NULL,
    lyy_equipment_id numeric(11,0),
    equipment_no character(16),
    lyy_user_id numeric(11,0),
    merchant_id numeric(11,0),
    card_no character varying(32),
    flow_amount numeric(8,2),
    flow_type numeric(2,0) NOT NULL,
    ext character varying(64),
    create_time timestamp(6) without time zone NOT NULL,
    lyy_equipment_group character varying(50),
    memo character varying(64),
    status numeric(1,0),
    amount numeric(8,2),
    receive_status numeric(1,0),
    refund_amount numeric(8,2),
    refund_time timestamp(6) without time zone,
    expiration_date date,
    time_limit bigint,
    usage_amount numeric(8,0),
    charge_mode character varying(64),
    order_id numeric(10,0),
    lyy_ic_card_id numeric(11,0),
    present numeric(8,2),
    flow_present numeric(8,2),
    passway numeric(4,0),
    start_param character varying(1024),
    deduction_remarks character varying(64),
    actual_time timestamp(6) without time zone,
    order_no character varying(64),
    update_time timestamp(6) without time zone,
    refund_present numeric(8,2)
)
PARTITION BY RANGE (create_time);
COMMENT ON COLUMN lyy_ic_card_flow.lyy_ic_card_flow_id is '主键ID';
COMMENT ON COLUMN lyy_ic_card_flow.lyy_equipment_id is '设备ID';
COMMENT ON COLUMN lyy_ic_card_flow.equipment_no is '设备号';
COMMENT ON COLUMN lyy_ic_card_flow.lyy_user_id is '用户ID';
COMMENT ON COLUMN lyy_ic_card_flow.merchant_id is '商户ID';
COMMENT ON COLUMN lyy_ic_card_flow.card_no is '卡号';
COMMENT ON COLUMN lyy_ic_card_flow.flow_amount is '流水记录金额，单位：元';
COMMENT ON COLUMN lyy_ic_card_flow.flow_type is ' 1扫码充卡 2刷卡充电 3使用账户余额充卡 4回刷停止充电 5充电自动停止 6-扫码充卡结果 7-打卡洗衣 8-刷卡洗衣启动失败 9-剩余费用退款,10 实际消费金额 ,11 刷卡取水,12手工退款 13销卡,14余额转入,15商家赠送,16销卡退款,17商家修改增加余额,18商家修改减少余额, 19消费扣款';
COMMENT ON COLUMN lyy_ic_card_flow.ext is '扩展字段和流水类型匹配，对应充值订单号、补卡的卡号
';
COMMENT ON COLUMN lyy_ic_card_flow.create_time is '创建时间';
COMMENT ON COLUMN lyy_ic_card_flow.lyy_equipment_group is '设备归属的场地名称可改变';
COMMENT ON COLUMN lyy_ic_card_flow.memo is '说明';
COMMENT ON COLUMN lyy_ic_card_flow.status is '0初始状态 
1操作成功  
2失败 
3超时 
4无效 -1已退款';
COMMENT ON COLUMN lyy_ic_card_flow.amount is 'ic卡当前的余额，计算后的';
COMMENT ON COLUMN lyy_ic_card_flow.receive_status is '圈存版充值流水领取状态：0-待领取；1-领取中；2-已领取';
COMMENT ON COLUMN lyy_ic_card_flow.refund_amount is '充值余额-退款金额';
COMMENT ON COLUMN lyy_ic_card_flow.refund_time is '退款时间';
COMMENT ON COLUMN lyy_ic_card_flow.expiration_date is '过期日期';
COMMENT ON COLUMN lyy_ic_card_flow.time_limit is '有效期（天）';
COMMENT ON COLUMN lyy_ic_card_flow.usage_amount is '使用量(售水机为出水量 ml)';
COMMENT ON COLUMN lyy_ic_card_flow.charge_mode is '计费方式（TIME_INTERVAL-按时段计费，TIMES-按次数计费）';
COMMENT ON COLUMN lyy_ic_card_flow.order_id is '业务订单Id';
COMMENT ON COLUMN lyy_ic_card_flow.lyy_ic_card_id is 'ic卡ID';
COMMENT ON COLUMN lyy_ic_card_flow.present is 'ic卡当前的赠送余额，计算后的';
COMMENT ON COLUMN lyy_ic_card_flow.flow_present is '赠送金额流水';
COMMENT ON COLUMN lyy_ic_card_flow.passway is '端口';
COMMENT ON COLUMN lyy_ic_card_flow.start_param is '启动参数(参考:LifeOrderStartParamDTO)';
COMMENT ON COLUMN lyy_ic_card_flow.deduction_remarks is '扣款备注';
COMMENT ON COLUMN lyy_ic_card_flow.actual_time is '消费时间';
COMMENT ON COLUMN lyy_ic_card_flow.order_no is '中台支付单号';
COMMENT ON COLUMN lyy_ic_card_flow.update_time is '更新时间';
COMMENT ON COLUMN lyy_ic_card_flow.refund_present is '赠送余额-退款金额';
COMMENT ON TABLE lyy_ic_card_flow is '卡流水金额';
