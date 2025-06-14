-- update mob spawn points to shift them to qms
UPDATE mob_spawn_points SET pos_X = 39.0766,   pos_y = -0.7559, pos_z = 135.6011,   pos_rot = 75  WHERE mobid = 17957299;
UPDATE mob_spawn_points SET pos_X = 601.2795,  pos_y = -0.2433, pos_z = -168.8869,  pos_rot = 162 WHERE mobid = 17957301;
UPDATE mob_spawn_points SET pos_X = -11.9079,  pos_y = -0.3944, pos_z = -435.8526,  pos_rot = 39  WHERE mobid = 17957304;
UPDATE mob_spawn_points SET pos_X = 510.6931,  pos_y = -0.2643, pos_z = -483.201,   pos_rot = 238 WHERE mobid = 17957308;
UPDATE mob_spawn_points SET pos_X = 325.7415,  pos_y = -0.1989, pos_z = -129.1349,  pos_rot = 172 WHERE mobid = 17957310;
UPDATE mob_spawn_points SET pos_X = 401.6606,  pos_y = -0.0000, pos_z = -638.9804,  pos_rot = 114 WHERE mobid = 17957313;
UPDATE mob_spawn_points SET pos_X = -364.7595, pos_y = -0.1233, pos_z = -434.251,   pos_rot = 31  WHERE mobid = 17957317;
UPDATE mob_spawn_points SET pos_X = -245.3619, pos_y = -0.4082, pos_z = 617.7747,   pos_rot = 16  WHERE mobid = 17957319;
UPDATE mob_spawn_points SET pos_X = -10.3273,  pos_y = -0.3153, pos_z = -158.021,   pos_rot = 20  WHERE mobid = 17957322;
UPDATE mob_spawn_points SET pos_X = -356.6668, pos_y = -0.496,  pos_z = 426.998,    pos_rot = 163 WHERE mobid = 17957325;
UPDATE mob_spawn_points SET pos_X = 249.8434,  pos_y = -0.989,  pos_z = -298.2996,  pos_rot = 145 WHERE mobid = 17957329;
UPDATE mob_spawn_points SET pos_X = 452.257,   pos_y = -0.4118, pos_z = -280.8013,  pos_rot = 249 WHERE mobid = 17957332;
UPDATE mob_spawn_points SET pos_X = -10.3273,  pos_y = -0.3153, pos_z = -158.021,   pos_rot = 20  WHERE mobid = 17957352;
UPDATE mob_spawn_points SET pos_X = 601.2795,  pos_y = -0.2433, pos_z = -168.8869,  pos_rot = 162 WHERE mobid = 17957355;
UPDATE mob_spawn_points SET pos_X = -356.6668, pos_y = -0.496,  pos_z = 426.998,    pos_rot = 163 WHERE mobid = 17957358;
UPDATE mob_spawn_points SET pos_X = -11.9079,  pos_y = -0.3944, pos_z = -435.8526,  pos_rot = 39  WHERE mobid = 17957361;
UPDATE mob_spawn_points SET pos_X = 510.6931,  pos_y = -0.2643, pos_z = -483.201,   pos_rot = 238 WHERE mobid = 17957365;
UPDATE mob_spawn_points SET pos_X = 325.7415,  pos_y = -0.1989, pos_z = -129.1349,  pos_rot = 172 WHERE mobid = 17957367;
UPDATE mob_spawn_points SET pos_X = 249.8434,  pos_y = -0.989,  pos_z = -298.2996,  pos_rot = 145 WHERE mobid = 17957370;
UPDATE mob_spawn_points SET pos_X = 452.257,   pos_y = -0.4118, pos_z = -280.8013,  pos_rot = 249 WHERE mobid = 17957373;
UPDATE mob_spawn_points SET pos_X = 39.0766,   pos_y = -0.7559, pos_z = 135.6011,   pos_rot = 75  WHERE mobid = 17957376;
UPDATE mob_spawn_points SET pos_X = 401.6606,  pos_y = -0.0000, pos_z = -638.9804,  pos_rot = 114 WHERE mobid = 17957343;
UPDATE mob_spawn_points SET pos_X = 403.1004,  pos_y = -0.0000, pos_z = -640.4817,  pos_rot = 125 WHERE mobid = 17957337;
UPDATE mob_spawn_points SET pos_X = 400.8694,  pos_y = -0.0000, pos_z = -635.8933,  pos_rot = 94  WHERE mobid = 17957385;
UPDATE mob_spawn_points SET pos_X = -364.7595, pos_y = -0.1233, pos_z = -434.251,   pos_rot = 31  WHERE mobid = 17957334;
UPDATE mob_spawn_points SET pos_X = -245.3619, pos_y = -0.4082, pos_z = 617.7747,   pos_rot = 16  WHERE mobid = 17957349;
UPDATE mob_spawn_points SET pos_X = -10.3273,  pos_y = -0.3153, pos_z = -158.021,   pos_rot = 20  WHERE mobid = 17957347;
-- add NM spawn points
INSERT INTO `nm_spawn_points` VALUES (17957278,0,-124.4,-0.268,34.275); -- Prickly_Pitriv
INSERT INTO `nm_spawn_points` VALUES (17957280,0,-19.01,0.475,80.188); -- Abyssdiver
INSERT INTO `nm_spawn_points` VALUES (17957294,0,-306.5,0.125,419.835); -- Beist
INSERT INTO `nm_spawn_points` VALUES (17956870,0,1,1,1); -- Emperor_Arthro
INSERT INTO `nm_spawn_points` VALUES (17957296,0,-143.2,0.285,-452.15); -- Eschan_Jewelweed
INSERT INTO `nm_spawn_points` VALUES (17957277,0,-357.5,0.238,14.435); -- Hugemaw_Harold
INSERT INTO `nm_spawn_points` VALUES (17957293,0,237.14,-1.708,-305.54); -- Immanibugard
INSERT INTO `nm_spawn_points` VALUES (17957292,0,-517.7,0.43,180.716); -- Jester_Malatrix
INSERT INTO `nm_spawn_points` VALUES (17957281,0,-36.69,-0.328,-350.24); -- Keeper_of_Heiligtum
INSERT INTO `nm_spawn_points` VALUES (17957282,0,-44.051,-0.341,-150.481); -- Muut
INSERT INTO `nm_spawn_points` VALUES (17957279,0,-493.9,0.18,231.925); -- Serpopard_Ninlil
INSERT INTO `nm_spawn_points` VALUES (17957291,0,-340.23,2.046,166.833); -- Voso
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


