UPDATE xidb.zone_settings 
SET misc = misc + 512
WHERE NOT(misc & 512);