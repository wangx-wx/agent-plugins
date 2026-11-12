-- system_charge_config
-- 库：commercial_charges
-- 业务分类：充电桩
-- 使用场景：收费配置

CREATE TABLE system_charge_config (
    system_charge_config_id numeric(10,0) NOT NULL DEFAULT NULL::numeric,
    lyy_equipment_type_id numeric(10,0) NOT NULL,
    agent_user_id numeric(10,0) DEFAULT NULL::numeric,
    lyy_distributor_id numeric(10,0) DEFAULT NULL::numeric,
    cost numeric(10,0) NOT NULL,
    status numeric(2,0) NOT NULL DEFAULT 0,
    customer_type integer NOT NULL,
    charge_days integer NOT NULL,
    charge_type numeric(2,0) NOT NULL,
    createdby numeric(10,0) NOT NULL,
    created timestamp(6) without time zone NOT NULL,
    updatedby numeric(10,0) NOT NULL,
    updated timestamp(6) without time zone NOT NULL
);
COMMENT ON COLUMN system_charge_config.system_charge_config_id is '主键id';
COMMENT ON COLUMN system_charge_config.lyy_equipment_type_id is '设备类型';
COMMENT ON COLUMN system_charge_config.agent_user_id is '代理商ID';
COMMENT ON COLUMN system_charge_config.lyy_distributor_id is '商户ID';
COMMENT ON COLUMN system_charge_config.cost is '成本价(分)';
COMMENT ON COLUMN system_charge_config.status is '状态   0：生效  1：无效';
COMMENT ON COLUMN system_charge_config.customer_type is '客户类型,总控(1),白名单(2)';
COMMENT ON COLUMN system_charge_config.charge_days is '续费天数';
COMMENT ON COLUMN system_charge_config.charge_type is '收费类型: 0:按台收费,1:按GMV抽成收费';
COMMENT ON COLUMN system_charge_config.createdby is '创建人';
COMMENT ON COLUMN system_charge_config.created is '创建时间';
COMMENT ON COLUMN system_charge_config.updatedby is '更新人';
COMMENT ON COLUMN system_charge_config.updated is '更新时间';
COMMENT ON TABLE system_charge_config is '系统收费配置表';
CREATE UNIQUE INDEX system_charge_customer_pkey ON system_charge_config USING btree (system_charge_config_id);
