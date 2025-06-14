
-- UPDATE bcnm_info SET levelcap = 99 WHERE name = 'call_to_arms';
-- UPDATE bcnm_info SET levelcap = 99 WHERE name = 'compliments_to_the_chef';
-- UPDATE bcnm_info SET levelcap = 99 WHERE name = 'tough_nut_to_crack';
-- UPDATE bcnm_info SET levelcap = 99 WHERE name = 'happy_caster';
-- UPDATE bcnm_info SET levelcap = 99 WHERE name = 'making_a_mockery';
-- UPDATE bcnm_info SET levelcap = 99 WHERE name = 'shadows_of_the_mind';

-- assign BCNM info into battle fields
INSERT INTO `bcnm_records` VALUES (166,165,'shadow_lord_battle_ii'       ,'nobody',0,1800);
INSERT INTO `bcnm_records` VALUES (263,179,'return_to_delkfutts_tower_ii','nobody',0,1800);
INSERT INTO `bcnm_records` VALUES (228,170,'moonlit_path_ii'             ,'nobody',0,1800); -- working on
INSERT INTO `bcnm_records` VALUES (229,170,'waking_the_beast_fullmoon_ii','nobody',0,1800); -- working on
INSERT INTO `bcnm_records` VALUES (294,180,'ark_angels_hm_ii'            ,'nobody',0,1800);
INSERT INTO `bcnm_records` VALUES (295,180,'ark_angels_tt_ii'            ,'nobody',0,1800);
INSERT INTO `bcnm_records` VALUES (296,180,'ark_angels_mr_ii'            ,'nobody',0,1800);
INSERT INTO `bcnm_records` VALUES (297,180,'ark_angels_ev_ii'            ,'nobody',0,1800);
INSERT INTO `bcnm_records` VALUES (298,180,'ark_angels_gk_ii'            ,'nobody',0,1800);
INSERT INTO `bcnm_records` VALUES (299,180,'divine_might_ii'             ,'nobody',0,1800);
INSERT INTO `bcnm_records` VALUES (321,181,'celestial_nexus_ii'          ,'nobody',0,1800);
INSERT INTO `bcnm_records` VALUES (421,201,'trial_by_wind_ii'            ,'nobody',0,1800); -- done
INSERT INTO `bcnm_records` VALUES (453,202,'trial_by_lightning_ii'       ,'nobody',0,1800); -- done
INSERT INTO `bcnm_records` VALUES (485,203,'trial_by_ice_ii'             ,'nobody',0,1800); -- done
INSERT INTO `bcnm_records` VALUES (548,207,'trial_by_fire_ii'            ,'nobody',0,1800); -- done
INSERT INTO `bcnm_records` VALUES (581,209,'trial_by_earth_ii'           ,'nobody',0,1800); -- done
INSERT INTO `bcnm_records` VALUES (612,211,'trial_by_water_ii'           ,'nobody',0,1800); -- done
INSERT INTO `bcnm_records` VALUES (680,  8,'head_wind_ii'                ,'nobody',0,1800);
INSERT INTO `bcnm_records` VALUES (707, 10,'waking_dreams_ii'            ,'nobody',0,1800); -- workign on
INSERT INTO `bcnm_records` VALUES (968, 31,'savage_ii'                   ,'nobody',0,1800); 
INSERT INTO `bcnm_records` VALUES (994, 32,'warriors_path_ii'            ,'nobody',0,1800);
INSERT INTO `bcnm_records` VALUES (995, 32,'one_to_be_feared_ii'         ,'nobody',0,1800);
INSERT INTO `bcnm_records` VALUES (1059,36,'dawn_ii'                     ,'nobody',0,1800);
INSERT INTO `bcnm_records` VALUES (1093,57,'legacy_of_the_lost_ii'       ,'nobody',0,1800);
INSERT INTO `bcnm_records` VALUES (1157,67,'puppet_in_peril_ii'          ,'nobody',0,1800);

-- assign Mobs into battle fields
-- Garuda Prim HTBF updated
INSERT INTO mob_spell_lists VALUES ('Garuda_Prime_HTBF', 508, 188, 65, 255); -- Aeroga V
INSERT INTO mob_spell_lists VALUES ('Garuda_Prime_HTBF', 508, 209, 65, 255); -- Tornado 2
INSERT INTO mob_spell_lists VALUES ('Garuda_Prime_HTBF', 508,  79, 65, 255); -- Slow II
INSERT INTO mob_spell_lists VALUES ('Garuda_Prime_HTBF', 508,  80, 65, 255); -- Paralyze II
INSERT INTO mob_spell_lists VALUES ('Garuda_Prime_HTBF', 508, 102, 65, 255); -- Enaero
INSERT INTO mob_spell_lists VALUES ('Garuda_Prime_HTBF', 508, 157, 65, 255); -- Aero IV
INSERT INTO mob_spell_lists VALUES ('Garuda_Prime_HTBF', 508, 158, 65, 255); -- Aero V
INSERT INTO mob_pools VALUES (40000, 'Garuda_Prime_HTBF', 'Garuda_Prime', 324, 0x00001c0300000000000000000000000000000000, 1, 4, 6, 240, 100, 0, 1, 1, 1, 18, 1, 0, 0, 3, 0, 0, 508, 0, 0, 37, 37);  
UPDATE mob_spawn_points SET pos_X =  503.4111, pos_y =   41.6648, pos_z = -366.8300,  pos_rot = 106 WHERE mobid = 17600540;
UPDATE mob_spawn_points SET pos_X =   24.1289, pos_y =  -18.3276, pos_z =   32.7717,  pos_rot = 101 WHERE mobid = 17600541;
UPDATE mob_spawn_points SET pos_X = -375.3079, pos_y =  -78.4023, pos_z =  512.9899,  pos_rot =  97 WHERE mobid = 17600542;
UPDATE mob_groups SET poolid = 40000, dropid = 3921, HP = 115000, MP = 5000, minLevel = 100, maxLevel = 110 WHERE name = 'Garuda_Prime_HTBF' AND groupid = 7;
INSERT INTO mob_droplist VALUES(3921,0,0,1000,4069,1000); -- Rem's Tale Ch. 6
INSERT INTO mob_droplist VALUES(3921,1,1,500,4069,250); -- Rem's Tale Ch. 6
INSERT INTO mob_droplist VALUES(3921,1,2,1000,20615,333); -- Levante Dagger
INSERT INTO mob_droplist VALUES(3921,1,2,1000,20808,333); -- Tramontane Axe
INSERT INTO mob_droplist VALUES(3921,1,2,1000,28538,334); -- Lebeche Ring
INSERT INTO mob_droplist VALUES(3921,1,3,1000,28441,500); -- Ponente Sash
INSERT INTO mob_droplist VALUES(3921,1,3,1000,28286,500); -- Ostro Greaves
INSERT INTO mob_droplist VALUES(3921,1,4,1000,8720,200); -- Maliyakaleya Coral
INSERT INTO mob_droplist VALUES(3921,1,4,1000,8721,200); -- Hepatizon Ore
INSERT INTO mob_droplist VALUES(3921,1,4,1000,8723,200); -- Beryllium Ore
INSERT INTO mob_droplist VALUES(3921,1,4,1000,8725,200); -- Exalted Log
INSERT INTO mob_droplist VALUES(3921,1,4,1000,8727,200); -- Sif's Lock
-- Ramuh Prim HTBF updated
INSERT INTO mob_spell_lists VALUES ('Ramuh_Prime_HTBF', 509, 198, 65, 255); -- Thundega V
INSERT INTO mob_spell_lists VALUES ('Ramuh_Prime_HTBF', 509, 213, 65, 255); -- Burst 2
INSERT INTO mob_spell_lists VALUES ('Ramuh_Prime_HTBF', 509,  79, 65, 255); -- Slow II
INSERT INTO mob_spell_lists VALUES ('Ramuh_Prime_HTBF', 509,  80, 65, 255); -- Paralyze II
INSERT INTO mob_spell_lists VALUES ('Ramuh_Prime_HTBF', 509, 104, 65, 255); -- Enthunder
--INSERT INTO mob_spell_lists VALUES ('Ramuh_Prime_HTBF', 507, 167, 65, 255); -- Thunder IV
INSERT INTO mob_spell_lists VALUES ('Ramuh_Prime_HTBF', 509, 168, 65, 255); -- Thunder V
INSERT INTO mob_pools VALUES (40001, 'Ramuh_Prime_HTBF', 'Ramuh_Prime', 320, 0x00001e0300000000000000000000000000000000, 1, 4, 12, 240, 100, 0, 1, 1, 1, 18, 0, 0, 0, 3, 0, 0, 509, 0, 0, 43, 43);  
UPDATE mob_spawn_points SET pos_X =  504.0446, pos_y =   41.7271, pos_z = -367.8477,  pos_rot =  97 WHERE mobid = 17604639;
UPDATE mob_spawn_points SET pos_X =   23.0873, pos_y =  -18.2112, pos_z =   31.6858,  pos_rot =  97 WHERE mobid = 17604640;
UPDATE mob_spawn_points SET pos_X = -375.9910, pos_y =  -78.3179, pos_z =  512.7903,  pos_rot =  89 WHERE mobid = 17604641;
UPDATE mob_groups SET poolid = 40001, dropid = 3923, HP = 115000, MP = 5000, minLevel = 100, maxLevel = 110 WHERE name = 'Ramuh_Prime_HTBF' AND groupid = 8;
INSERT INTO mob_droplist VALUES(3923,0,0,1000,4070,1000); -- Rem's Tale Ch. 7
INSERT INTO mob_droplist VALUES(3923,1,1,500,4070,250); -- Rem's Tale Ch. 7
INSERT INTO mob_droplist VALUES(3923,1,2,1000,21166,333); -- Staccato Staff
INSERT INTO mob_droplist VALUES(3923,1,2,1000,21274,333); -- Donar Gun
INSERT INTO mob_droplist VALUES(3923,1,2,1000,28354,334); -- Voltsurge Torque
INSERT INTO mob_droplist VALUES(3923,1,3,1000,28432,500); -- Ukko Sash
INSERT INTO mob_droplist VALUES(3923,1,3,1000,28142,500); -- Brontes Cuisses
INSERT INTO mob_droplist VALUES(3923,1,4,1000,8720,200); -- Maliyakaleya Coral
INSERT INTO mob_droplist VALUES(3923,1,4,1000,8721,200); -- Hepatizon Ore
INSERT INTO mob_droplist VALUES(3923,1,4,1000,8723,200); -- Beryllium Ore
INSERT INTO mob_droplist VALUES(3923,1,4,1000,8725,200); -- Exalted Log
INSERT INTO mob_droplist VALUES(3923,1,4,1000,8727,200); -- Sif's Lock
-- Shiva Prim HTBF updated
INSERT INTO mob_spell_lists VALUES ('Shiva_Prime_HTBF', 510, 183, 65, 255); -- Blizzaga V
INSERT INTO mob_spell_lists VALUES ('Shiva_Prime_HTBF', 510, 207, 65, 255); -- Freeze 2
INSERT INTO mob_spell_lists VALUES ('Shiva_Prime_HTBF', 510,  79, 65, 255); -- Slow II
INSERT INTO mob_spell_lists VALUES ('Shiva_Prime_HTBF', 510,  80, 65, 255); -- Paralyze II
INSERT INTO mob_spell_lists VALUES ('Shiva_Prime_HTBF', 510, 101, 65, 255); -- Enblizzard
INSERT INTO mob_spell_lists VALUES ('Shiva_Prime_HTBF', 510, 152, 65, 255); -- Blizzard IV
INSERT INTO mob_spell_lists VALUES ('Shiva_Prime_HTBF', 510, 153, 65, 255); -- Blizzard V
INSERT INTO mob_pools VALUES (40002, 'Shiva_Prime_HTBF', 'Shiva_Prime', 319, 0x00001d0300000000000000000000000000000000, 1, 4, 6, 240, 100, 0, 1, 1, 1, 18, 1, 0, 0, 3, 0, 0, 510, 0, 0, 44, 44);  
UPDATE mob_spawn_points SET pos_X =  504.8676,  pos_y =  41.5439,  pos_z = -366.713,  pos_rot = 102 WHERE mobid = 17608747;
UPDATE mob_spawn_points SET pos_X =   23.9380,  pos_y = -18.2799,  pos_z =  32.3346,  pos_rot = 102 WHERE mobid = 17608748;
UPDATE mob_spawn_points SET pos_X = -374.1309,  pos_y = -78.5339,  pos_z = 512.5617,  pos_rot =  96 WHERE mobid = 17608749;
UPDATE mob_groups SET poolid = 40002, dropid = 3922, HP = 115000, MP = 5000, minLevel = 100, maxLevel = 110 WHERE name = 'Shiva_Prime_HTBF' AND groupid = 7;
INSERT INTO mob_droplist VALUES(3922,0,0,1000,4073,1000); -- Rem's Tale Ch. 10
INSERT INTO mob_droplist VALUES(3922,1,1,500,4073,250); -- Rem's Tale Ch. 10
INSERT INTO mob_droplist VALUES(3922,1,2,1000,20529,333); -- Calved Claws
INSERT INTO mob_droplist VALUES(3922,1,2,1000,21167,333); -- Frazil Staff
INSERT INTO mob_droplist VALUES(3922,1,2,1000,28495,334); -- Rimeice Earring
INSERT INTO mob_droplist VALUES(3922,1,3,1000,28008,500); -- Nilas Gloves
INSERT INTO mob_droplist VALUES(3922,1,3,1000,21366,500); -- Floestone
INSERT INTO mob_droplist VALUES(3922,1,4,1000,8720,200); -- Maliyakaleya Coral
INSERT INTO mob_droplist VALUES(3922,1,4,1000,8721,200); -- Hepatizon Ore
INSERT INTO mob_droplist VALUES(3922,1,4,1000,8723,200); -- Beryllium Ore
INSERT INTO mob_droplist VALUES(3922,1,4,1000,8725,200); -- Exalted Log
INSERT INTO mob_droplist VALUES(3922,1,4,1000,8727,200); -- Sif's Lock
-- Leviathan Prim HTBF updated
INSERT INTO mob_spell_lists VALUES ('Leviathan_Prime_HTBF', 511, 203, 65, 255); -- Waterga V
INSERT INTO mob_spell_lists VALUES ('Leviathan_Prime_HTBF', 511, 215, 65, 255); -- Flood 2
INSERT INTO mob_spell_lists VALUES ('Leviathan_Prime_HTBF', 511,  79, 65, 255); -- Slow II
INSERT INTO mob_spell_lists VALUES ('Leviathan_Prime_HTBF', 511,  80, 65, 255); -- Paralyze II
INSERT INTO mob_spell_lists VALUES ('Leviathan_Prime_HTBF', 511, 105, 65, 255); -- Enwater
INSERT INTO mob_spell_lists VALUES ('Leviathan_Prime_HTBF', 511, 172, 65, 255); -- Water IV
INSERT INTO mob_spell_lists VALUES ('Leviathan_Prime_HTBF', 511, 173, 65, 255); -- Water V
INSERT INTO mob_pools VALUES (40003, 'Leviathan_Prime_HTBF', 'Leviathan_Prime', 323, 0x00001b0300000000000000000000000000000000, 1, 4, 8, 240, 100, 0, 1, 1, 1, 18, 1, 0, 0, 3, 0, 0, 511, 0, 0, 40, 40);  
UPDATE mob_spawn_points SET pos_X =  505.3401, pos_y =   41.5271, pos_z = -367.2156,  pos_rot = 102 WHERE mobid = 17641497;
UPDATE mob_spawn_points SET pos_X =   25.9310, pos_y =  -18.6385, pos_z =   33.1422,  pos_rot = 100 WHERE mobid = 17641498;
UPDATE mob_spawn_points SET pos_X = -375.2288, pos_y =  -78.4145, pos_z =  513.0482,  pos_rot =  99 WHERE mobid = 17641499;
UPDATE mob_groups SET poolid = 40003, dropid = 3920, HP = 115000, MP = 5000, minLevel = 100, maxLevel = 110 WHERE name = 'Leviathan_Prime_HTBF' AND groupid = 6;
INSERT INTO mob_droplist VALUES(3920,0,0,1000,4072,1000); -- Rem's Tale Ch. 9
INSERT INTO mob_droplist VALUES(3920,1,1,500,4072,250); -- Rem's Tale Ch. 9
INSERT INTO mob_droplist VALUES(3920,1,2,1000,20944,333); -- Pelagos Lance
INSERT INTO mob_droplist VALUES(3920,1,2,1000,21103,333); -- Vadose Rod
INSERT INTO mob_droplist VALUES(3920,1,2,1000,20856,334); -- Phreatic Axe
INSERT INTO mob_droplist VALUES(3920,1,3,1000,21420,500); -- Benthos Grip
INSERT INTO mob_droplist VALUES(3920,1,3,1000,28493,500); -- Neritic Earring
INSERT INTO mob_droplist VALUES(3920,1,4,1000,8720,200); -- Maliyakaleya Coral
INSERT INTO mob_droplist VALUES(3920,1,4,1000,8721,200); -- Hepatizon Ore
INSERT INTO mob_droplist VALUES(3920,1,4,1000,8723,200); -- Beryllium Ore
INSERT INTO mob_droplist VALUES(3920,1,4,1000,8725,200); -- Exalted Log
INSERT INTO mob_droplist VALUES(3920,1,4,1000,8727,200); -- Sif's Lock
-- Ifrit Prim HTBF updated
INSERT INTO mob_spell_lists VALUES ('Ifrit_Prime_HTBF', 512, 178, 65, 255); -- firaga V
INSERT INTO mob_spell_lists VALUES ('Ifrit_Prime_HTBF', 512, 205, 65, 255); -- flare 2
INSERT INTO mob_spell_lists VALUES ('Ifrit_Prime_HTBF', 512,  79, 65, 255); -- Slow II
INSERT INTO mob_spell_lists VALUES ('Ifrit_Prime_HTBF', 512,  80, 65, 255); -- Paralyze II
INSERT INTO mob_spell_lists VALUES ('Ifrit_Prime_HTBF', 512, 100, 65, 255); -- Enfire
INSERT INTO mob_spell_lists VALUES ('Ifrit_Prime_HTBF', 512, 147, 65, 255); -- fire IV
INSERT INTO mob_spell_lists VALUES ('Ifrit_Prime_HTBF', 512, 148, 65, 255); -- fire V
INSERT INTO mob_pools VALUES (40004, 'Ifrit_Prime_HTBF', 'Ifrit_Prime', 322, 0x0000190300000000000000000000000000000000, 1, 4, 5, 240, 100, 0, 1, 1, 1, 18, 1, 0, 0, 3, 0, 0, 512, 0, 0, 38, 38);  
UPDATE mob_spawn_points SET pos_X =  503.4712, pos_y =   41.7094, pos_z = -367.2797,  pos_rot =  97 WHERE mobid = 17625113;
UPDATE mob_spawn_points SET pos_X =   23.6167, pos_y =  -18.3472, pos_z =   33.1332,  pos_rot = 103 WHERE mobid = 17625114;
UPDATE mob_spawn_points SET pos_X = -375.8824, pos_y =  -78.3193, pos_z =  512.7032,  pos_rot = 103 WHERE mobid = 17625115;
UPDATE mob_groups SET poolid = 40004, dropid = 3924, HP = 115000, MP = 5000, minLevel = 100, maxLevel = 110 WHERE name = 'Ifrit_Prime_HTBF' AND groupid = 6;
INSERT INTO mob_droplist VALUES(3924,0,0,1000,4072,1000); -- Rem's Tale Ch. 9
INSERT INTO mob_droplist VALUES(3924,1,1,500,4072,250); -- Rem's Tale Ch. 9
INSERT INTO mob_droplist VALUES(3924,1,2,1000,20716,333); -- Perfervid Sword
INSERT INTO mob_droplist VALUES(3924,1,2,1000,21036,333); -- Atakigiri
INSERT INTO mob_droplist VALUES(3924,1,2,1000,28285,334); -- Coalrake Sabots
INSERT INTO mob_droplist VALUES(3924,1,3,1000,27594,500); -- Annealed Mantle
INSERT INTO mob_droplist VALUES(3924,1,3,1000,21421,500); -- Immolation Grip
INSERT INTO mob_droplist VALUES(3924,1,4,1000,8720,200); -- Maliyakaleya Coral
INSERT INTO mob_droplist VALUES(3924,1,4,1000,8721,200); -- Hepatizon Ore
INSERT INTO mob_droplist VALUES(3924,1,4,1000,8723,200); -- Beryllium Ore
INSERT INTO mob_droplist VALUES(3924,1,4,1000,8725,200); -- Exalted Log
INSERT INTO mob_droplist VALUES(3924,1,4,1000,8727,200); -- Sif's Lock
-- Titan Prim HTBF updated
INSERT INTO mob_spell_lists VALUES ('Titan_Prime_HTBF', 513, 193, 65, 255); -- stonega V
INSERT INTO mob_spell_lists VALUES ('Titan_Prime_HTBF', 513, 211, 65, 255); -- quake 2
INSERT INTO mob_spell_lists VALUES ('Titan_Prime_HTBF', 513,  79, 65, 255); -- Slow II
INSERT INTO mob_spell_lists VALUES ('Titan_Prime_HTBF', 513,  80, 65, 255); -- Paralyze II
INSERT INTO mob_spell_lists VALUES ('Titan_Prime_HTBF', 513, 103, 65, 255); -- Enstone
INSERT INTO mob_spell_lists VALUES ('Titan_Prime_HTBF', 513, 162, 65, 255); -- stone IV
INSERT INTO mob_spell_lists VALUES ('Titan_Prime_HTBF', 513, 163, 65, 255); -- stone V
INSERT INTO mob_pools VALUES (40005, 'Titan_Prime_HTBF', 'Titan_Prime', 321, 0x00001a0300000000000000000000000000000000, 4, 4, 6, 240, 100, 0, 1, 1, 1, 18, 1, 0, 0, 3, 0, 0, 513, 0, 0, 45, 45);  
UPDATE mob_spawn_points SET pos_X =  503.7151, pos_y =   41.7203, pos_z = -367.5521,  pos_rot =  89 WHERE mobid = 17633308;
UPDATE mob_spawn_points SET pos_X =   24.4596, pos_y =  -18.3895, pos_z =   33.1568,  pos_rot =  97 WHERE mobid = 17633309;
UPDATE mob_spawn_points SET pos_X = -375.5651, pos_y =  -78.3770, pos_z =  513.0141,  pos_rot = 102 WHERE mobid = 17633310;
UPDATE mob_groups SET poolid = 40005, dropid = 3925, HP = 115000, MP = 5000, minLevel = 100, maxLevel = 110 WHERE name = 'Titan_Prime_HTBF' AND groupid = 7;
INSERT INTO mob_droplist VALUES(3925,0,0,1000,4071,1000); -- Rem's Tale Ch. 8
INSERT INTO mob_droplist VALUES(3925,1,1,500,4071,250); -- Rem's Tale Ch. 8
INSERT INTO mob_droplist VALUES(3925,1,2,1000,21102,333); -- Mafic Cudgel
INSERT INTO mob_droplist VALUES(3925,1,2,1000,20757,333); -- Foreshock Sword
INSERT INTO mob_droplist VALUES(3925,1,2,1000,21357,334); -- Togakushi Shuriken
INSERT INTO mob_droplist VALUES(3925,1,3,1000,28535,500); -- Supershear Ring
INSERT INTO mob_droplist VALUES(3925,1,3,1000,21358,500); -- Plumose Sachet
INSERT INTO mob_droplist VALUES(3925,1,4,1000,8720,200); -- Maliyakaleya Coral
INSERT INTO mob_droplist VALUES(3925,1,4,1000,8721,200); -- Hepatizon Ore
INSERT INTO mob_droplist VALUES(3925,1,4,1000,8723,200); -- Beryllium Ore
INSERT INTO mob_droplist VALUES(3925,1,4,1000,8725,200); -- Exalted Log
INSERT INTO mob_droplist VALUES(3925,1,4,1000,8727,200); -- Sif's Lock
-- Fenrir Prim HTBF updated
INSERT INTO mob_pools VALUES (40006, 'Fenrir_Prime_HTBF', 'Fenrir_Prime', 325, 0x0000180300000000000000000000000000000000, 8, 4, 6, 240, 100, 0, 1, 1, 1, 18, 1, 0, 0, 3, 0, 0, 0, 0, 0, 40001, 36);  
UPDATE mob_spawn_points SET mobname = 'Fenrir_Prime_HTBF', pos_X =  339.4457, pos_y =   47.5105, pos_z = -341.6085,  pos_rot =  64 WHERE mobid = 17473651;
UPDATE mob_spawn_points SET mobname = 'Fenrir_Prime_HTBF', pos_X =  -59.9329, pos_y =    9.4368, pos_z =   59.3577,  pos_rot =  64 WHERE mobid = 17473652;
UPDATE mob_spawn_points SET mobname = 'Fenrir_Prime_HTBF', pos_X = -380.1290, pos_y =  -52.5273, pos_z =  418.5986,  pos_rot =  64 WHERE mobid = 17473653;
UPDATE mob_groups SET poolid = 40006, dropid = 3926, HP = 155000, MP = 5000, minLevel = 110, maxLevel = 120 WHERE name = 'Fenrir_Prime_HTBF' AND groupid = 31;
INSERT INTO mob_skill_lists VALUES ('Fenrir_Prime_HTBF', 40001, 831); -- moonlit charge
INSERT INTO mob_skill_lists VALUES ('Fenrir_Prime_HTBF', 40001, 832); -- crescent fang
INSERT INTO mob_skill_lists VALUES ('Fenrir_Prime_HTBF', 40001, 833); -- lunar cry
INSERT INTO mob_skill_lists VALUES ('Fenrir_Prime_HTBF', 40001, 834); -- ecliptic growl
INSERT INTO mob_skill_lists VALUES ('Fenrir_Prime_HTBF', 40001, 835); -- lunar roar
INSERT INTO mob_skill_lists VALUES ('Fenrir_Prime_HTBF', 40001, 836); -- eclipse bite
INSERT INTO mob_skill_lists VALUES ('Fenrir_Prime_HTBF', 40001, 837); -- ecliptic howl
-- INSERT INTO mob_skill_lists VALUES ('Fenrir_Prime_HTBF', 40001, 839); -- howling moon -  - removed from mob list so we can control how often he uses it
INSERT INTO mob_droplist VALUES(3926,0,0,1000,4069,1000); -- Rem's Tale Ch. 6
INSERT INTO mob_droplist VALUES(3926,1,1,500,4069,250); -- Rem's Tale Ch. 6
INSERT INTO mob_droplist VALUES(3926,1,2,1000,20707,333); -- Medeina Kilij
INSERT INTO mob_droplist VALUES(3926,1,2,1000,21412,333); -- Capitoline Strap
INSERT INTO mob_droplist VALUES(3926,1,2,1000,25600,334); -- Ma'iitsoh Haube
INSERT INTO mob_droplist VALUES(3926,1,3,1000,26969,500); -- Vrikodara Jupon
INSERT INTO mob_droplist VALUES(3926,1,3,1000,27608,500); -- Lupine Cape
INSERT INTO mob_droplist VALUES(3926,1,4,1000,8720,200); -- Maliyakaleya Coral
INSERT INTO mob_droplist VALUES(3926,1,4,1000,8721,200); -- Hepatizon Ore
INSERT INTO mob_droplist VALUES(3926,1,4,1000,8723,200); -- Beryllium Ore
INSERT INTO mob_droplist VALUES(3926,1,4,1000,8725,200); -- Exalted Log
INSERT INTO mob_droplist VALUES(3926,1,4,1000,8727,200); -- Sif's Lock
-- Carbuncle Prim HTBF updated Carbuncle_Prime_HTBF
INSERT INTO mob_pools VALUES (40007, 'Carbuncle_Prime_HTBF', 'Carbuncle_Prime', 34, 0x0000170300000000000000000000000000000000, 3, 4, 7, 240, 100, 0, 1, 1, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 34, 34);  
UPDATE mob_spawn_points SET mobname = 'Carbuncle_Prime_HTBF', groupid = 32, pos_X =  339.6589, pos_y =   47.5315, pos_z = -342.1236,  pos_rot =  64 WHERE mobid = 17473562;
UPDATE mob_spawn_points SET mobname = 'Carbuncle_Prime_HTBF', groupid = 32, pos_X =  -59.7994, pos_y =    9.4894, pos_z =   58.6598,  pos_rot =  64 WHERE mobid = 17473573;
UPDATE mob_spawn_points SET mobname = 'Carbuncle_Prime_HTBF', groupid = 32, pos_X = -380.2636, pos_y =  -52.5487, pos_z =  419.2726,  pos_rot =  64 WHERE mobid = 17473584;
UPDATE mob_groups SET poolid = 40007, dropid = 3927, HP = 155000, MP = 5000, minLevel = 110, maxLevel = 120 WHERE name = 'Carbuncle_Prime_HTBF' AND groupid = 32;
UPDATE mob_groups SET HP = 50000, MP = 9999, minLevel = 95, maxLevel = 100, name = 'Ifrit_Prime_HTBF', poolid = 40004 WHERE name = 'Ifrit_Prime' AND groupid = 9;
UPDATE mob_groups SET HP = 50000, MP = 9999, minLevel = 95, maxLevel = 100, name = 'Shiva_Prime_HTBF', poolid = 40002 WHERE name = 'Shiva_Prime' AND groupid = 10;
UPDATE mob_groups SET HP = 50000, MP = 9999, minLevel = 95, maxLevel = 100, name = 'Garuda_Prime_HTBF', poolid = 40000 WHERE name = 'Garuda_Prime' AND groupid = 11;
UPDATE mob_groups SET HP = 50000, MP = 9999, minLevel = 95, maxLevel = 100, name = 'Titan_Prime_HTBF', poolid = 40005 WHERE name = 'Titan_Prime' AND groupid = 12;
UPDATE mob_groups SET HP = 50000, MP = 9999, minLevel = 95, maxLevel = 100, name = 'Ramuh_Prime_HTBF', poolid = 40001 WHERE name = 'Ramuh_Prime' AND groupid = 13;
UPDATE mob_groups SET HP = 50000, MP = 9999, minLevel = 95, maxLevel = 100, name = 'Leviathan_Prime_HTBF', poolid = 40003 WHERE name = 'Leviathan_Prime' AND groupid = 14;
UPDATE mob_spawn_points SET mobname = 'Ifrit_Prime_HTBF', pos_X =  339.6589, pos_y =   47.5315, pos_z = -342.1236,  pos_rot =  64 WHERE mobid = 17473563;
UPDATE mob_spawn_points SET mobname = 'Ifrit_Prime_HTBF', pos_X =  -59.7994, pos_y =    9.4894, pos_z =   58.6598,  pos_rot =  64 WHERE mobid = 17473574;
UPDATE mob_spawn_points SET mobname = 'Ifrit_Prime_HTBF', pos_X = -380.2636, pos_y =  -52.5487, pos_z =  419.2726,  pos_rot =  64 WHERE mobid = 17473585;
UPDATE mob_spawn_points SET mobname = 'Shiva_Prime_HTBF', pos_X =  339.6589, pos_y =   47.5315, pos_z = -342.1236,  pos_rot =  64 WHERE mobid = 17473564;
UPDATE mob_spawn_points SET mobname = 'Shiva_Prime_HTBF', pos_X =  -59.7994, pos_y =    9.4894, pos_z =   58.6598,  pos_rot =  64 WHERE mobid = 17473575;
UPDATE mob_spawn_points SET mobname = 'Shiva_Prime_HTBF', pos_X = -380.2636, pos_y =  -52.5487, pos_z =  419.2726,  pos_rot =  64 WHERE mobid = 17473586;
UPDATE mob_spawn_points SET mobname = 'Garuda_Prime_HTBF', pos_X =  339.6589, pos_y =   47.5315, pos_z = -342.1236,  pos_rot =  64 WHERE mobid = 17473565;
UPDATE mob_spawn_points SET mobname = 'Garuda_Prime_HTBF', pos_X =  -59.7994, pos_y =    9.4894, pos_z =   58.6598,  pos_rot =  64 WHERE mobid = 17473576;
UPDATE mob_spawn_points SET mobname = 'Garuda_Prime_HTBF', pos_X = -380.2636, pos_y =  -52.5487, pos_z =  419.2726,  pos_rot =  64 WHERE mobid = 17473587;
UPDATE mob_spawn_points SET mobname = 'Titan_Prime_HTBF', pos_X =  339.6589, pos_y =   47.5315, pos_z = -342.1236,  pos_rot =  64 WHERE mobid = 17473566;
UPDATE mob_spawn_points SET mobname = 'Titan_Prime_HTBF', pos_X =  -59.7994, pos_y =    9.4894, pos_z =   58.6598,  pos_rot =  64 WHERE mobid = 17473577;
UPDATE mob_spawn_points SET mobname = 'Titan_Prime_HTBF', pos_X = -380.2636, pos_y =  -52.5487, pos_z =  419.2726,  pos_rot =  64 WHERE mobid = 17473588;
UPDATE mob_spawn_points SET mobname = 'Ramuh_Prime_HTBF', pos_X =  339.6589, pos_y =   47.5315, pos_z = -342.1236,  pos_rot =  64 WHERE mobid = 17473567;
UPDATE mob_spawn_points SET mobname = 'Ramuh_Prime_HTBF', pos_X =  -59.7994, pos_y =    9.4894, pos_z =   58.6598,  pos_rot =  64 WHERE mobid = 17473578;
UPDATE mob_spawn_points SET mobname = 'Ramuh_Prime_HTBF', pos_X = -380.2636, pos_y =  -52.5487, pos_z =  419.2726,  pos_rot =  64 WHERE mobid = 17473589;
UPDATE mob_spawn_points SET mobname = 'Leviathan_Prime_HTBF', pos_X =  339.6589, pos_y =   47.5315, pos_z = -342.1236,  pos_rot =  64 WHERE mobid = 17473568;
UPDATE mob_spawn_points SET mobname = 'Leviathan_Prime_HTBF', pos_X =  -59.7994, pos_y =    9.4894, pos_z =   58.6598,  pos_rot =  64 WHERE mobid = 17473579;
UPDATE mob_spawn_points SET mobname = 'Leviathan_Prime_HTBF', pos_X = -380.2636, pos_y =  -52.5487, pos_z =  419.2726,  pos_rot =  64 WHERE mobid = 17473590;
INSERT INTO mob_droplist VALUES(3927,0,0,1000,4070,1000); -- Rem's Tale Ch. 7
INSERT INTO mob_droplist VALUES(3927,1,1,500,4070,250); -- Rem's Tale Ch. 7
INSERT INTO mob_droplist VALUES(3927,1,2,1000,21155,333); -- Marquetry Staff
INSERT INTO mob_droplist VALUES(3927,1,2,1000,26970,333); -- Lapidary Tunic
INSERT INTO mob_droplist VALUES(3927,1,2,1000,27466,334); -- Diamantaire Sollerets
INSERT INTO mob_droplist VALUES(3927,1,3,1000,27516,500); -- Satlada Necklace
INSERT INTO mob_droplist VALUES(3927,1,3,1000,28414,500); -- Engraved Belt
INSERT INTO mob_droplist VALUES(3927,1,4,1000,8720,200); -- Maliyakaleya Coral
INSERT INTO mob_droplist VALUES(3927,1,4,1000,8721,200); -- Hepatizon Ore
INSERT INTO mob_droplist VALUES(3927,1,4,1000,8723,200); -- Beryllium Ore
INSERT INTO mob_droplist VALUES(3927,1,4,1000,8725,200); -- Exalted Log
INSERT INTO mob_droplist VALUES(3927,1,4,1000,8727,200); -- Sif's Lock
-- Diablos Prim HTBF updated
INSERT INTO mob_pools VALUES (40008, 'Diabolos_Prime_HTBF', 'Diabolos_Prime', 35, 0x0000790400000000000000000000000000000000, 4, 5, 12, 240, 100, 0, 1, 1, 0, 18, 0, 0, 0, 0, 0, 0, 515, 0, 0, 40002, 35);  
UPDATE mob_spawn_points SET mobname = 'Diabolos_Prime_HTBF', pos_X =  -240.0419, pos_y =   -32.0000, pos_z = 291.0711,  pos_rot =  69 WHERE mobid = 16818226;
UPDATE mob_spawn_points SET mobname = 'Diabolos_Prime_HTBF', pos_X =  -59.7994, pos_y =    9.4894, pos_z =   58.6598,  pos_rot =  64 WHERE mobid = 16818227;
UPDATE mob_spawn_points SET mobname = 'Diabolos_Prime_HTBF', pos_X = -380.2636, pos_y =  -52.5487, pos_z =  419.2726,  pos_rot =  64 WHERE mobid = 16818228;
UPDATE mob_groups SET poolid = 40008, dropid = 3928, HP = 155000, MP = 5000, minLevel = 110, maxLevel = 120 WHERE name = 'Diabolos_HTBF' AND groupid = 6;
INSERT INTO mob_droplist VALUES(3928,0,0,1000,4071,1000); -- Rem's Tale Ch. 8
INSERT INTO mob_droplist VALUES(3928,1,1,500,4071,250); -- Rem's Tale Ch. 8
INSERT INTO mob_droplist VALUES(3928,1,2,1000,20982,333); -- Shuhansadamune
INSERT INTO mob_droplist VALUES(3928,1,2,1000,26971,333); -- Chozoron Coselete
INSERT INTO mob_droplist VALUES(3928,1,2,1000,27105,334); -- Loagaeth Cuffs
INSERT INTO mob_droplist VALUES(3928,1,3,1000,27531,500); -- Darkside Earring
INSERT INTO mob_droplist VALUES(3928,1,3,1000,10767,500); -- Pernicious Ring
INSERT INTO mob_droplist VALUES(3928,1,4,1000,8720,200); -- Maliyakaleya Coral
INSERT INTO mob_droplist VALUES(3928,1,4,1000,8721,200); -- Hepatizon Ore
INSERT INTO mob_droplist VALUES(3928,1,4,1000,8723,200); -- Beryllium Ore
INSERT INTO mob_droplist VALUES(3928,1,4,1000,8725,200); -- Exalted Log
INSERT INTO mob_droplist VALUES(3928,1,4,1000,8727,200); -- Sif's Lock
INSERT INTO mob_skill_lists VALUES ('Diabolos_Prime_HTBF', 40002, 1910); -- Nether Blast -- no scipt -- testing
INSERT INTO mob_skill_lists VALUES ('Diabolos_Prime_HTBF', 40002, 582); -- Cacodemonia -- no script -- testing
INSERT INTO mob_skill_lists VALUES ('Diabolos_Prime_HTBF', 40002, 1905); -- Noctoshield -- no script -- testing
INSERT INTO mob_skill_lists VALUES ('Diabolos_Prime_HTBF', 40002, 3554); -- Night Terror -- no script -- testing
-- INSERT INTO mob_skill_lists VALUES ('Diabolos_Prime_HTBF', 40002, 1911); -- Ruinous Omen -- 2 hr -- no script  - removed from mob list so we can control how often he uses it
INSERT INTO mob_skill_lists VALUES ('Diabolos_Prime_HTBF', 40002, 1907); -- Dream Shroud -- no script-- testing
INSERT INTO mob_skill_lists VALUES ('Diabolos_Prime_HTBF', 40002, 1908); -- Nightmare
UPDATE mob_skills SET mob_anim_id = 918 WHERE mob_skill_id = 1908;
UPDATE mob_skills SET mob_anim_id = 1127 WHERE mob_skill_id = 1907;
UPDATE mob_skills SET mob_anim_id = 1129 WHERE mob_skill_id = 1910;
INSERT INTO mob_skills VALUES(582, 1128, 'cacodemonia', 2,0.0, 13.5, 2000, 1500, 4, 0, 0, 0, 0, 0, 0);
INSERT INTO mob_skills VALUES(3554, 2535, 'night_terror', 2,0.0, 13.5, 2000, 1500, 4, 0, 0, 0, 0, 0, 0);
INSERT INTO mob_spell_lists VALUES('Diabolos_Prime_HTBF', 515, 232, 1, 255); -- bio iii
INSERT INTO mob_spell_lists VALUES('Diabolos_Prime_HTBF', 515, 246, 1, 255); -- drain ii
INSERT INTO mob_spell_lists VALUES('Diabolos_Prime_HTBF', 515, 248, 1, 255); -- aspir ii
INSERT INTO mob_spell_lists VALUES('Diabolos_Prime_HTBF', 515, 276, 1, 255); -- blind ii
INSERT INTO mob_spell_lists VALUES('Diabolos_Prime_HTBF', 515, 259, 1, 255); -- sleep ii
INSERT INTO mob_spell_lists VALUES('Diabolos_Prime_HTBF', 515, 274, 1, 255); -- sleepga ii
INSERT INTO mob_spell_lists VALUES('Diabolos_Prime_HTBF', 515, 260, 1, 255); -- dispel
INSERT INTO mob_spell_lists VALUES('Diabolos_Prime_HTBF', 515, 252, 1, 255); -- stun
-- Ark Angel HTBF HTBF updates
INSERT INTO `mob_pools` VALUES (40009,'Ark_Angel_EV_HTBF','Ark_Angel_EV',352,0x0000110300000000000000000000000000000000,7,3,3,240,125,0,1,1,1,18,0,32,1595,1051,0,0,518,0,0,352,352);
INSERT INTO `mob_pools` VALUES (40010,'Ark_Angel_GK_HTBF','Ark_Angel_GK',353,0x0000140300000000000000000000000000000000,12,14,10,240,125,0,1,1,1,18,0,32,693,1179,0,0,0,0,0,353,353);
INSERT INTO `mob_pools` VALUES (40011,'Ark_Angel_HM_HTBF','Ark_Angel_HM',354,0x0000100300000000000000000000000000000000,1,13,3,240,125,0,1,1,1,18,0,32,3139,1179,0,0,517,0,0,354,354);
INSERT INTO `mob_pools` VALUES (40012,'Ark_Angel_MR_HTBF','Ark_Angel_MR',355,0x0000120300000000000000000000000000000000,9,6,2,240,125,0,1,1,1,18,0,32,4504,1051,0,0,0,0,0,355,355);
INSERT INTO `mob_pools` VALUES (40013,'Ark_Angel_TT_HTBF','Ark_Angel_TT',356,0x0000130300000000000000000000000000000000,4,8,7,240,125,2,1,1,1,18,0,32,1129,1179,0,0,516,0,0,356,356);
INSERT INTO `mob_pools` VALUES (40014,'Ark_Angels_Mandragora','Ark_Angels_Mandragora',178,0x00002D0100000000000000000000000000000000,2,2,1,480,100,0,1,0,1,18,0,0,0,1667,8,0,0,0,0,178,178);
INSERT INTO `mob_pools` VALUES (40015,'Ark_Angels_Tiger','Ark_Angels_Tiger',242,0x0000340100000000000000000000000000000000,1,1,7,240,100,0,1,0,1,18,0,0,0,1153,0,0,0,0,0,242,242);
INSERT INTO `mob_pools` VALUES (40016,'Ark_Angels_Wyvern','Ark_Angels_Wyvern',193,0x00000C0300000000000000000000000000000000,14,1,7,200,100,0,1,0,1,18,0,0,0,1157,0,0,0,0,0,714,193);
INSERT INTO `mob_groups` VALUES (11500, 40009, 180, 'Ark_Angel_EV_HTBF',0,128,3929,155000,9999,115,120,0);
INSERT INTO `mob_groups` VALUES (11501, 40010, 180, 'Ark_Angel_GK_HTBF',0,128,3930,155000,9999,115,120,0);
INSERT INTO `mob_groups` VALUES (11502, 40011, 180, 'Ark_Angel_HM_HTBF',0,128,3931,155000,9999,115,120,0);
INSERT INTO `mob_groups` VALUES (11503, 40012, 180, 'Ark_Angel_MR_HTBF',0,128,3932,155000,9999,115,120,0);
INSERT INTO `mob_groups` VALUES (11504, 40013, 180, 'Ark_Angel_TT_HTBF',0,128,3933,155000,9999,115,120,0);
UPDATE mob_spawn_points SET mobname = 'Ark_Angel_EV_HTBF',     groupid = 11500, pos_X = -13.9772,   pos_y = -18.7160,  pos_z = 14.2155,  pos_rot =  33 WHERE mobid = 17514701;
UPDATE mob_spawn_points SET mobname = 'Ark_Angel_EV_HTBF',     groupid = 11500, pos_X = -562.3348,  pos_y = 242.6680,  pos_z = 56.3998,  pos_rot =  33 WHERE mobid = 17514702;
UPDATE mob_spawn_points SET mobname = 'Ark_Angel_EV_HTBF',     groupid = 11500, pos_X = -477.6799,  pos_y = -317.6700, pos_z = 79.2236,  pos_rot =  33 WHERE mobid = 17514703;
UPDATE mob_spawn_points SET mobname = 'Ark_Angel_TT_HTBF',     groupid = 11504, pos_X = -13.9772,   pos_y = -18.7160,  pos_z = 14.2155,  pos_rot =  33 WHERE mobid = 17514704;
UPDATE mob_spawn_points SET mobname = 'Ark_Angel_TT_HTBF',     groupid = 11504, pos_X = -562.3348,  pos_y = 242.6680,  pos_z = 56.3998,  pos_rot =  33 WHERE mobid = 17514705;
UPDATE mob_spawn_points SET mobname = 'Ark_Angel_TT_HTBF',     groupid = 11504, pos_X = -477.6799,  pos_y = -317.6700, pos_z = 79.2236,  pos_rot =  33 WHERE mobid = 17514706;
UPDATE mob_spawn_points SET mobname = 'Ark_Angel_GK_HTBF',     groupid = 11501, pos_X = -13.9772,   pos_y = -18.7160,  pos_z = 14.2155,  pos_rot =  33 WHERE mobid = 17514707;
UPDATE mob_spawn_points SET mobname = 'Ark_Angel_GK_HTBF',     groupid = 11501, pos_X = -562.3348,  pos_y = 242.6680,  pos_z = 56.3998,  pos_rot =  33 WHERE mobid = 17514708;
UPDATE mob_spawn_points SET mobname = 'Ark_Angel_GK_HTBF',     groupid = 11501, pos_X = -477.6799,  pos_y = -317.6700, pos_z = 79.2236,  pos_rot =  33 WHERE mobid = 17514709;
UPDATE mob_spawn_points SET mobname = 'Ark_Angels_Wyvern',                      pos_X = -13.9772,   pos_y = -18.7160,  pos_z = 14.2155,  pos_rot =  33 WHERE mobid = 17514710;
UPDATE mob_spawn_points SET mobname = 'Ark_Angels_Wyvern',                      pos_X = -562.3348,  pos_y = 242.6680,  pos_z = 56.3998,  pos_rot =  33 WHERE mobid = 17514711;
UPDATE mob_spawn_points SET mobname = 'Ark_Angels_Wyvern',                      pos_X = -477.6799,  pos_y = -317.6700, pos_z = 79.2236,  pos_rot =  33 WHERE mobid = 17514712;
UPDATE mob_spawn_points SET mobname = 'Ark_Angel_HM_HTBF',     groupid = 11502, pos_X = -13.9772,   pos_y = -18.7160,  pos_z = 14.2155,  pos_rot =  33 WHERE mobid = 17514737;
UPDATE mob_spawn_points SET mobname = 'Ark_Angel_HM_HTBF',     groupid = 11502, pos_X = -562.3348,  pos_y = 242.6680,  pos_z = 56.3998,  pos_rot =  33 WHERE mobid = 17514738;
UPDATE mob_spawn_points SET mobname = 'Ark_Angel_HM_HTBF',     groupid = 11502, pos_X = -477.6799,  pos_y = -317.6700, pos_z = 79.2236,  pos_rot =  33 WHERE mobid = 17514739;
UPDATE mob_spawn_points SET mobname = 'Ark_Angel_MR_HTBF',     groupid = 11503, pos_X = -13.9772,   pos_y = -18.7160,  pos_z = 14.2155,  pos_rot =  33 WHERE mobid = 17514740;
UPDATE mob_spawn_points SET mobname = 'Ark_Angel_MR_HTBF',     groupid = 11503, pos_X = -562.3348,  pos_y = 242.6680,  pos_z = 56.3998,  pos_rot =  33 WHERE mobid = 17514741;
UPDATE mob_spawn_points SET mobname = 'Ark_Angel_MR_HTBF',     groupid = 11503, pos_X = -477.6799,  pos_y = -317.6700, pos_z = 79.2236,  pos_rot =  33 WHERE mobid = 17514742;
UPDATE mob_spawn_points SET mobname = 'Ark_Angels_Tiger',                       pos_X = -13.9772,   pos_y = -18.7160,  pos_z = 14.2155,  pos_rot =  33 WHERE mobid = 17514743;
UPDATE mob_spawn_points SET mobname = 'Ark_Angels_Tiger',                       pos_X = -562.3348,  pos_y = 242.6680,  pos_z = 56.3998,  pos_rot =  33 WHERE mobid = 17514744;
UPDATE mob_spawn_points SET mobname = 'Ark_Angels_Tiger',                       pos_X = -477.6799,  pos_y = -317.6700, pos_z = 79.2236,  pos_rot =  33 WHERE mobid = 17514745;
UPDATE mob_spawn_points SET mobname = 'Ark_Angels_Mandragora',                  pos_X = -13.9772,   pos_y = -18.7160,  pos_z = 14.2155,  pos_rot =  33 WHERE mobid = 17514746;
UPDATE mob_spawn_points SET mobname = 'Ark_Angels_Mandragora',                  pos_X = -562.3348,  pos_y = 242.6680,  pos_z = 56.3998,  pos_rot =  33 WHERE mobid = 17514747;
UPDATE mob_spawn_points SET mobname = 'Ark_Angels_Mandragora',                  pos_X = -477.6799,  pos_y = -317.6700, pos_z = 79.2236,  pos_rot =  33 WHERE mobid = 17514748;
INSERT INTO mob_droplist VALUES(3931,0,0,1000,4069,1000); -- Rem Tale Ch 6
INSERT INTO mob_droplist VALUES(3931,0,0,250,4069,1000); -- Rem Tale Ch 6
INSERT INTO mob_droplist VALUES(3931,1,1,750,8710,375); -- Buried Vestige
INSERT INTO mob_droplist VALUES(3931,1,1,750,8719,375); -- Maliyakaleya Coral
INSERT INTO mob_droplist VALUES(3931,1,2,500,20864,250); -- Castigation
INSERT INTO mob_droplist VALUES(3931,1,2,500,20733,250); -- Anahera Saber
INSERT INTO mob_droplist VALUES(3931,1,3,750,27744,225); -- Lithelimb Cap
INSERT INTO mob_droplist VALUES(3931,1,3,750,21427,225); -- Bloodrain Strap
INSERT INTO mob_droplist VALUES(3931,1,3,750,28311,200); -- Manabyss Pigaches
INSERT INTO mob_droplist VALUES(3933,0,0,1000,4073,1000); -- Rem Tale Ch 10
INSERT INTO mob_droplist VALUES(3933,0,0,250,4073,1000); -- Rem Tale Ch 10
INSERT INTO mob_droplist VALUES(3933,1,1,1000,8710,375); -- Buried Vestige
INSERT INTO mob_droplist VALUES(3933,1,1,1000,8721,375); -- Hepatizon Ore
INSERT INTO mob_droplist VALUES(3933,1,2,1000,20913,250); -- Anahera Scythe
INSERT INTO mob_droplist VALUES(3933,1,2,1000,21181,250); -- Venabulum
INSERT INTO mob_droplist VALUES(3933,1,3,1000,28174,225); -- Theurgists Slacks
INSERT INTO mob_droplist VALUES(3933,1,3,1000,28312,225); -- Scamps Sollerets
INSERT INTO mob_droplist VALUES(3933,1,3,1000,28616,200); -- Fravashi Mantle
INSERT INTO mob_droplist VALUES(3932,0,0,1000,4071,1000); -- Rem Tale Ch 8
INSERT INTO mob_droplist VALUES(3932,0,0,250,4071,1000); -- Rem Tale Ch 8
INSERT INTO mob_droplist VALUES(3932,1,1,1000,8710,375); -- Buried Vestige
INSERT INTO mob_droplist VALUES(3932,1,1,1000,8723,375); -- Beryllium Ore
INSERT INTO mob_droplist VALUES(3932,1,2,1000,20997,250); -- Raimitsukane
INSERT INTO mob_droplist VALUES(3932,1,2,1000,20822,250); -- Anahera Tabar
INSERT INTO mob_droplist VALUES(3932,1,3,1000,28025,225); -- Regimen Mittens
INSERT INTO mob_droplist VALUES(3932,1,3,1000,27745,225); -- Felistris Mask
INSERT INTO mob_droplist VALUES(3932,1,3,1000,28461,200); -- Sekhmet Corset
INSERT INTO mob_droplist VALUES(3929,0,0,1000,4070,1000); -- Rem Tale Ch 7
INSERT INTO mob_droplist VALUES(3929,0,0,250,4070,1000); -- Rem Tale Ch 7
INSERT INTO mob_droplist VALUES(3929,1,1,1000,8710,375); -- Buried Vestige
INSERT INTO mob_droplist VALUES(3929,1,1,1000,8725,375); -- Exalted Log
INSERT INTO mob_droplist VALUES(3929,1,2,1000,20734,250); -- Anahera Sword
INSERT INTO mob_droplist VALUES(3929,1,2,1000,21116,250); -- Cagliostros Rod
INSERT INTO mob_droplist VALUES(3929,1,3,1000,28173,225); -- Osmium Cuisses
INSERT INTO mob_droplist VALUES(3929,1,3,1000,28578,225); -- Patricius Ring
INSERT INTO mob_droplist VALUES(3929,1,3,1000,28034,200); -- Dynasty Mitts
INSERT INTO mob_droplist VALUES(3930,0,0,1000,4072,1000); -- Rem Tale Ch 9
INSERT INTO mob_droplist VALUES(3930,0,0,250,4072,1000); -- Rem Tale Ch 9
INSERT INTO mob_droplist VALUES(3930,1,1,1000,8710,375); -- Buried Vestige
INSERT INTO mob_droplist VALUES(3930,1,1,1000,8727,375); -- Sifs Lock
INSERT INTO mob_droplist VALUES(3930,1,2,1000,20765,250); -- Tunglmyrkvi
INSERT INTO mob_droplist VALUES(3930,1,2,1000,21049,250); -- Anahera Blade
INSERT INTO mob_droplist VALUES(3930,1,3,1000,28389,225); -- Agitators Collar
INSERT INTO mob_droplist VALUES(3930,1,3,1000,28035,225); -- Lurid Mitts
INSERT INTO mob_droplist VALUES(3930,1,3,1000,28313,200); -- Daihanshi Habaki
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,148,1,255); -- fire_v
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,153,1,255); -- blizzard_v
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,158,1,255); -- aero_v
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,163,1,255); -- stone_v
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,168,1,255); -- thunder_v
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,173,1,255); -- water_v
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,178,1,255); -- firaga_v
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,183,1,255); -- blizzaga_v
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,188,1,255); -- aeroga_v
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,193,1,255); -- stonega_v
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,198,1,255); -- thundaga_v
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,203,1,255); -- waterga_v
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,205,1,255); -- flare_ii
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,207,1,255); -- freeze_ii
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,209,1,255); -- tornado_ii
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,211,1,255); -- quake_ii
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,213,1,255); -- burst_ii
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,215,1,255); -- flood_ii
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,221,1,255); -- poison_ii
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,226,1,255); -- poisonga_ii
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,232,1,255); -- bio_iii
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,246,1,255); -- drain_ii
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,248,1,255); -- aspir_ii
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,249,1,255); -- blaze_spikes
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,252,1,255); -- stun
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,259,1,255); -- sleep_ii
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,266,1,255); -- absorb-str
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,267,1,255); -- absorb-dex
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,268,1,255); -- absorb-vit
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,269,1,255); -- absorb-agi
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,270,1,255); -- absorb-int
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,271,1,255); -- absorb-mnd
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,272,1,255); -- absorb-chr
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,274,1,255); -- sleepga_ii
INSERT INTO mob_spell_lists VALUES ('ArkAngelTTHTBF',516,275,1,255); -- absorb-tp
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,508,1,255); -- yurin_ichi
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,319,1,255); -- aisha_ichi
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,507,1,255); -- myoshu_ichi
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,509,1,255); -- kakka_ichi
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,410,1,255); -- puppets_operetta
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,320,1,255); -- katon_ichi
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,321,1,255); -- katon_ni
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,322,1,255); -- katon_san
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,323,1,255); -- hyoton_ichi
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,324,1,255); -- hyoton_ni
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,325,1,255); -- hyoton_san
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,326,1,255); -- huton_ichi
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,327,1,255); -- huton_ni
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,328,1,255); -- huton_san
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,329,1,255); -- doton_ichi
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,330,1,255); -- doton_ni
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,331,1,255); -- doton_san
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,332,1,255); -- raiton_ichi
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,333,1,255); -- raiton_ni
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,334,1,255); -- raiton_san
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,335,1,255); -- suiton_ichi
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,336,1,255); -- suiton_ni
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,337,1,255); -- suiton_san
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,338,1,255); -- utsusemi_ichi
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,339,1,255); -- utsusemi_ni
INSERT INTO mob_spell_lists VALUES ('ArkAngelHM',517,340,1,255); -- utsusemi_san
INSERT INTO mob_spell_lists VALUES ('ArkAngelEV',518,5,1,255); -- cure_v
INSERT INTO mob_spell_lists VALUES ('ArkAngelEV',518,14,1,255); -- poisona
INSERT INTO mob_spell_lists VALUES ('ArkAngelEV',518,15,1,255); -- paralyna
INSERT INTO mob_spell_lists VALUES ('ArkAngelEV',518,16,1,255); -- blindna
INSERT INTO mob_spell_lists VALUES ('ArkAngelEV',518,17,1,255); -- silena
INSERT INTO mob_spell_lists VALUES ('ArkAngelEV',518,18,1,255); -- stona
INSERT INTO mob_spell_lists VALUES ('ArkAngelEV',518,22,1,255); -- holy_ii
INSERT INTO mob_spell_lists VALUES ('ArkAngelEV',518,25,1,255); -- dia_iii
INSERT INTO mob_spell_lists VALUES ('ArkAngelEV',518,32,1,255); -- banish_v
INSERT INTO mob_spell_lists VALUES ('ArkAngelEV',518,35,1,255); -- diaga_iii
INSERT INTO mob_spell_lists VALUES ('ArkAngelEV',518,47,1,255); -- protect_v
INSERT INTO mob_spell_lists VALUES ('ArkAngelEV',518,52,1,255); -- shell_v
INSERT INTO mob_spell_lists VALUES ('ArkAngelEV',518,53,1,255); -- blink
INSERT INTO mob_spell_lists VALUES ('ArkAngelEV',518,54,1,255); -- stoneskin
INSERT INTO mob_spell_lists VALUES ('ArkAngelEV',518,111,1,255); -- regen_iii
INSERT INTO mob_spell_lists VALUES ('ArkAngelEV',518,112,1,255); -- flash
INSERT INTO mob_spell_lists VALUES ('ArkAngelEV',518,106,1,255); -- phalanx
INSERT INTO mob_spell_lists VALUES ('ArkAngelEV',518,97,1,255); -- reprisal
INSERT INTO mob_spell_lists VALUES ('ArkAngelEV',518,855,1,255); -- enlight_ii
UPDATE mob_spawn_points SET mobname = 'Ark_Angel_EV_HTBF',     groupid = 11500, pos_X = -13.9772,   pos_y = -18.7160,  pos_z = 14.2155,  pos_rot =  33 WHERE mobid = 17514781;
UPDATE mob_spawn_points SET mobname = 'Ark_Angel_TT_HTBF',     groupid = 11504, pos_X = -16.0718,   pos_y = -18.7161,  pos_z = 14.2155,  pos_rot =  54 WHERE mobid = 17514782;
UPDATE mob_spawn_points SET mobname = 'Ark_Angel_GK_HTBF',     groupid = 11501, pos_X = -18.6289,   pos_y = -18.7163,  pos_z = 14.2155,  pos_rot =  50 WHERE mobid = 17514783;
UPDATE mob_spawn_points SET mobname = 'Ark_Angels_Wyvern',                      pos_X = -18.6289,   pos_y = -18.7163,  pos_z = 14.2155,  pos_rot =  50 WHERE mobid = 17514784;
UPDATE mob_spawn_points SET mobname = 'Ark_Angel_HM_HTBF',     groupid = 11502, pos_X =  -9.1463,   pos_y = -18.7163,  pos_z = 14.2155,  pos_rot =  43 WHERE mobid = 17514777;
UPDATE mob_spawn_points SET mobname = 'Ark_Angel_MR_HTBF',     groupid = 11503, pos_X = -12.1318,   pos_y = -18.7161,  pos_z = 14.2155,  pos_rot =  39 WHERE mobid = 17514778;
UPDATE mob_spawn_points SET mobname = 'Ark_Angels_Tiger',                       pos_X = -12.1318,   pos_y = -18.7161,  pos_z = 14.2155,  pos_rot =  39 WHERE mobid = 17514779;
UPDATE mob_spawn_points SET mobname = 'Ark_Angels_Mandragora',                  pos_X = -12.1318,   pos_y = -18.7161,  pos_z = 14.2155,  pos_rot =  39 WHERE mobid = 17514780;
INSERT INTO mob_droplist VALUES (3934,1,2,1000,4069,200); -- Rem Tale Ch 6
INSERT INTO mob_droplist VALUES (3934,1,2,1000,4070,200); -- Rem Tale Ch 7
INSERT INTO mob_droplist VALUES (3934,1,2,1000,4072,200); -- Rem Tale Ch 8
INSERT INTO mob_droplist VALUES (3934,1,2,1000,4072,200); -- Rem Tale Ch 9
INSERT INTO mob_droplist VALUES (3934,1,2,1000,4073,200); -- Rem Tale Ch 10
INSERT INTO mob_droplist VALUES (3934,1,2,500,4069,100); -- Rem Tale Ch 6
INSERT INTO mob_droplist VALUES (3934,1,2,500,4070,100); -- Rem Tale Ch 7
INSERT INTO mob_droplist VALUES (3934,1,2,500,4072,100); -- Rem Tale Ch 8
INSERT INTO mob_droplist VALUES (3934,1,2,500,4072,100); -- Rem Tale Ch 9
INSERT INTO mob_droplist VALUES (3934,1,2,500,4073,100); -- Rem Tale Ch 10
INSERT INTO mob_droplist VALUES (3934,1,3,1000,8710,166); -- Buried Vestige
INSERT INTO mob_droplist VALUES (3934,1,3,1000,8719,167); -- Maliyakaleya Coral
INSERT INTO mob_droplist VALUES (3934,1,3,1000,8721,166); -- Hepatizon Ore
INSERT INTO mob_droplist VALUES (3934,1,3,1000,8723,167); -- Beryllium Ore
INSERT INTO mob_droplist VALUES (3934,1,3,1000,8725,167); -- Exalted Log
INSERT INTO mob_droplist VALUES (3934,1,3,1000,8727,167); -- Sifs Lock
INSERT INTO mob_droplist VALUES (3934,1,4,750,21381,250); -- Seraphicaller
INSERT INTO mob_droplist VALUES (3934,1,4,750,21452,250); -- Divinator
INSERT INTO mob_droplist VALUES (3934,1,4,750,22261,250); -- Divinator II
INSERT INTO mob_droplist VALUES (3934,1,5,1000,21425,145); -- Lentus Grip
INSERT INTO mob_droplist VALUES (3934,1,5,1000,27888,145); -- Kyujutsugi
INSERT INTO mob_droplist VALUES (3934,1,5,1000,28517,142); -- Crematio Earring
INSERT INTO mob_droplist VALUES (3934,1,5,1000,28515,142); -- Trux Earring
INSERT INTO mob_droplist VALUES (3934,1,5,1000,28519,142); -- Tripudio Earring
INSERT INTO mob_droplist VALUES (3934,1,5,1000,28516,142); -- Sanare Earring
INSERT INTO mob_droplist VALUES (3934,1,5,1000,28518,142); -- Gelai Earring
-- puppet in peril HTBF
UPDATE mob_pools SET name = 'Lancelord_Gaheel_HTBF',   spellList = 519 WHERE name = 'Lancelord_Gaheel_Ja'  AND poolid = 2370;
UPDATE mob_pools SET name = 'Mamool_Unseen_HTBF',      spellList = 517 WHERE name = 'Mamool_Ja_Unseen'      AND poolid = 6958;
UPDATE mob_pools SET name = 'Mamool_Flamerearer_HTBF'  WHERE name = 'Mamool_Ja_Flamerearer' AND poolid = 6959;
UPDATE mob_pools SET name = 'Mamool_Isangoma_HTBF',    spellList = 520 WHERE name = 'Mamool_Ja_Isangoma'    AND poolid = 6955;
UPDATE mob_pools SET name = 'Mamool_Profligate_HTBF'   WHERE name = 'Mamool_Ja_Profligate'  AND poolid = 6957;
UPDATE mob_pools SET name = 'Mamool_Polemicist_HTBF',  spellList = 516 WHERE name = 'Mamool_Ja_Polemicist'  AND poolid = 6956;
UPDATE mob_groups SET dropid = 3935, HP = 175000, MP = 9999, minLevel = 120, maxLevel = 125, name = 'Lancelord_Gaheel_HTBF'   WHERE poolid = 2370 AND name = 'Lancelord_Gaheel_Ja'; 
UPDATE mob_groups SET HP = 75000,  MP = 9999, minLevel = 110, maxLevel = 115, name = 'Mamool_Unseen_HTBF'      WHERE poolid = 6958 AND name = 'Mamool_Ja_Unseen'; 
UPDATE mob_groups SET HP = 75000,  MP = 9999, minLevel = 110, maxLevel = 115, name = 'Mamool_Flamerearer_HTBF' WHERE poolid = 6959 AND name = 'Mamool_Ja_Flamerearer'; 
UPDATE mob_groups SET HP = 75000,  MP = 9999, minLevel = 110, maxLevel = 115, name = 'Mamool_Isangoma_HTBF'    WHERE poolid = 6955 AND name = 'Mamool_Ja_Isangoma'; 
UPDATE mob_groups SET HP = 75000,  MP = 9999, minLevel = 110, maxLevel = 115, name = 'Mamool_Profligate_HTBF'  WHERE poolid = 6957 AND name = 'Mamool_Ja_Profligate'; 
UPDATE mob_groups SET HP = 75000,  MP = 9999, minLevel = 110, maxLevel = 115, name = 'Mamool_Polemicist_HTBF'  WHERE poolid = 6956 AND name = 'Mamool_Ja_Polemicist'; 
UPDATE mob_spawn_points SET mobname = 'Lancelord_Gaheel_HTBF',   pos_X = 241.7711,   pos_y = -31.5431,  pos_z = 239.0438,  pos_rot =  159 WHERE mobid = 17051760;
UPDATE mob_spawn_points SET mobname = 'Mamool_Unseen_HTBF',      pos_X = 241.7711,   pos_y = -31.5431,  pos_z = 239.0438,  pos_rot =  159 WHERE mobid = 17051761;
UPDATE mob_spawn_points SET mobname = 'Mamool_Flamerearer_HTBF', pos_X = 244.7644,   pos_y = -31.1628,  pos_z = 239.6185,  pos_rot =  144 WHERE mobid = 17051762;
UPDATE mob_spawn_points SET mobname = 'Mamool_Isangoma_HTBF',    pos_X = 246.1002,   pos_y = -31.0492,  pos_z = 243.0372,  pos_rot =  121 WHERE mobid = 17051763;
UPDATE mob_spawn_points SET mobname = 'Mamool_Profligate_HTBF',  pos_X = 241.5989,   pos_y = -31.1523,  pos_z = 235.0241,  pos_rot =  174 WHERE mobid = 17051764;
UPDATE mob_spawn_points SET mobname = 'Mamool_Polemicist_HTBF',  pos_X = 239.5683,   pos_y = -31.0689,  pos_z = 233.3579,  pos_rot =  191 WHERE mobid = 17051765;
UPDATE mob_spawn_points SET pos_X = -12.1318,   pos_y = -18.7161,  pos_z = 14.2155,  pos_rot =  39 WHERE mobid = 17051766; -- Scorched-snout Wyvern
UPDATE mob_spawn_points SET mobname = 'Lancelord_Gaheel_HTBF',   pos_X = 0.789,   pos_y = 8.5000,  pos_z = -0.2412,  pos_rot =  158 WHERE mobid = 17051767;
UPDATE mob_spawn_points SET mobname = 'Mamool_Unseen_HTBF',      pos_X = 0.789,   pos_y = 8.5000,  pos_z = -0.2412,  pos_rot =  158 WHERE mobid = 17051768;
UPDATE mob_spawn_points SET mobname = 'Mamool_Flamerearer_HTBF', pos_X = 3.2212,  pos_y = 8.6344,  pos_z = 1.7963,   pos_rot =  117 WHERE mobid = 17051769;
UPDATE mob_spawn_points SET mobname = 'Mamool_Isangoma_HTBF',    pos_X = 2.8961,  pos_y = 8.8946,  pos_z = 4.2043,   pos_rot =  99 WHERE mobid = 17051770;
UPDATE mob_spawn_points SET mobname = 'Mamool_Profligate_HTBF',  pos_X = 3.6058,  pos_y = 8.7719,  pos_z = -2.3333,  pos_rot =  165 WHERE mobid = 17051771;
UPDATE mob_spawn_points SET mobname = 'Mamool_Polemicist_HTBF',  pos_X = 2.2063,  pos_y = 8.8454,  pos_z = -4.9297,  pos_rot =  181 WHERE mobid = 17051772;
UPDATE mob_spawn_points SET pos_X = -12.1318,   pos_y = -18.7161,  pos_z = 14.2155,  pos_rot =  39 WHERE mobid = 17051773; -- Scorched-snout Wyvern
UPDATE mob_spawn_points SET mobname = 'Lancelord_Gaheel_HTBF',   pos_X = -240.5868,  pos_y = 48.5000,  pos_z = -239.1030,  pos_rot =  158 WHERE mobid = 17051774;
UPDATE mob_spawn_points SET mobname = 'Mamool_Unseen_HTBF',      pos_X = -240.5868,  pos_y = 48.5000,  pos_z = -239.1030,  pos_rot =  158 WHERE mobid = 17051775;
UPDATE mob_spawn_points SET mobname = 'Mamool_Flamerearer_HTBF', pos_X = -238.7326,  pos_y = 48.5000,  pos_z = -238.6066,  pos_rot =  129 WHERE mobid = 17051776;
UPDATE mob_spawn_points SET mobname = 'Mamool_Isangoma_HTBF',    pos_X = -237.811,   pos_y = 48.6941,  pos_z = -236.6441,  pos_rot =  121 WHERE mobid = 17051777;
UPDATE mob_spawn_points SET mobname = 'Mamool_Profligate_HTBF',  pos_X = -238.2886,  pos_y = 48.5472,  pos_z = -242.3815,  pos_rot =  170 WHERE mobid = 17051778;
UPDATE mob_spawn_points SET mobname = 'Mamool_Polemicist_HTBF',  pos_X = -239.4235,  pos_y = 48.8254,  pos_z = -244.5281,  pos_rot =  179 WHERE mobid = 17051779;
UPDATE mob_spawn_points SET pos_X = -12.1318,   pos_y = -18.7161,  pos_z = 14.2155,  pos_rot =  39 WHERE mobid = 17051780; -- Scorched-snout Wyvern
INSERT INTO mob_spell_lists VALUES ('LancelordGaheelJa',519,1,1,255); -- cure
INSERT INTO mob_spell_lists VALUES ('LancelordGaheelJa',519,2,1,255); -- cure_ii
INSERT INTO mob_spell_lists VALUES ('LancelordGaheelJa',519,3,1,255); -- cure_iii
INSERT INTO mob_spell_lists VALUES ('LancelordGaheelJa',519,4,1,255); -- cure_iv
INSERT INTO mob_spell_lists VALUES ('LancelordGaheelJa',519,28,1,255); -- banish
INSERT INTO mob_spell_lists VALUES ('LancelordGaheelJa',519,29,1,255); -- banish_ii
INSERT INTO mob_spell_lists VALUES ('LancelordGaheelJa',519,43,1,255); -- protect
INSERT INTO mob_spell_lists VALUES ('LancelordGaheelJa',519,44,1,255); -- protect_ii
INSERT INTO mob_spell_lists VALUES ('LancelordGaheelJa',519,45,1,255); -- protect_iii
INSERT INTO mob_spell_lists VALUES ('LancelordGaheelJa',519,46,1,255); -- protect_iv
INSERT INTO mob_spell_lists VALUES ('LancelordGaheelJa',519,47,1,255); -- protect_v
INSERT INTO mob_spell_lists VALUES ('LancelordGaheelJa',519,48,1,255); -- shell
INSERT INTO mob_spell_lists VALUES ('LancelordGaheelJa',519,49,1,255); -- shell_ii
INSERT INTO mob_spell_lists VALUES ('LancelordGaheelJa',519,50,1,255); -- shell_iii
INSERT INTO mob_spell_lists VALUES ('LancelordGaheelJa',519,51,1,255); -- shell_iv
INSERT INTO mob_spell_lists VALUES ('LancelordGaheelJa',519,112,1,255); -- flash
INSERT INTO mob_spell_lists VALUES ('LancelordGaheelJa',519,5,1,255); -- cure v
INSERT INTO mob_spell_lists VALUES ('LancelordGaheelJa',519,6,1,255); -- cure vi
INSERT INTO mob_spell_lists VALUES ('LancelordGaheelJa',519,52,1,255); -- shell v
INSERT INTO mob_spell_lists VALUES ('MammolIsangomaHTBF',520,5,1,255); -- Cure v
INSERT INTO mob_spell_lists VALUES ('MammolIsangomaHTBF',520,6,1,255); -- Cure vi
INSERT INTO mob_spell_lists VALUES ('MammolIsangomaHTBF',520,10,1,255); -- Curega v
INSERT INTO mob_spell_lists VALUES ('MammolIsangomaHTBF',520,11,1,255); -- Curega vi
INSERT INTO mob_spell_lists VALUES ('MammolIsangomaHTBF',520,35,1,255); -- diaga iii
INSERT INTO mob_spell_lists VALUES ('MammolIsangomaHTBF',520,40,1,255); -- banishga iii
INSERT INTO mob_spell_lists VALUES ('MammolIsangomaHTBF',520,53,1,255); -- blink
INSERT INTO mob_spell_lists VALUES ('MammolIsangomaHTBF',520,54,1,255); -- stoneskin
INSERT INTO mob_spell_lists VALUES ('MammolIsangomaHTBF',520,111,1,255); -- regen_iii
INSERT INTO mob_spell_lists VALUES ('MammolIsangomaHTBF',520,112,1,255); -- flash
INSERT INTO mob_spell_lists VALUES ('MammolIsangomaHTBF',520,106,1,255); -- phalanx
INSERT INTO mob_spell_lists VALUES ('MammolIsangomaHTBF',520,14,1,255); -- poisona
INSERT INTO mob_spell_lists VALUES ('MammolIsangomaHTBF',520,15,1,255); -- paralyna
INSERT INTO mob_spell_lists VALUES ('MammolIsangomaHTBF',520,16,1,255); -- blindna
INSERT INTO mob_spell_lists VALUES ('MammolIsangomaHTBF',520,17,1,255); -- silena
INSERT INTO mob_spell_lists VALUES ('MammolIsangomaHTBF',520,18,1,255); -- stona
INSERT INTO mob_droplist VALUES(3935,0,0,1000,4073,1000); -- Rem Tale Ch 10
INSERT INTO mob_droplist VALUES(3935,1,1,500,4073,500); -- Rem Tale Ch 10
INSERT INTO mob_droplist VALUES(3935,1,2,1000,8719,333); -- Maliyakaleya Coral
INSERT INTO mob_droplist VALUES(3935,1,2,1000,8725,333); -- Exalted Log
INSERT INTO mob_droplist VALUES(3935,1,2,1000,8727,334); -- Sif's Lock
INSERT INTO mob_droplist VALUES(3935,1,3,750,21368,250); -- Bestas Bane
INSERT INTO mob_droplist VALUES(3935,1,3,750,21381,250); -- Seraphicaller
INSERT INTO mob_droplist VALUES(3935,1,3,750,21452,250); -- Divinator
INSERT INTO mob_droplist VALUES(3935,1,3,750,22261,250); -- Divinator II
INSERT INTO mob_droplist VALUES(3935,1,4,400,27862,100); -- Savas Jawshan
INSERT INTO mob_droplist VALUES(3935,1,4,400,28151,100); -- Sifahir Slacks
INSERT INTO mob_droplist VALUES(3935,1,4,400,27710,100); -- Sahip Helm
INSERT INTO mob_droplist VALUES(3935,1,4,400,28498,100); -- Pratik Earring
-- Warriors Path THTBF
UPDATE mob_groups SET dropid = 3936,HP = 155000,  MP = 9999, minLevel = 120, maxLevel = 125, name = 'Tenzen_HTBF' WHERE groupid = 10 AND name = 'Tenzen'; 
UPDATE mob_groups SET HP = 155000,  MP = 9999, minLevel = 110, maxLevel = 115, name = 'Cherukiki_HTBF'       WHERE groupid = 13 AND name = 'Cherukiki'; 
UPDATE mob_groups SET HP = 155000,  MP = 9999, minLevel = 110, maxLevel = 115, name = 'Kukki-Chebukki_HTBF'  WHERE groupid = 12 AND name = 'Kukki-Chebukki'; 
UPDATE mob_groups SET HP = 155000,  MP = 9999, minLevel = 110, maxLevel = 115, name = 'Makki-Chebukki_HTBF'  WHERE groupid = 11 AND name = 'Makki-Chebukki'; 
UPDATE mob_pools SET name = 'Tenzen_HTBF'                                             WHERE name = 'Tenzen'          AND poolid = 6956;
UPDATE mob_pools SET spellList = 520, skill_list_id = 0, name = 'Cherukiki_HTBF'      WHERE name = 'Cherukiki'       AND poolid = 710;
UPDATE mob_pools SET spellList = 516, skill_list_id = 0, name = 'Kukki-Chebukki_HTBF' WHERE name = 'Kukki-Chebukki'  AND poolid = 2293;
UPDATE mob_pools SET skill_list_id = 0,                  name = 'Makki-Chebukki_HTBF' WHERE name = 'Makki-Chebukki'  AND poolid = 2492;
UPDATE mob_spawn_points SET mobname = 'Tenzen_HTBF',           pos_x = -640.0229,  pos_y = -231.3476,  pos_z = 529.5814,  pos_rot =  61 WHERE mobid = 16908370;
UPDATE mob_spawn_points SET mobname = 'Makki-Chebukki_HTBF'    WHERE mobid = 16908371;
UPDATE mob_spawn_points SET mobname = 'Kukki-Chebukki_HTBF'    WHERE mobid = 16908372;
UPDATE mob_spawn_points SET mobname = 'Cherukiki_HTBF'         WHERE mobid = 16908373;
UPDATE mob_spawn_points SET mobname = 'Tenzen_HTBF',           pos_x = 0.1016,     pos_y = -151.3476,  pos_z = 170.1908,  pos_rot =  61 WHERE mobid = 16908374;
UPDATE mob_spawn_points SET mobname = 'Makki-Chebukki_HTBF'    WHERE mobid = 16908375;
UPDATE mob_spawn_points SET mobname = 'Kukki-Chebukki_HTBF'    WHERE mobid = 16908376;
UPDATE mob_spawn_points SET mobname = 'Cherukiki_HTBF'         WHERE mobid = 16908377;
UPDATE mob_spawn_points SET mobname = 'Tenzen_HTBF',           pos_x = 640.1404,   pos_y = -71.3476,  pos_z = -189.8488,  pos_rot =  61 WHERE mobid = 16908378;
UPDATE mob_spawn_points SET mobname = 'Makki-Chebukki_HTBF'    WHERE mobid = 16908379;
UPDATE mob_spawn_points SET mobname = 'Kukki-Chebukki_HTBF'    WHERE mobid = 16908380;
UPDATE mob_spawn_points SET mobname = 'Cherukiki_HTBF'         WHERE mobid = 16908381;
INSERT INTO mob_droplist VALUES(3936,0,0,1000,4072,1000); -- Rem Tale Ch 9
INSERT INTO mob_droplist VALUES(3936,1,1,500,4072,500); -- Rem Tale Ch 9
INSERT INTO mob_droplist VALUES(3936,1,2,1000,8721,250); -- Hepatizon Ore
INSERT INTO mob_droplist VALUES(3936,1,2,1000,8723,250); -- Beryllium Ore
INSERT INTO mob_droplist VALUES(3936,1,2,1000,8727,250); -- Sifs Lock
INSERT INTO mob_droplist VALUES(3936,1,2,1000,687,250); -- Scarletite Ingot
INSERT INTO mob_droplist VALUES(3936,1,3,750,21371,150); -- Ginsen
INSERT INTO mob_droplist VALUES(3936,1,3,750,21227,150); -- Hangaku-no-Yumi
INSERT INTO mob_droplist VALUES(3936,1,3,750,21381,150); -- Seraphicaller
INSERT INTO mob_droplist VALUES(3936,1,3,750,21452,150); -- Divinator
INSERT INTO mob_droplist VALUES(3936,1,3,750,22261,150); -- Divinator II
INSERT INTO mob_droplist VALUES(3936,1,4,600,27719,200); -- Sukeroku Hachimaki
INSERT INTO mob_droplist VALUES(3936,1,4,600,28292,200); -- Battlecast Gaiters
INSERT INTO mob_droplist VALUES(3936,1,4,600,28379,200); -- Mizukage-no-Kubikazari

-- One to e Feared HBF

INSERT INTO `mob_pools` VALUES (40018,'Omega_HTBF','Omega',54,0x0000350400000000000000000000000000000000,1,1,6,240,100,0,1,1,0,34,22528,32,7,1691,13,0,0,0,0,54,54);
INSERT INTO `mob_pools` VALUES (40017,'Ultima_HTBF','Ultima',54,0x0000330400000000000000000000000000000000,1,1,6,240,100,0,1,1,0,34,22528,32,2635,1691,13,0,0,0,0,728,54);
UPDATE mob_groups SET poolid = 40017, dropid = 3937,HP = 155000,  MP = 9999, minLevel = 120, maxLevel = 125, name = 'Ultima_HTBF' WHERE groupid = 9 AND name = 'Ultima_HTBF'; 
UPDATE mob_groups SET poolid = 40018,               HP = 155000,  MP = 9999, minLevel = 120, maxLevel = 125, name = 'Omega_HTBF' WHERE groupid = 8 AND name = 'Omega_HTBF'; 
UPDATE mob_spawn_points SET mobname = 'Omega_HTBF', groupid = 8,          pos_x = -639.8127,  pos_y = -231.3477,  pos_z =  510.5845,  pos_rot = 191 WHERE mobid = 16908406; 
UPDATE mob_spawn_points SET mobname = 'Omega_HTBF', groupid = 8,          pos_x =    0.0241,  pos_y = -151.3476,  pos_z =  150.8623,  pos_rot = 184 WHERE mobid = 16908408; 
UPDATE mob_spawn_points SET mobname = 'Omega_HTBF', groupid = 8,          pos_x =  640.0577,  pos_y =  -71.3477,  pos_z = -209.3274,  pos_rot = 187 WHERE mobid = 16908410; 
UPDATE mob_spawn_points SET mobname = 'Ultima_HTBF', groupid = 9,         pos_x = -779.9949,  pos_y = -103.3476,  pos_z =  -71.6040,  pos_rot =  63 WHERE mobid = 16908407;
UPDATE mob_spawn_points SET mobname = 'Ultima_HTBF', groupid = 9,         pos_x = -139.9194,  pos_y =  -23.3476,  pos_z = -430.0629,  pos_rot =  66 WHERE mobid = 16908409;
UPDATE mob_spawn_points SET mobname = 'Ultima_HTBF', groupid = 9,         pos_x =  499.9628,  pos_y =   56.6524,  pos_z = -790.0623,  pos_rot =  64 WHERE mobid = 16908411;
INSERT INTO mob_droplist VALUES(3937,0,0,1000,4073,1000); -- Rem Tale Ch 10
INSERT INTO mob_droplist VALUES(3937,1,1,500,4073,500); -- Rem Tale Ch 10
INSERT INTO mob_droplist VALUES(3937,1,2,1000,8719,200); -- Maliyakaleya Coral
INSERT INTO mob_droplist VALUES(3937,1,2,1000,8721,200); -- Hepatizon Ore
INSERT INTO mob_droplist VALUES(3937,1,2,1000,8723,200); -- Beryllium Ore
INSERT INTO mob_droplist VALUES(3937,1,2,1000,8725,200); -- Exalted Log
INSERT INTO mob_droplist VALUES(3937,1,2,1000,8727,200); -- Sifs Lock
INSERT INTO mob_droplist VALUES(3937,1,3,750,20516,375); -- Denouements
INSERT INTO mob_droplist VALUES(3937,1,3,750,26400,375); -- Culminus
INSERT INTO mob_droplist VALUES(3937,1,4,400,25634,100); -- Terminal Helm
INSERT INTO mob_droplist VALUES(3937,1,4,400,25707,100); -- Terminal Plate
INSERT INTO mob_droplist VALUES(3937,1,4,400,27541,100); -- Cessance Earring
INSERT INTO mob_droplist VALUES(3937,1,4,400,26000,100); -- Consummation Torque






UPDATE mob_groups SET poolid = 5106 WHERE name = 'Promathia_htbf';

-- insert mob ability
-- INSERT INTO `mob_skills` VALUES (1712,1183,'bugle_call',1,10.0,2000,1500,4,4,0,0,0,0,0); -- imp -- bugal call
-- INSERT INTO `mob_skills` VALUES (1980,1197,'boreas_mantle',0,7.0,2000,1500,1,4,0,0,0,0,0); -- phantom puk
INSERT INTO `mob_skills` VALUES (3290,3034,'bowels_of_agony',0,0.0,7.0,2000,0,4,0,0,0,0,0,0); -- Bowels of Agony - Shadow Lord
INSERT INTO `mob_skill_lists` VALUES ('ShadowLord', 225, 3290);
