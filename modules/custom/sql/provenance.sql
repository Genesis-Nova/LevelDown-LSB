UPDATE zone_settings SET misc = 2204 WHERE zoneid = 222;
UPDATE mob_groups SET spawntype = 128 WHERE groupid = 2 AND name = 'Crystal_Fetter';
INSERT INTO `npc_list` VALUES (17686590,'Provenance_Crystal','Provenance Crystal',192,-150.000,3.911,-670.000,1,50,50,0,0,32,0,27,0x0000710900000000000000000000000000000000,0,'WOTG',1);
INSERT INTO `npc_list` VALUES (17686591,'Provenance_Crystal','Provenance Crystal',192,-150.000,3.911,-670.000,1,50,50,0,0,32,0,27,0x0000710900000000000000000000000000000000,0,'WOTG',1);
INSERT INTO `npc_list` VALUES (17686592,'Provenance_Crystal','Provenance Crystal',192,-150.000,3.911,-670.000,1,50,50,0,0,32,0,27,0x0000710900000000000000000000000000000000,0,'WOTG',1);
INSERT INTO `npc_list` VALUES (17686593,'Provenance_Crystal','Provenance Crystal',192,-150.000,3.911,-670.000,1,50,50,0,0,32,0,27,0x0000710900000000000000000000000000000000,0,'WOTG',1);
UPDATE npc_list SET name = 'Provenance_Crystal#1', pos_rot = 192, pos_x = -150.000, pos_y =    3.911, pos_z = -670.000 WHERE npcid = 17686589; -- Provenance Crystal
UPDATE npc_list SET name = 'Provenance_Crystal#2', pos_rot =  26, pos_x =  585.781, pos_y =   19.500, pos_z = -666.283 WHERE npcid = 17686590; -- Provenance Crystal
UPDATE npc_list SET name = 'Provenance_Crystal#3', pos_rot = 245, pos_x =  620.811, pos_y =   39.500, pos_z = -216.670 WHERE npcid = 17686591; -- Provenance Crystal
UPDATE npc_list SET name = 'Provenance_Crystal#4', pos_rot = 192, pos_x = -285.000, pos_y =  -19.655, pos_z = -245.000 WHERE npcid = 17686588; -- Provenance Crystal
UPDATE npc_list SET name = 'Provenance_Crystal#5', pos_rot =  93, pos_x =   40.527, pos_y = -108.000, pos_z =  560.272 WHERE npcid = 17686593; -- Provenance Crystal
UPDATE npc_list SET name = 'Provenance_Crystal#6', pos_rot = 106, pos_x =  560.213, pos_y =   12.000, pos_z =  560.929 WHERE npcid = 17686592; -- Provenance Crystal
UPDATE npc_list SET name = 'Provenance_Crystal#7', pos_rot =  96, pos_x =  -558.88, pos_y = -228.000, pos_z = 559.0488 WHERE npcid = 17686586; -- Provenance Crystal
UPDATE mob_spawn_points SET pos_x = -581.1092, pos_y = -228.000, pos_z =  563.1008, pos_rot =  80 WHERE mobid = 17686530;
UPDATE mob_spawn_points SET groupid = 11526,pos_x =  -156.834, pos_y =   0.7654, pos_z = -679.9487, pos_rot =  90 WHERE mobid = 17686542; -- Pil
UPDATE mob_spawn_points SET groupid = 11525,pos_x =  616.4836, pos_y =  20.4582, pos_z = -692.1054, pos_rot =  44 WHERE mobid = 17686543; -- ASDB
UPDATE mob_spawn_points SET groupid = 11529,pos_x =  634.9714, pos_y =  40.2474, pos_z = -207.8789, pos_rot = 249 WHERE mobid = 17686545; -- Shah
UPDATE mob_spawn_points SET groupid = 11527,pos_x =  -265.130, pos_y = -19.0198, pos_z = -241.5804, pos_rot = 231 WHERE mobid = 17686544; -- Rukh
UPDATE mob_spawn_points SET groupid = 11528,pos_x =    37.444, pos_y = -108.000, pos_z =   555.792, pos_rot =  93 WHERE mobid = 17686541; -- Sarbaz
UPDATE mob_spawn_points SET groupid = 11530,pos_x =  557.5035, pos_y =   12.000, pos_z =  558.8103, pos_rot = 100 WHERE mobid = 17686546; -- Wazir
UPDATE mob_spawn_points SET groupid = 11531,pos_x =  -566.961, pos_y = -228.000, pos_z =  547.7069, pos_rot =  95 WHERE mobid = 17686529; -- Provenance Watcher
UPDATE mob_spawn_points SET pos_x = -562.205, pos_y = -228.000, pos_z =  529.688,  pos_rot =  155 WHERE mobid = 17686539;
UPDATE mob_spawn_points SET pos_x = -585.271, pos_y = -228.000, pos_z =  -556.769, pos_rot =   30 WHERE mobid = 17686540;
UPDATE mob_pools SET spellList = 523 WHERE poolid = 4654 AND name = 'Provenance_Watcher';
INSERT INTO mob_groups VALUES(11525,4664,222,'Asb',300,0,0,500000,9999,125,125,0);
INSERT INTO mob_groups VALUES(11526,5315,222,'Pil',300,0,0,525000,9999,120,120,0);
INSERT INTO mob_groups VALUES(11527,4663,222,'Rukh',300,0,0,550000,9999,135,135,0);
INSERT INTO mob_groups VALUES(11528,4665,222,'Sarbaz',300,0,0,625000,9999,140,140,0);
INSERT INTO mob_groups VALUES(11529,4667,222,'Shah',300,0,0,650000,9999,130,130,0);
INSERT INTO mob_groups VALUES(11530,4666,222,'Wazir',300,0,0,700000,9999,145,145,0);
INSERT INTO mob_groups VALUES(11531,4654,222,'Provenance_Watcher',600,0,0,1500000,9999,150,150,0);
INSERT INTO mob_groups VALUES(11532,4666,77,'PR_Imp',180,0,0,50000,9999,135,137,0);
INSERT INTO mob_groups VALUES(11533,244,190,'PR_Armet_Beetle',180,0,169,45000,0,134,136,0);
INSERT INTO mob_groups VALUES(11534,7062,4,'PR_Bight_Rarab',180,0,309,45000,0,135,137,0);
INSERT INTO mob_groups VALUES(11535,7063,4,'PR_Camelopard',180,0,432,45000,0,135,137,0);
INSERT INTO mob_groups VALUES(11536,1802,52,'PR_Colibri',180,0,1225,45000,0,133,135,0);
INSERT INTO mob_groups VALUES(11537,6801,190,'PR_Cutlass_Scorpion',180,0,549,45000,0,135,137,0);
INSERT INTO mob_groups VALUES(11538,6460,190,'PR_Dire_Bat',180,0,0,45000,0,133,135,0);
INSERT INTO mob_groups VALUES(11539,7061,4,'PR_Ghost_Crab',180,0,2931,45000,0,137,139,0);
INSERT INTO mob_groups VALUES(11540,7058,190,'PR_Hati',180,0,1278,45000,5000,136,137,0);
INSERT INTO mob_groups VALUES(11541,7064,4,'PR_Hypnos_Eft',180,0,2379,45000,0,135,137,0);
INSERT INTO mob_groups VALUES(11542,2388,190,'PR_Lemures',180,0,1506,45000,5000,137,139,0);
INSERT INTO mob_groups VALUES(11543,7059,190,'PR_Spartoi_Sorcerer',180,0,2301,45000,5000,135,137,0);
INSERT INTO mob_groups VALUES(11544,7060,190,'PR_Spartoi_Warrior',180,0,2125,45000,0,135,137,0);
INSERT INTO mob_groups VALUES(11545,6391,190,'PR_Thousand_Eyes',180,0,2402,45000,5000,135,137,0);
INSERT INTO mob_groups VALUES(11546,3946,190,'PR_Tomb_Worm',180,0,0,45000,5000,131,133,0);
INSERT INTO mob_groups VALUES(11547,4355,52,'PR_Wivre',180,0,2952,45000,0,135,137,0);
INSERT INTO `mob_skills` VALUES (2888,1183,'dark_recital',1,0.0,10.0,2000,1500,4,0,0,0,0,0,0);
INSERT INTO mob_skill_lists VALUES ('Provenance_Imp', 49999,1709);
INSERT INTO mob_skill_lists VALUES ('Provenance_Imp', 49999,1710);
INSERT INTO mob_skill_lists VALUES ('Provenance_Imp', 49999,1711);
INSERT INTO mob_skill_lists VALUES ('Provenance_Imp', 49999,2003);
INSERT INTO mob_skill_lists VALUES ('Provenance_Imp', 49999,2004);
INSERT INTO mob_skill_lists VALUES ('Provenance_Imp', 49999,2888);
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,148,1,255); -- fire_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,153,1,255); -- blizzard_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,158,1,255); -- aero_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,163,1,255); -- stone_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,168,1,255); -- thunder_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,173,1,255); -- water_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,178,1,255); -- firaga_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,183,1,255); -- blizzaga_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,188,1,255); -- aeroga_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,193,1,255); -- stonega_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,198,1,255); -- thundaga_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,203,1,255); -- waterga_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,205,1,255); -- flare_ii
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,207,1,255); -- freeze_ii
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,209,1,255); -- tornado_ii
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,211,1,255); -- quake_ii
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,213,1,255); -- burst_ii
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,215,1,255); -- flood_ii
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,221,1,255); -- poison_ii
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,226,1,255); -- poisonga_ii
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,232,1,255); -- bio_iii
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,246,1,255); -- drain_ii
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,248,1,255); -- aspir_ii
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,249,1,255); -- blaze_spikes
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,252,1,255); -- stun
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,259,1,255); -- sleep_ii
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,266,1,255); -- absorb-str
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,267,1,255); -- absorb-dex
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,268,1,255); -- absorb-vit
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,269,1,255); -- absorb-agi
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,270,1,255); -- absorb-int
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,271,1,255); -- absorb-mnd
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,272,1,255); -- absorb-chr
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,274,1,255); -- sleepga_ii
INSERT INTO mob_spell_lists VALUES ('Provenance_Imp',522,275,1,255); -- absorb-tp
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,182,1,255); -- blizzaga_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,183,1,255); -- blizzaga_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,497,1,255); -- blizzaja
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,152,1,255); -- blizzard_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,153,1,255); -- blizzard_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,850,1,255); -- blizzard_vi
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,1,1,255); -- cure
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,2,1,255); -- cure_ii
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,3,1,255); -- cure_iii
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,4,1,255); -- cure_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,5,1,255); -- cure_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,6,1,255); -- cure_vi
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,35,1,255); -- diaga_iii
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,36,1,255); -- diaga_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,37,1,255); -- diaga_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,177,1,255); -- firaga_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,178,1,255); -- firaga_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,496,1,255); -- firaja
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,147,1,255); -- fire_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,148,1,255); -- fire_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,849,1,255); -- fire_vi
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,356,1,255); -- paralyga
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,361,1,255); -- blindga
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,365,1,255); -- breakga
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,359,1,255); -- silencega
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,357,1,255); -- slowga
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,162,1,255); -- stone_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,163,1,255); -- stone_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,852,1,255); -- stone_vi
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,192,1,255); -- stonega_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,193,1,255); -- stonega_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,499,1,255); -- stoneja
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,197,1,255); -- thundaga_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,198,1,255); -- thundaga_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,500,1,255); -- thundaja
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,167,1,255); -- thunder_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,168,1,255); -- thunder_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,853,1,255); -- thunder_vi
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,172,1,255); -- water_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,173,1,255); -- water_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,854,1,255); -- water_vi
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,202,1,255); -- waterga_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,203,1,255); -- waterga_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,501,1,255); -- waterja
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,157,1,255); -- aero_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,158,1,255); -- aero_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,851,1,255); -- aero_vi
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,187,1,255); -- aeroga_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,188,1,255); -- aeroga_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Watcher',523,498,1,255); -- aeroja
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,147,1,255); --fire_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,148,1,255); --fire_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,177,1,255); --firaga_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,178,1,255); --firaga_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,496,1,255); --firaja
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,152,1,255); --blizzard_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,153,1,255); --blizzard_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,182,1,255); --blizzaga_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,183,1,255); --blizzaga_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,497,1,255); --blizzaja
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,157,1,255); --aero_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,158,1,255); --aero_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,187,1,255); --aeroga_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,188,1,255); --aeroga_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,498,1,255); --aeroja
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,162,1,255); --stone_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,163,1,255); --stone_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,192,1,255); --stonega_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,193,1,255); --stonega_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,499,1,255); --stoneja
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,167,1,255); --thunder_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,168,1,255); --thunder_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,197,1,255); --thundaga_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,198,1,255); --thundaga_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,500,1,255); --thundaja
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,172,1,255); --water_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,173,1,255); --water_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,202,1,255); --waterga_iv
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,203,1,255); --waterga_v
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,501,1,255); --waterja
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,219,1,255); --comet
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,218,1,255); --meteor
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,503,1,255); --impact
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,273,1,255); --sleepga
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,274,1,255); --sleepga_ii
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,356,1,255); --paralyga
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,357,1,255); --slowga
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,359,1,255); --silencega
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,360,1,255); --dispelga
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,361,1,255); --blindga
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,362,1,255); --bindga
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,365,1,255); --breakga
INSERT INTO mob_spell_lists VALUES ('Provenance_Boss',526,366,1,255); --graviga
INSERT INTO mob_skill_lists VALUES ('PWatcher_Phase1', 49997,2515); -- phason_beam ** conal
INSERT INTO mob_skill_lists VALUES ('PWatcher_Phase1', 49997,2839); -- prismatic_breath ** aoe
INSERT INTO mob_skill_lists VALUES ('PWatcher_Phase1', 49997,2840); -- acicular_brand ** aoe
INSERT INTO mob_skill_lists VALUES ('PWatcher_Phase1', 49997,2841); -- orogenesis ** aoe
INSERT INTO mob_skill_lists VALUES ('PWatcher_Phase1', 49997,2842); -- phason_beam
INSERT INTO mob_skill_lists VALUES ('PWatcher_Phase1', 49997,2843); -- diffractive_break ** aoe
INSERT INTO mob_skill_lists VALUES ('PWatcher_Phase1', 49997,2844); -- euhedral_swat ** aoe knock back
INSERT INTO mob_skill_lists VALUES ('PWatcher_Phase2', 49998,2852); -- prismatic_breath
INSERT INTO mob_skill_lists VALUES ('PWatcher_Phase2', 49998,2853); -- acicular_brand
INSERT INTO mob_skill_lists VALUES ('PWatcher_Phase2', 49998,2854); -- orogenesis
INSERT INTO mob_skill_lists VALUES ('PWatcher_Phase2', 49998,2856); -- diffractive_break
INSERT INTO mob_skill_lists VALUES ('PWatcher_Phase2', 49998,2857); -- euhedral_swat
INSERT INTO mob_skill_lists VALUES ('PWatcher_Phase2', 49998,2858); -- crystallite_shower ** aoe
INSERT INTO mob_skill_lists VALUES ('PWatcher_Phase2', 49998,2859); -- graviton_crux ** aoe knock back
INSERT INTO mob_skill_lists VALUES ('PWatcher_Phase2', 49998,2860); -- crystal_bolide ** aoe
INSERT INTO mob_skill_lists VALUES ('PWatcher_Phase2', 49998,2861); -- fragor_maximus ** aoe
UPDATE mob_skills SET mob_skill_aoe = 8, mob_skill_aoe_radius = 20, knockback = 15 WHERE mob_skill_id = 2844; -- euhedral_swat
UPDATE mob_skills SET mob_skill_aoe = 1, mob_skill_aoe_radius = 20, knockback = 15 WHERE mob_skill_id = 2859; -- graviton_crux
UPDATE mob_skills SET mob_skill_aoe = 1, mob_skill_aoe_radius = 20 WHERE mob_skill_id = 2861; -- fragor_maximus
UPDATE mob_skills SET mob_skill_aoe = 1, mob_skill_aoe_radius = 20 WHERE mob_skill_id = 2860; -- crystal_bolide
UPDATE mob_skills SET mob_skill_aoe = 1, mob_skill_aoe_radius = 20 WHERE mob_skill_id = 2858; -- crystallite_shower
UPDATE mob_skills SET mob_skill_aoe = 1, mob_skill_aoe_radius = 20 WHERE mob_skill_id = 2856; -- diffractive_break
UPDATE mob_skills SET mob_skill_aoe = 1, mob_skill_aoe_radius = 20 WHERE mob_skill_id = 2854; -- orogenesis
UPDATE mob_skills SET mob_skill_aoe = 1, mob_skill_aoe_radius = 20 WHERE mob_skill_id = 2840; -- acicular_brand
UPDATE mob_skills SET mob_skill_aoe = 1, mob_skill_aoe_radius = 20 WHERE mob_skill_id = 2515; -- phason_beam
UPDATE mob_skills SET mob_skill_aoe = 4, mob_skill_aoe_radius = 20 WHERE mob_skill_id = 2839; -- prismatic_breath
INSERT INTO `mob_skills` VALUES (2905,2649,'shahs_decree',1,15.0,7.0,2000,1500,4,0,0,0,0,0,0);
INSERT INTO `mob_skills` VALUES (2906,2650,'false_promises',1,10.0,7.0,2000,1500,4,0,0,0,0,0,0);
INSERT INTO `mob_skills` VALUES (2806,2550,'beleaguerment',1,15.0,7.0,2000,1500,4,0,0,0,0,0,0);
INSERT INTO `mob_skills` VALUES (2807,2551,'unchivalrous_stab',1,25.0,7.0,2000,1500,4,0,0,0,0,0,0);
INSERT INTO `mob_skills` VALUES (2808,2552,'discordant_gambit',1,15.0,7.0,2000,1500,4,0,0,0,0,0,0);
INSERT INTO `mob_skills` VALUES (2805,2549,'pawns_penumbra',1,20.0,7.0,2000,1500,4,0,0,0,0,0,0);
INSERT INTO mob_skill_lists VALUES ('[Provenance]Asb',49996,2775); -- tabbiyaa_gambit
INSERT INTO mob_skill_lists VALUES ('[Provenance]Asb',49996,2566); -- diabolic_claw
INSERT INTO mob_skill_lists VALUES ('[Provenance]Asb',49996,2776); -- shah_mat
INSERT INTO mob_skill_lists VALUES ('[Provenance]Asb',49996,2568); -- deathly_diminuendo
INSERT INTO mob_skill_lists VALUES ('[Provenance]Asb',49996,2569); -- hellish_crescendo
INSERT INTO mob_skill_lists VALUES ('[Provenance]Asb',49996,2807); -- unchivalrous_stab
INSERT INTO mob_skill_lists VALUES ('[Provenance]Rukh',49995,2775); -- tabbiyaa_gambit 
INSERT INTO mob_skill_lists VALUES ('[Provenance]Rukh',49995,2776); -- shah_mat
INSERT INTO mob_skill_lists VALUES ('[Provenance]Rukh',49995,2567); -- stygian_cyclone
INSERT INTO mob_skill_lists VALUES ('[Provenance]Rukh',49995,2572); -- malign_invocation
INSERT INTO mob_skill_lists VALUES ('[Provenance]Rukh',49995,2808); -- discordant_gambit
INSERT INTO mob_skill_lists VALUES ('[Provenance]Rukh',49995,2806); -- beleaguerment
INSERT INTO mob_skill_lists VALUES ('[Provenance]Shah',49994,2775); -- tabbiyaa_gambit
INSERT INTO mob_skill_lists VALUES ('[Provenance]Shah',49994,2776); -- shah_mat
INSERT INTO mob_skill_lists VALUES ('[Provenance]Shah',49994,2568); -- deathly_diminuendo
INSERT INTO mob_skill_lists VALUES ('[Provenance]Shah',49994,2774); -- flank_opening
INSERT INTO mob_skill_lists VALUES ('[Provenance]Shah',49994,2806); -- beleaguerment
INSERT INTO mob_skill_lists VALUES ('[Provenance]Shah',49994,2805); -- pawns_penumbra
INSERT INTO mob_skill_lists VALUES ('[Provenance]Shah',49994,2905); -- shahs_decree
INSERT INTO mob_skill_lists VALUES ('[Provenance]Shah',49994,2807); -- unchivalrous_stab
INSERT INTO mob_skill_lists VALUES ('[Provenance]Wazir',49993,2775); -- tabbiyaa_gambit
INSERT INTO mob_skill_lists VALUES ('[Provenance]Wazir',49993,2568); -- deathly_diminuendo
INSERT INTO mob_skill_lists VALUES ('[Provenance]Wazir',49993,2566); -- diabolic_claw
INSERT INTO mob_skill_lists VALUES ('[Provenance]Wazir',49993,2567); -- stygian_cyclone
INSERT INTO mob_skill_lists VALUES ('[Provenance]Wazir',49993,2572); -- malign_invocation
INSERT INTO mob_skill_lists VALUES ('[Provenance]Wazir',49993,2569); -- hellish_crescendo
INSERT INTO mob_skill_lists VALUES ('[Provenance]Wazir',49993,2776); -- shah_mat
INSERT INTO mob_skill_lists VALUES ('[Provenance]Wazir',49993,2808); -- discordant_gambit
INSERT INTO mob_skill_lists VALUES ('[Provenance]Wazir',49993,2906); -- false_promises
INSERT INTO mob_skill_lists VALUES ('[Provenance]Pil',49992,2775); -- tabbiyaa_gambit
INSERT INTO mob_skill_lists VALUES ('[Provenance]Pil',49992,2776); -- shah_mat
INSERT INTO mob_skill_lists VALUES ('[Provenance]Pil',49992,2774); -- flank_opening
INSERT INTO mob_skill_lists VALUES ('[Provenance]Pil',49992,2572); -- malign_invocation
INSERT INTO mob_skill_lists VALUES ('[Provenance]Pil',49992,2808); -- discordant_gambit
INSERT INTO mob_skill_lists VALUES ('[Provenance]Sarbaz',49991,2775); -- tabbiyaa_gambit
INSERT INTO mob_skill_lists VALUES ('[Provenance]Sarbaz',49991,2567); -- stygian_cyclone
INSERT INTO mob_skill_lists VALUES ('[Provenance]Sarbaz',49991,2572); -- malign_invocation
INSERT INTO mob_skill_lists VALUES ('[Provenance]Sarbaz',49991,2808); -- discordant_gambit
INSERT INTO mob_skill_lists VALUES ('[Provenance]Sarbaz',49991,2805); -- pawns_penumbra
UPDATE mob_pools SET skill_list_id = 49996, spellList = 526 WHERE poolid = 4664 AND name = 'Asb';
UPDATE mob_pools SET skill_list_id = 49992, spellList = 526 WHERE poolid = 5315 AND name = 'Pil';
UPDATE mob_pools SET skill_list_id = 49995, spellList = 526 WHERE poolid = 4663 AND name = 'Rukh';
UPDATE mob_pools SET skill_list_id = 49991, spellList = 526 WHERE poolid = 4665 AND name = 'Sarbaz';
UPDATE mob_pools SET skill_list_id = 49994, spellList = 526 WHERE poolid = 4667 AND name = 'Shah';
UPDATE mob_pools SET skill_list_id = 49993, spellList = 526 WHERE poolid = 4666 AND name = 'Wazir';

