-- Shockmaw
INSERT INTO mob_skill_lists VALUES ('Shockmaw', 50001, 2869); -- deap sea dirge
INSERT INTO mob_skill_lists VALUES ('Shockmaw', 50001, 2870); -- caudal capacitor
INSERT INTO mob_skill_lists VALUES ('Shockmaw', 50001, 2871); -- baleen gurge
INSERT INTO mob_skill_lists VALUES ('Shockmaw', 50001, 2868); -- thar she blows
INSERT INTO mob_skill_lists VALUES ('Shockmaw', 50001, 2876); -- ecolocation
INSERT INTO mob_skill_lists VALUES ('Shockmaw', 50001, 2875); -- water spout
INSERT INTO mob_skill_lists VALUES ('Shockmaw', 50001, 2872); -- depth charge
INSERT INTO mob_skill_lists VALUES ('Shockmaw', 50001, 2873); -- blowhole blast
INSERT INTO mob_skill_lists VALUES ('Shockmaw', 50001, 2874); -- angry seas
INSERT INTO mob_spell_lists VALUES ('Shockmaw', 524, 501, 65, 255); -- waterja
INSERT INTO mob_spell_lists VALUES ('Shockmaw', 524, 173, 65, 255); -- water v
INSERT INTO mob_spell_lists VALUES ('Shockmaw', 524, 854, 65, 255); -- water vi
INSERT INTO mob_spell_lists VALUES ('Shockmaw', 524, 215, 65, 255); -- flood 2
INSERT INTO mob_spell_lists VALUES ('Shockmaw', 524, 500, 65, 255); -- thunderja
INSERT INTO mob_spell_lists VALUES ('Shockmaw', 524, 168, 65, 255); -- thunder v
INSERT INTO mob_spell_lists VALUES ('Shockmaw', 524, 853, 65, 255); -- thunder vi
INSERT INTO mob_spell_lists VALUES ('Shockmaw', 524, 213, 65, 255); -- burst 2
INSERT INTO mob_spell_lists VALUES ('Shockmaw', 524,  46, 65, 255); -- protect iv
INSERT INTO mob_spell_lists VALUES ('Shockmaw', 524,  47, 65, 255); -- protect v
INSERT INTO mob_spell_lists VALUES ('Shockmaw', 524,  51, 65, 255); -- shell iv
INSERT INTO mob_spell_lists VALUES ('Shockmaw', 524,  52, 65, 255); -- shell v
UPDATE mob_pools SET sJob = 4, skill_list_id = 50001, spellList = 524 WHERE poolid = 5721 AND name = 'Shockmaw';

-- Fleet Stalker
INSERT INTO mob_skill_lists VALUES ('Fleetstalker', 50000, 2924); -- divesting stampede
INSERT INTO mob_skill_lists VALUES ('Fleetstalker', 50000, 3506); -- hellfire arrow
INSERT INTO mob_skill_lists VALUES ('Fleetstalker', 50000, 2922); -- soulshattering roar
INSERT INTO mob_skill_lists VALUES ('Fleetstalker', 50000, 3507); -- incensed pummel
INSERT INTO mob_skill_lists VALUES ('Fleetstalker', 50000, 2926); -- beastruction
INSERT INTO mob_spell_lists VALUES ('Fleetstalker', 525, 286, 65, 255); -- addle
INSERT INTO mob_spell_lists VALUES ('Fleetstalker', 525, 365, 65, 255); -- breakga
INSERT INTO mob_spell_lists VALUES ('Fleetstalker', 525, 359, 65, 255); -- silencega
INSERT INTO mob_spell_lists VALUES ('Fleetstalker', 525, 357, 65, 255); -- slowga
INSERT INTO mob_spell_lists VALUES ('Fleetstalker', 525, 366, 65, 255); -- graviga
INSERT INTO mob_spell_lists VALUES ('Fleetstalker', 525, 360, 65, 255); -- dispelga
INSERT INTO mob_spell_lists VALUES ('Fleetstalker', 525, 211, 65, 255); -- quake ii
INSERT INTO mob_spell_lists VALUES ('Fleetstalker', 525, 191, 65, 255); -- stonaga III
INSERT INTO mob_spell_lists VALUES ('Fleetstalker', 525, 192, 65, 255); -- stonaga IV
INSERT INTO mob_spell_lists VALUES ('Fleetstalker', 525, 499, 65, 255); -- stoneja
INSERT INTO mob_spell_lists VALUES ('Fleetstalker', 525, 205, 65, 255); -- flare ii
INSERT INTO mob_spell_lists VALUES ('Fleetstalker', 525, 148, 65, 255); -- fire v
INSERT INTO mob_spell_lists VALUES ('Fleetstalker', 525, 849, 65, 255); -- fire vi
INSERT INTO mob_spell_lists VALUES ('Fleetstalker', 525, 176, 65, 255); -- firaga iii
INSERT INTO mob_spell_lists VALUES ('Fleetstalker', 525, 177, 65, 255); -- firagaiv
INSERT INTO mob_spell_lists VALUES ('Fleetstalker', 525, 496, 65, 255); -- firja
UPDATE mob_pools SET mJob = 4, sJob = 5, skill_list_id = 50000, spellList = 525 WHERE poolid = 5720 AND name = 'Fleetstalker';

-- Urmahlullu
INSERT INTO mob_skill_lists VALUES ('Urmahlullu', 50002, 628); -- wild horn
INSERT INTO mob_skill_lists VALUES ('Urmahlullu', 50002, 633); -- howl
INSERT INTO mob_skill_lists VALUES ('Urmahlullu', 50002, 629); -- thunder bolt
INSERT INTO mob_skill_lists VALUES ('Urmahlullu', 50002, 632); -- flame armor
-- INSERT INTO mob_skill_lists VALUES ('Urmahlullu', 50002, 632); -- Ecliptic Meteor
-- INSERT INTO mob_skill_lists VALUES ('Urmahlullu', 50002, 632); -- Amnesic Blast
INSERT INTO mob_spell_lists VALUES ('Urmahlullu', 514, 853, 65, 255); -- thunder vi
INSERT INTO mob_spell_lists VALUES ('Urmahlullu', 514, 168, 65, 255); -- thunder v
INSERT INTO mob_spell_lists VALUES ('Urmahlullu', 514, 213, 65, 255); -- burst ii
INSERT INTO mob_spell_lists VALUES ('Urmahlullu', 514, 239, 65, 255); -- shock
UPDATE mob_pools SET sJob = 4, skill_list_id = 50002, spellList = 514 WHERE poolid = 5722 AND name = 'Urmahlullu';

UPDATE mob_pools SET mobType = 2 WHERE name = 'Gulltop';
UPDATE mob_pools SET mobType = 2 WHERE name = 'Palila';
UPDATE mob_pools SET mobType = 2 WHERE name = 'Aglaophotis';
UPDATE mob_pools SET mobType = 2 WHERE name = 'Ferrodon';
UPDATE mob_pools SET mobType = 2 WHERE name = 'Brittlis';
UPDATE mob_pools SET mobType = 2 WHERE name = 'Fleetstalker';
UPDATE mob_pools SET mobType = 2 WHERE name = 'Yakshi';
UPDATE mob_pools SET mobType = 2 WHERE name = 'Albumen';
UPDATE mob_pools SET mobType = 2 WHERE name = 'Onychophora';

UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = -640.000, pos_y = -39.400, pos_z = -255.000 WHERE npcid = 17969965;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = -590.000, pos_y = -60.400, pos_z = 108.700 WHERE npcid = 17969966;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = -390.000, pos_y = -67.000, pos_z = 302.000 WHERE npcid = 17969967;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = -490.000, pos_y = -54.400, pos_z = 437.200 WHERE npcid = 17969968;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = -410.000, pos_y = -63.000, pos_z = 582.000 WHERE npcid = 17969969;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = -283.000, pos_y = -55.600, pos_z = 519.000 WHERE npcid = 17969970;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = -160.000, pos_y = -72.000, pos_z = 636.000 WHERE npcid = 17969971;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = 60.500, pos_y = -83.400, pos_z = 583.300 WHERE npcid = 17969972;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = 163.400, pos_y = -87.500, pos_z = 333.700 WHERE npcid = 17969973;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = -589.000, pos_y = -417.400, pos_z = -1028.000 WHERE npcid = 17969974;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = -614.200, pos_y = -417.400, pos_z = -1030.000 WHERE npcid = 17969975;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = -612.000, pos_y = -417.400, pos_z = -1050.000 WHERE npcid = 17969976;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = -291.395, pos_y = -42.000, pos_z = -401.071 WHERE npcid = 17961699;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = -571.348, pos_y = -68.700, pos_z = -185.561 WHERE npcid = 17961700;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = -440.593, pos_y = -40.000, pos_z = -4.551 WHERE npcid = 17961701;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = -471.487, pos_y = -42.000, pos_z = 153.196 WHERE npcid = 17961702;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = -352.868, pos_y = -68.700, pos_z = 486.310 WHERE npcid = 17961703;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = -140.480, pos_y = -40.000, pos_z = 417.622 WHERE npcid = 17961704;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = 107.020, pos_y = -40.000, pos_z = -432.584 WHERE npcid = 17961705;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = 353.070, pos_y = -68.700, pos_z = 485.995 WHERE npcid = 17961706;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = 471.487, pos_y = -42.000, pos_z = 153.196 WHERE npcid = 17961707;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = 440.595, pos_y = -40.100, pos_z = -4.544 WHERE npcid = 17961708;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = 571.480, pos_y = -68.700, pos_z = -185.686 WHERE npcid = 17961709;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = 291.395, pos_y = -42.000, pos_z = -401.071 WHERE npcid = 17961710;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = -238.000, pos_y = 0.000, pos_z = 612.000 WHERE npcid = 17957437;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = -365.000, pos_y = 0.000, pos_z = 439.000 WHERE npcid = 17957438;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = 35.000, pos_y = 0.000, pos_z = 126.000 WHERE npcid = 17957439;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = -1.400, pos_y = 0.000, pos_z = -163.000 WHERE npcid = 17957440;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = -360.000, pos_y = 0.000, pos_z = -440.000 WHERE npcid = 17957441;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = -6.700, pos_y = 0.000, pos_z = -443.500 WHERE npcid = 17957442;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = 243.600, pos_y = 0.000, pos_z = -295.400 WHERE npcid = 17957443;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = 461.000, pos_y = 0.000, pos_z = -278.400 WHERE npcid = 17957444;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = 519.000, pos_y = 0.000, pos_z = -479.500 WHERE npcid = 17957445;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = 321.000, pos_y = 0.000, pos_z = -119.900 WHERE npcid = 17957446;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = 596.700, pos_y = 0.000, pos_z = -163.800 WHERE npcid = 17957447;
UPDATE npc_list SET name = 'geasFete_qm', flag = 1, animation = 0, namevis = 112, status = 0, entityFlags = 3, name_prefix = 2, widescan = 0,  pos_rot = 0, look = 0x0000340000000000000000000000000000000000, pos_x = 396.000, pos_y = 0.000, pos_z = -641.000 WHERE npcid = 17957448;

