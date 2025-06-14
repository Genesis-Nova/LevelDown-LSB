-- INSERT INTO bcnm_battlefield VALUES (1058,1,16924685,3);
-- INSERT INTO bcnm_info VALUES (1058,36,'both_paths_taken', 'nobody',0,900,900,99,6,0,5,1);
UPDATE mob_spawn_points SET pos_x = -519.4308, pos_y = -120.0000, pos_z = 526.7888, pos_rot = 65 WHERE mobid = 16924685;
UPDATE mob_groups SET poolid = 30001, HP = 50000, MP = 10000, minLevel = 104, maxLevel = 110 WHERE name = 'Disjoined_One';
INSERT INTO mob_pools VALUES (30001,'Disjoined_One','Disjoined One',508,0x010000018411E620E630E640E650406100700000,8,0,3,240,100,0,0,0,0,16,0,32,3029,131,0,0,501,0,0,494,356);
INSERT INTO mob_family_system VALUES (508, 'Disjoined_One',86, 'Humanoid', 13, 'Humanoid', 0.0, 40, 100, 100,2,5,3,6,6,2,4,1,3,1,3,0,3,0);
INSERT INTO mob_spell_lists VALUES ('Disjoined_One', 501, 252,1,255);
INSERT INTO mob_spell_lists VALUES ('Disjoined_One', 501, 243,1,255);
INSERT INTO mob_spell_lists VALUES ('Disjoined_One', 501, 277,1,255);
INSERT INTO mob_spell_lists VALUES ('Disjoined_One', 501, 880,1,255);
INSERT INTO mob_skill_lists VALUES ('Disjoined_One', 494, 938);
INSERT INTO mob_skill_lists VALUES ('Disjoined_One', 494, 975);
UPDATE mob_groups SET poolid = 5997, minLevel = 100, maxLevel = 104, allegiance = 1 WHERE name = 'Iroha' AND groupid = 6;


-- add iroha to battlefield
-- INSERT INTO bcnm_battlefield VALUES (1058,1,16924686,1);
UPDATE mob_spawn_points SET pos_x = -520.655, pos_y = -120.500, pos_z = 515.389, pos_rot = 202 WHERE mobid = 16924686;



