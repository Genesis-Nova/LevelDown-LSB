--										  Abyssea - ALL NORMAL MOBS +30 LVLs
UPDATE mob_groups SET minLevel = minLevel + 40, maxLevel = maxLevel +45 WHERE zoneid IN (15,45,132,215,216,217,218,253,254) AND spawntype != 128;
UPDATE mob_groups SET minLevel = minLevel + 40, maxLevel = maxLevel +45 WHERE zoneid IN (15,45,132,215,216,217,218,253,254) AND spawntype = 128;
--                      Dynamis NM timed spawn
UPDATE mob_groups SET spawntype = 0, respawntime = 5400 WHERE zoneid IN (39,40,41,42,119,134,135,185,186,187,188) AND spawntype = 32;
--                      LoO
UPDATE mob_groups SET spawntype = 0, respawntime = 600, HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Lord_of_Onzozo' AND spawntype = 32;
--                     Mysticmaker Profblix
UPDATE mob_groups SET spawntype = 0, respawntime = 600, HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Mysticmaker_Profblix' AND spawntype = 128;
--                    Morbolger 
UPDATE mob_groups SET spawntype = 0, respawntime = 3600, HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Morbolger' AND spawntype = 128;
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
UPDATE mob_family_system SET mobradius = 3.0 WHERE familyID = 77;
UPDATE mob_family_system SET mobradius = 3.0 WHERE familyID = 188;
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
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Vulpangue' AND zoneid = 51;
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Chamrosh' AND zoneid = 65;
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Cheese_Hoarder_Gigiroon' AND zoneid = 72;
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Brass_Borer' AND zoneid = 61;
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Claret' AND zoneid = 61;
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Ob' AND zoneid = 72;
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Velionis' AND zoneid = 54;
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Chigre' AND zoneid = 68;
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Lil_Apkallu' AND zoneid = 54;
--						    110 HP 78000 Tier II
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Iriz_Ima' AND zoneid = 51;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Lividroot_Amooshah' AND zoneid = 52;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Iriri_Samariri' AND zoneid = 65;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Anantaboga' AND zoneid = 61;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Dextrose' AND zoneid = 62;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Reacton' AND zoneid = 62;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Verdelet' AND zoneid = 79;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Wulgaru' AND zoneid = 72;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Zareehkl_the_Jubilant' AND zoneid = 54;
--						    115 HP 85000 Tier III
UPDATE mob_groups SET HP = 85000, minLevel = 115, maxLevel = 115 WHERE name = 'Armed_Gears' AND zoneid = 72;
UPDATE mob_groups SET HP = 85000, minLevel = 115, maxLevel = 115 WHERE name = 'Gotoh_Zha_the_Redolent' AND zoneid = 51;
UPDATE mob_groups SET HP = 85000, minLevel = 115, maxLevel = 115 WHERE name = 'Dea' AND zoneid = 52;
UPDATE mob_groups SET HP = 85000, minLevel = 115, maxLevel = 115 WHERE name = 'Achamoth' AND zoneid = 62;
UPDATE mob_groups SET HP = 85000, minLevel = 115, maxLevel = 115 WHERE name = 'Khromasoul_Bhurborlor' AND zoneid = 61;
UPDATE mob_groups SET HP = 85000, minLevel = 115, maxLevel = 115 WHERE name = 'Nosferatu' AND zoneid = 68;
UPDATE mob_groups SET HP = 85000, minLevel = 115, maxLevel = 115 WHERE name = 'Experimental_Lamia' AND zoneid = 79;
UPDATE mob_groups SET HP = 85000, minLevel = 115, maxLevel = 115 WHERE name = 'Mahjlaef_the_Paintorn' AND zoneid = 79;
UPDATE mob_groups SET HP = 85000, minLevel = 115, maxLevel = 115 WHERE name = 'Nuhn' AND zoneid = 54;
--							120 HP 105000 Tier IV
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Tinnin' AND zoneid = 51;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Sarameya' AND zoneid = 61;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Tyger' AND zoneid = 79;
--  					    125 HP 165000 Tier V
UPDATE mob_groups SET HP = 175000, minLevel = 125, maxLevel = 125 WHERE name = 'Pandemonium_Warden' AND zoneid = 68;
--						  VWNM  105 HP 55000 Stage I
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Sallow_Seymour' AND zoneid = 106;
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Ushumgal' AND zoneid = 88;
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Sarimanok' AND zoneid = 101;
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Cottus' AND zoneid = 81;
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Virvatuli' AND zoneid = 115;
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Pancimanci' AND zoneid = 95;
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Goji' AND zoneid = 120;
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Gugalanna' AND zoneid = 98;
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Yatagarasu' AND zoneid = 110;
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Agathos' AND zoneid = 91;
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Cherufe' AND zoneid = 105;
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Taweret' AND zoneid = 84;
UPDATE mob_groups SET HP = 55000, minLevel = 105, maxLevel = 105 WHERE name = 'Holy_Moly' AND zoneid = 123;
--						    110 HP 78000 Stage II
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Lorbulcrud' AND zoneid = 196;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Krabimanjaro' AND zoneid = 193;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Ogbunabali' AND zoneid = 198;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Roly-Poly' AND zoneid = 200;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Laidly_Laurence' AND zoneid = 164;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Mellonia' AND zoneid = 197;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Nympha_Eunomia' AND zoneid = 171;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Gasha-1stform' AND zoneid = 195;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Giltine' AND zoneid = 175;
--						    115 HP 85000 Stage III
UPDATE mob_groups SET HP = 85000, minLevel = 115, maxLevel = 115 WHERE name = 'Murk-veined_Baneberry' AND zoneid = 109;
UPDATE mob_groups SET HP = 85000, minLevel = 115, maxLevel = 115 WHERE name = 'Melancholic_Moira' AND zoneid = 90;
UPDATE mob_groups SET HP = 85000, minLevel = 115, maxLevel = 115 WHERE name = 'Belphoebe' AND zoneid = 104;
UPDATE mob_groups SET HP = 85000, minLevel = 115, maxLevel = 115 WHERE name = 'Kholomodumo' AND zoneid = 82;
UPDATE mob_groups SET HP = 85000, minLevel = 115, maxLevel = 115 WHERE name = 'Lord_Asag' AND zoneid = 119;
UPDATE mob_groups SET HP = 85000, minLevel = 115, maxLevel = 115 WHERE name = 'Akupara' AND zoneid = 97;
UPDATE mob_groups SET HP = 85000, minLevel = 115, maxLevel = 115 WHERE name = 'Kaggen' AND zoneid = 126;
UPDATE mob_groups SET HP = 85000, minLevel = 115, maxLevel = 115 WHERE name = 'Akvan' AND zoneid = 184;
UPDATE mob_groups SET HP = 85000, minLevel = 115, maxLevel = 115 WHERE name = 'Pil-VNM' AND zoneid = 127;
--							120 HP 105000 Stage IV
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Celaeno' AND zoneid = 191;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Hahava' AND zoneid = 190;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Voidwrought' AND zoneid = 194;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Lancing_Lamorak' AND zoneid = 100;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Bhishani' AND zoneid = 107;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Rw_Nw_Prt_M_Hrw' AND zoneid = 116;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Fjalar' AND zoneid = 7;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Abununnu' AND zoneid = 24;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Tsui-Goab' AND zoneid = 25;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Isarukitsck' AND zoneid = 5;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Ildebrann' AND zoneid = 205;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Neith' AND zoneid = 159;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Sabotender_Campeador' AND zoneid = 125;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Tangaroa' AND zoneid = 174;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Malleator_Maurok' AND zoneid = 208;
--						    121 HP 125000 Stage V
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Stachysaurus' AND zoneid = 102;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Gwynn_ap_Nudd' AND zoneid = 108;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Smierc' AND zoneid = 117;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Dimgruzub' AND zoneid = 54;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Brekekekex' AND zoneid = 79;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Yalungur' AND zoneid = 65;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Vanasarvik' AND zoneid = 61;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Cath_Palug' AND zoneid = 121;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Modron' AND zoneid = 153;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Mimic_King' AND zoneid = 122;
--  					    122 HP 145000 Stage VI
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Gaunab' AND zoneid = 83;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Ocythoe' AND zoneid = 89;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Kalasutrax' AND zoneid = 96;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Ig-Alima' AND zoneid = 103;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Botulus_Rex' AND zoneid = 118;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Bismarck' AND zoneid = 4;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Morta' AND zoneid = 68;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Aello' AND zoneid = 130;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Uptala' AND zoneid = 177;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Qilin' AND zoneid = 178;
--					Unity NM	    122 HP 145000 - 75
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Bounding_Belinda' AND zoneid = 107;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Hugemaw_Harold' AND zoneid = 101;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Prickly_Pitriv' AND zoneid = 116;
--						    123 HP 155000 - 99
UPDATE mob_groups SET HP = 155000, minLevel = 123, maxLevel = 123 WHERE name = 'Ironhorn_Baldurno' AND zoneid = 102;
UPDATE mob_groups SET HP = 155000, minLevel = 123, maxLevel = 123 WHERE name = 'Sleepy_Mabel' AND zoneid = 108;
UPDATE mob_groups SET HP = 155000, minLevel = 123, maxLevel = 123 WHERE name = 'Serpopard_Ninlil' AND zoneid = 117;
--						    125 HP 175000 - 119
UPDATE mob_groups SET HP = 175000, minLevel = 125, maxLevel = 125 WHERE name = 'Abyssdiver' AND zoneid = 118;
UPDATE mob_groups SET HP = 175000, minLevel = 125, maxLevel = 125 WHERE name = 'Immanibugard' AND zoneid = 24;
UPDATE mob_groups SET HP = 175000, minLevel = 125, maxLevel = 125 WHERE name = 'Intuila' AND zoneid = 4;
UPDATE mob_groups SET HP = 175000, minLevel = 125, maxLevel = 125 WHERE name = 'Jester_Malatrix' AND zoneid = 126;
UPDATE mob_groups SET HP = 175000, minLevel = 125, maxLevel = 125 WHERE name = 'Orcfeltrap' AND zoneid = 2;
UPDATE mob_groups SET HP = 175000, minLevel = 125, maxLevel = 125 WHERE name = 'Sybaritic_Samantha' AND zoneid = 123;
UPDATE mob_groups SET HP = 175000, minLevel = 125, maxLevel = 125 WHERE name = 'Valkurm_Imperator' AND zoneid = 103;
--							127 HP 185000 - 122
UPDATE mob_groups SET HP = 185000, minLevel = 127, maxLevel = 127 WHERE name = 'Cactrot_Veloz' AND zoneid = 114;
UPDATE mob_groups SET HP = 185000, minLevel = 127, maxLevel = 127 WHERE name = 'Emperor_Arthro' AND zoneid = 104;
UPDATE mob_groups SET HP = 185000, minLevel = 127, maxLevel = 127 WHERE name = 'Garbage_Gel' AND zoneid = 167;
UPDATE mob_groups SET HP = 185000, minLevel = 127, maxLevel = 127 WHERE name = 'Joyous_Green' AND zoneid = 109;
UPDATE mob_groups SET HP = 185000, minLevel = 127, maxLevel = 127 WHERE name = 'Keeper_of_Heiligtum' AND zoneid = 121;
UPDATE mob_groups SET HP = 185000, minLevel = 127, maxLevel = 127 WHERE name = 'Tiyanak' AND zoneid = 25;
UPDATE mob_groups SET HP = 185000, minLevel = 127, maxLevel = 127 WHERE name = 'Voso' AND zoneid = 213;
UPDATE mob_groups SET HP = 185000, minLevel = 127, maxLevel = 127 WHERE name = 'Warblade_Beak' AND zoneid = 119;
UPDATE mob_groups SET HP = 185000, minLevel = 127, maxLevel = 127 WHERE name = 'Woodland_Mender' AND zoneid = 124;
--						    128 HP 205000 - 125
UPDATE mob_groups SET HP = 205000, minLevel = 128, maxLevel = 128 WHERE name = 'Arke' AND zoneid = 120;
UPDATE mob_groups SET HP = 205000, minLevel = 128, maxLevel = 128 WHERE name = 'Ayapec' AND zoneid = 153;
UPDATE mob_groups SET HP = 205000, minLevel = 128, maxLevel = 128 WHERE name = 'Azure-toothed_Clawberry' AND zoneid = 159;
UPDATE mob_groups SET HP = 205000, minLevel = 128, maxLevel = 128 WHERE name = 'Bakunawa' AND zoneid = 176;
UPDATE mob_groups SET HP = 205000, minLevel = 128, maxLevel = 128 WHERE name = 'Beist' AND zoneid = 112;
UPDATE mob_groups SET HP = 205000, minLevel = 128, maxLevel = 128 WHERE name = 'Centurio_XX-I' AND zoneid = 208;
UPDATE mob_groups SET HP = 205000, minLevel = 128, maxLevel = 128 WHERE name = 'Coca' AND zoneid = 205;
UPDATE mob_groups SET HP = 205000, minLevel = 128, maxLevel = 128 WHERE name = 'Douma_Weapon' AND zoneid = 122;
UPDATE mob_groups SET HP = 205000, minLevel = 128, maxLevel = 128 WHERE name = 'King_Uropygid' AND zoneid = 125;
UPDATE mob_groups SET HP = 205000, minLevel = 128, maxLevel = 128 WHERE name = 'Kubool_Jas_Mhuufya' AND zoneid = 51;
UPDATE mob_groups SET HP = 205000, minLevel = 128, maxLevel = 128 WHERE name = 'Largantua' AND zoneid = 111;
UPDATE mob_groups SET HP = 205000, minLevel = 128, maxLevel = 128 WHERE name = 'Lumber_Jill' AND zoneid = 105;
UPDATE mob_groups SET HP = 205000, minLevel = 128, maxLevel = 128 WHERE name = 'Mephitas' AND zoneid = 200;
UPDATE mob_groups SET HP = 205000, minLevel = 128, maxLevel = 128 WHERE name = 'Muut' AND zoneid = 7;
UPDATE mob_groups SET HP = 205000, minLevel = 128, maxLevel = 128 WHERE name = 'Specter_Worm' AND zoneid = 174;
UPDATE mob_groups SET HP = 205000, minLevel = 128, maxLevel = 128 WHERE name = 'Strix' AND zoneid = 110;
UPDATE mob_groups SET HP = 205000, minLevel = 128, maxLevel = 128 WHERE name = 'Vermillion_Fishfly' AND zoneid = 24;
--  					    129 HP 225000 - 128
UPDATE mob_groups SET HP = 225000, minLevel = 129, maxLevel = 129 WHERE name = 'Azrael' AND zoneid = 160;
UPDATE mob_groups SET HP = 225000, minLevel = 129, maxLevel = 129 WHERE name = 'Borealis_Shadow' AND zoneid = 204;
UPDATE mob_groups SET HP = 225000, minLevel = 129, maxLevel = 129 WHERE name = 'Camahueto' AND zoneid = 5;
UPDATE mob_groups SET HP = 225000, minLevel = 129, maxLevel = 129 WHERE name = 'Carousing_Celine' AND zoneid = 204;
UPDATE mob_groups SET HP = 225000, minLevel = 129, maxLevel = 129 WHERE name = 'Grand_Grenade' AND zoneid = 61;
UPDATE mob_groups SET HP = 225000, minLevel = 129, maxLevel = 129 WHERE name = 'Vedrfolnir' AND zoneid = 113;
UPDATE mob_groups SET HP = 225000, minLevel = 129, maxLevel = 129 WHERE name = 'Vidmapire' AND zoneid = 72;
UPDATE mob_groups SET HP = 225000, minLevel = 129, maxLevel = 129 WHERE name = 'Volatile_Cluster' AND zoneid = 25;
UPDATE mob_groups SET HP = 225000, minLevel = 129, maxLevel = 129 WHERE name = 'Glazemane' AND zoneid = 113;
UPDATE mob_groups SET HP = 225000, minLevel = 129, maxLevel = 129 WHERE name = 'Wyvernhunter_Bambrox' AND zoneid = 212;
--  					    130 HP 245000 - 135
UPDATE mob_groups SET HP = 245000, minLevel = 130, maxLevel = 130 WHERE name = 'Hidhaegg' AND zoneid = 153;
UPDATE mob_groups SET HP = 245000, minLevel = 130, maxLevel = 130 WHERE name = 'Sovereign_Behemoth' AND zoneid = 127;
UPDATE mob_groups SET HP = 245000, minLevel = 130, maxLevel = 130 WHERE name = 'Tolba' AND zoneid = 128;
UPDATE mob_groups SET HP = 245000, minLevel = 130, maxLevel = 130 WHERE name = 'Thuban' AND zoneid = 51;
UPDATE mob_groups SET HP = 245000, minLevel = 130, maxLevel = 130 WHERE name = 'Sarama' AND zoneid = 61;
UPDATE mob_groups SET HP = 245000, minLevel = 130, maxLevel = 130 WHERE name = 'Shedu' AND zoneid = 79;
--  					    135 HP 345000 - 145
UPDATE mob_groups SET HP = 345000, minLevel = 135, maxLevel = 135 WHERE name = 'Tumult_Curator' AND zoneid = 68;
--				Zitah NMs			120 HP 105000 Tier I
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Wepwawet' AND zoneid = 288;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Lustful_Lydia' AND zoneid = 288;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Aglaophotis' AND zoneid = 288;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Tangata_Manu' AND zoneid = 288;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Vidala' AND zoneid = 288;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Gestalt' AND zoneid = 288;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Angrboda' AND zoneid = 288;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Cunnast' AND zoneid = 288;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Revetaur' AND zoneid = 288;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Ferrodon' AND zoneid = 288;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Gulltop' AND zoneid = 288;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Vyala' AND zoneid = 288;
--						    121 HP 125000 Tier II
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Emperor_Arthro' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Hugemaw_Harold' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Prickly_Pitriv' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Serpopard_Ninlil' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Abyssdiver' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Keeper_of_Heiligtum' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Muut' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Voso' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Jester_Malatrix' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Immanibugard' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Eschan_Jewelweed' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Ionos' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Sensual_Sandy' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Nosoi' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Brittlis' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Kamohoalii' AND zoneid = 288;
UPDATE mob_groups SET HP = 125000, minLevel = 121, maxLevel = 121 WHERE name = 'Umdhlebi' AND zoneid = 288;
--  					    122 HP 145000 Tier III
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Fleetstalker' AND zoneid = 288;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Shockmaw' AND zoneid = 288;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Urmahlullu' AND zoneid = 288;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Azi_Dahaka' AND zoneid = 288;
--  					    123 HP 155000 HELM
UPDATE mob_groups SET HP = 155000, minLevel = 123, maxLevel = 123 WHERE name = 'Bucca' AND zoneid = 288;
UPDATE mob_groups SET HP = 155000, minLevel = 123, maxLevel = 123 WHERE name = 'Puca' AND zoneid = 288;
UPDATE mob_groups SET HP = 155000, minLevel = 123, maxLevel = 123 WHERE name = 'Alpluachra' AND zoneid = 288;
UPDATE mob_groups SET HP = 155000, minLevel = 123, maxLevel = 123 WHERE name = 'Blazewing' AND zoneid = 288;
UPDATE mob_groups SET HP = 155000, minLevel = 123, maxLevel = 123 WHERE name = 'Pazuzu' AND zoneid = 288;
--  					    125 HP 175000 HELM II
UPDATE mob_groups SET HP = 175000, minLevel = 125, maxLevel = 125 WHERE name = 'Wrathare' AND zoneid = 288;
--						    110 HP 78000 Abyssea Konschtat
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Alkonost' AND zoneid = 15;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Arimaspi' AND zoneid = 15;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Ashtaerh_the_Gallvexed' AND zoneid = 15;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Bakka' AND zoneid = 15;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Balaur' AND zoneid = 15;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Bloodguzzler' AND zoneid = 15;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Bombadeel' AND zoneid = 15;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Clingy_Clare' AND zoneid = 15;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Fear_Gorta' AND zoneid = 15;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Gangly_Gean' AND zoneid = 15;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Guimauve' AND zoneid = 15;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Hexenpilz' AND zoneid = 15;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Keratyrannos' AND zoneid = 15;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Khalamari' AND zoneid = 15;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Lentor' AND zoneid = 15;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Pavan' AND zoneid = 15;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Raskovnik' AND zoneid = 15;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Siranpa-kamuy' AND zoneid = 15;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Depths_Digester' AND zoneid = 15;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Hadal_Satiator' AND zoneid = 15;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Meanderer' AND zoneid = 15;
--						    120 HP 105000 Abyssea Konschtat
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Kukulkan' AND zoneid = 15;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Fistule' AND zoneid = 15;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Turul' AND zoneid = 15;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Eccentric_Eve' AND zoneid = 15;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Bloodeye_Vileberry' AND zoneid = 15;
--						    110 HP 78000 Abyssea La Theine
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Adamastor' AND zoneid = 132;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Baba_Yaga' AND zoneid = 132;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Brooder' AND zoneid = 132;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Chasmic_Hornet' AND zoneid = 132;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Dozing_Dorian' AND zoneid = 132;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Grandgousier' AND zoneid = 132;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Hadhayosh' AND zoneid = 132;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Irrlicht' AND zoneid = 132;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Keesha_Poppo' AND zoneid = 132;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'La_Theine_Liege' AND zoneid = 132;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Lugarhoo' AND zoneid = 132;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Mangy-tailed_Marvin' AND zoneid = 132;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Megamaw_Mikey' AND zoneid = 132;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Megantereon' AND zoneid = 132;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Nahn' AND zoneid = 132;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Nguruvilu' AND zoneid = 132;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Ovni' AND zoneid = 132;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Pantagruel' AND zoneid = 132;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Piasa' AND zoneid = 132;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Poroggo_Dom_Juan' AND zoneid = 132;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Toppling_Tuber' AND zoneid = 132;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Trudging_Thomas' AND zoneid = 132;
--						    120 HP 105000 Abyssea La Theine
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Briareus' AND zoneid = 132;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Carabosse' AND zoneid = 132;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Karkinos' AND zoneid = 132;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Ruminator' AND zoneid = 132;
--						    110 HP 78000 Abyssea Tahrongi
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Halimede' AND zoneid = 45;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Vetehinen' AND zoneid = 45;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Ophanim' AND zoneid = 45;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Cannered_Noz' AND zoneid = 45;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Treble_Noctules' AND zoneid = 45;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Gancanagh' AND zoneid = 45;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Hedetet' AND zoneid = 45;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Abas' AND zoneid = 45;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Alectryon' AND zoneid = 45;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Tefenet' AND zoneid = 45;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Muscaliet' AND zoneid = 45;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Lachrymater' AND zoneid = 45;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Cuelebre' AND zoneid = 45;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Mictlantecuhtli' AND zoneid = 45;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Chukwa' AND zoneid = 45;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Minhocao' AND zoneid = 45;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Adze' AND zoneid = 45;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Quetzalli' AND zoneid = 45;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Manananggal' AND zoneid = 45;
--						    120 HP 105000 Abyssea Tahrongi
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Chloris' AND zoneid = 45;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Glavoid' AND zoneid = 45;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Lacovie' AND zoneid = 45;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Myrmecoleon' AND zoneid = 45;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Ambuscader_Antlion' AND zoneid = 45;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Iratham' AND zoneid = 45;
--						    121 HP 115000 Abyssea Tahrongi
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Usurper' AND zoneid = 45;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Yearner' AND zoneid = 45;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Hungerer' AND zoneid = 45;
--						    110 HP 78000 Abyssea Attohwa
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Berstuk' AND zoneid = 215;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Blazing_Eruca' AND zoneid = 215;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Drekavac' AND zoneid = 215;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Gaizkin' AND zoneid = 215;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Granite_Borer' AND zoneid = 215;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Ironclad_Cleaver' AND zoneid = 215;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Kampe' AND zoneid = 215;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Kharon' AND zoneid = 215;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Mielikki' AND zoneid = 215;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Nightshade' AND zoneid = 215;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Pallid_Percy' AND zoneid = 215;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Smok' AND zoneid = 215;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Svarbhanu' AND zoneid = 215;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Tejas' AND zoneid = 215;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Ulhuadshi' AND zoneid = 215;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Wherwetrice' AND zoneid = 215;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Ateuvhi' AND zoneid = 215;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Eseuvhi' AND zoneid = 215;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Lusca' AND zoneid = 215;
--						    120 HP 105000 Abyssea Attohwa
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Aggressor_Antlion' AND zoneid = 215;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Amun' AND zoneid = 215;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Gieremund' AND zoneid = 215;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Titlacauan' AND zoneid = 215;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Tunga' AND zoneid = 215;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Warbler' AND zoneid = 215;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Whiro' AND zoneid = 215;
--						    121 HP 115000 Abyssea Attohwa
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Itzpapalotl' AND zoneid = 215;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Yaanei' AND zoneid = 215;
--						    110 HP 78000 Abyssea Misareaux
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Amhuluk' AND zoneid = 216;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Avalerion' AND zoneid = 216;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Cep-Kamuy' AND zoneid = 216;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Cirein-croin' AND zoneid = 216;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Funereal_Apkallu' AND zoneid = 216;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Ironclad_Observer' AND zoneid = 216;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Ironclad_Pulverizer' AND zoneid = 216;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Ironclad_Severer' AND zoneid = 216;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Jala' AND zoneid = 216;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Manohra' AND zoneid = 216;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Minax_Bugard' AND zoneid = 216;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Nehebkau' AND zoneid = 216;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Nonno' AND zoneid = 216;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Npfundlwa' AND zoneid = 216;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Tuskertrap' AND zoneid = 216;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Mighrah' AND zoneid = 216;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Mxghrah' AND zoneid = 216;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Tristitia' AND zoneid = 216;
--						    120 HP 105000 Abyssea Misareaux
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Abyssic_Cluster' AND zoneid = 216;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Asanbosam' AND zoneid = 216;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Athamas' AND zoneid = 216;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Flame_Skimmer' AND zoneid = 216;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Gukumatz' AND zoneid = 216;
--						    121 HP 115000 Abyssea Misareaux
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Karkatakam' AND zoneid = 216;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Kutharei' AND zoneid = 216;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Sirrush' AND zoneid = 216;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Sobek' AND zoneid = 216;
--						    110 HP 78000 Abyssea Vunkerl
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Armillaria' AND zoneid = 217;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Bukhis' AND zoneid = 217;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Chhir_Batti' AND zoneid = 217;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Durinn' AND zoneid = 217;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Dvalinn' AND zoneid = 217;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Fulmotondro' AND zoneid = 217;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Gnawtooth_Gary' AND zoneid = 217;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Iku-Turso' AND zoneid = 217;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Kadraeth_the_Hatespawn' AND zoneid = 217;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Karkadann' AND zoneid = 217;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Khalkotaur' AND zoneid = 217;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Quasimodo' AND zoneid = 217;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Rakshas' AND zoneid = 217;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Seps' AND zoneid = 217;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Xan' AND zoneid = 217;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Hmzdei' AND zoneid = 217;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Ketea' AND zoneid = 217;
UPDATE mob_groups SET HP = 78000, minLevel = 110, maxLevel = 110 WHERE name = 'Vuzdei' AND zoneid = 217;
--						    120 HP 105000 Abyssea Vunkerl
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Ayravata' AND zoneid = 217;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Div-e_Sepid' AND zoneid = 217;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Hanuman' AND zoneid = 217;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Hrosshvalur' AND zoneid = 217;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Iktomi' AND zoneid = 217;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Lord_Varney' AND zoneid = 217;
UPDATE mob_groups SET HP = 105000, minLevel = 120, maxLevel = 120 WHERE name = 'Pascerpot' AND zoneid = 217;
--						    121 HP 115000 Abyssea Vunkerl
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Ironclad_Executioner' AND zoneid = 217;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Sedna' AND zoneid = 217;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Sippoy' AND zoneid = 217;
--						    121 HP 115000 Abyssea Altepa
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Ansherekh' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Battlerigged_Chariot' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Bennu' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Bugul_Noz' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Chickcharney' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Cuijatender' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Dragua' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Hazhdiha' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Long-Barreled_Chariot' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Orthrus' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Ouzelum' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Sharabha' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Shaula' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Tablilla' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Vadleany' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Waugyl' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Earth_Elemental' AND zoneid = 218;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Fire_Elemental' AND zoneid = 218;
--						    122 HP 145000 Abyssea Altepa
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Amarok' AND zoneid = 218;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Emperador_de_Altepa' AND zoneid = 218;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Hedjedjet' AND zoneid = 218;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Ironclad_Smiter' AND zoneid = 218;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Rani' AND zoneid = 218;
UPDATE mob_groups SET respawntime = 900, spawntype = 0, HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Brulo' AND zoneid = 218;
UPDATE mob_spawn_points SET pos_x = -563.9868, pos_y = 0.0900, pos_z = -405.8278, pos_rot = 159 WHERE mobid = 17670580;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Koios' AND zoneid = 218;
--						    121 HP 115000 Abyssea Uleguerand
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Anemic_Aloysius' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Apademak' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Audumbla' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Awahondo' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Chillwing_Hwitti' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Impervious_Chariot' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Isgebind' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Koghatu' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Kur' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Refitted_Chariot' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Resheph' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Sisyphus' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Upas-Kamuy' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Veri_Selen' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Chione' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Ice_Elemental' AND zoneid = 253;
UPDATE mob_groups SET respawntime = 900, spawntype = 0, HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Ogopogo' AND zoneid = 253;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Water_Elemental' AND zoneid = 253;
--						    122 HP 145000 Abyssea Uleguerand
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Blanga' AND zoneid = 253;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Dhorme_Khimaira' AND zoneid = 253;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Empousa' AND zoneid = 253;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Indrik' AND zoneid = 253;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Ironclad_Triturator' AND zoneid = 253;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Pantokrator' AND zoneid = 253;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Yaguarogui' AND zoneid = 253;
--						    121 HP 115000 Abyssea Grauberg
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Amphitrite' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Assailer_Chariot' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Azdaja' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Burstrox_Powderpate' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Ironclad_Sunderer' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Jaculus' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Lorelei' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Melo_Melo' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Minaruja' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Rencounter_Chariot' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Teekesselchen' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Xibalba' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Air_Elemental' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Dark_Elemental' AND zoneid = 254;
UPDATE mob_groups SET HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Gamayun' AND zoneid = 254;
UPDATE mob_groups SET respawntime = 900, spawntype = 0, HP = 115000, minLevel = 121, maxLevel = 121 WHERE name = 'Maere' AND zoneid = 254;
UPDATE mob_spawn_points SET pos_x = 511.0331, pos_y = 55.5410, pos_z = 672.2692, pos_rot = 216 WHERE mobid = 17818070;
--						    122 HP 145000 Abyssea Grauberg
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Alfard' AND zoneid = 254;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Bomblix_Flamefinger' AND zoneid = 254;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Deelgeed' AND zoneid = 254;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Fleshflayer_Killakriq' AND zoneid = 254;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Fuath' AND zoneid = 254;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Ika-Roa' AND zoneid = 254;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Ningishzida' AND zoneid = 254;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Raja' AND zoneid = 254;
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Teugghia' AND zoneid = 254;
--					Void Walker NM	Tier I    122 HP 145000
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Sunderclaw';
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Quagmire_Pugil';
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Globster';
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Ground_Guzzler';
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Raker_Bee';
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Rummager_Beetle';
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Aither';
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Deorc';
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Eorthe';
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Puretos';
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Pruina';
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Beorht';
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Thunor';
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Lacus';
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Gjenganger';
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Gorehound';
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Void_Hare';
UPDATE mob_groups SET HP = 145000, minLevel = 122, maxLevel = 122 WHERE name = 'Prickly_Sheep';
--					Void Walker NM	Tier II	  127 HP 185000
UPDATE mob_groups SET HP = 185000, minLevel = 127, maxLevel = 127 WHERE name = 'Capricornus';
UPDATE mob_groups SET HP = 185000, minLevel = 127, maxLevel = 127 WHERE name = 'Yacumama';
UPDATE mob_groups SET HP = 185000, minLevel = 127, maxLevel = 127 WHERE name = 'Lamprey_Lord';
UPDATE mob_groups SET HP = 185000, minLevel = 127, maxLevel = 127 WHERE name = 'Shoggoth';
UPDATE mob_groups SET HP = 185000, minLevel = 127, maxLevel = 127 WHERE name = 'Jyeshtha';
UPDATE mob_groups SET HP = 185000, minLevel = 127, maxLevel = 127 WHERE name = 'Farruca_Fly';
UPDATE mob_groups SET HP = 185000, minLevel = 127, maxLevel = 127 WHERE name = 'Skuld';
UPDATE mob_groups SET HP = 185000, minLevel = 127, maxLevel = 127 WHERE name = 'Urd';
UPDATE mob_groups SET HP = 185000, minLevel = 127, maxLevel = 127 WHERE name = 'Erebus';
UPDATE mob_groups SET HP = 185000, minLevel = 127, maxLevel = 127 WHERE name = 'Feuerunke';
UPDATE mob_groups SET HP = 185000, minLevel = 127, maxLevel = 127 WHERE name = 'Chesma';
UPDATE mob_groups SET HP = 185000, minLevel = 127, maxLevel = 127 WHERE name = 'Tammuz';
--  				Void Walker NM	Tier III  135 HP 345000
UPDATE mob_groups SET HP = 345000, minLevel = 135, maxLevel = 135 WHERE name = 'Krabkatoa';
UPDATE mob_groups SET HP = 345000, minLevel = 135, maxLevel = 135 WHERE name = 'Blobdingnag';
UPDATE mob_groups SET HP = 345000, minLevel = 135, maxLevel = 135 WHERE name = 'Orcus';
UPDATE mob_groups SET HP = 345000, minLevel = 135, maxLevel = 135 WHERE name = 'Verthandi';
UPDATE mob_groups SET HP = 345000, minLevel = 135, maxLevel = 135 WHERE name = 'Lord_Ruthven';
UPDATE mob_groups SET HP = 345000, minLevel = 135, maxLevel = 135 WHERE name = 'Dawon';
--  				Void Walker NM	Tier IV	  150 HP 545000
UPDATE mob_groups SET HP = 545000, minLevel = 150, maxLevel = 150 WHERE name = 'Yilbegan';

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