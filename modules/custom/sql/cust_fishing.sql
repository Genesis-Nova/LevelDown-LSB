-- Custom Fishing SQL
-- fishing_fish
INSERT INTO `fishing_fish` VALUES (5817,'Tiger Shark',99,35,3,10,55,280,25,1,1,255,255,0,0,3,1,0,0,0,0,1,450,1979,'',0,0,1,0);
INSERT INTO `fishing_fish` VALUES (5951,'Bloodblotch',82,20,3,9,1,1,19,0,1,255,255,0,0,3,1,0,0,0,0,1,500,0,'',0,0,0,0);
INSERT INTO `fishing_fish` VALUES (6489,'Far East Puffer',110,39,3,10,55,180,25,1,0,255,255,0,0,3,1,0,0,0,0,1,350,0,'',0,0,1,0);
INSERT INTO `fishing_fish` VALUES (9200,'Wasabi',1,19,13,2,1,1,10,0,0,255,255,0,9,1,1,0,0,0,1,1,900,0,'',0,0,0,0);

-- Fishing_groups
INSERT INTO `fishing_group` VALUES (136,5817,500,245,6);   -- Tiger Shark -- Ship Sebina to/from Mharua Whole Zone
INSERT INTO `fishing_group` VALUES (137,5817,500,245,6);   -- Tiger Shark -- Ship Sebina to/from Mharua w/ Pirates Whole Zone
INSERT INTO `fishing_group` VALUES (136,5951,500,350,10);  -- Bloodblotch -- Ship Sebina to/from Mharua Whole Zone
INSERT INTO `fishing_group` VALUES (137,5951,500,350,10);  -- Bloodblotch -- Ship Sebina to/from Mharua w/ Pirates Whole Zone
INSERT INTO `fishing_group` VALUES (100,6489,500,50,5);    -- Far East Puffer -- Sea Serpent Grotto Misc Puddles
INSERT INTO `fishing_group` VALUES (95,9200,900,300,15);   -- Wasabi -- Norg Whole Zone

-- Fishing Bait affinity
-- Tiger Shark
INSERT INTO `fishing_bait_affinity` VALUES (16994,5817,3); -- Slice Of Carp, 	Tiger Shark,  Power : 3
INSERT INTO `fishing_bait_affinity` VALUES (17394,5817,2); -- Peeled Lobster,  	Tiger Shark,  Power : 2
INSERT INTO `fishing_bait_affinity` VALUES (17407,5817,2); -- Minnow,          	Tiger Shark,  Power : 2
INSERT INTO `fishing_bait_affinity` VALUES (17400,5817,2); -- Sinking Minnow,  	Tiger Shark,  Power : 2
-- Bloodblotch
INSERT INTO `fishing_bait_affinity` VALUES (17400,5951,3); -- Sinking Minnow,  	Bloodblotch,  Power : 3
INSERT INTO `fishing_bait_affinity` VALUES (17393,5951,3); -- Slice Of Cod,     Bloodblotch,  Power : 3
INSERT INTO `fishing_bait_affinity` VALUES (17395,5951,3); -- Lugworm,          Bloodblotch,  Power : 3
INSERT INTO `fishing_bait_affinity` VALUES (17407,5951,2); -- Minnow,          	Bloodblotch,  Power : 2
INSERT INTO `fishing_bait_affinity` VALUES (17394,5951,2); -- Peeled Lobster,  	Bloodblotch,  Power : 2
-- Far East Puffer
INSERT INTO `fishing_bait_affinity` VALUES (17405,6489,3); -- Fly Lure,     Far East Puffer,  Power : 3
-- Wasabi
INSERT INTO `fishing_bait_affinity` VALUES (17399,9200,3); -- Sabiki Rig,            Wasabi,  Power : 3
INSERT INTO `fishing_bait_affinity` VALUES (17398,9200,3); -- Rogue Rig,             Wasabi,  Power : 3
INSERT INTO `fishing_bait_affinity` VALUES (17002,9200,2); -- Robber Rig,            Wasabi,  Power : 2
