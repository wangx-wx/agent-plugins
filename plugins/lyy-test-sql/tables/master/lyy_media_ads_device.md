---
table: adempiere.lyy_media_ads_device
database: master
domain: 娱乐
dbDictId: 10099
description: 媒体广告投放设备表
use_cases:
  - 查询兑币机下发广告记录
---

# lyy_media_ads_device

## 字段

| 字段 | 类型 | 说明 |
|---|---|---|
| lyy_media_ads_device_id | numeric(10,0) | 主键id |
| lyy_media_ads_id | numeric(10,0) | 对应的媒体广告ID |
| lyy_equipment_id | numeric(10,0) | 对应的设备ID |
| status | numeric(2,0) | 3-待播放,4·播放中,5-已停止,6-已移除 |
| lyy_mainboard_position_id | numeric(10,0) | 仓位id |

## 查询规则

- 待补充

## 索引

- PK: lyy_media_ads_device_id
- UNIQUE: (lyy_equipment_id, lyy_media_ads_id)
