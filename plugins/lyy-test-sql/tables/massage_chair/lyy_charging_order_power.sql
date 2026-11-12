-- lyy_charging_order_power
-- 库：massage_chair
-- 业务分类：充电桩
-- 使用场景：充电订单对应功率过程

CREATE TABLE lyy_charging_order_power (
    id numeric(12,0),
    charging_order_id numeric(10,0) NOT NULL,
    charging_time character varying(8) NOT NULL,
    charging_power numeric(8,0) NOT NULL DEFAULT 0,
    create_time timestamp(6) without time zone NOT NULL,
    charging_electric numeric(9,5),
    charging_temperature numeric(10,2),
    charging_voltage numeric(10,2),
    charging_current numeric(10,2),
    created timestamp(6) without time zone
)
PARTITION BY RANGE (create_time);
COMMENT ON COLUMN lyy_charging_order_power.id is '充电功率记录ID（主键）';
COMMENT ON COLUMN lyy_charging_order_power.charging_order_id is '充电订单ID';
COMMENT ON COLUMN lyy_charging_order_power.charging_time is '充电时间点（HH：SS 格式）';
COMMENT ON COLUMN lyy_charging_order_power.charging_power is '充电功率(网络原因不能够上传默认为0)';
COMMENT ON COLUMN lyy_charging_order_power.create_time is '创建时间';
COMMENT ON COLUMN lyy_charging_order_power.charging_electric is '充电电量';
COMMENT ON COLUMN lyy_charging_order_power.charging_temperature is '温度';
COMMENT ON COLUMN lyy_charging_order_power.charging_voltage is '电压';
COMMENT ON COLUMN lyy_charging_order_power.charging_current is '电流';
