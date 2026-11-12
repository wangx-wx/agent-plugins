-- system_charge_equipment_bill
-- 库：commercial_charges
-- 业务分类：充电桩
-- 使用场景：收费规则

CREATE TABLE system_charge_equipment_bill (
    system_charge_equipment_bill_id numeric(11,0) NOT NULL,
    lyy_equipment_id numeric(10,0) NOT NULL,
    cost numeric(10,0) NOT NULL,
    increase_price numeric(10,0) NOT NULL,
    charge_days integer NOT NULL,
    total_fee numeric(10,0) NOT NULL,
    balance_fee numeric(10,0) NOT NULL,
    end_date date NOT NULL,
    next_end_date date NOT NULL,
    status integer NOT NULL,
    created timestamp(6) without time zone NOT NULL,
    updated timestamp(6) without time zone NOT NULL,
    charge_type integer NOT NULL DEFAULT 0,
    charge_value integer NOT NULL DEFAULT 6000,
    factory_increase_price_rate numeric(10,2),
    system_charge_rule_id numeric(10,0)
);
COMMENT ON COLUMN system_charge_equipment_bill.lyy_equipment_id is '设备ID';
COMMENT ON COLUMN system_charge_equipment_bill.cost is '成本价（分）';
COMMENT ON COLUMN system_charge_equipment_bill.increase_price is '提价（分）';
COMMENT ON COLUMN system_charge_equipment_bill.charge_days is '续费天数';
COMMENT ON COLUMN system_charge_equipment_bill.total_fee is '缴费总额（分）';
COMMENT ON COLUMN system_charge_equipment_bill.balance_fee is '剩余缴费金额（分）';
COMMENT ON COLUMN system_charge_equipment_bill.end_date is '当前到期日期';
COMMENT ON COLUMN system_charge_equipment_bill.next_end_date is '续费后到期日期';
COMMENT ON COLUMN system_charge_equipment_bill.status is '状态：0未缴完；1已缴完';
COMMENT ON COLUMN system_charge_equipment_bill.charge_type is '收费类型: 0:按台收费,1:按GMV抽成收费';
COMMENT ON COLUMN system_charge_equipment_bill.charge_value is '收费值-如果是比例，则是万分比，如果是固定金额则单位是分';
COMMENT ON COLUMN system_charge_equipment_bill.factory_increase_price_rate is '工厂分成比例';
COMMENT ON COLUMN system_charge_equipment_bill.system_charge_rule_id is '规则ID';
COMMENT ON TABLE system_charge_equipment_bill is '设备缴费单表';
CREATE UNIQUE INDEX system_charge_equipment_bill_pkey ON system_charge_equipment_bill USING btree (system_charge_equipment_bill_id);
CREATE INDEX system_charge_equipment_bill_equipment_idx ON system_charge_equipment_bill USING btree (lyy_equipment_id, end_date, status);
