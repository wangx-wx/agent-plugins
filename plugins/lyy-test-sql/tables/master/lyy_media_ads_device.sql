-- lyy_media_ads_device
-- 库：master
-- 业务分类：娱乐
-- 使用场景：查询兑币机下发广告记录

CREATE TABLE adempiere.lyy_media_ads_device (
    lyy_media_ads_device_id numeric(10,0) NOT NULL,
    lyy_media_ads_id numeric(10,0) NOT NULL,
    lyy_equipment_id numeric(10,0) NOT NULL,
    status numeric(2,0),
    lyy_mainboard_position_id numeric(10,0)
);
COMMENT ON COLUMN adempiere.lyy_media_ads_device.lyy_media_ads_device_id is '主键id';
COMMENT ON COLUMN adempiere.lyy_media_ads_device.lyy_media_ads_id is '对应的媒体广告ID';
COMMENT ON COLUMN adempiere.lyy_media_ads_device.lyy_equipment_id is '对应的设备ID';
COMMENT ON COLUMN adempiere.lyy_media_ads_device.status is '3-待播放,4·播放中,5-已停止,6-已移除';
COMMENT ON COLUMN adempiere.lyy_media_ads_device.lyy_mainboard_position_id is '仓位id';
COMMENT ON TABLE adempiere.lyy_media_ads_device is '媒体广告投放设备表';
CREATE UNIQUE INDEX pk_lyy_media_ads_device ON adempiere.lyy_media_ads_device USING btree (lyy_media_ads_device_id);
CREATE UNIQUE INDEX media_ads_device_idx ON adempiere.lyy_media_ads_device USING btree (lyy_equipment_id, lyy_media_ads_id);
