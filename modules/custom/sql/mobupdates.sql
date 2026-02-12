--										  Abyssea - ALL NORMAL MOBS +30 LVLs
UPDATE mob_spawn_points AS m
INNER JOIN (
    SELECT 'Abas' AS name, 34 AS gid UNION ALL
    SELECT 'Adamastor', 32 UNION ALL
    SELECT 'Air_Elemental', 50 UNION ALL
    SELECT 'Alectryon', 35 UNION ALL
    SELECT 'Alfard', 38 UNION ALL
    SELECT 'Alkonost', 42 UNION ALL
    SELECT 'Amarok', 34 UNION ALL
    SELECT 'Ambuscader_Antlion', 50 UNION ALL
    SELECT 'Amhuluk', 43 UNION ALL
    SELECT 'Amphitrite', 40 UNION ALL
    SELECT 'Anemic_Aloysius', 45 UNION ALL
    SELECT 'Apademak', 26 UNION ALL
    SELECT 'Arimaspi', 44 UNION ALL
    SELECT 'Armillaria', 38 UNION ALL
    SELECT 'Ashtaerh_the_Gallvexed', 14 UNION ALL
    SELECT 'Assailer_Chariot', 43 UNION ALL
    SELECT 'Ateuvhi', 28 UNION ALL
    SELECT 'Audumbla', 47 UNION ALL
    SELECT 'Avalerion', 37 UNION ALL
    SELECT 'Azdaja', 39 UNION ALL
    SELECT 'Baba_Yaga', 36 UNION ALL
    SELECT 'Badlands_Crab', 1 UNION ALL
    SELECT 'Bastion_Fighter', 67 UNION ALL
    SELECT 'Bastion_Fighter', 68 UNION ALL
    SELECT 'Bastion_Mage', 68 UNION ALL
    SELECT 'Bastion_Mage', 69 UNION ALL
    SELECT 'Bennu', 29 UNION ALL
    SELECT 'Berstuk', 37 UNION ALL
    SELECT 'Blanga', 37 UNION ALL
    SELECT 'Blazing_Eruca', 30 UNION ALL
    SELECT 'Bloodeye_Vileberry', 57 UNION ALL
    SELECT 'Bloodguzzler', 32 UNION ALL
    SELECT 'Bombadeel', 19 UNION ALL
    SELECT 'Bomblix_Flamefinger', 30 UNION ALL
    SELECT 'Briareus', 41 UNION ALL
    SELECT 'Brine_Crab', 1 UNION ALL
    SELECT 'Brooder', 56 UNION ALL
    SELECT 'Brulo', 47 UNION ALL
    SELECT 'Bugul_Noz', 46 UNION ALL
    SELECT 'Bukhis', 41 UNION ALL
    SELECT 'Burstrox_Powderpate', 36 UNION ALL
    SELECT 'Cannered_Noz', 30 UNION ALL
    SELECT 'Carabosse', 42 UNION ALL
    SELECT 'Cep-Kamuy', 34 UNION ALL
    SELECT 'Chhir_Batti', 37 UNION ALL
    SELECT 'Chickcharney', 44 UNION ALL
    SELECT 'Chillwing_Hwitti', 46 UNION ALL
    SELECT 'Chione', 39 UNION ALL
    SELECT 'Chloris', 39 UNION ALL
    SELECT 'Cirein-croin', 42 UNION ALL
    SELECT 'Clingy_Clare', 38 UNION ALL
    SELECT 'Crabtrap', 2 UNION ALL
    SELECT 'Custodian', 65 UNION ALL
    SELECT 'Custodian', 66 UNION ALL
    SELECT 'Daggertooth_Pugil', 1 UNION ALL
    SELECT 'Dark_Elemental', 51 UNION ALL
    SELECT 'Decontaminator', 56 UNION ALL
    SELECT 'Decontaminator', 57 UNION ALL
    SELECT 'Depths_Digester', 3 UNION ALL
    SELECT 'Dhorme_Khimaira', 34 UNION ALL
    SELECT 'Disassembler', 59 UNION ALL
    SELECT 'Disassembler', 60 UNION ALL
    SELECT 'Dragua', 28 UNION ALL
    SELECT 'Drekavac', 34 UNION ALL
    SELECT 'Durinn', 43 UNION ALL
    SELECT 'Dvalinn', 32 UNION ALL
    SELECT 'Earth_Elemental', 50 UNION ALL
    SELECT 'Earth_Mover', 64 UNION ALL
    SELECT 'Earth_Mover', 65 UNION ALL
    SELECT 'Eccentric_Eve', 48 UNION ALL
    SELECT 'Edifier', 61 UNION ALL
    SELECT 'Edifier', 62 UNION ALL
    SELECT 'Emperador_de_Altepa', 38 UNION ALL
    SELECT 'Eseuvhi', 27 UNION ALL
    SELECT 'Fear_Gorta', 51 UNION ALL
    SELECT 'Fire_Elemental', 49 UNION ALL
    SELECT 'Frog_Prince', 3 UNION ALL
    SELECT 'Frost_Bomb_Mk-II', 1 UNION ALL
    SELECT 'Fulmotondro', 25 UNION ALL
    SELECT 'Funereal_Apkallu', 32 UNION ALL
    SELECT 'Gaizkin', 32 UNION ALL
    SELECT 'Gamayun', 49 UNION ALL
    SELECT 'Gancanagh', 32 UNION ALL
    SELECT 'Glavoid', 40 UNION ALL
    SELECT 'Gnawtooth_Gary', 40 UNION ALL
    SELECT 'Grandgousier', 34 UNION ALL
    SELECT 'Granite_Borer', 29 UNION ALL
    SELECT 'Guimauve', 34 UNION ALL
    SELECT 'Hadal_Mirror', 2 UNION ALL
    SELECT 'Hadal_Satiator', 1 UNION ALL
    SELECT 'Hadhayosh', 43 UNION ALL
    SELECT 'Halimede', 27 UNION ALL
    SELECT 'Hedetet', 33 UNION ALL
    SELECT 'Hexenpilz', 23 UNION ALL
    SELECT 'Hmzdei', 27 UNION ALL
    SELECT 'Hungerer', 26 UNION ALL
    SELECT 'Ice_Elemental', 49 UNION ALL
    SELECT 'Ika-Roa', 34 UNION ALL
    SELECT 'Iku-Turso', 31 UNION ALL
    SELECT 'Immobilizer', 58 UNION ALL
    SELECT 'Immobilizer', 59 UNION ALL
    SELECT 'Impervious_Chariot', 33 UNION ALL
    SELECT 'Iratham', 51 UNION ALL
    SELECT 'Ironclad_Observer', 35 UNION ALL
    SELECT 'Ironclad_Pulverizer', 45 UNION ALL
    SELECT 'Ironclad_Smiter', 32 UNION ALL
    SELECT 'Ironclad_Sunderer', 27 UNION ALL
    SELECT 'Ironclad_Triturator', 32 UNION ALL
    SELECT 'Isgebind', 27 UNION ALL
    SELECT 'Itzpapalotl', 45 UNION ALL
    SELECT 'Jala', 26 UNION ALL
    SELECT 'Kadraeth_the_Hatespawn', 33 UNION ALL
    SELECT 'Kampe', 36 UNION ALL
    SELECT 'Karkadann', 44 UNION ALL
    SELECT 'Karkatakam', 38 UNION ALL
    SELECT 'Karkinos', 3 UNION ALL
    SELECT 'Keratyrannos', 27 UNION ALL
    SELECT 'Ketea', 26 UNION ALL
    SELECT 'Khalkotaur', 29 UNION ALL
    SELECT 'Kharon', 33 UNION ALL
    SELECT 'Koghatu', 40 UNION ALL
    SELECT 'Koios', 48 UNION ALL
    SELECT 'Kukulkan', 28 UNION ALL
    SELECT 'Kutharei', 52 UNION ALL
    SELECT 'Lachrymater', 38 UNION ALL
    SELECT 'Lacovie', 41 UNION ALL
    SELECT 'La_Theine_Liege', 35 UNION ALL
    SELECT 'Lentor', 30 UNION ALL
    SELECT 'Lesser_Arimaspi', 45 UNION ALL
    SELECT 'Lorelei', 35 UNION ALL
    SELECT 'Lugarhoo', 40 UNION ALL
    SELECT 'Lusca', 26 UNION ALL
    SELECT 'Maahes', 38 UNION ALL
    SELECT 'Maere', 48 UNION ALL
    SELECT 'Manohra', 33 UNION ALL
    SELECT 'Meanderer', 4 UNION ALL
    SELECT 'Meditator', 57 UNION ALL
    SELECT 'Megantereon', 31 UNION ALL
    SELECT 'Mielikki', 41 UNION ALL
    SELECT 'Mighrah', 29 UNION ALL
    SELECT 'Minaruja', 32 UNION ALL
    SELECT 'Minax_Bugard', 30 UNION ALL
    SELECT 'Muscaliet', 37 UNION ALL
    SELECT 'Mxghrah', 28 UNION ALL
    SELECT 'Myrmecoleon', 49 UNION ALL
    SELECT 'Nahn', 2 UNION ALL
    SELECT 'Nehebkau', 36 UNION ALL
    SELECT 'Nguruvilu', 37 UNION ALL
    SELECT 'Nightshade', 39 UNION ALL
    SELECT 'Ningishzida', 28 UNION ALL
    SELECT 'Nonno', 39 UNION ALL
    SELECT 'Npfundlwa', 41 UNION ALL
    SELECT 'Ogopogo', 31 UNION ALL
    SELECT 'Ophanim', 29 UNION ALL
    SELECT 'Oppressor', 60 UNION ALL
    SELECT 'Oppressor', 61 UNION ALL
    SELECT 'Orthrus', 27 UNION ALL
    SELECT 'Overseer', 62 UNION ALL
    SELECT 'Overseer', 63 UNION ALL
    SELECT 'Pallid_Percy', 31 UNION ALL
    SELECT 'Pantagruel', 33 UNION ALL
    SELECT 'Pantokrator', 25 UNION ALL
    SELECT 'Pascerpot', 39 UNION ALL
    SELECT 'Poroggo_Dom_Juan', 38 UNION ALL
    SELECT 'Pustule', 36 UNION ALL
    SELECT 'Qiqirn_Bewitcher', 70 UNION ALL
    SELECT 'Qiqirn_Bewitcher', 71 UNION ALL
    SELECT 'Qiqirn_Trapper', 69 UNION ALL
    SELECT 'Qiqirn_Trapper', 70 UNION ALL
    SELECT 'Quasimodo', 30 UNION ALL
    SELECT 'Raja', 37 UNION ALL
    SELECT 'Rakshas', 34 UNION ALL
    SELECT 'Rani', 26 UNION ALL
    SELECT 'Ravager_Chariot', 66 UNION ALL
    SELECT 'Ravager_Chariot', 67 UNION ALL
    SELECT 'Resheph', 28 UNION ALL
    SELECT 'Rubicund_Adenium', 1 UNION ALL
    SELECT 'Ruminator', 55 UNION ALL
    SELECT 'Sand_Pugil', 2 UNION ALL
    SELECT 'Sarcophilus', 17 UNION ALL
    SELECT 'Scrutinizer', 55 UNION ALL
    SELECT 'Scrutinizer', 56 UNION ALL
    SELECT 'Scythemaw_Jagil', 2 UNION ALL
    SELECT 'Sedna', 42 UNION ALL
    SELECT 'Sentinel_Crab', 1 UNION ALL
    SELECT 'Seps', 35 UNION ALL
    SELECT 'Sharabha', 41 UNION ALL
    SELECT 'Shaula', 37 UNION ALL
    SELECT 'Sippoy', 45 UNION ALL
    SELECT 'Siranpa-kamuy', 40 UNION ALL
    SELECT 'Sirrush', 31 UNION ALL
    SELECT 'Smok', 42 UNION ALL
    SELECT 'Sobek', 44 UNION ALL
    SELECT 'Spring_Pugil', 2 UNION ALL
    SELECT 'Sturdy_Pyxis', 6 UNION ALL
    SELECT 'Sturdy_Pyxis', 22 UNION ALL
    SELECT 'Sturdy_Pyxis', 24 UNION ALL
    SELECT 'Sturdy_Pyxis', 25 UNION ALL
    SELECT 'Sturdy_Pyxis', 26 UNION ALL
    SELECT 'Sturdy_Pyxis', 51 UNION ALL
    SELECT 'Sturdy_Pyxis', 53 UNION ALL
    SELECT 'Sturdy_Pyxis', 54 UNION ALL
    SELECT 'Sturdy_Pyxis', 58 UNION ALL
    SELECT 'Sturdy_Pyxis', 72 UNION ALL
    SELECT 'Sturdy_Pyxis', 73 UNION ALL
    SELECT 'Surveyor', 54 UNION ALL
    SELECT 'Surveyor', 71 UNION ALL
    SELECT 'Svarbhanu', 35 UNION ALL
    SELECT 'Tablilla', 39 UNION ALL
    SELECT 'Teekesselchen', 31 UNION ALL
    SELECT 'Tefenet', 36 UNION ALL
    SELECT 'Tejas', 25 UNION ALL
    SELECT 'Teugghia', 29 UNION ALL
    SELECT 'Titlacauan', 43 UNION ALL
    SELECT 'Tonberry_Lieje', 56 UNION ALL
    SELECT 'Toppling_Tuber', 39 UNION ALL
    SELECT 'Treble_Noctules', 31 UNION ALL
    SELECT 'Tristitia', 27 UNION ALL
    SELECT 'Trudging_Thomas', 30 UNION ALL
    SELECT 'Tuskertrap', 40 UNION ALL
    SELECT 'Ulhuadshi', 44 UNION ALL
    SELECT 'Upas-Kamuy', 42 UNION ALL
    SELECT 'Usurper', 24 UNION ALL
    SELECT 'Vadleany', 45 UNION ALL
    SELECT 'Vale_Crab', 1 UNION ALL
    SELECT 'Veri_Selen', 44 UNION ALL
    SELECT 'Vetehinen', 28 UNION ALL
    SELECT 'Vigilant_Gear', 63 UNION ALL
    SELECT 'Vigilant_Gear', 64 UNION ALL
    SELECT 'Vigilant_Gears', 57 UNION ALL
    SELECT 'Vigilant_Gears', 58 UNION ALL
    SELECT 'Vuzdei', 28 UNION ALL
    SELECT 'Water_Elemental', 48 UNION ALL
    SELECT 'Waugyl', 43 UNION ALL
    SELECT 'Wherwetrice', 40 UNION ALL
    SELECT 'Xan', 36 UNION ALL
    SELECT 'Xibalba', 33 UNION ALL
    SELECT 'Yaanei', 52 UNION ALL
    SELECT 'Yaguarogui', 38 UNION ALL
    SELECT 'Yearner', 25
) AS v ON m.mobname = v.name AND m.groupid = v.gid
SET 
    m.minLevel = m.minLevel + 40, 
    m.maxLevel = m.maxLevel + 45;

--                      Dynamis NM timed spawn
UPDATE mob_groups SET spawntype = 0, respawntime = 5400 WHERE zoneid IN (39,40,41,42,119,134,135,185,186,187,188) AND spawntype = 32;
--                      LoO
UPDATE mob_groups SET spawntype = 0, respawntime = 600, HP = 78000 WHERE name = 'Lord_of_Onzozo' AND spawntype = 32;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Lord_of_Onzozo' AND groupid = 16;
--                     Mysticmaker Profblix
UPDATE mob_groups SET HP = 78000 WHERE name = 'Mysticmaker_Profblix' AND spawntype = 128;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Mysticmaker_Profblix';
--                    Morbolger 
UPDATE mob_groups SET HP = 78000 WHERE name = 'Morbolger' AND spawntype = 128;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Morbolger';
-- Orcus
UPDATE mob_pools SET aggro = 0, true_detection = 0 WHERE poolid = 7010;
--						Mob Pools settings		
UPDATE mob_pools SET aggro = 1 WHERE name = "Apex_Eft";
UPDATE mob_pools SET aggro = 1 WHERE name = "Apex_Toad";
UPDATE mob_pools SET aggro = 1 WHERE name = "Apex_Mandragora";
UPDATE mob_pools SET aggro = 1 WHERE name = "Apex_Crab";
UPDATE mob_pools SET links = 1 WHERE name = "Apex_Crab";
UPDATE mob_pools SET aggro = 1 WHERE name = "Eschan_Opo-Opo";
UPDATE mob_pools SET links = 1 WHERE name = "Eschan_Opo-Opo";
UPDATE mob_pools SET links = 1 WHERE name = "Blanched_Mandragora";
UPDATE mob_pools SET aggro = 1 WHERE name = "Locus_Wivre";
UPDATE mob_pools SET links = 1 WHERE name = "Locus_Wivre";
UPDATE mob_pools SET aggro = 1 WHERE name = "Locus_Colibri";
UPDATE mob_pools SET aggro = 1 WHERE name = "Locus_Hypnos_Eft";
UPDATE mob_pools SET aggro = 1 WHERE name = "Locus_Camelopard";
UPDATE mob_pools SET aggro = 1 WHERE name = "Locus_Bight_Rarab";
UPDATE mob_pools SET aggro = 1 WHERE name = "Locus_Armet_Beetle";
UPDATE mob_pools SET links = 1 WHERE name = "Locus_Cutlass_Scorpion";
UPDATE mob_pools SET links = 1 WHERE name = "Locus_Ghost_Crab";
UPDATE mob_pools SET sJob = 4 WHERE name = "Tolba"; 
--						Mob Group settings	
--							Zone 190			
UPDATE mob_groups SET HP = 17000 WHERE name = "Locus_Spartoi_Sorcerer";
UPDATE mob_groups SET HP = 17000 WHERE name = "Locus_Spartoi_Warrior";
UPDATE mob_groups SET HP = 17000 WHERE name = "Locus_Cutlass_Scorpion";
UPDATE mob_groups SET HP = 17000 WHERE name = "Locus_Thousand_Eyes";
UPDATE mob_groups SET HP = 17000 WHERE name = "Locus_Hati";
UPDATE mob_groups SET HP = 17000 WHERE name = "Locus_Armet_Beetle";
UPDATE mob_groups SET HP = 17000 WHERE name = "Locus_Dire_Bat";
UPDATE mob_groups SET HP = 17000 WHERE name = "Locus_Tomb_Worm";
--							Zone 4							--
UPDATE mob_groups SET HP = 17000 WHERE name = "Locus_Bight_Rarab";
UPDATE mob_groups SET HP = 17000 WHERE name = "Locus_Camelopard";
UPDATE mob_groups SET HP = 17000 WHERE name = "Locus_Hypnos_Eft";
UPDATE mob_groups SET HP = 17000 WHERE name = "Locus_Ghost_Crab";
--						Mob Family settings
UPDATE mob_family_system SET detects = 3 WHERE familyID = 46;
UPDATE mob_family_system SET detects = 3 WHERE familyID = 47;
UPDATE mob_family_system SET detects = 3 WHERE familyID = 77;
UPDATE mob_family_system SET detects = 3 WHERE familyID = 98;
UPDATE mob_family_system SET detects = 3 WHERE familyID = 107;
UPDATE mob_family_system SET detects = 3 WHERE familyID = 197;
UPDATE mob_family_system SET detects = 3 WHERE familyID = 178;
UPDATE mob_family_system SET detects = 3 WHERE familyID = 72;
UPDATE mob_family_system SET detects = 3 WHERE familyID = 80;
UPDATE mob_family_system SET detects = 3 WHERE familyID = 206;
UPDATE mob_family_system SET detects = 3 WHERE familyID = 257;
UPDATE mob_family_system SET detects = 3 WHERE familyID = 188;
UPDATE mob_family_system SET detects = 3 WHERE familyID = 87;
UPDATE mob_family_system SET detects = 3 WHERE familyID = 58;

--                      Mob Respawn Time
UPDATE mob_groups SET respawntime = 180 WHERE respawntime = 60; -- All
UPDATE mob_groups SET respawntime = 180 WHERE respawntime = 300; -- All
UPDATE mob_groups SET respawntime = 180 WHERE respawntime = 330; -- All
UPDATE mob_groups SET respawntime = 180 WHERE respawntime = 480; -- All
UPDATE mob_groups SET respawntime = 420 WHERE respawntime = 600; -- All
UPDATE mob_groups SET respawntime = 420 WHERE respawntime = 660; -- All
UPDATE mob_groups SET respawntime = 420 WHERE respawntime = 720; -- All
UPDATE mob_groups SET respawntime = 420 WHERE respawntime = 792; -- All
UPDATE mob_groups SET respawntime = 420 WHERE respawntime = 900; -- All
UPDATE mob_groups SET respawntime = 420 WHERE respawntime = 924; -- All
UPDATE mob_groups SET respawntime = 420 WHERE respawntime = 960; -- All
--                      Zone 178
UPDATE mob_groups SET respawntime = 180 WHERE respawntime = 420 AND zoneid = 178;
UPDATE mob_groups SET respawntime = 180 WHERE respawntime = 600 AND zoneid = 178;
UPDATE mob_groups SET respawntime = 180 WHERE respawntime = 660 AND zoneid = 178;
UPDATE mob_groups SET respawntime = 180 WHERE respawntime = 720 AND zoneid = 178;
UPDATE mob_groups SET respawntime = 180 WHERE respawntime = 792 AND zoneid = 178;
UPDATE mob_groups SET respawntime = 180 WHERE respawntime = 900 AND zoneid = 178;
UPDATE mob_groups SET respawntime = 180 WHERE respawntime = 924 AND zoneid = 178;
UPDATE mob_groups SET respawntime = 180 WHERE respawntime = 960 AND zoneid = 178;
--						  ZNM  105 HP 55000 Tier I
UPDATE mob_groups SET HP = 55000 WHERE name = 'Vulpangue' AND zoneid = 51;
UPDATE mob_groups SET HP = 55000 WHERE name = 'Chamrosh' AND zoneid = 65;
UPDATE mob_groups SET HP = 55000 WHERE name = 'Cheese_Hoarder_Gigiroon' AND zoneid = 72;
UPDATE mob_groups SET HP = 55000 WHERE name = 'Brass_Borer' AND zoneid = 61;
UPDATE mob_groups SET HP = 55000 WHERE name = 'Claret' AND zoneid = 61;
UPDATE mob_groups SET HP = 55000 WHERE name = 'Ob' AND zoneid = 72;
UPDATE mob_groups SET HP = 55000 WHERE name = 'Velionis' AND zoneid = 54;
UPDATE mob_groups SET HP = 55000 WHERE name = 'Chigre' AND zoneid = 68;
UPDATE mob_groups SET HP = 55000 WHERE name = 'Lil_Apkallu' AND zoneid = 54;

UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Vulpangue';
UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Chamrosh';
UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Cheese_Hoarder_Gigiroon';
UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Brass_Borer';
UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Claret';
UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Ob';
UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Velionis';
UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Chigre';
UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Lil_Apkallu';

--						    110 HP 78000 Tier II
UPDATE mob_groups SET HP = 78000 WHERE name = 'Iriz_Ima' AND zoneid = 51;
UPDATE mob_groups SET HP = 78000 WHERE name = 'Lividroot_Amooshah' AND zoneid = 52;
UPDATE mob_groups SET HP = 78000 WHERE name = 'Iriri_Samariri' AND zoneid = 65;
UPDATE mob_groups SET HP = 78000 WHERE name = 'Anantaboga' AND zoneid = 61;
UPDATE mob_groups SET HP = 78000 WHERE name = 'Dextrose' AND zoneid = 62;
UPDATE mob_groups SET HP = 78000 WHERE name = 'Reacton' AND zoneid = 62;
UPDATE mob_groups SET HP = 78000 WHERE name = 'Verdelet' AND zoneid = 79;
UPDATE mob_groups SET HP = 78000 WHERE name = 'Wulgaru' AND zoneid = 72;
UPDATE mob_groups SET HP = 78000 WHERE name = 'Zareehkl_the_Jubilant' AND zoneid = 54;

UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Iriz_Ima';
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Lividroot_Amooshah';
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Iriri_Samariri';
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Anantaboga';
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Dextrose';
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Reacton';
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Verdelet';
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Wulgaru';
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Zareehkl_the_Jubilant';

--						    115 HP 85000 Tier III
UPDATE mob_groups SET HP = 85000 WHERE name = 'Armed_Gears' AND zoneid = 72;
UPDATE mob_groups SET HP = 85000 WHERE name = 'Gotoh_Zha_the_Redolent' AND zoneid = 51;
UPDATE mob_groups SET HP = 85000 WHERE name = 'Dea' AND zoneid = 52;
UPDATE mob_groups SET HP = 85000 WHERE name = 'Achamoth' AND zoneid = 62;
UPDATE mob_groups SET HP = 85000 WHERE name = 'Khromasoul_Bhurborlor' AND zoneid = 61;
UPDATE mob_groups SET HP = 85000 WHERE name = 'Nosferatu' AND zoneid = 68;
UPDATE mob_groups SET HP = 85000 WHERE name = 'Experimental_Lamia' AND zoneid = 79;
UPDATE mob_groups SET HP = 85000 WHERE name = 'Mahjlaef_the_Paintorn' AND zoneid = 79;
UPDATE mob_groups SET HP = 85000 WHERE name = 'Nuhn' AND zoneid = 54;

UPDATE mob_spawn_points SET minLevel = 115, maxLevel = 115 WHERE mobname = 'Armed_Gears';
UPDATE mob_spawn_points SET minLevel = 115, maxLevel = 115 WHERE mobname = 'Gotoh_Zha_the_Redolent';
UPDATE mob_spawn_points SET minLevel = 115, maxLevel = 115 WHERE mobname = 'Dea';
UPDATE mob_spawn_points SET minLevel = 115, maxLevel = 115 WHERE mobname = 'Achamoth';
UPDATE mob_spawn_points SET minLevel = 115, maxLevel = 115 WHERE mobname = 'Khromasoul_Bhurborlor';
UPDATE mob_spawn_points SET minLevel = 115, maxLevel = 115 WHERE mobname = 'Nosferatu';
UPDATE mob_spawn_points SET minLevel = 115, maxLevel = 115 WHERE mobname = 'Experimental_Lamia';
UPDATE mob_spawn_points SET minLevel = 115, maxLevel = 115 WHERE mobname = 'Mahjlaef_the_Paintorn';
UPDATE mob_spawn_points SET minLevel = 115, maxLevel = 115 WHERE mobname = 'Nuhn';

--							120 HP 105000 Tier IV
UPDATE mob_groups SET HP = 105000 WHERE name = 'Tinnin' AND zoneid = 51;
UPDATE mob_groups SET HP = 105000 WHERE name = 'Sarameya' AND zoneid = 61;
UPDATE mob_groups SET HP = 105000 WHERE name = 'Tyger' AND zoneid = 79;

UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Sarameya';
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Tyger';

--  					    125 HP 165000 Tier V
UPDATE mob_groups SET HP = 175000 WHERE name = 'Pandemonium_Warden' AND zoneid = 68;
UPDATE mob_spawn_points SET minLevel = 125, maxLevel = 125 WHERE mobname = 'Pandemonium_Warden';

--						  VWNM  105 HP 55000 Stage I
UPDATE mob_groups SET HP = 55000 WHERE name = 'Sallow_Seymour' AND zoneid = 106;
UPDATE mob_groups SET HP = 55000 WHERE name = 'Ushumgal' AND zoneid = 88;
UPDATE mob_groups SET HP = 55000 WHERE name = 'Sarimanok' AND zoneid = 101;
UPDATE mob_groups SET HP = 55000 WHERE name = 'Cottus' AND zoneid = 81;
UPDATE mob_groups SET HP = 55000 WHERE name = 'Virvatuli' AND zoneid = 115;
UPDATE mob_groups SET HP = 55000 WHERE name = 'Pancimanci' AND zoneid = 95;
UPDATE mob_groups SET HP = 55000 WHERE name = 'Goji' AND zoneid = 120;
UPDATE mob_groups SET HP = 55000 WHERE name = 'Gugalanna' AND zoneid = 98;
UPDATE mob_groups SET HP = 55000 WHERE name = 'Yatagarasu' AND zoneid = 110;
UPDATE mob_groups SET HP = 55000 WHERE name = 'Agathos' AND zoneid = 91;
UPDATE mob_groups SET HP = 55000 WHERE name = 'Cherufe' AND zoneid = 105;
UPDATE mob_groups SET HP = 55000 WHERE name = 'Taweret' AND zoneid = 84;
UPDATE mob_groups SET HP = 55000 WHERE name = 'Holy_Moly' AND zoneid = 123;

UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Sallow_Seymour';
UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Ushumgal';
UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Sarimanok';
UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Cottus';
UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Virvatuli';
UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Pancimanci';
UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Goji';
UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Gugalanna';
UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Yatagarasu';
UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Agathos';
UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Cherufe';
UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Taweret';
UPDATE mob_spawn_points SET minLevel = 105, maxLevel = 105 WHERE mobname = 'Holy_Moly';

--						    110 HP 78000 Stage II
UPDATE mob_groups SET HP = 78000 WHERE name = 'Lorbulcrud' AND zoneid = 196;
UPDATE mob_groups SET HP = 78000 WHERE name = 'Krabimanjaro' AND zoneid = 193;
UPDATE mob_groups SET HP = 78000 WHERE name = 'Ogbunabali' AND zoneid = 198;
UPDATE mob_groups SET HP = 78000 WHERE name = 'Roly-Poly' AND zoneid = 200;
UPDATE mob_groups SET HP = 78000 WHERE name = 'Laidly_Laurence' AND zoneid = 164;
UPDATE mob_groups SET HP = 78000 WHERE name = 'Mellonia' AND zoneid = 197;
UPDATE mob_groups SET HP = 78000 WHERE name = 'Nympha_Eunomia' AND zoneid = 171;
UPDATE mob_groups SET HP = 78000 WHERE name = 'Gasha-1stform' AND zoneid = 195;
UPDATE mob_groups SET HP = 78000 WHERE name = 'Giltine' AND zoneid = 175;

UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Lorbulcrud';
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Krabimanjaro';
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Ogbunabali';
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Roly-Poly';
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Laidly_Laurence';
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Mellonia';
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Nympha_Eunomia';
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Gasha-1stform';
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Giltine';

--						    115 HP 85000 Stage III
UPDATE mob_groups SET HP = 85000 WHERE name = 'Murk-veined_Baneberry' AND zoneid = 109;
UPDATE mob_groups SET HP = 85000 WHERE name = 'Melancholic_Moira' AND zoneid = 90;
UPDATE mob_groups SET HP = 85000 WHERE name = 'Belphoebe' AND zoneid = 104;
UPDATE mob_groups SET HP = 85000 WHERE name = 'Kholomodumo' AND zoneid = 82;
UPDATE mob_groups SET HP = 85000 WHERE name = 'Lord_Asag' AND zoneid = 119;
UPDATE mob_groups SET HP = 85000 WHERE name = 'Akupara' AND zoneid = 97;
UPDATE mob_groups SET HP = 85000 WHERE name = 'Kaggen' AND zoneid = 126;
UPDATE mob_groups SET HP = 85000 WHERE name = 'Akvan' AND zoneid = 184;
UPDATE mob_groups SET HP = 85000 WHERE name = 'Pil-VNM' AND zoneid = 127;

UPDATE mob_spawn_points SET minLevel = 115, maxLevel = 115 WHERE mobname = 'Murk-veined_Baneberry';
UPDATE mob_spawn_points SET minLevel = 115, maxLevel = 115 WHERE mobname = 'Melancholic_Moira';
UPDATE mob_spawn_points SET minLevel = 115, maxLevel = 115 WHERE mobname = 'Belphoebe';
UPDATE mob_spawn_points SET minLevel = 115, maxLevel = 115 WHERE mobname = 'Kholomodumo';
UPDATE mob_spawn_points SET minLevel = 115, maxLevel = 115 WHERE mobname = 'Lord_Asag';
UPDATE mob_spawn_points SET minLevel = 115, maxLevel = 115 WHERE mobname = 'Akupara';
UPDATE mob_spawn_points SET minLevel = 115, maxLevel = 115 WHERE mobname = 'Kaggen';
UPDATE mob_spawn_points SET minLevel = 115, maxLevel = 115 WHERE mobname = 'Akvan';
UPDATE mob_spawn_points SET minLevel = 115, maxLevel = 115 WHERE mobname = 'Pil-VNM';

--							120 HP 105000 Stage IV
UPDATE mob_groups SET HP = 105000 WHERE name = 'Celaeno' AND zoneid = 191;
UPDATE mob_groups SET HP = 105000 WHERE name = 'Hahava' AND zoneid = 190;
UPDATE mob_groups SET HP = 105000 WHERE name = 'Voidwrought' AND zoneid = 194;
UPDATE mob_groups SET HP = 105000 WHERE name = 'Lancing_Lamorak' AND zoneid = 100;
UPDATE mob_groups SET HP = 105000 WHERE name = 'Bhishani' AND zoneid = 107;
UPDATE mob_groups SET HP = 105000 WHERE name = 'Rw_Nw_Prt_M_Hrw' AND zoneid = 116;
UPDATE mob_groups SET HP = 105000 WHERE name = 'Fjalar' AND zoneid = 7;
UPDATE mob_groups SET HP = 105000 WHERE name = 'Abununnu' AND zoneid = 24;
UPDATE mob_groups SET HP = 105000 WHERE name = 'Tsui-Goab' AND zoneid = 25;
UPDATE mob_groups SET HP = 105000 WHERE name = 'Isarukitsck' AND zoneid = 5;
UPDATE mob_groups SET HP = 105000 WHERE name = 'Ildebrann' AND zoneid = 205;
UPDATE mob_groups SET HP = 105000 WHERE name = 'Neith' AND zoneid = 159;
UPDATE mob_groups SET HP = 105000 WHERE name = 'Sabotender_Campeador' AND zoneid = 125;
UPDATE mob_groups SET HP = 105000 WHERE name = 'Tangaroa' AND zoneid = 174;
UPDATE mob_groups SET HP = 105000 WHERE name = 'Malleator_Maurok' AND zoneid = 208;

UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Celaeno'; 
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Hahava';
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Voidwrought';
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Lancing_Lamorak';
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Bhishani';
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Rw_Nw_Prt_M_Hrw';
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Fjalar';
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Abununnu';
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Tsui-Goab';
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Isarukitsck';
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Ildebrann';
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Neith';
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Sabotender_Campeador';
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Tangaroa';
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Malleator_Maurok';

--						    121 HP 125000 Stage V
UPDATE mob_groups SET HP = 125000 WHERE name = 'Stachysaurus' AND zoneid = 102;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Gwynn_ap_Nudd' AND zoneid = 108;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Smierc' AND zoneid = 117;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Dimgruzub' AND zoneid = 54;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Brekekekex' AND zoneid = 79;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Yalungur' AND zoneid = 65;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Vanasarvik' AND zoneid = 61;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Cath_Palug' AND zoneid = 121;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Modron' AND zoneid = 153;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Mimic_King' AND zoneid = 122;

UPDATE mob_spawn_points SET minLevel = 121, maxLevel = 121 WHERE mobname = 'Stachysaurus';
UPDATE mob_spawn_points SET minLevel = 121, maxLevel = 121 WHERE mobname = 'Gwynn_ap_Nudd';
UPDATE mob_spawn_points SET minLevel = 121, maxLevel = 121 WHERE mobname = 'Smierc';
UPDATE mob_spawn_points SET minLevel = 121, maxLevel = 121 WHERE mobname = 'Dimgruzub';
UPDATE mob_spawn_points SET minLevel = 121, maxLevel = 121 WHERE mobname = 'Brekekekex';
UPDATE mob_spawn_points SET minLevel = 121, maxLevel = 121 WHERE mobname = 'Yalungur';
UPDATE mob_spawn_points SET minLevel = 121, maxLevel = 121 WHERE mobname = 'Vanasarvik';
UPDATE mob_spawn_points SET minLevel = 121, maxLevel = 121 WHERE mobname = 'Cath_Palug';
UPDATE mob_spawn_points SET minLevel = 121, maxLevel = 121 WHERE mobname = 'Modron';


--  					    122 HP 145000 Stage VI
UPDATE mob_groups SET HP = 145000 WHERE name = 'Gaunab' AND zoneid = 83;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Ocythoe' AND zoneid = 89;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Kalasutrax' AND zoneid = 96;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Ig-Alima' AND zoneid = 103;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Botulus_Rex' AND zoneid = 118;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Bismarck' AND zoneid = 4;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Morta' AND zoneid = 68;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Aello' AND zoneid = 130;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Uptala' AND zoneid = 177;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Qilin' AND zoneid = 178;

UPDATE mob_spawn_points SET minLevel = 122, maxLevel = 122 WHERE mobname = 'Gaunab';
UPDATE mob_spawn_points SET minLevel = 122, maxLevel = 122 WHERE mobname = 'Ocythoe';
UPDATE mob_spawn_points SET minLevel = 122, maxLevel = 122 WHERE mobname = 'Kalasutrax';
UPDATE mob_spawn_points SET minLevel = 122, maxLevel = 122 WHERE mobname = 'Ig-Alima';
UPDATE mob_spawn_points SET minLevel = 122, maxLevel = 122 WHERE mobname = 'Botulus_Rex';
UPDATE mob_spawn_points SET minLevel = 122, maxLevel = 122 WHERE mobname = 'Bismarck';
UPDATE mob_spawn_points SET minLevel = 122, maxLevel = 122 WHERE mobname = 'Morta';
UPDATE mob_spawn_points SET minLevel = 122, maxLevel = 122 WHERE mobname = 'Aello';
UPDATE mob_spawn_points SET minLevel = 122, maxLevel = 122 WHERE mobname = 'Uptala';
UPDATE mob_spawn_points SET minLevel = 122, maxLevel = 122 WHERE mobname = 'Qilin';

--					Unity NM	    122 HP 145000 - 75
UPDATE mob_groups SET HP = 145000 WHERE name = 'Bounding_Belinda' AND zoneid = 107;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Hugemaw_Harold' AND zoneid = 101;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Prickly_Pitriv' AND zoneid = 116;

UPDATE mob_spawn_points SET minLevel = 122, maxLevel = 122 WHERE mobname = 'Bounding_Belinda';
UPDATE mob_spawn_points SET minLevel = 122, maxLevel = 122 WHERE mobname = 'Hugemaw_Harold';
UPDATE mob_spawn_points SET minLevel = 122, maxLevel = 122 WHERE mobname = 'Prickly_Pitriv';

--						    123 HP 155000 - 99
UPDATE mob_groups SET HP = 155000 WHERE name = 'Ironhorn_Baldurno' AND zoneid = 102;
UPDATE mob_groups SET HP = 155000 WHERE name = 'Sleepy_Mabel' AND zoneid = 108;
UPDATE mob_groups SET HP = 155000 WHERE name = 'Serpopard_Ninlil' AND zoneid = 117;

UPDATE mob_spawn_points SET minLevel = 123, maxLevel = 123 WHERE mobname = 'Ironhorn_Baldurno';
UPDATE mob_spawn_points SET minLevel = 123, maxLevel = 123 WHERE mobname = 'Sleepy_Mabel';
UPDATE mob_spawn_points SET minLevel = 123, maxLevel = 123 WHERE mobname = 'Serpopard_Ninlil';

--						    125 HP 175000 - 119
UPDATE mob_groups SET HP = 175000 WHERE name = 'Abyssdiver' AND zoneid = 118;
UPDATE mob_groups SET HP = 175000 WHERE name = 'Immanibugard' AND zoneid = 24;
UPDATE mob_groups SET HP = 175000 WHERE name = 'Intuila' AND zoneid = 4;
UPDATE mob_groups SET HP = 175000 WHERE name = 'Jester_Malatrix' AND zoneid = 126;
UPDATE mob_groups SET HP = 175000 WHERE name = 'Orcfeltrap' AND zoneid = 2;
UPDATE mob_groups SET HP = 175000 WHERE name = 'Sybaritic_Samantha' AND zoneid = 123;
UPDATE mob_groups SET HP = 175000 WHERE name = 'Valkurm_Imperator' AND zoneid = 103;

UPDATE mob_spawn_points SET minLevel = 125, maxLevel = 125 WHERE mobname = 'Abyssdiver';
UPDATE mob_spawn_points SET minLevel = 125, maxLevel = 125 WHERE mobname = 'Immanibugard';
UPDATE mob_spawn_points SET minLevel = 125, maxLevel = 125 WHERE mobname = 'Intuila';
UPDATE mob_spawn_points SET minLevel = 125, maxLevel = 125 WHERE mobname = 'Jester_Malatrix';
UPDATE mob_spawn_points SET minLevel = 125, maxLevel = 125 WHERE mobname = 'Orcfeltrap';
UPDATE mob_spawn_points SET minLevel = 125, maxLevel = 125 WHERE mobname = 'Sybaritic_Samantha';
UPDATE mob_spawn_points SET minLevel = 125, maxLevel = 125 WHERE mobname = 'Valkurm_Imperator';

--							127 HP 185000 - 122
UPDATE mob_groups SET HP = 185000 WHERE name = 'Cactrot_Veloz' AND zoneid = 114;
UPDATE mob_groups SET HP = 185000 WHERE name = 'Emperor_Arthro' AND zoneid = 104;
UPDATE mob_groups SET HP = 185000 WHERE name = 'Garbage_Gel' AND zoneid = 167;
UPDATE mob_groups SET HP = 185000 WHERE name = 'Joyous_Green' AND zoneid = 109;
UPDATE mob_groups SET HP = 185000 WHERE name = 'Keeper_of_Heiligtum' AND zoneid = 121;
UPDATE mob_groups SET HP = 185000 WHERE name = 'Tiyanak' AND zoneid = 25;
UPDATE mob_groups SET HP = 185000 WHERE name = 'Voso' AND zoneid = 213;
UPDATE mob_groups SET HP = 185000 WHERE name = 'Warblade_Beak' AND zoneid = 119;
UPDATE mob_groups SET HP = 185000 WHERE name = 'Woodland_Mender' AND zoneid = 124;

UPDATE mob_spawn_points SET minLevel = 127, maxLevel = 127 WHERE mobname = 'Cactrot_Veloz';
UPDATE mob_spawn_points SET minLevel = 127, maxLevel = 127 WHERE mobname = 'Emperor_Arthro';
UPDATE mob_spawn_points SET minLevel = 127, maxLevel = 127 WHERE mobname = 'Garbage_Gel';
UPDATE mob_spawn_points SET minLevel = 127, maxLevel = 127 WHERE mobname = 'Joyous_Green';
UPDATE mob_spawn_points SET minLevel = 127, maxLevel = 127 WHERE mobname = 'Keeper_of_Heiligtum';
UPDATE mob_spawn_points SET minLevel = 127, maxLevel = 127 WHERE mobname = 'Tiyanak';
UPDATE mob_spawn_points SET minLevel = 127, maxLevel = 127 WHERE mobname = 'Voso';
UPDATE mob_spawn_points SET minLevel = 127, maxLevel = 127 WHERE mobname = 'Warblade_Beak';

--						    128 HP 205000 - 125
UPDATE mob_groups SET HP = 205000 WHERE name = 'Arke' AND zoneid = 120;
UPDATE mob_groups SET HP = 205000 WHERE name = 'Ayapec' AND zoneid = 153;
UPDATE mob_groups SET HP = 205000 WHERE name = 'Azure-toothed_Clawberry' AND zoneid = 159;
UPDATE mob_groups SET HP = 205000 WHERE name = 'Bakunawa' AND zoneid = 176;
UPDATE mob_groups SET HP = 205000 WHERE name = 'Beist' AND zoneid = 112;
UPDATE mob_groups SET HP = 205000 WHERE name = 'Centurio_XX-I' AND zoneid = 208;
UPDATE mob_groups SET HP = 205000 WHERE name = 'Coca' AND zoneid = 205;
UPDATE mob_groups SET HP = 205000 WHERE name = 'Douma_Weapon' AND zoneid = 122;
UPDATE mob_groups SET HP = 205000 WHERE name = 'King_Uropygid' AND zoneid = 125;
UPDATE mob_groups SET HP = 205000 WHERE name = 'Kubool_Jas_Mhuufya' AND zoneid = 51;
UPDATE mob_groups SET HP = 205000 WHERE name = 'Largantua' AND zoneid = 111;
UPDATE mob_groups SET HP = 205000 WHERE name = 'Lumber_Jill' AND zoneid = 105;
UPDATE mob_groups SET HP = 205000 WHERE name = 'Mephitas' AND zoneid = 200;
UPDATE mob_groups SET HP = 205000 WHERE name = 'Muut' AND zoneid = 7;
UPDATE mob_groups SET HP = 205000 WHERE name = 'Specter_Worm' AND zoneid = 174;
UPDATE mob_groups SET HP = 205000 WHERE name = 'Strix' AND zoneid = 110;
UPDATE mob_groups SET HP = 205000 WHERE name = 'Vermillion_Fishfly' AND zoneid = 24;

UPDATE mob_spawn_points SET minLevel = 128, maxLevel = 128 WHERE mobname = 'Arke';
UPDATE mob_spawn_points SET minLevel = 128, maxLevel = 128 WHERE mobname = 'Ayapec';
UPDATE mob_spawn_points SET minLevel = 128, maxLevel = 128 WHERE mobname = 'Azure-toothed_Clawberry';
UPDATE mob_spawn_points SET minLevel = 128, maxLevel = 128 WHERE mobname = 'Bakunawa';
UPDATE mob_spawn_points SET minLevel = 128, maxLevel = 128 WHERE mobname = 'Beist';
UPDATE mob_spawn_points SET minLevel = 128, maxLevel = 128 WHERE mobname = 'Centurio_XX-I';
UPDATE mob_spawn_points SET minLevel = 128, maxLevel = 128 WHERE mobname = 'Coca';
UPDATE mob_spawn_points SET minLevel = 128, maxLevel = 128 WHERE mobname = 'Douma_Weapon';
UPDATE mob_spawn_points SET minLevel = 128, maxLevel = 128 WHERE mobname = 'King_Uropygid';
UPDATE mob_spawn_points SET minLevel = 128, maxLevel = 128 WHERE mobname = 'Kubool_Jas_Mhuufya';
UPDATE mob_spawn_points SET minLevel = 128, maxLevel = 128 WHERE mobname = 'Largantua';
UPDATE mob_spawn_points SET minLevel = 128, maxLevel = 128 WHERE mobname = 'Lumber_Jill';
UPDATE mob_spawn_points SET minLevel = 128, maxLevel = 128 WHERE mobname = 'Mephitas';
UPDATE mob_spawn_points SET minLevel = 128, maxLevel = 128 WHERE mobname = 'Muut';
UPDATE mob_spawn_points SET minLevel = 128, maxLevel = 128 WHERE mobname = 'Specter_Worm';
UPDATE mob_spawn_points SET minLevel = 128, maxLevel = 128 WHERE mobname = 'Strix';
UPDATE mob_spawn_points SET minLevel = 128, maxLevel = 128 WHERE mobname = 'Vermillion_Fishfly';

--  					    129 HP 225000 - 128
UPDATE mob_groups SET HP = 225000 WHERE name = 'Azrael' AND zoneid = 160;
UPDATE mob_groups SET HP = 225000 WHERE name = 'Borealis_Shadow' AND zoneid = 204;
UPDATE mob_groups SET HP = 225000 WHERE name = 'Camahueto' AND zoneid = 5;
UPDATE mob_groups SET HP = 225000 WHERE name = 'Carousing_Celine' AND zoneid = 204;
UPDATE mob_groups SET HP = 225000 WHERE name = 'Grand_Grenade' AND zoneid = 61;
UPDATE mob_groups SET HP = 225000 WHERE name = 'Vedrfolnir' AND zoneid = 113;
UPDATE mob_groups SET HP = 225000 WHERE name = 'Vidmapire' AND zoneid = 72;
UPDATE mob_groups SET HP = 225000 WHERE name = 'Volatile_Cluster' AND zoneid = 25;
UPDATE mob_groups SET HP = 225000 WHERE name = 'Glazemane' AND zoneid = 113;
UPDATE mob_groups SET HP = 225000 WHERE name = 'Wyvernhunter_Bambrox' AND zoneid = 212;

UPDATE mob_spawn_points SET minLevel = 129, maxLevel = 129 WHERE mobname = 'Azrael';
UPDATE mob_spawn_points SET minLevel = 129, maxLevel = 129 WHERE mobname = 'Borealis_Shadow';
UPDATE mob_spawn_points SET minLevel = 129, maxLevel = 129 WHERE mobname = 'Camahueto';
UPDATE mob_spawn_points SET minLevel = 129, maxLevel = 129 WHERE mobname = 'Carousing_Celine';
UPDATE mob_spawn_points SET minLevel = 129, maxLevel = 129 WHERE mobname = 'Grand_Grenade';
UPDATE mob_spawn_points SET minLevel = 129, maxLevel = 129 WHERE mobname = 'Vedrfolnir';
UPDATE mob_spawn_points SET minLevel = 129, maxLevel = 129 WHERE mobname = 'Vidmapire';
UPDATE mob_spawn_points SET minLevel = 129, maxLevel = 129 WHERE mobname = 'Volatile_Cluster';
UPDATE mob_spawn_points SET minLevel = 129, maxLevel = 129 WHERE mobname = 'Glazemane';
UPDATE mob_spawn_points SET minLevel = 129, maxLevel = 129 WHERE mobname = 'Wyvernhunter_Bambrox';

--  					    130 HP 245000 - 135
UPDATE mob_groups SET HP = 245000 WHERE name = 'Hidhaegg' AND zoneid = 153;
UPDATE mob_groups SET HP = 245000 WHERE name = 'Sovereign_Behemoth' AND zoneid = 127;
UPDATE mob_groups SET HP = 245000 WHERE name = 'Tolba' AND zoneid = 128;
UPDATE mob_groups SET HP = 245000 WHERE name = 'Thuban' AND zoneid = 51;
UPDATE mob_groups SET HP = 245000 WHERE name = 'Sarama' AND zoneid = 61;
UPDATE mob_groups SET HP = 245000 WHERE name = 'Shedu' AND zoneid = 79;

UPDATE mob_spawn_points SET minLevel = 130, maxLevel = 130 WHERE mobname = 'Hidhaegg';
UPDATE mob_spawn_points SET minLevel = 130, maxLevel = 130 WHERE mobname = 'Sovereign_Behemoth';
UPDATE mob_spawn_points SET minLevel = 130, maxLevel = 130 WHERE mobname = 'Tolba';
UPDATE mob_spawn_points SET minLevel = 130, maxLevel = 130 WHERE mobname = 'Thuban';
UPDATE mob_spawn_points SET minLevel = 130, maxLevel = 130 WHERE mobname = 'Sarama';
UPDATE mob_spawn_points SET minLevel = 130, maxLevel = 130 WHERE mobname = 'Shedu';

--  					    135 HP 345000 - 145
UPDATE mob_groups SET HP = 345000 WHERE name = 'Tumult_Curator' AND zoneid = 68;

UPDATE mob_spawn_points SET minLevel = 135, maxLevel = 135 WHERE mobname = 'Tumult_Curator';

--				Zitah NMs			120 HP 105000 Tier I
UPDATE mob_groups SET HP = 105000 WHERE name = 'Wepwawet' AND zoneid = 288;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Wepwawet';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Lustful_Lydia' AND zoneid = 288;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Lustful_Lydia';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Aglaophotis' AND zoneid = 288;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Aglaophotis';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Tangata_Manu' AND zoneid = 288;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Tangata_Manu';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Vidala' AND zoneid = 288;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Vidala';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Gestalt' AND zoneid = 288;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Gestalt';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Angrboda' AND zoneid = 288;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Angrboda';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Cunnast' AND zoneid = 288;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Cunnast';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Revetaur' AND zoneid = 288;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Revetaur';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Ferrodon' AND zoneid = 288;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Ferrodon';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Gulltop' AND zoneid = 288;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Gulltop';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Vyala' AND zoneid = 288;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Vyala';
--						    121 HP 125000 Tier II
UPDATE mob_groups SET HP = 125000 WHERE name = 'Emperor_Arthro' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Hugemaw_Harold' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Prickly_Pitriv' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Serpopard_Ninlil' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Abyssdiver' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Keeper_of_Heiligtum' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Muut' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Voso' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Jester_Malatrix' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Immanibugard' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Eschan_Jewelweed' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Ionos' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Sensual_Sandy' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Nosoi' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Brittlis' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Kamohoalii' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000 WHERE name = 'Umdhlebi' AND zoneid = 288;
--  					    122 HP 145000 Tier III
UPDATE mob_groups SET HP = 145000 WHERE name = 'Fleetstalker' AND zoneid = 288;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Shockmaw' AND zoneid = 288;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Urmahlullu' AND zoneid = 288;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Azi_Dahaka' AND zoneid = 288;
--  					    123 HP 155000 HELM
UPDATE mob_groups SET HP = 155000 WHERE name = 'Bucca' AND zoneid = 288;
UPDATE mob_spawn_points SET minLevel = 123, maxLevel = 123 WHERE mobname = 'Bucca';
UPDATE mob_groups SET HP = 155000 WHERE name = 'Puca' AND zoneid = 288;
UPDATE mob_spawn_points SET minLevel = 123, maxLevel = 123 WHERE mobname = 'Puca';
UPDATE mob_groups SET HP = 155000 WHERE name = 'Alpluachra' AND zoneid = 288;
UPDATE mob_spawn_points SET minLevel = 123, maxLevel = 123 WHERE mobname = 'Alpluachra';
UPDATE mob_groups SET HP = 155000 WHERE name = 'Blazewing' AND zoneid = 288;
UPDATE mob_spawn_points SET minLevel = 123, maxLevel = 123 WHERE mobname = 'Blazewing';
UPDATE mob_groups SET HP = 155000 WHERE name = 'Pazuzu' AND zoneid = 288;
UPDATE mob_spawn_points SET minLevel = 123, maxLevel = 123 WHERE mobname = 'Pazuzu';
--  					    125 HP 175000 HELM II
UPDATE mob_groups SET HP = 175000 WHERE name = 'Wrathare' AND zoneid = 288;
UPDATE mob_spawn_points SET minLevel = 125, maxLevel = 125 WHERE mobname = 'Wrathare';
--						    110 HP 78000 Abyssea Konschtat
UPDATE mob_groups SET HP = 78000 WHERE name = 'Alkonost' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Alkonost';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Arimaspi' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Arimaspi';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Ashtaerh_the_Gallvexed' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Ashtaerh_the_Gallvexed';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Bakka' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Bakka';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Balaur' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Balaur';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Bloodguzzler' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Bloodguzzler';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Bombadeel' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Bombadeel';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Clingy_Clare' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Clingy_Clare';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Fear_Gorta' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Fear_Gorta';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Gangly_Gean' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Gangly_Gean';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Guimauve' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Guimauve';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Hexenpilz' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Hexenpilz';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Keratyrannos' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Keratyrannos';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Khalamari' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Khalamari';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Lentor' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Lentor';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Pavan' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Pavan';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Raskovnik' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Raskovnik';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Siranpa-kamuy' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Siranpa-kamuy';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Depths_Digester' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Depths_Digester';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Hadal_Satiator' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Hadal_Satiator';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Meanderer' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Meanderer';
-- 120 HP 105000 Abyssea Konschtat
UPDATE mob_groups SET HP = 105000 WHERE name = 'Kukulkan' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Kukulkan';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Fistule' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Fistule';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Turul' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Turul';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Eccentric_Eve' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Eccentric_Eve';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Bloodeye_Vileberry' AND zoneid = 15;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Bloodeye_Vileberry';
-- 110 HP 78000 Abyssea La Theine
UPDATE mob_groups SET HP = 78000 WHERE name = 'Adamastor' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Adamastor';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Baba_Yaga' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Baba_Yaga';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Brooder' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Brooder';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Chasmic_Hornet' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Chasmic_Hornet';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Dozing_Dorian' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Dozing_Dorian';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Grandgousier' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Grandgousier';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Hadhayosh' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Hadhayosh';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Irrlicht' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Irrlicht';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Keesha_Poppo' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Keesha_Poppo';
UPDATE mob_groups SET HP = 78000 WHERE name = 'La_Theine_Liege' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'La_Theine_Liege';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Lugarhoo' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Lugarhoo';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Mangy-tailed_Marvin' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Mangy-tailed_Marvin';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Megamaw_Mikey' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Megamaw_Mikey';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Megantereon' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Megantereon';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Nahn' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Nahn';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Nguruvilu' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Nguruvilu';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Ovni' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Ovni';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Pantagruel' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Pantagruel';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Piasa' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Piasa';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Poroggo_Dom_Juan' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Poroggo_Dom_Juan';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Toppling_Tuber' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Toppling_Tuber';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Trudging_Thomas' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Trudging_Thomas';
-- 120 HP 105000 Abyssea La Theine
UPDATE mob_groups SET HP = 105000 WHERE name = 'Briareus' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Briareus';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Carabosse' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Carabosse';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Karkinos' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Karkinos';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Ruminator' AND zoneid = 132;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Ruminator';
-- 110 HP 78000 Abyssea Tahrongi
UPDATE mob_groups SET HP = 78000 WHERE name = 'Halimede' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Halimede';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Vetehinen' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Vetehinen';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Ophanim' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Ophanim';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Cannered_Noz' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Cannered_Noz';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Treble_Noctules' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Treble_Noctules';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Gancanagh' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Gancanagh';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Hedetet' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Hedetet';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Abas' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Abas';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Alectryon' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Alectryon';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Tefenet' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Tefenet';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Muscaliet' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Muscaliet';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Lachrymater' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Lachrymater';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Cuelebre' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Cuelebre';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Mictlantecuhtli' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Mictlantecuhtli';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Chukwa' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Chukwa';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Minhocao' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Minhocao';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Adze' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Adze';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Quetzalli' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Quetzalli';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Manananggal' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Manananggal';
-- 120 HP 105000 Abyssea Tahrongi
UPDATE mob_groups SET HP = 105000 WHERE name = 'Chloris' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Chloris';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Glavoid' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Glavoid';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Lacovie' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Lacovie';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Myrmecoleon' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Myrmecoleon';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Ambuscader_Antlion' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Ambuscader_Antlion';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Iratham' AND zoneid = 45;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Iratham';
-- 121 HP 115000 Abyssea Tahrongi
UPDATE mob_groups SET HP = 115000 WHERE name = 'Usurper' AND zoneid = 45;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Yearner' AND zoneid = 45;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Hungerer' AND zoneid = 45;
-- 110 HP 78000 Abyssea Attohwa
UPDATE mob_groups SET HP = 78000 WHERE name = 'Berstuk' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Berstuk';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Blazing_Eruca' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Blazing_Eruca';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Drekavac' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Drekavac';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Gaizkin' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Gaizkin';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Granite_Borer' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Granite_Borer';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Ironclad_Cleaver' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Ironclad_Cleaver';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Kampe' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Kampe';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Kharon' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Kharon';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Mielikki' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Mielikki';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Nightshade' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Nightshade';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Pallid_Percy' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Pallid_Percy';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Smok' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Smok';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Svarbhanu' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Svarbhanu';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Tejas' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Tejas';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Ulhuadshi' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Ulhuadshi';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Wherwetrice' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Wherwetrice';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Ateuvhi' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Ateuvhi';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Eseuvhi' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Eseuvhi';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Lusca' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Lusca';
-- 120 HP 105000 Abyssea Attohwa
UPDATE mob_groups SET HP = 105000 WHERE name = 'Aggressor_Antlion' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Aggressor_Antlion';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Amun' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Amun';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Gieremund' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Gieremund';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Titlacauan' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Titlacauan';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Tunga' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Tunga';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Warbler' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Warbler';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Whiro' AND zoneid = 215;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Whiro';
-- 121 HP 115000 Abyssea Attohwa
UPDATE mob_groups SET HP = 115000 WHERE name = 'Itzpapalotl' AND zoneid = 215;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Yaanei' AND zoneid = 215;
-- 110 HP 78000 Abyssea Misareaux
UPDATE mob_groups SET HP = 78000 WHERE name = 'Amhuluk' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Amhuluk';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Avalerion' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Avalerion';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Cep-Kamuy' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Cep-Kamuy';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Cirein-croin' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Cirein-croin';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Funereal_Apkallu' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Funereal_Apkallu';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Ironclad_Observer' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Ironclad_Observer';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Ironclad_Pulverizer' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Ironclad_Pulverizer';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Ironclad_Severer' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Ironclad_Severer';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Jala' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Jala';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Manohra' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Manohra';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Minax_Bugard' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Minax_Bugard';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Nehebkau' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Nehebkau';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Nonno' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Nonno';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Npfundlwa' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Npfundlwa';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Tuskertrap' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Tuskertrap';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Mighrah' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Mighrah';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Mxghrah' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Mxghrah';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Tristitia' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Tristitia';
-- 120 HP 105000 Abyssea Misareaux
UPDATE mob_groups SET HP = 105000 WHERE name = 'Abyssic_Cluster' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Abyssic_Cluster';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Asanbosam' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Asanbosam';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Athamas' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Athamas';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Flame_Skimmer' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Flame_Skimmer';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Gukumatz' AND zoneid = 216;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Gukumatz';
-- 121 HP 115000 Abyssea Misareaux
UPDATE mob_groups SET HP = 115000 WHERE name = 'Karkatakam' AND zoneid = 216;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Kutharei' AND zoneid = 216;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Sirrush' AND zoneid = 216;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Sobek' AND zoneid = 216;
-- 110 HP 78000 Abyssea Vunkerl
UPDATE mob_groups SET HP = 78000 WHERE name = 'Armillaria' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Armillaria';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Bukhis' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Bukhis';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Chhir_Batti' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Chhir_Batti';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Durinn' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Durinn';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Dvalinn' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Dvalinn';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Fulmotondro' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Fulmotondro';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Gnawtooth_Gary' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Gnawtooth_Gary';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Iku-Turso' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Iku-Turso';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Kadraeth_the_Hatespawn' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Kadraeth_the_Hatespawn';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Karkadann' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Karkadann';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Khalkotaur' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Khalkotaur';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Quasimodo' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Quasimodo';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Rakshas' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Rakshas';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Seps' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Seps';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Xan' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Xan';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Hmzdei' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Hmzdei';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Ketea' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Ketea';
UPDATE mob_groups SET HP = 78000 WHERE name = 'Vuzdei' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 110, maxLevel = 110 WHERE mobname = 'Vuzdei';
-- 120 HP 105000 Abyssea Vunkerl
UPDATE mob_groups SET HP = 105000 WHERE name = 'Ayravata' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Ayravata';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Div-e_Sepid' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Div-e_Sepid';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Hanuman' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Hanuman';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Hrosshvalur' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Hrosshvalur';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Iktomi' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Iktomi';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Lord_Varney' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Lord_Varney';
UPDATE mob_groups SET HP = 105000 WHERE name = 'Pascerpot' AND zoneid = 217;
UPDATE mob_spawn_points SET minLevel = 120, maxLevel = 120 WHERE mobname = 'Pascerpot';
-- 121 HP 115000 Abyssea Vunkerl
UPDATE mob_groups SET HP = 115000 WHERE name = 'Ironclad_Executioner' AND zoneid = 217;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Sedna' AND zoneid = 217;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Sippoy' AND zoneid = 217;
-- 121 HP 115000 Abyssea Altepa
UPDATE mob_groups SET HP = 115000 WHERE name = 'Ansherekh' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Battlerigged_Chariot' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Bennu' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Bugul_Noz' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Chickcharney' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Cuijatender' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Dragua' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Hazhdiha' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Long-Barreled_Chariot' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Orthrus' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Ouzelum' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Sharabha' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Shaula' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Tablilla' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Vadleany' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Waugyl' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Earth_Elemental' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Fire_Elemental' AND zoneid = 218;
-- 122 HP 145000 Abyssea Altepa
UPDATE mob_groups SET HP = 145000 WHERE name = 'Amarok' AND zoneid = 218;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Emperador_de_Altepa' AND zoneid = 218;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Hedjedjet' AND zoneid = 218;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Ironclad_Smiter' AND zoneid = 218;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Rani' AND zoneid = 218;
UPDATE mob_groups SET respawntime = 900, spawntype = 0, HP = 145000 WHERE name = 'Brulo' AND zoneid = 218;
UPDATE mob_spawn_points SET pos_x = -563.9868, pos_y = 0.0900, pos_z = -405.8278, pos_rot = 159 WHERE mobid = 17670580;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Koios' AND zoneid = 218;
--						    121 HP 115000 Abyssea Uleguerand
UPDATE mob_groups SET HP = 115000 WHERE name = 'Anemic_Aloysius' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Apademak' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Audumbla' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Awahondo' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Chillwing_Hwitti' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Impervious_Chariot' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Isgebind' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Koghatu' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Kur' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Refitted_Chariot' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Resheph' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Sisyphus' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Upas-Kamuy' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Veri_Selen' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Chione' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Ice_Elemental' AND zoneid = 253;
UPDATE mob_groups SET respawntime = 900, spawntype = 0, HP = 115000 WHERE name = 'Ogopogo' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Water_Elemental' AND zoneid = 253;
--						    122 HP 145000 Abyssea Uleguerand
UPDATE mob_groups SET HP = 145000 WHERE name = 'Blanga' AND zoneid = 253;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Dhorme_Khimaira' AND zoneid = 253;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Empousa' AND zoneid = 253;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Indrik' AND zoneid = 253;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Ironclad_Triturator' AND zoneid = 253;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Pantokrator' AND zoneid = 253;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Yaguarogui' AND zoneid = 253;
--						    121 HP 115000 Abyssea Grauberg
UPDATE mob_groups SET HP = 115000 WHERE name = 'Amphitrite' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Assailer_Chariot' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Azdaja' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Burstrox_Powderpate' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Ironclad_Sunderer' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Jaculus' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Lorelei' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Melo_Melo' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Minaruja' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Rencounter_Chariot' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Teekesselchen' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Xibalba' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Air_Elemental' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Dark_Elemental' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000 WHERE name = 'Gamayun' AND zoneid = 254;
UPDATE mob_groups SET respawntime = 900, spawntype = 0, HP = 115000 WHERE name = 'Maere' AND zoneid = 254;
UPDATE mob_spawn_points SET pos_x = 511.0331, pos_y = 55.5410, pos_z = 672.2692, pos_rot = 216 WHERE mobid = 17818070;
--						    122 HP 145000 Abyssea Grauberg
UPDATE mob_groups SET HP = 145000 WHERE name = 'Alfard' AND zoneid = 254;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Bomblix_Flamefinger' AND zoneid = 254;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Deelgeed' AND zoneid = 254;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Fleshflayer_Killakriq' AND zoneid = 254;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Fuath' AND zoneid = 254;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Ika-Roa' AND zoneid = 254;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Ningishzida' AND zoneid = 254;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Raja' AND zoneid = 254;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Teugghia' AND zoneid = 254;
--					Void Walker NM	Tier I    122 HP 145000
UPDATE mob_groups SET HP = 145000 WHERE name = 'Sunderclaw';
UPDATE mob_groups SET HP = 145000 WHERE name = 'Quagmire_Pugil';
UPDATE mob_groups SET HP = 145000 WHERE name = 'Globster';
UPDATE mob_groups SET HP = 145000 WHERE name = 'Ground_Guzzler';
UPDATE mob_groups SET HP = 145000 WHERE name = 'Raker_Bee';
UPDATE mob_groups SET HP = 145000 WHERE name = 'Rummager_Beetle';
UPDATE mob_groups SET HP = 145000 WHERE name = 'Aither';
UPDATE mob_groups SET HP = 145000 WHERE name = 'Deorc';
UPDATE mob_groups SET HP = 145000 WHERE name = 'Eorthe';
UPDATE mob_groups SET HP = 145000 WHERE name = 'Puretos';
UPDATE mob_groups SET HP = 145000 WHERE name = 'Pruina';
UPDATE mob_groups SET HP = 145000 WHERE name = 'Beorht';
UPDATE mob_groups SET HP = 145000 WHERE name = 'Thunor';
UPDATE mob_groups SET HP = 145000 WHERE name = 'Lacus';
UPDATE mob_groups SET HP = 145000 WHERE name = 'Gjenganger';
UPDATE mob_groups SET HP = 145000 WHERE name = 'Gorehound';
UPDATE mob_groups SET HP = 145000 WHERE name = 'Void_Hare';
UPDATE mob_groups SET HP = 145000 WHERE name = 'Prickly_Sheep';
--					Void Walker NM	Tier II	  127 HP 185000
UPDATE mob_groups SET HP = 185000 WHERE name = 'Capricornus';
UPDATE mob_spawn_points SET minLevel = 127, maxLevel = 127 WHERE mobname = 'Capricornus';
UPDATE mob_groups SET HP = 185000 WHERE name = 'Yacumama';
UPDATE mob_spawn_points SET minLevel = 127, maxLevel = 127 WHERE mobname = 'Yacumama';
UPDATE mob_groups SET HP = 185000 WHERE name = 'Lamprey_Lord';
UPDATE mob_spawn_points SET minLevel = 127, maxLevel = 127 WHERE mobname = 'Lamprey_Lord';
UPDATE mob_groups SET HP = 185000 WHERE name = 'Shoggoth';
UPDATE mob_spawn_points SET minLevel = 127, maxLevel = 127 WHERE mobname = 'Shoggoth';
UPDATE mob_groups SET HP = 185000 WHERE name = 'Jyeshtha';
UPDATE mob_spawn_points SET minLevel = 127, maxLevel = 127 WHERE mobname = 'Jyeshtha';
UPDATE mob_groups SET HP = 185000 WHERE name = 'Farruca_Fly';
UPDATE mob_spawn_points SET minLevel = 127, maxLevel = 127 WHERE mobname = 'Farruca_Fly';
UPDATE mob_groups SET HP = 185000 WHERE name = 'Skuld';
UPDATE mob_spawn_points SET minLevel = 127, maxLevel = 127 WHERE mobname = 'Skuld';
UPDATE mob_groups SET HP = 185000 WHERE name = 'Urd';
UPDATE mob_spawn_points SET minLevel = 127, maxLevel = 127 WHERE mobname = 'Urd';
UPDATE mob_groups SET HP = 185000 WHERE name = 'Erebus';
UPDATE mob_spawn_points SET minLevel = 127, maxLevel = 127 WHERE mobname = 'Erebus';
UPDATE mob_groups SET HP = 185000 WHERE name = 'Feuerunke';
UPDATE mob_spawn_points SET minLevel = 127, maxLevel = 127 WHERE mobname = 'Feuerunke';
UPDATE mob_groups SET HP = 185000 WHERE name = 'Chesma';
UPDATE mob_spawn_points SET minLevel = 127, maxLevel = 127 WHERE mobname = 'Chesma';
UPDATE mob_groups SET HP = 185000 WHERE name = 'Tammuz';
UPDATE mob_spawn_points SET minLevel = 127, maxLevel = 127 WHERE mobname = 'Tammuz';
--  				Void Walker NM	Tier III  135 HP 345000
UPDATE mob_groups SET HP = 345000 WHERE name = 'Krabkatoa';
UPDATE mob_spawn_points SET minLevel = 135, maxLevel = 135 WHERE mobname = 'Krabkatoa';
UPDATE mob_groups SET HP = 345000 WHERE name = 'Blobdingnag';
UPDATE mob_spawn_points SET minLevel = 135, maxLevel = 135 WHERE mobname = 'Blobdingnag';
UPDATE mob_groups SET HP = 345000 WHERE name = 'Orcus';
UPDATE mob_spawn_points SET minLevel = 135, maxLevel = 135 WHERE mobname = 'Orcus';
UPDATE mob_groups SET HP = 345000 WHERE name = 'Verthandi';
UPDATE mob_spawn_points SET minLevel = 135, maxLevel = 135 WHERE mobname = 'Verthandi';
UPDATE mob_groups SET HP = 345000 WHERE name = 'Lord_Ruthven';
UPDATE mob_spawn_points SET minLevel = 135, maxLevel = 135 WHERE mobname = 'Lord_Ruthven';
UPDATE mob_groups SET HP = 345000 WHERE name = 'Dawon';
UPDATE mob_spawn_points SET minLevel = 135, maxLevel = 135 WHERE mobname = 'Dawon';
--  				Void Walker NM	Tier IV	  150 HP 545000
UPDATE mob_groups SET HP = 545000 WHERE name = 'Yilbegan';
UPDATE mob_spawn_points SET minLevel = 150, maxLevel = 150 WHERE mobname = 'Yilbegan';

-- correct apex jagil mod skills
UPDATE mob_pools SET skill_list_id = 197 WHERE name = 'Apex_Jagil' AND poolid = 5393;

-- correct fistule to be targetable
UPDATE mob_pools SET entityFlags = 647 WHERE name = 'Fistule' AND poolid = 1348;

-- new skill list for Chillwing Hwitti
INSERT INTO mob_skill_lists VALUES('Chillwing Hwitti', 50003, 1709); -- abrasive_tantara
INSERT INTO mob_skill_lists VALUES('Chillwing Hwitti', 50003, 1710); -- deafening_tantara
INSERT INTO mob_skill_lists VALUES('Chillwing Hwitti', 50003, 2004); -- stifling tantara
INSERT INTO mob_skill_lists VALUES('Chillwing Hwitti', 50003, 2003); -- stifling tantara
UPDATE mob_pools SET skill_list_id = 50003 WHERE poolid = 720 AND name = 'Chillwing_Hwitti';
-- add howl to Sarameya
INSERT INTO mob_skill_lists VALUES('Sarameya', 314, 1079); -- howl

UPDATE mob_pools SET entityFlags = 1159 WHERE poolid = 1159 AND name = 'Ironclad_Executioner';

-- add skills into Ovni list
INSERT INTO mob_skill_lists VALUES('torrential_torment', 824, 1374); -- torrential torment
INSERT INTO mob_skill_lists VALUES('flourescene', 824, 1377); -- flourescene - boost
INSERT INTO mob_skill_lists VALUES('invincible', 824, 694); -- invincible


UPDATE mob_spawn_points SET pos_x = -815.1406, pos_y = -9.8131, pos_z = -376.9443, pos_rot = 14 WHERE mobid = 17670559; -- Rani
UPDATE mob_spawn_points SET pos_x = -804.3063, pos_y = -7.9862, pos_z = -365.7767, pos_rot = 39 WHERE mobid = 17670551; -- Rani
UPDATE mob_spawn_points SET pos_x = -825.7000, pos_y = -9.1779, pos_z = -388.5070, pos_rot =  7 WHERE mobid = 17670555; -- Rani

UPDATE mob_pools SET modelid = 0x0000100100000000000000000000000000000000  WHERE name = 'Raker_Bee';
UPDATE mob_pools SET modelid = 0x0000980100000000000000000000000000000000 WHERE name = 'Rummager_Beetle';
-- Zone 289 Escha RuAun lottery NMs
UPDATE mob_groups SET HP = 145000 WHERE name = 'Warder_of_Temperance' AND zoneid = 289;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Warder_of_Faith' AND zoneid = 289;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Warder_of_Justice' AND zoneid = 289;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Warder_of_Hope' AND zoneid = 289;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Warder_of_Prudence' AND zoneid = 289;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Warder_of_Love' AND zoneid = 289;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Warder_of_Fortitude' AND zoneid = 289;
UPDATE mob_spawn_points SET minLevel = 124, maxLevel = 125 WHERE mobname = 'Warder_of_Fortitude';
UPDATE mob_groups SET HP = 145000 WHERE name = 'Warder_of_Dignity' AND zoneid = 289;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Warder_of_Loyalty' AND zoneid = 289;
UPDATE mob_groups SET HP = 145000 WHERE name = 'Warder_of_Mercy' AND zoneid = 289;
-- Zone 291 Reisenjima lottery NMs
UPDATE mob_groups SET HP = 155000 WHERE name = 'Ascended_Chapuli' AND zoneid = 291;
UPDATE mob_groups SET HP = 155000 WHERE name = 'Ascended_Mosquito' AND zoneid = 291;
UPDATE mob_groups SET HP = 155000 WHERE name = 'Ascended_Mantis' AND zoneid = 291;
UPDATE mob_groups SET HP = 155000 WHERE name = 'Ascended_Beetle' AND zoneid = 291;
UPDATE mob_groups SET HP = 155000 WHERE name = 'Ascended_Luckybug' AND zoneid = 291;
UPDATE mob_groups SET HP = 155000 WHERE name = 'Ascended_Lucani' AND zoneid = 291;
UPDATE mob_groups SET HP = 155000 WHERE name = 'Ascended_Porxie' AND zoneid = 291;
UPDATE mob_groups SET HP = 155000 WHERE name = 'Ascended_Cyhiraeth' AND zoneid = 291;
UPDATE mob_groups SET HP = 155000 WHERE name = 'Ascended_Tiger' AND zoneid = 291;
UPDATE mob_groups SET HP = 155000 WHERE name = 'Ascended_Naraka' AND zoneid = 291;
UPDATE mob_groups SET HP = 155000 WHERE name = 'Ascended_panopt' AND zoneid = 291;
UPDATE mob_groups SET HP = 155000 WHERE name = 'Ascended_Poroggo' AND zoneid = 291;
UPDATE mob_groups SET HP = 155000 WHERE name = 'Ascended_Chigoe' AND zoneid = 291;
UPDATE mob_groups SET HP = 155000 WHERE name = 'Ascended_Hippogryph' AND zoneid = 291;
UPDATE mob_groups SET HP = 155000 WHERE name = 'Ascended_Faaz' AND zoneid = 291;
UPDATE mob_groups SET HP = 155000 WHERE name = 'Ascended_Gefyrst' AND zoneid = 291;
UPDATE mob_groups SET HP = 155000 WHERE name = 'Ascended_Ungeweder' AND zoneid = 291;
UPDATE mob_groups SET HP = 155000 WHERE name = 'Heavenly_Veela' AND zoneid = 291;

--Remove Death from Supreme Dragon
DELETE FROM mob_spell_lists WHERE spell_list_id=292 AND spell_id=367;