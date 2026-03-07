-- current max mob drop id is 5000, starting at 4500 to ignore future lsb adds hopefully
-- Abyssea
UPDATE mob_droplist SET itemRate = 1000 WHERE dropId = 47 and itemRate = 100; -- alfard fang drop rate correction
UPDATE mob_droplist SET dropType = 1, groupId = 1, groupRate = 100, itemRate = 1000 WHERE dropId = 47 and itemRate = 50; -- alfard fang drop rate correction
UPDATE mob_droplist SET itemrate = 500 WHERE itemid IN (
    2961, 3094, 4400, 4756, 5568, 11434, 11444, 11445, 11572, 11573, 11623, 
    11647, 11648, 11649, 11650, 11652, 11653, 11694, 11695, 11696, 11701, 
    11702, 11703, 11709, 11718, 11721, 11722, 11752, 11754, 11800, 11886, 
    11898, 11899, 11900, 11901, 11902, 11903, 11905, 11906, 11907, 11908, 
    11909, 11910, 11937, 11947, 12318, 15910, 16190, 16308, 16309, 17047, 
    17110, 17856, 18456, 18514, 18620, 18801, 18803, 18833, 18834, 18893, 
    18900, 18968, 19052, 19053, 19054, 19055, 19056, 19057, 19058, 19059, 
    19131, 19190, 19193, 19257, 19258, 19259, 19261, 19289, 19313, 19315, 
    19732
) OR itemid BETWEEN 3110 AND 3293
  OR itemid BETWEEN 3315 AND 3315;
  -- Adjusting existing drop lists
DELETE FROM mob_droplist WHERE dropId = 1536 AND itemId = 18852; -- delete octave club from LoO
INSERT INTO mob_droplist VALUES(1536, 0, 0, 1000, 17440, 1); -- add kraken club to LoO
INSERT INTO mob_droplist VALUES(1763,0,0,1000,14724,5); -- Moldavite Earring (Rare, 5%) Mysticmaker_Profblix
INSERT INTO mob_droplist VALUES(2418, 0, 1, 100, 18852, 334); -- add Octave club to Tinnin
INSERT INTO mob_droplist VALUES(2162, 0, 1, 100, 18852, 333); -- add Octave club to Sarameya
INSERT INTO mob_droplist VALUES(2508, 0, 1, 100, 18852, 333); -- add Octave club to Tyger
INSERT INTO mob_droplist VALUES(2418, 0, 1, 100, 19163, 333); -- add Nightfall to Tinnin
INSERT INTO mob_droplist VALUES(2162, 0, 1, 100, 19163, 333); -- add Nightfall to Sarameya
INSERT INTO mob_droplist VALUES(2508, 0, 1, 100, 19163, 334); -- add Nightfall to Tyger
UPDATE mob_droplist SET itemRate = 500 WHERE dropId = 193 and itemRate = 20; -- Flask Of Romaeve Spring Water drop rate correction - Aura Pots
INSERT INTO mob_droplist VALUES(2820,1,1,1000,4064,250); -- Rem tale 1 / NMs Mother Globe
INSERT INTO mob_droplist VALUES(2820,1,1,1000,4069,250); -- Rem tale 6 / NMs Mother Globe
INSERT INTO mob_droplist VALUES(2820,1,2,1000,844,250); -- Phoenix Feather / NMs Mother Globe
INSERT INTO mob_droplist VALUES(2820,1,2,1000,1311,250); -- Oxblood / NMs Mother Globe
INSERT INTO mob_droplist VALUES(2820,1,3,1000,16605,333); -- Enhancing Sword / NMs Mother Globe
INSERT INTO mob_droplist VALUES(2820,1,3,1000,20628,333); -- Mindmeld Kris / NMs Mother Globe
INSERT INTO mob_droplist VALUES(2820,1,3,1000,28571,334); -- Waterfall Ring / NMs Mother Globe
INSERT INTO mob_droplist VALUES(2326,1,1,1000,4065,250); -- Rem tale 2 / NMs Steam Cleaner
INSERT INTO mob_droplist VALUES(2326,1,1,1000,4066,250); -- Rem tale 3 / NMs Steam Cleaner
INSERT INTO mob_droplist VALUES(2326,1,2,1000,837,250); -- Malboro Fiber / NMs Steam Cleaner
INSERT INTO mob_droplist VALUES(2326,1,2,1000,844,250); -- Phoenix Feather / NMs Steam Cleaner
INSERT INTO mob_droplist VALUES(2326,1,3,1000,28657,500); -- Kaidate / NMs Steam Cleaner
INSERT INTO mob_droplist VALUES(2326,1,3,1000,20625,500); -- Secespita / NMs Steam Cleaner
INSERT INTO mob_droplist VALUES(2821,1,1,1000,4066,250); -- Rem tale 3 / NMs Faust
INSERT INTO mob_droplist VALUES(2821,1,1,1000,4067,250); -- Rem tale 4 / NMs Faust
INSERT INTO mob_droplist VALUES(2821,1,2,1000,1110,250); -- Beetle Blood / NMs Faust
INSERT INTO mob_droplist VALUES(2821,1,2,1000,837,250); -- Malboro Fiber / NMs Faust
INSERT INTO mob_droplist VALUES(2821,1,3,1000,28512,333); -- Dawn Earring / NMs Faust
INSERT INTO mob_droplist VALUES(2821,1,3,1000,28574,333); -- Icecrack Ring / NMs Faust
INSERT INTO mob_droplist VALUES(2821,1,3,1000,21120,333); -- Patriarch Cane / NMs Faust
INSERT INTO mob_droplist VALUES(357,1,1,1000,4067,250); -- Rem tale 4 / NMs Brigandish Blade
INSERT INTO mob_droplist VALUES(357,1,1,1000,4068,250); -- Rem tale 5 / NMs Brigandish Blade
INSERT INTO mob_droplist VALUES(357,1,2,1000,836,250); -- Damascene Cloth / NMs Brigandish Blade
INSERT INTO mob_droplist VALUES(357,1,2,1000,1110,250); -- Beetle Blood / NMs Brigandish Blade
INSERT INTO mob_droplist VALUES(357,1,3,1000,28304,500); -- Litany Clogs / NMs Brigandish Blade
INSERT INTO mob_droplist VALUES(357,1,3,1000,28383,500); -- Pentalagus Charm / NMs Brigandish Blade
INSERT INTO mob_droplist VALUES(2822,1,1,1000,4068,250); -- Rem tale 5 / NMs Ullikummi
INSERT INTO mob_droplist VALUES(2822,1,1,1000,4065,250); -- Rem tale 2 / NMs Ullikummi
INSERT INTO mob_droplist VALUES(2822,1,2,1000,1311,250); -- Oxblood / NMs Ullikummi
INSERT INTO mob_droplist VALUES(2822,1,2,1000,836,250); -- Damascene Cloth / NMs Ullikummi
INSERT INTO mob_droplist VALUES(2822,1,3,1000,21382,500); -- Dosis Tathlum / NMs Ullikummi
INSERT INTO mob_droplist VALUES(2822,1,3,1000,20956,500); -- Sibat / NMs Ullikummi
INSERT INTO mob_droplist VALUES(638,1,1,1000,4069,250); -- Rem tale 6 / NMs Despot
INSERT INTO mob_droplist VALUES(638,1,1,1000,4064,250); -- Rem tale 1 / NMs Despot
INSERT INTO mob_droplist VALUES(638,1,2,1000,844,250); -- Phoenix Feather / NMs Despot
INSERT INTO mob_droplist VALUES(638,1,2,1000,1311,250); -- Oxblood / NMs Despot
INSERT INTO mob_droplist VALUES(638,1,3,1000,28165,333); -- Laktisma Leggings / NMs Despot
INSERT INTO mob_droplist VALUES(638,1,3,1000,20542,333); -- Gnafrons Adargas / NMs Despot
INSERT INTO mob_droplist VALUES(638,1,3,1000,28027,334); -- Boor Bracelets / NMs Despot
INSERT INTO mob_droplist VALUES(2823,1,1,1000,4064,250); -- Rem tale 1 / NMs Olla Grande
INSERT INTO mob_droplist VALUES(2823,1,1,1000,4065,250); -- Rem tale 2 / NMs Olla Grande
INSERT INTO mob_droplist VALUES(2823,1,2,1000,836,250); -- Damascene Cloth / NMs Olla Grande
INSERT INTO mob_droplist VALUES(2823,1,2,1000,844,250); -- Phoenix Feather / NMs Olla Grande
INSERT INTO mob_droplist VALUES(2823,1,3,1000,20629,500); -- Legato Dagger / NMs Olla Grande
INSERT INTO mob_droplist VALUES(2823,1,3,1000,28456,500); -- Kasiri Belt / NMs Olla Grande
INSERT INTO mob_droplist VALUES(2800,1,1,1000,4066,250); -- Rem tale 3 / NMs Zipacna
INSERT INTO mob_droplist VALUES(2800,1,1,1000,4067,250); -- Rem tale 4 / NMs Zipacna
INSERT INTO mob_droplist VALUES(2800,1,2,1000,1110,250); -- Beetle Blood / NMs Zipacna
INSERT INTO mob_droplist VALUES(2800,1,2,1000,837,250); -- Malboro Fiber / NMs Zipacna
INSERT INTO mob_droplist VALUES(2800,1,3,1000,28608,500); -- Earthcry Mantle / NMs Zipacna
INSERT INTO mob_droplist VALUES(2800,1,3,1000,21252,500); -- One-eyed / NMs Zipacna
INSERT INTO mob_droplist VALUES(1397,1,1,1000,4067,250); -- Rem tale 4 / NMs Jailer of Fortitude
INSERT INTO mob_droplist VALUES(1397,1,1,1000,4068,250); -- Rem tale 5 / NMs Jailer of Fortitude
INSERT INTO mob_droplist VALUES(1397,1,2,1000,836,250); -- Damascene Cloth / NMs Jailer of Fortitude
INSERT INTO mob_droplist VALUES(1397,1,2,1000,1110,250); -- Beetle Blood / NMs Jailer of Fortitude
INSERT INTO mob_droplist VALUES(1397,1,3,1000,20767,333); -- Medicor Sword / NMs Jailer of Fortitude
INSERT INTO mob_droplist VALUES(1397,1,3,1000,20818,333); -- Hurlbat / NMs Jailer of Fortitude
INSERT INTO mob_droplist VALUES(1397,1,3,1000,28455,334); -- Ovate Rope / NMs Jailer of Fortitude
INSERT INTO mob_droplist VALUES(1402,1,1,1000,4068,250); -- Rem tale 5 / NMs Jailer of Temperance
INSERT INTO mob_droplist VALUES(1402,1,1,1000,4064,250); -- Rem tale 1 / NMs Jailer of Temperance
INSERT INTO mob_droplist VALUES(1402,1,2,1000,1311,250); -- Oxblood / NMs Jailer of Temperance
INSERT INTO mob_droplist VALUES(1402,1,2,1000,836,250); -- Damascene Cloth / NMs Jailer of Temperance
INSERT INTO mob_droplist VALUES(1402,1,3,1000,21045,500); -- Bukyoku / NMs Jailer of Temperance
INSERT INTO mob_droplist VALUES(1402,1,3,1000,28609,500); -- Savior Mantle / NMs Jailer of Temperance
INSERT INTO mob_droplist VALUES(1396,1,1,1000,4069,250); -- Rem tale 6 / NMs Jailer of Faith
INSERT INTO mob_droplist VALUES(1396,1,1,1000,4070,250); -- Rem tale 7 / NMs Jailer of Faith
INSERT INTO mob_droplist VALUES(1396,1,2,1000,844,250); -- Phoenix Feather / NMs Jailer of Faith
INSERT INTO mob_droplist VALUES(1396,1,2,1000,1311,250); -- Oxblood / NMs Jailer of Faith
INSERT INTO mob_droplist VALUES(1396,1,3,1000,28572,500); -- jwalamukhi Ring / NMs Jailer of Faith
INSERT INTO mob_droplist VALUES(1396,1,3,1000,27735,500); -- Enedron Glasses / NMs Jailer of Faith
INSERT INTO mob_droplist VALUES(1399,1,1,1000,4070,250); -- Rem tale 7 / NMs Jailer of Justice
INSERT INTO mob_droplist VALUES(1399,1,1,1000,4071,250); -- Rem tale 8 / NMs Jailer of Justice
INSERT INTO mob_droplist VALUES(1399,1,2,1000,837,250); -- Malboro Fiber / NMs Jailer of Justice
INSERT INTO mob_droplist VALUES(1399,1,2,1000,844,250); -- Phoenix Feather / NMs Jailer of Justice
INSERT INTO mob_droplist VALUES(1399,1,3,1000,21000,333); -- Magorokuhocho / NMs Jailer of Justice
INSERT INTO mob_droplist VALUES(1399,1,3,1000,17528,333); -- Astral Signa / NMs Jailer of Justice
INSERT INTO mob_droplist VALUES(1399,1,3,1000,20866,334); -- Parashu / NMs Jailer of Justice
INSERT INTO mob_droplist VALUES(1398,1,1,1000,4071,250); -- Rem tale 8 / NMs Jailer of Hope
INSERT INTO mob_droplist VALUES(1398,1,1,1000,4072,250); -- Rem tale 9 / NMs Jailer of Hope
INSERT INTO mob_droplist VALUES(1398,1,2,1000,1110,250); -- Beetle Blood / NMs Jailer of Hope
INSERT INTO mob_droplist VALUES(1398,1,2,1000,837,250); -- Malboro Fiber / NMs Jailer of Hope
INSERT INTO mob_droplist VALUES(1398,1,3,1000,20541,500); -- Pinion Cesti / NMs Jailer of Hope
INSERT INTO mob_droplist VALUES(1398,1,3,1000,20999,500); -- Habukatana / NMs Jailer of Hope
INSERT INTO mob_droplist VALUES(1401,1,1,1000,4072,250); -- Rem tale 9 / NMs Jailer of Prudance
INSERT INTO mob_droplist VALUES(1401,1,1,1000,4073,250); -- Rem tale 10 / NMs Jailer of Prudance
INSERT INTO mob_droplist VALUES(1401,1,2,1000,836,250); -- Damascene Cloth / NMs Jailer of Prudance
INSERT INTO mob_droplist VALUES(1401,1,2,1000,1110,250); -- Beetle Blood / NMs Jailer of Prudance
INSERT INTO mob_droplist VALUES(1401,1,3,1000,21185,500); -- Boonwell Staff / NMs Jailer of Prudance
INSERT INTO mob_droplist VALUES(1401,1,3,1000,20729,500); -- Vivifiante / NMs Jailer of Prudance
INSERT INTO mob_droplist VALUES(1400,1,1,1000,4073,250); -- Rem tale 10 / NMs Jailer of love
INSERT INTO mob_droplist VALUES(1400,1,1,1000,4069,250); -- Rem tale 6 / NMs Jailer of love
INSERT INTO mob_droplist VALUES(1400,1,2,1000,1311,250); -- Oxblood / NMs Jailer of love
INSERT INTO mob_droplist VALUES(1400,1,2,1000,836,250); -- Damascene Cloth / NMs Jailer of love
INSERT INTO mob_droplist VALUES(1400,1,3,1000,20627,500); -- Surcoufs Jambiya / NMs Jailer of love
INSERT INTO mob_droplist VALUES(1400,1,3,1000,20727,500); -- Tabahi Fleuret / NMs Jailer of love
INSERT INTO mob_droplist VALUES(3,1,1,1000,4069,750); -- Rem tale 6 / NMs Absolue Virtue
INSERT INTO mob_droplist VALUES(3,1,1,1000,4070,750); -- Rem tale 7 / NMs Absolue Virtue
INSERT INTO mob_droplist VALUES(3,1,2,1000,4071,750); -- Rem tale 8 / NMs Absolue Virtue
INSERT INTO mob_droplist VALUES(3,1,2,1000,4072,750); -- Rem tale 9 / NMs Absolue Virtue
INSERT INTO mob_droplist VALUES(3,1,3,1000,4073,750); -- Rem tale 10 / NMs Absolue Virtue
INSERT INTO mob_droplist VALUES(2196,1,3,1000,4070,250); -- Rem tale 7 / NMs Seiryu
INSERT INTO mob_droplist VALUES(2196,1,3,1000,4071,250); -- Rem tale 8 / NMs Seiryu
INSERT INTO mob_droplist VALUES(2196,1,4,1000,836,250); -- Damascene Cloth / NMs Seiryu
INSERT INTO mob_droplist VALUES(2196,1,4,1000,1110,250); -- Beetle Blood / NMs Seiryu
INSERT INTO mob_droplist VALUES(2196,1,5,1000,21232,333); -- Phulax Bow / NMs Seiryu
INSERT INTO mob_droplist VALUES(2196,1,5,1000,20911,333); -- Last Rest / NMs Seiryu
INSERT INTO mob_droplist VALUES(2196,1,5,1000,17928,334); -- Juggernaut / NMs Seiryu
INSERT INTO mob_droplist VALUES(2362,1,3,1000,4071,250); -- Rem tale 8 / NMs Suzaku
INSERT INTO mob_droplist VALUES(2362,1,3,1000,4072,250); -- Rem tale 9 / NMs Suzaku
INSERT INTO mob_droplist VALUES(2362,1,4,1000,1311,250); -- Oxblood / NMs Suzaku
INSERT INTO mob_droplist VALUES(2362,1,4,1000,836,250); -- Damascene Cloth / NMs Suzaku
INSERT INTO mob_droplist VALUES(2362,1,5,1000,28026,500); -- Aiwon Gauntlets / NMs Suzaku
INSERT INTO mob_droplist VALUES(2362,1,5,1000,28573,500); -- Wuji Ring / NMs Suzaku
INSERT INTO mob_droplist VALUES(394,1,3,1000,4072,250); -- Rem tale 9 / NMs Byakko
INSERT INTO mob_droplist VALUES(394,1,3,1000,4073,250); -- Rem tale 10 / NMs Byakko
INSERT INTO mob_droplist VALUES(394,1,4,1000,844,250); -- Phoenix Feather / NMs Byakko
INSERT INTO mob_droplist VALUES(394,1,4,1000,1311,250); -- Oxblood / NMs Byakko
INSERT INTO mob_droplist VALUES(394,1,5,1000,21046,500); -- Kiikanemitsu / NMs Byakko
INSERT INTO mob_droplist VALUES(394,1,5,1000,21184,500); -- Surma Staff / NMs Byakko
INSERT INTO mob_droplist VALUES(946,1,3,1000,4073,250); -- Rem tale 10 / NMs Genbu
INSERT INTO mob_droplist VALUES(946,1,3,1000,4070,250); -- Rem tale 7 / NMs Genbu
INSERT INTO mob_droplist VALUES(946,1,4,1000,1110,250); -- Beetle Blood / NMs Genbu
INSERT INTO mob_droplist VALUES(946,1,4,1000,836,250); -- Damascene Cloth / NMs Genbu
INSERT INTO mob_droplist VALUES(946,1,5,1000,21423,500); -- Tardus Grip / NMs Genbu
INSERT INTO mob_droplist VALUES(946,1,5,1000,21282,500); -- Qasama Hexagun / NMs Genbu
INSERT INTO mob_droplist VALUES(2843,1,2,1000,4064,250); -- Rem tale 1 / NMs Ix'aern (DRG)
INSERT INTO mob_droplist VALUES(2843,1,2,1000,4065,250); -- Rem tale 2 / NMs Ix'aern (DRG)
INSERT INTO mob_droplist VALUES(2843,1,3,1000,844,250); -- Phoenix Feather / NMs Ix'aern (DRG)
INSERT INTO mob_droplist VALUES(2843,1,3,1000,1311,250); -- Oxblood / NMs Ix'aern (DRG)
INSERT INTO mob_droplist VALUES(2843,1,4,1000,28658,333); -- Sors Shield / NMs Ix'aern (DRG)
INSERT INTO mob_droplist VALUES(2843,1,4,1000,20955,333); -- Agilis Lance / NMs Ix'aern (DRG)
INSERT INTO mob_droplist VALUES(2843,1,4,1000,21424,334); -- Zuuxowu Grip / NMs Ix'aern (DRG)
INSERT INTO mob_droplist VALUES(2844,1,2,1000,4066,250); -- Rem tale 3 / NMs Ix'aern (DRK)
INSERT INTO mob_droplist VALUES(2844,1,2,1000,4067,250); -- Rem tale 4 / NMs Ix'aern (DRK)
INSERT INTO mob_droplist VALUES(2844,1,3,1000,1110,250); -- Beetle Blood / NMs Ix'aern (DRK)
INSERT INTO mob_droplist VALUES(2844,1,3,1000,837,250); -- Malboro Fiber / NMs Ix'aern (DRK)
INSERT INTO mob_droplist VALUES(2844,1,4,1000,20957,500); -- Concido Course / NMs Ix'aern (DRK)
INSERT INTO mob_droplist VALUES(2844,1,4,1000,20626,500); -- Blitto Needle / NMs Ix'aern (DRK)
INSERT INTO mob_droplist VALUES(2819,1,5,1000,4069,750); -- Rem tale 6 / NMs Kirin
INSERT INTO mob_droplist VALUES(2819,1,5,1000,4070,750); -- Rem tale 7 / NMs Kirin
INSERT INTO mob_droplist VALUES(2819,1,6,1000,4071,750); -- Rem tale 8 / NMs Kirin
INSERT INTO mob_droplist VALUES(2819,1,6,1000,4072,750); -- Rem tale 9 / NMs Kirin
INSERT INTO mob_droplist VALUES(2819,1,7,1000,4073,750); -- Rem tale 10 / NMs Kirin
INSERT INTO mob_droplist VALUES(3168,1,1,500,11632,125); -- Karka Ring / Void Walker Tier 2 Capricornus
INSERT INTO mob_droplist VALUES(3168,1,1,500,11629,125); -- Zilant Ring  / Void Walker Tier 2 Capricornus
INSERT INTO mob_droplist VALUES(3168,1,1,500,11633,125); -- Galdr Ring  / Void Walker Tier 2 Capricornus
INSERT INTO mob_droplist VALUES(3168,1,1,500,19248,125); -- Lucky Coin / Void Walker Tier 2 Capricornus
INSERT INTO mob_droplist VALUES(3168,0,0,1000,2884,1000); --  (Always, 100%) / Void Walker Tier 2 Capricornus
INSERT INTO mob_droplist VALUES(3168,0,0,1000,2884,900); -- Krabkatoa Shell (90.0%) / Void Walker Tier 2 Capricornus
INSERT INTO mob_droplist VALUES(3168,0,0,1000,2884,30); -- Krabkatoa Shell (3.0%) / Void Walker Tier 2 Capricornus
INSERT INTO mob_droplist VALUES(3168,0,0,1000,844,350); -- Pheonix Feather / Void Walker Tier 2 Capricornus
INSERT INTO mob_droplist VALUES(3168,1,2,1000,4064,500); -- Rem tale 1 / Void Walker Tier 2 Capricornus
INSERT INTO mob_droplist VALUES(3168,1,2,1000,4065,500); -- Rem tale 2 / Void Walker Tier 2 Capricornus
INSERT INTO mob_droplist VALUES(3169,1,1,500,11632,125); -- Karka Ring / Yacumama Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3169,1,1,500,11629,125); -- Zilant Ring / Yacumama  Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3169,1,1,500,11633,125); -- Galdr Ring  / Yacumama Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3169,1,1,500,19248,125); -- Lucky Coin / Yacumama Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3169,0,0,1000,2884,1000); -- Krabkatoa Shell (Always, 100%) / Yacumama Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3169,0,0,1000,2884,900); -- Krabkatoa Shell (90.0%) / Yacumama Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3169,0,0,1000,2884,30); -- Krabkatoa Shell (3.0%) / Yacumama Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3169,0,0,1000,837,350); -- Malboro Fiber / Yacumama Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3169,1,2,1000,4065,500); -- Rem tale 2 / Yacumama Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3169,1,2,1000,4066,500); -- Rem tale 3 / Yacumama Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3170,1,1,500,11631,125); -- Blobnag Ring / Lamprey Lord Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3170,1,1,500,11629,125); -- Zilant Ring  / Lamprey Lord Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3170,1,1,500,11633,125); -- Galdr Ring  / Lamprey Lord Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3170,1,1,500,19248,125); -- Lucky Coin / Lamprey Lord Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3170,0,0,1000,2882,1000); -- Baby Blobdingnag (Always, 100%) / Lamprey Lord Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3170,0,0,1000,2882,900); -- Baby Blobdingnag (90.0%) / Lamprey Lord Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3170,0,0,1000,2882,30); -- Baby Blobdingnag (3.0%) / Lamprey Lord Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3170,0,0,1000,1110,350); -- Beetle Blood / Lamprey Lord Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3170,1,2,1000,4066,500); -- Rem tale 3 / Lamprey Lord Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3170,1,2,1000,4067,500); -- Rem tale 4 / Lamprey Lord Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3171,1,1,500,11631,125); -- Blobnag Ring Shoggoth / Shoggoth Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3171,1,1,500,11629,125); -- Zilant Ring  / Shoggoth Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3171,1,1,500,11633,125); -- Galdr Ring  / Shoggoth Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3171,1,1,500,19248,125); -- Lucky Coin / Shoggoth Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3171,0,0,1000,2882,1000); -- Baby Blobdingnag (Always, 100%) / Shoggoth Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3171,0,0,1000,2882,900); -- Baby Blobdingnag (90.0%) / Shoggoth Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3171,0,0,1000,2882,30); -- Baby Blobdingnag (3.0%) / Shoggoth Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3171,0,0,1000,836,350); -- Damascene Cloth / Shoggoth Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3171,1,2,1000,4067,500); -- Rem tale 4 / Shoggoth Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3171,1,2,1000,4068,500); -- Rem tale 5 / Shoggoth Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3172,1,1,500,11630,125); -- Corneus Ring Jyeshtha / Jyeshtha Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3172,1,1,500,11629,125); -- Zilant Ring  / Jyeshtha Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3172,1,1,500,11633,125); -- Galdr Ring  / Jyeshtha Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3172,1,1,500,19248,125); -- Lucky Coin / Jyeshtha Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3172,0,0,1000,2885,1000); -- Orcus Mandible (Always, 100%) / Jyeshtha Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3172,0,0,1000,2885,900); -- Orcus Mandible (90.0%) / Jyeshtha Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3172,0,0,1000,2885,30); -- Orcus Mandible (3.0%) / Jyeshtha Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3172,0,0,1000,1311,350); -- Oxblood  / Jyeshtha Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3172,1,2,1000,4068,500); -- Rem tale 5 / Jyeshtha Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3172,1,2,1000,4064,500); -- Rem tale 1 / Jyeshtha Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3173,1,1,500,11630,125); -- Corneus Ring Farruca / Farruca Fly Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3173,1,1,500,11629,125); -- Zilant Ring  / Farruca Fly Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3173,1,1,500,11633,125); -- Galdr Ring  / Farruca Fly Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3173,1,1,500,19248,125); -- Lucky Coin / Farruca Fly Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3173,0,0,1000,2885,1000); -- Orcus Mandible (Always, 100%) / Farruca Fly Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3173,0,0,1000,2885,900); -- Orcus Mandible (90.0%) / Farruca Fly Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3173,0,0,1000,2885,30); -- Orcus Mandible (3.0%) / Farruca Fly Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3173,0,0,1000,844,350); -- Pheonix Feather / Farruca Fly Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3173,1,2,1000,4064,500); -- Rem tale 1 / Farruca Fly Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3173,1,2,1000,4065,500); -- Rem tale 2 / Farruca Fly Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3174,1,1,500,11634,125); -- add Veela Ring  Skurd / Skurd Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3174,1,1,500,11629,125); -- Zilant Ring  / Skurd Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3174,1,1,500,11633,125); -- Galdr Ring  / Skurd Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3174,1,1,500,19248,125); -- Lucky Coin / Skurd Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3174,0,0,1000,2881,1000); -- Eye Of Verthandi (Always, 100%) / Skurd Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3174,0,0,1000,2881,900); -- Eye Of Verthandi (90.0%) / Skurd Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3174,0,0,1000,2881,30); -- Eye Of Verthandi (3.0%) / Skurd Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3174,0,0,1000,837,350); -- Malboro Fiber / Skurd Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3174,1,2,1000,4065,500); -- Rem tale 2 / Skurd Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3174,1,2,1000,4066,500); -- Rem tale 3 / Skurd Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3175,1,1,500,11634,125); -- add Veela Ring  Urd / Urd Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3175,1,1,500,11629,125); -- Zilant Ring  / Urd Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3175,1,1,500,11633,125); -- Galdr Ring  / Urd Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3175,1,1,500,19248,125); -- Lucky Coin / Urd Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3175,0,0,1000,2881,1000); -- Eye Of Verthandi (Always, 100%) / Urd Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3175,0,0,1000,2881,900); -- Eye Of Verthandi (90.0%) / Urd Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3175,0,0,1000,2881,30); -- Eye Of Verthandi (3.0%) / Urd Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3175,0,0,1000,1110,350); -- Beetle Blood / Urd Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3175,1,2,1000,4066,500); -- Rem tale 3 / Urd Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3175,1,2,1000,4067,500); -- Rem tale 4 / Urd Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3177,1,1,500,11628,125); -- Strigoi Ring Erebus/ Erebus Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3177,1,1,500,11629,125); -- Zilant Ring / Erebus Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3177,1,1,500,11633,125); -- Galdr Ring / Erebus Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3177,1,1,500,19248,125); -- Lucky Coin/ Erebus Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3177,0,0,1000,2883,1000); -- Ruthvens Nail (Always, 100%)/ Erebus Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3177,0,0,1000,2883,900); -- Ruthvens Nail (90.0%)/ Erebus Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3177,0,0,1000,2883,30); -- Ruthvens Nail (3.0%)/ Erebus Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3177,0,0,1000,836,350); -- Damascene Cloth/ Erebus Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3177,1,2,1000,4067,500); -- Rem tale 4/ Erebus Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3177,1,2,1000,4068,500); -- Rem tale 5 / Erebus Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3176,1,1,500,11628,125); -- Strigoi Ring Feuerunke / Feuerunke Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3176,1,1,500,11629,125); -- Zilant Ring  / Feuerunke Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3176,1,1,500,11633,125); -- Galdr Ring  / Feuerunke Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3176,1,1,500,19248,125); -- Lucky Coin / Feuerunke Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3176,0,0,1000,2883,1000); -- Ruthvens Nail (Always, 100%) / Feuerunke Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3176,0,0,1000,2883,900); -- Ruthvens Nail (90.0%) / Feuerunke Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3176,0,0,1000,2883,30); -- Ruthvens Nail (3.0%) / Feuerunke Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3176,0,0,1000,1311,350); -- Oxblood  / Feuerunke Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3176,1,2,1000,4068,500); -- Rem tale 5 / Feuerunke Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3176,1,2,1000,4064,500); -- Rem tale 1 / Feuerunke Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3178,1,1,500,15859,125); -- Succor Ring / Chesma Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3178,1,1,500,11629,125); -- Zilant Ring  / Chesma Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3178,1,1,500,11633,125); -- Galdr Ring  / Chesma Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3178,1,1,500,19248,125); -- Lucky Coin / Chesma Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3178,0,0,1000,2570,1000); -- Pelt Of Dawon (Always, 100%) / Chesma Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3178,0,0,1000,2570,900); -- Pelt Of Dawon (90.0%) / Chesma Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3178,0,0,1000,2570,30); -- Pelt Of Dawon (3.0%) / Chesma Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3178,0,0,1000,837,350); -- Malboro Fiber / Chesma Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3178,1,2,1000,4064,500); -- Rem tale 1 / Chesma Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3178,1,2,1000,4065,500); -- Rem tale 2 / Chesma Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3179,1,1,500,15859,125); -- Succor Ring / Tammuz Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3179,1,1,500,11629,125); -- Zilant Ring / Tammuz Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3179,1,1,500,11633,125); -- Galdr Ring / Tammuz Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3179,1,1,500,19248,125); -- Lucky Coin / Tammuz Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3179,0,0,1000,2570,1000); -- Pelt Of Dawon (Always, 100%) / Tammuz Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3179,0,0,1000,2570,900); -- Pelt Of Dawon (90.0%) / Tammuz Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3179,0,0,1000,2570,30); -- Pelt Of Dawon (3.0%) / Tammuz Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3179,0,0,1000,1110,350); -- Beetle Blood / Tammuz Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3179,1,2,1000,4065,500); -- Rem tale 2 / Tammuz Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(3179,1,2,1000,4066,500); -- Rem tale 3 / Tammuz Void Walker Tier 2 
INSERT INTO mob_droplist VALUES(2076,1,1,300,11651,1000); -- Epona ring / Rani

-- New Drop Lists
INSERT INTO mob_droplist VALUES(4000,0,0,1000,8707,250); -- Raaz Hide Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,0,0,1000,2359,250); -- Star Sapphire Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,0,0,1000,4058,250); -- Bismuth Ore Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,0,0,1000,9075,250); -- Vulcanite Ore Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,0,0,1000,8751,250); -- Ancestral Cloth Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,0,0,1000,4026,250); -- Akaso Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,0,0,1000,4018,250); -- Guatambu Log Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,0,0,1000,8747,250); -- Ra'Kaznar Ore Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,0,0,1000,3552,250); -- RaSquamous Hide Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,0,0,1000,3926,250); -- Urunday Log Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,1,1,1000,844,200); -- Pheonix Feather Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,1,1,1000,837,200); -- Malboro Fiber Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,1,1,1000,1110,200); -- Beetle Blood Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,1,1,1000,836,200); -- Damascene Cloth Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,1,1,1000,1311,200); -- Oxblood Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,1,2,1000,4064,200); -- Rem tale 1 Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,1,2,1000,4065,200); -- Rem tale 2 Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,1,2,1000,4066,200); -- Rem tale 3 Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,1,2,1000,4067,200); -- Rem tale 4 Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,1,2,1000,4068,200); -- Rem tale 5 Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,1,3,500,11631,55); -- Blobnag Ring Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,1,3,500,11634,55); -- Veela Ring Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,1,3,500,11628,55); -- Strigoi Ring Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,1,3,500,15859,55); -- Succor Ring Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,1,3,500,11630,55); -- Corneus Ring Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,1,3,500,11632,55); -- Karka Ring Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,1,3,500,11629,55); -- Zilant Ring Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,1,3,500,11633,55); -- Galdr Ring Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4000,1,3,500,19248,55); -- Lucky Coin Void Walker Tier 1 Yildegan, Orcus, Blobdingnag, Krabkatoa, Dawon, Lord Ruthven, Verthandi
INSERT INTO mob_droplist VALUES(4001,1,1,750,9281,187); -- P. War card / Krabkatoa Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4001,1,1,750,9282,187); -- P. Mnk card / Krabkatoa Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4001,1,1,750,9283,187); -- P. Whm card / Krabkatoa Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4001,1,1,750,9299,187); -- P. Dnc card / Krabkatoa Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4001,1,2,500,9281,125); -- P. War card / Krabkatoa Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4001,1,2,500,9282,125); -- P. Mnk card / Krabkatoa Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4001,1,2,500,9283,125); -- P. Whm card / Krabkatoa Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4001,1,2,500,9299,125); -- P. Dnc card / Krabkatoa Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4001,1,3,250,9281,62); -- P. War card / Krabkatoa Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4001,1,3,250,9282,62); -- P. Mnk card / Krabkatoa Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4001,1,3,250,9283,62); -- P. Whm card / Krabkatoa Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4001,1,3,250,9299,62); -- P. Dnc card / Krabkatoa Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4001,1,4,150,9281,37); -- P. War card / Krabkatoa Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4001,1,4,150,9282,37); -- P. Mnk card / Krabkatoa Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4001,1,4,150,9283,37); -- P. Whm card / Krabkatoa Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4001,1,4,150,9299,37); -- P. Dnc card / Krabkatoa Void Walker Tier 3 

INSERT INTO mob_droplist VALUES(4002,1,1,750,9284,187); -- P. Blm card / Blobdingnag Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4002,1,1,750,9285,187); -- P. Rdm card / Blobdingnag Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4002,1,1,750,9286,187); -- P. Thf card / Blobdingnag Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4002,1,1,750,9300,187); -- P. Sch card / Blobdingnag Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4002,1,2,500,9284,125); -- P. Blm card / Blobdingnag Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4002,1,2,500,9285,125); -- P. Rdm card / Blobdingnag Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4002,1,2,500,9286,125); -- P. Thf card / Blobdingnag Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4002,1,2,500,9300,125); -- P. Sch card / Blobdingnag Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4002,1,3,250,9284,62); -- P. Blm card / Blobdingnag Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4002,1,3,250,9285,62); -- P. Rdm card / Blobdingnag Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4002,1,3,250,9286,62); -- P. Thf card / Blobdingnag Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4002,1,3,250,9300,62); -- P. Sch card / Blobdingnag Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4002,1,4,150,9284,37); -- P. Blm card / Blobdingnag Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4002,1,4,150,9285,37); -- P. Rdm card / Blobdingnag Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4002,1,4,150,9286,37); -- P. Thf card / Blobdingnag Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4002,1,4,150,9300,37); -- P. Sch card / Blobdingnag Void Walker Tier 3 

INSERT INTO mob_droplist VALUES(4003,1,1,750,9287,187); -- P. Pld card / Orcus Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4003,1,1,750,9288,187); -- P. Drk card / Orcus Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4003,1,1,750,9289,187); -- P. Bst card / Orcus Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4003,1,1,750,9301,187); -- P. Geo card / Orcus Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4003,1,2,500,9287,125); -- P. Pld card / Orcus Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4003,1,2,500,9288,125); -- P. Drk card / Orcus Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4003,1,2,500,9289,125); -- P. Bst card / Orcus Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4003,1,2,500,9301,125); -- P. Geo card / Orcus Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4003,1,3,250,9287,62); -- P. Pld card / Orcus Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4003,1,3,250,9288,62); -- P. Drk card / Orcus Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4003,1,3,250,9289,62); -- P. Bst card / Orcus Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4003,1,3,250,9301,62); -- P. Geo card / Orcus Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4003,1,4,150,9287,37); -- P. Pld card / Orcus Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4003,1,4,150,9288,37); -- P. Drk card / Orcus Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4003,1,4,150,9289,37); -- P. Bst card / Orcus Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4003,1,4,150,9301,37); -- P. Geo card / Orcus Void Walker Tier 3 

INSERT INTO mob_droplist VALUES(4004,1,1,750,9290,187); -- P. Brd card / Verthandi Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4004,1,1,750,9291,187); -- P. Rng card / Verthandi Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4004,1,1,750,9292,187); -- P. Sam card / Verthandi Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4004,1,1,750,9302,187); -- P. Run card / Verthandi Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4004,1,2,500,9290,125); -- P. Brd card / Verthandi Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4004,1,2,500,9291,125); -- P. Rng card / Verthandi Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4004,1,2,500,9292,125); -- P. Sam card / Verthandi Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4004,1,2,500,9302,125); -- P. Run card / Verthandi Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4004,1,3,250,9290,62); -- P. Brd card / Verthandi Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4004,1,3,250,9291,62); -- P. Rng card / Verthandi Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4004,1,3,250,9292,62); -- P. Sam card / Verthandi Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4004,1,3,250,9302,62); -- P. Run card / Verthandi Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4004,1,4,150,9290,37); -- P. Brd card / Verthandi Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4004,1,4,150,9291,37); -- P. Rng card / Verthandi Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4004,1,4,150,9292,37); -- P. Sam card / Verthandi Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4004,1,4,150,9302,37); -- P. Run card / Verthandi Void Walker Tier 3 

INSERT INTO mob_droplist VALUES(4005,1,1,750,9293,250); -- P. Nin card / Dawon Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4005,1,1,750,9294,250); -- P. Drg card / Dawon Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4005,1,1,750,9295,250); -- P. Smn card / Dawon Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4005,1,2,500,9293,166); -- P. Nin card / Dawon Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4005,1,2,500,9294,166); -- P. Drg card / Dawon Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4005,1,2,500,9295,166); -- P. Smn card / Dawon Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4005,1,3,250,9293,83); -- P. Nin card / Dawon Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4005,1,3,250,9294,83); -- P. Drg card / Dawon Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4005,1,3,250,9295,83); -- P. Smn card / Dawon Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4005,1,4,150,9293,50); -- P. Nin card / Dawon Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4005,1,4,150,9294,50); -- P. Drg card / Dawon Void Walker Tier 3 
INSERT INTO mob_droplist VALUES(4005,1,4,150,9295,50); -- P. Smn card / Dawon Void Walker Tier 3 

INSERT INTO mob_droplist VALUES(4006,1,1,300,26723,100); -- SU1 Wildheitschaller Head / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,1,300,26727,100); -- SU1 Revealer's Crown Head +1/ Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,1,300,26725,100); -- SU1 Sombra Tiara +1 Head / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,2,300,26882,100); -- SU1 Wildheitbrust Body / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,2,300,26886,100); -- SU1 Revealer's Tunic Body +1/ Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,2,300,26884,100); -- SU1 Sombra Harness +1 Body / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,3,300,27988,100); -- SU1 Wildheithentzes Hands / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,3,300,27992,100); -- SU1 Revealer's Mitts Hands +1/ Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,3,300,27989,100); -- SU1 Sombra Mittens Hands / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,4,300,27225,100); -- SU1 Wildheitdiechlings Legs / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,4,300,27229,100); -- SU1 Revealer's Pants Legs +1/ Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,4,300,27227,100); -- SU1 Sombra Tights Legs +1 / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,5,300,27397,100); -- SU1 Wildheitschuhs Feet / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,5,300,27401,100); -- SU1 Revealer's Pumps Feet +1 / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,5,300,27399,100); -- SU1 Sombra Leggings Feet +1 / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,22021,3); -- SU2 Weapons Ames / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21456,3); -- SU2 Weapons Animator P / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21458,3); -- SU2 Weapons Animator P II / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21706,3); -- SU2 Weapons Barbarity / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21556,3); -- SU2 Weapons Beryllium Kris / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,22023,3); -- SU2 Weapons Beryllium Mace / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21708,3); -- SU2 Weapons Beryllium Pick / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21659,3); -- SU2 Weapons Beryllium Sword / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21963,3); -- SU2 Weapons Beryllium Tachi / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,20802,3); -- SU2 Weapons Blurred Axe / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21217,3); -- SU2 Weapons Blurred Bow / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,20525,3); -- SU2 Weapons Blurred Claws / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,20849,3); -- SU2 Weapons Blurred Cleaver / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21480,3); -- SU2 Weapons Blurred Crossbow / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21400,3); -- SU2 Weapons Blurred Harp / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,20601,3); -- SU2 Weapons Blurred Knife / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,20940,3); -- SU2 Weapons Blurred Lance / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21093,3); -- SU2 Weapons Blurred Rod / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,20896,3); -- SU2 Weapons Blurred Scythe / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,27643,3); -- SU2 Weapons Blurred Shield / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21157,3); -- SU2 Weapons Blurred Staff / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,20711,3); -- SU2 Weapons Blurred Sword / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21656,3); -- SU2 Weapons Dyrnwyn / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21606,3); -- SU2 Weapons Enriching Sword / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,22125,3); -- SU2 Weapons Exalted Bow / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,22137,3); -- SU2 Weapons Exalted Crossbow / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21869,3); -- SU2 Weapons Exalted Spear / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,22078,3); -- SU2 Weapons Exalted Staff / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21765,3); -- SU2 Weapons Hepatizon Axe / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21511,3); -- SU2 Weapons Hepatizon Baghnakhs / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21610,3); -- SU2 Weapons Hepatizon Rapier / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21614,3); -- SU2 Weapons Hepatizon Sapara / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21506,3); -- SU2 Weapons Jolt Counter / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,20984,3); -- SU2 Weapons Kujaku / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21032,3); -- SU2 Weapons Kunitsuna / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,20754,3); -- SU2 Weapons Malfeasance / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21815,3); -- SU2 Weapons Maliya Sickle / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,21394,3); -- SU2 Weapons Sancus Sachet / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,6,150,22076,3); -- SU2 Weapons Was / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,7,50,26877,16); -- SU2 Armor Foppish Tunica / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,7,50,26875,16); -- SU2 Armor Ravenous Breastplate / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,7,50,26879,16); -- SU2 Armor Wretched Coat / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,8,20,4074,1); -- SU3 Mats Thought Crystal / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,8,20,4075,1); -- SU3 Mats Hope Crystal / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,8,20,4076,1); -- SU3 Mats Fulfillment Crystal / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,8,20,9064,1); -- SU3 Mats Tartarian Chain / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,8,20,9003,1); -- SU3 Mats Plovid Flesh / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,8,20,9006,1); -- SU3 Mats Defiant Scarf / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,8,20,9005,1); -- SU3 Mats Macuil horn / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,8,20,9007,1); -- SU3 Mats Defiant Sweat / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,8,20,9002,1); -- SU3 Mats Plovid Effluvium / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,8,20,9061,1); -- SU3 Mats Hades' Claw / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,8,20,8754,1); -- SU3 Mats Cehuetzi Pelt / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,8,20,9004,1); -- SU3 Mats Macuil Plating / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,8,20,8752,1); -- SU3 Mats Cehuetzi Claw / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4006,1,8,20,3981,1); -- SU3 Mats Bztavian Wing / Yildegan Void Walker Tier 4
INSERT INTO mob_droplist VALUES(4007,1,1,750,9296,250); -- P. Blu card / Lord Ruthven Void Walker Tier 3
INSERT INTO mob_droplist VALUES(4007,1,1,750,9297,250); -- P. Cor card / Lord Ruthven Void Walker Tier 3
INSERT INTO mob_droplist VALUES(4007,1,1,750,9298,250); -- P. Pup card / Lord Ruthven Void Walker Tier 3
INSERT INTO mob_droplist VALUES(4007,1,2,500,9296,166); -- P. Blu card / Lord Ruthven Void Walker Tier 3
INSERT INTO mob_droplist VALUES(4007,1,2,500,9297,166); -- P. Cor card / Lord Ruthven Void Walker Tier 3
INSERT INTO mob_droplist VALUES(4007,1,2,500,9298,166); -- P. Pup card / Lord Ruthven Void Walker Tier 3
INSERT INTO mob_droplist VALUES(4007,1,3,250,9296,83); -- P. Blu card / Lord Ruthven Void Walker Tier 3
INSERT INTO mob_droplist VALUES(4007,1,3,250,9297,83); -- P. Cor card / Lord Ruthven Void Walker Tier 3
INSERT INTO mob_droplist VALUES(4007,1,3,250,9298,83); -- P. Pup card / Lord Ruthven Void Walker Tier 3
INSERT INTO mob_droplist VALUES(4007,1,4,150,9296,50); -- P. Blu card / Lord Ruthven Void Walker Tier 3
INSERT INTO mob_droplist VALUES(4007,1,4,150,9297,50); -- P. Cor card / Lord Ruthven Void Walker Tier 3
INSERT INTO mob_droplist VALUES(4007,1,4,150,9298,50); -- P. Pup card / Lord Ruthven Void Walker Tier 3
INSERT INTO mob_droplist VALUES(4008,0,0,1000,9084,1000); -- Eschalixir / Escha Zitah NM Abyssdiver Beist Emperor_Arthro Eschan_Jewelweed Hugemaw_Harold Immanibugard Jester_Malatrix Keeper_of_Heiligtum Muut Prickly_Pitriv Serpopard_Ninlil Voso
INSERT INTO mob_droplist VALUES(4008,0,0,1000,9085,500); -- Eschalixir +1 / Escha Zitah NM Abyssdiver Beist Emperor_Arthro Eschan_Jewelweed Hugemaw_Harold Immanibugard Jester_Malatrix Keeper_of_Heiligtum Muut Prickly_Pitriv Serpopard_Ninlil Voso
INSERT INTO mob_droplist VALUES(4008,0,0,1000,10953,111); -- bone. torque / Escha Zitah NM Abyssdiver Beist Emperor_Arthro Eschan_Jewelweed Hugemaw_Harold Immanibugard Jester_Malatrix Keeper_of_Heiligtum Muut Prickly_Pitriv Serpopard_Ninlil Voso
INSERT INTO mob_droplist VALUES(4008,0,0,1000,10954,111); -- alchemst. torque / Escha Zitah NM Abyssdiver Beist Emperor_Arthro Eschan_Jewelweed Hugemaw_Harold Immanibugard Jester_Malatrix Keeper_of_Heiligtum Muut Prickly_Pitriv Serpopard_Ninlil Voso
INSERT INTO mob_droplist VALUES(4008,0,0,1000,10952,111); -- tanners torque / Escha Zitah NM Abyssdiver Beist Emperor_Arthro Eschan_Jewelweed Hugemaw_Harold Immanibugard Jester_Malatrix Keeper_of_Heiligtum Muut Prickly_Pitriv Serpopard_Ninlil Voso
INSERT INTO mob_droplist VALUES(4008,0,0,1000,10955,111); -- culin. torque / Escha Zitah NM Abyssdiver Beist Emperor_Arthro Eschan_Jewelweed Hugemaw_Harold Immanibugard Jester_Malatrix Keeper_of_Heiligtum Muut Prickly_Pitriv Serpopard_Ninlil Voso
INSERT INTO mob_droplist VALUES(4008,0,0,1000,10950,111); -- goldsm. torque / Escha Zitah NM Abyssdiver Beist Emperor_Arthro Eschan_Jewelweed Hugemaw_Harold Immanibugard Jester_Malatrix Keeper_of_Heiligtum Muut Prickly_Pitriv Serpopard_Ninlil Voso
INSERT INTO mob_droplist VALUES(4008,0,0,1000,10949,111); -- smithys torque / Escha Zitah NM Abyssdiver Beist Emperor_Arthro Eschan_Jewelweed Hugemaw_Harold Immanibugard Jester_Malatrix Keeper_of_Heiligtum Muut Prickly_Pitriv Serpopard_Ninlil Voso
INSERT INTO mob_droplist VALUES(4008,0,0,1000,10925,111); -- fishers torque / Escha Zitah NM Abyssdiver Beist Emperor_Arthro Eschan_Jewelweed Hugemaw_Harold Immanibugard Jester_Malatrix Keeper_of_Heiligtum Muut Prickly_Pitriv Serpopard_Ninlil Voso
INSERT INTO mob_droplist VALUES(4008,0,0,1000,10948,111); -- carvers torque / Escha Zitah NM Abyssdiver Beist Emperor_Arthro Eschan_Jewelweed Hugemaw_Harold Immanibugard Jester_Malatrix Keeper_of_Heiligtum Muut Prickly_Pitriv Serpopard_Ninlil Voso
INSERT INTO mob_droplist VALUES(4008,0,0,1000,10951,111); -- weavers torque / Escha Zitah NM Abyssdiver Beist Emperor_Arthro Eschan_Jewelweed Hugemaw_Harold Immanibugard Jester_Malatrix Keeper_of_Heiligtum Muut Prickly_Pitriv Serpopard_Ninlil Voso
INSERT INTO mob_droplist VALUES(4009,0,0,1000,27099,200); -- Naga Tekko / Escha Zitah NM - Wepwawet Wepwawet
INSERT INTO mob_droplist VALUES(4009,0,0,1000,27461,200); -- Pursuers Gaiters / Escha Zitah NM - Wepwawet Wepwawet
INSERT INTO mob_droplist VALUES(4009,0,0,1000,21413,350); -- Clemency Grip / Escha Zitah NM - Wepwawet Wepwawet
INSERT INTO mob_droplist VALUES(4009,0,0,1000,26791,200); -- Eschite Helm / Escha Zitah NM - Wepwawet Wepwawet
INSERT INTO mob_droplist VALUES(4009,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM - Wepwawet Wepwawet
INSERT INTO mob_droplist VALUES(4009,0,1,1000,9057,750); -- ayapecs shell / Escha Zitah NM - Wepwawet Wepwawet
INSERT INTO mob_droplist VALUES(4010,0,0,1000,26947,200); -- Eschite Breastplate / Escha Zitah NM - Lustful_Lydia Lustful_Lydia
INSERT INTO mob_droplist VALUES(4010,0,0,1000,27284,200); -- Naga Hakama / Escha Zitah NM Lustful_Lydia Lustful_Lydia
INSERT INTO mob_droplist VALUES(4010,0,0,1000,26796,200); -- Psycloth Tiara / Escha Zitah NM Lustful_Lydia Lustful_Lydia
INSERT INTO mob_droplist VALUES(4010,0,0,1000,22250,350); -- Seraphic Ampulla / Escha Zitah NM Lustful_Lydia Lustful_Lydia
INSERT INTO mob_droplist VALUES(4010,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Lustful_Lydia Lustful_Lydia
INSERT INTO mob_droplist VALUES(4010,0,1,1000,9060,750); -- stick of ethereal incense / Escha Zitah NM Lustful_Lydia Lustful_Lydia
INSERT INTO mob_droplist VALUES(4011,0,0,1000,27097,200); -- Eschite Gauntlets / Escha Zitah NM Aglaophotis Aglaophotis
INSERT INTO mob_droplist VALUES(4011,0,0,1000,26952,200); -- Psycloth Vest / Escha Zitah NM Aglaophotis Aglaophotis
INSERT INTO mob_droplist VALUES(4011,0,0,1000,27459,200); -- Naga Kyahan / Escha Zitah NM Aglaophotis Aglaophotis
INSERT INTO mob_droplist VALUES(4011,0,0,1000,27512,350); -- Marked Gorget / Escha Zitah NM Aglaophotis Aglaophotis
INSERT INTO mob_droplist VALUES(4011,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Aglaophotis Aglaophotis
INSERT INTO mob_droplist VALUES(4011,0,1,1000,9057,750); -- ayapecs shell / Escha Zitah NM Aglaophotis Aglaophotis
INSERT INTO mob_droplist VALUES(4012,0,0,1000,27282,200); -- Eschite Cuisses / Escha Zitah NM Tangata_Manu Tangata_Manu
INSERT INTO mob_droplist VALUES(4012,0,0,1000,27102,200); -- Psycloth Manillas / Escha Zitah NM Tangata_Manu Tangata_Manu
INSERT INTO mob_droplist VALUES(4012,0,0,1000,28474,350); -- Mendicants Earring / Escha Zitah NM Tangata_Manu Tangata_Manu
INSERT INTO mob_droplist VALUES(4012,0,0,1000,26794,200); -- Rawhide Mask / Escha Zitah NM Tangata_Manu Tangata_Manu
INSERT INTO mob_droplist VALUES(4012,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Tangata_Manu Tangata_Manu
INSERT INTO mob_droplist VALUES(4012,0,1,1000,9060,750); -- stick of ethereal incense / Escha Zitah NM Tangata_Manu Tangata_Manu
INSERT INTO mob_droplist VALUES(4013,0,0,1000,27552,350); -- Overbearing Ring / Escha Zitah NM Vidala Vidala
INSERT INTO mob_droplist VALUES(4013,0,0,1000,27287,200); -- Psycloth Lappas / Escha Zitah NM Vidala Vidala
INSERT INTO mob_droplist VALUES(4013,0,0,1000,26950,200); -- Rawhide Vest / Escha Zitah NM Vidala Vidala
INSERT INTO mob_droplist VALUES(4013,0,0,1000,27457,200); -- Eschite Greaves / Escha Zitah NM Vidala Vidala
INSERT INTO mob_droplist VALUES(4013,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Vidala Vidala
INSERT INTO mob_droplist VALUES(4013,0,1,1000,9057,750); -- ayapecs shell / Escha Zitah NM Vidala Vidala
INSERT INTO mob_droplist VALUES(4014,0,0,1000,27462,200); -- Psycloth Boots / Escha Zitah NM Gestalt Gestalt
INSERT INTO mob_droplist VALUES(4014,0,0,1000,26792,200); -- Despair Helm / Escha Zitah NM Gestalt Gestalt
INSERT INTO mob_droplist VALUES(4014,0,0,1000,27606,350); -- Dispersers Cape / Escha Zitah NM Gestalt Gestalt
INSERT INTO mob_droplist VALUES(4014,0,0,1000,27100,200); -- Rawhide Gloves / Escha Zitah NM Gestalt Gestalt
INSERT INTO mob_droplist VALUES(4014,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Gestalt Gestalt
INSERT INTO mob_droplist VALUES(4014,0,1,1000,9060,750); -- stick of ethereal incense / Escha Zitah NM Gestalt Gestalt
INSERT INTO mob_droplist VALUES(4015,0,0,1000,28416,350); -- Lucidity Sash / Escha Zitah NM Angrboda Angrboda
INSERT INTO mob_droplist VALUES(4015,0,0,1000,26948,200); -- Despair Mail / Escha Zitah NM Angrboda Angrboda
INSERT INTO mob_droplist VALUES(4015,0,0,1000,26797,200); -- Vanya Hood / Escha Zitah NM Angrboda Angrboda
INSERT INTO mob_droplist VALUES(4015,0,0,1000,27285,200); -- Rawhide Trousers / Escha Zitah NM Angrboda Angrboda
INSERT INTO mob_droplist VALUES(4015,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Angrboda Angrboda
INSERT INTO mob_droplist VALUES(4015,0,1,1000,9057,750); -- ayapecs shell / Escha Zitah NM Angrboda Angrboda
INSERT INTO mob_droplist VALUES(4016,0,0,1000,26953,200); -- Vanya Robe / Escha Zitah NM Cunnast Cunnast
INSERT INTO mob_droplist VALUES(4016,0,0,1000,27098,200); -- Despair Finger Gauntlets / Escha Zitah NM Cunnast Cunnast
INSERT INTO mob_droplist VALUES(4016,0,0,1000,27460,200); -- Rawhide Boots / Escha Zitah NM Cunnast Cunnast
INSERT INTO mob_droplist VALUES(4016,0,0,1000,21414,350); -- Willpower Grip / Escha Zitah NM Cunnast Cunnast
INSERT INTO mob_droplist VALUES(4016,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Cunnast Cunnast
INSERT INTO mob_droplist VALUES(4016,0,1,1000,9060,750); -- stick of ethereal incense / Escha Zitah NM Cunnast Cunnast
INSERT INTO mob_droplist VALUES(4017,0,0,1000,26795,200); -- Pursuers Beret / Escha Zitah NM Revetaur Revetaur
INSERT INTO mob_droplist VALUES(4017,0,0,1000,27103,200); -- Vanya Cuffs / Escha Zitah NM Revetaur Revetaur
INSERT INTO mob_droplist VALUES(4017,0,0,1000,27283,200); -- Despair Cuisses / Escha Zitah NM Revetaur Revetaur
INSERT INTO mob_droplist VALUES(4017,0,0,1000,22251,350); -- Grenade Core / Escha Zitah NM Revetaur Revetaur
INSERT INTO mob_droplist VALUES(4017,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Revetaur Revetaur
INSERT INTO mob_droplist VALUES(4017,0,1,1000,9057,750); -- ayapecs shell / Escha Zitah NM Revetaur Revetaur
INSERT INTO mob_droplist VALUES(4018,0,0,1000,27458,200); -- Despair Greaves / Escha Zitah NM Ferrodon Ferrodon
INSERT INTO mob_droplist VALUES(4018,0,0,1000,27513,350); -- Subtlety Spectacles / Escha Zitah NM Ferrodon Ferrodon
INSERT INTO mob_droplist VALUES(4018,0,0,1000,26951,200); -- Pursuers Doublet / Escha Zitah NM Ferrodon Ferrodon
INSERT INTO mob_droplist VALUES(4018,0,0,1000,27288,200); -- Vanya Slops / Escha Zitah NM Ferrodon Ferrodon
INSERT INTO mob_droplist VALUES(4018,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Ferrodon Ferrodon
INSERT INTO mob_droplist VALUES(4018,0,1,1000,9060,750); -- stick of ethereal incense / Escha Zitah NM Ferrodon Ferrodon
INSERT INTO mob_droplist VALUES(4019,0,0,1000,27101,200); -- Pursuers Cuffs / Escha Zitah NM Gulltop Gulltop
INSERT INTO mob_droplist VALUES(4019,0,0,1000,26793,200); -- Naga Somen / Escha Zitah NM Gulltop Gulltop
INSERT INTO mob_droplist VALUES(4019,0,0,1000,27463,200); -- Vanya Clogs / Escha Zitah NM Gulltop Gulltop
INSERT INTO mob_droplist VALUES(4019,0,0,1000,28475,350); -- Infused Earring / Escha Zitah NM Gulltop Gulltop
INSERT INTO mob_droplist VALUES(4019,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Gulltop Gulltop
INSERT INTO mob_droplist VALUES(4019,0,1,1000,9060,750); -- stick of ethereal incense / Escha Zitah NM Gulltop Gulltop
INSERT INTO mob_droplist VALUES(4020,0,0,1000,27553,350); -- Resonance Ring / Escha Zitah NM Vyala
INSERT INTO mob_droplist VALUES(4020,0,0,1000,27286,200); -- Pursuers Pants / Escha Zitah NM Vyala
INSERT INTO mob_droplist VALUES(4020,0,0,1000,26949,200); -- Naga Samue / Escha Zitah NM Vyala
INSERT INTO mob_droplist VALUES(4020,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Vyala
INSERT INTO mob_droplist VALUES(4020,0,1,1000,9057,750); -- ayapecs shell / Escha Zitah NM Vyala
INSERT INTO mob_droplist VALUES(4021,0,1,1000,20524,330); -- Nibiru Sainti / Escha Zitah NM Ionos
INSERT INTO mob_droplist VALUES(4021,0,1,1000,21216,330); -- Nibiru Bow / Escha Zitah NM Ionos
INSERT INTO mob_droplist VALUES(4021,0,1,1000,20895,330); -- Nibiru Sickle / Escha Zitah NM Ionos
INSERT INTO mob_droplist VALUES(4021,0,0,1000,27607,350); -- Thaumaturges Cape / Escha Zitah NM Ionos
INSERT INTO mob_droplist VALUES(4021,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Ionos
INSERT INTO mob_droplist VALUES(4021,0,1,500,9078,100); -- Ashweed / Escha Zitah NM Ionos
INSERT INTO mob_droplist VALUES(4021,0,1,500,9077,100); -- Duskcrawler / Escha Zitah NM Ionos
INSERT INTO mob_droplist VALUES(4021,0,1,500,9076,100); -- Gravewood Log / Escha Zitah NM Ionos
INSERT INTO mob_droplist VALUES(4022,0,1,1000,20600,330); -- Nibiru Knife / Escha Zitah NM Sensual_Sandy
INSERT INTO mob_droplist VALUES(4022,0,1,1000,20939,330); -- Nibiru Lance / Escha Zitah NM Sensual_Sandy
INSERT INTO mob_droplist VALUES(4022,0,1,1000,21273,330); -- Nibiru Gun / Escha Zitah NM Sensual_Sandy
INSERT INTO mob_droplist VALUES(4022,0,0,1000,28417,350); -- Sinew Belt / Escha Zitah NM Sensual_Sandy
INSERT INTO mob_droplist VALUES(4022,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Sensual_Sandy
INSERT INTO mob_droplist VALUES(4022,0,1,500,9078,100); -- Ashweed / Escha Zitah NM Sensual_Sandy
INSERT INTO mob_droplist VALUES(4022,0,1,500,9077,100); -- Duskcrawler / Escha Zitah NM Sensual_Sandy
INSERT INTO mob_droplist VALUES(4022,0,1,500,9076,100); -- Gravewood Log / Escha Zitah NM Sensual_Sandy
INSERT INTO mob_droplist VALUES(4023,0,1,1000,20710,330); -- Nibiru Blade / Escha Zitah NM Nosoi
INSERT INTO mob_droplist VALUES(4023,0,0,1000,28476,350); -- Calamitous Earring / Escha Zitah NM Nosoi
INSERT INTO mob_droplist VALUES(4023,0,1,1000,20983,330); -- Mijin / Escha Zitah NM Nosoi
INSERT INTO mob_droplist VALUES(4023,0,1,1000,27642,330); -- Nibiru Shield / Escha Zitah NM Nosoi
INSERT INTO mob_droplist VALUES(4023,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Nosoi
INSERT INTO mob_droplist VALUES(4023,0,1,500,9078,100); -- Ashweed / Escha Zitah NM Nosoi
INSERT INTO mob_droplist VALUES(4023,0,1,500,9077,100); -- Duskcrawler / Escha Zitah NM Nosoi
INSERT INTO mob_droplist VALUES(4023,0,1,500,9076,100); -- Gravewood Log / Escha Zitah NM Nosoi
INSERT INTO mob_droplist VALUES(4024,0,0,1000,27554,350); -- Purity Ring / Escha Zitah NM Brittlis
INSERT INTO mob_droplist VALUES(4024,0,1,1000,21699,330); -- Nibiru Faussar / Escha Zitah NM Brittlis
INSERT INTO mob_droplist VALUES(4024,0,1,1000,21399,330); -- Nibiru Harp / Escha Zitah NM Brittlis
INSERT INTO mob_droplist VALUES(4024,0,1,1000,21031,330); -- Sensui / Escha Zitah NM Brittlis
INSERT INTO mob_droplist VALUES(4024,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Brittlis
INSERT INTO mob_droplist VALUES(4024,0,1,500,9078,100); -- Ashweed / Escha Zitah NM Brittlis
INSERT INTO mob_droplist VALUES(4024,0,1,500,9077,100); -- Duskcrawler / Escha Zitah NM Brittlis
INSERT INTO mob_droplist VALUES(4024,0,1,500,9076,100); -- Gravewood Log / Escha Zitah NM Brittlis
INSERT INTO mob_droplist VALUES(4025,0,1,1000,20801,500); -- Nibiru Tabar / Escha Zitah NM Kamohoalii
INSERT INTO mob_droplist VALUES(4025,0,1,1000,21092,500); -- Nibiru Cudgel / Escha Zitah NM Kamohoalii
INSERT INTO mob_droplist VALUES(4025,0,0,1000,21415,350); -- Forefathers Grip / Escha Zitah NM Kamohoalii
INSERT INTO mob_droplist VALUES(4025,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Kamohoalii
INSERT INTO mob_droplist VALUES(4025,0,1,500,9078,100); -- Ashweed / Escha Zitah NM Kamohoalii
INSERT INTO mob_droplist VALUES(4025,0,1,500,9077,100); -- Duskcrawler / Escha Zitah NM Kamohoalii
INSERT INTO mob_droplist VALUES(4025,0,1,500,9076,100); -- Gravewood Log / Escha Zitah NM Kamohoalii
INSERT INTO mob_droplist VALUES(4026,0,1,1000,20848,500); -- Nibiru Chopper / Escha Zitah NM Umdhlebi
INSERT INTO mob_droplist VALUES(4026,0,1,1000,21156,500); -- Nibiru Staff / Escha Zitah NM Umdhlebi
INSERT INTO mob_droplist VALUES(4026,0,0,1000,22252,350); -- Sapience Orb / Escha Zitah NM Umdhlebi
INSERT INTO mob_droplist VALUES(4026,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Umdhlebi
INSERT INTO mob_droplist VALUES(4026,0,1,500,9078,100); -- Ashweed / Escha Zitah NM Umdhlebi
INSERT INTO mob_droplist VALUES(4026,0,1,500,9077,100); -- Duskcrawler / Escha Zitah NM Umdhlebi
INSERT INTO mob_droplist VALUES(4026,0,1,500,9076,100); -- Gravewood Log / Escha Zitah NM Umdhlebi
INSERT INTO mob_droplist VALUES(4027,0,0,1000,27605,350); -- Penetrating Cape / Escha Zitah NM Fleetstalker
INSERT INTO mob_droplist VALUES(4027,0,0,1000,26958,200); -- Swellers Harness / Escha Zitah NM Fleetstalker
INSERT INTO mob_droplist VALUES(4027,0,0,1000,20847,10); -- Router / Escha Zitah NM Fleetstalker
INSERT INTO mob_droplist VALUES(4027,0,0,1000,27104,200); -- Shriekers Cuffs / Escha Zitah NM Fleetstalker
INSERT INTO mob_droplist VALUES(4027,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Fleetstalker
INSERT INTO mob_droplist VALUES(4027,0,1,1000,9078,333); -- Ashweed / Escha Zitah NM Fleetstalker
INSERT INTO mob_droplist VALUES(4027,0,1,1000,9077,333); -- Duskcrawler / Escha Zitah NM Fleetstalker
INSERT INTO mob_droplist VALUES(4027,0,1,1000,9076,333); -- Gravewood Log / Escha Zitah NM Fleetstalker
INSERT INTO mob_droplist VALUES(4028,0,0,1000,27464,200); -- Inspirited Boots / Escha Zitah NM Shockmaw
INSERT INTO mob_droplist VALUES(4028,0,0,1000,27289,200); -- Doyen Pants / Escha Zitah NM Shockmaw
INSERT INTO mob_droplist VALUES(4028,0,0,1000,27511,350); -- Dampeners Torque / Escha Zitah NM Shockmaw
INSERT INTO mob_droplist VALUES(4028,0,0,1000,20938,10); -- Annealed Lance / Escha Zitah NM Shockmaw
INSERT INTO mob_droplist VALUES(4028,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Shockmaw
INSERT INTO mob_droplist VALUES(4028,0,1,1000,9078,333); -- Ashweed / Escha Zitah NM Shockmaw
INSERT INTO mob_droplist VALUES(4028,0,1,1000,9077,333); -- Duskcrawler / Escha Zitah NM Shockmaw
INSERT INTO mob_droplist VALUES(4028,0,1,1000,9076,333); -- Gravewood Log / Escha Zitah NM Shockmaw
INSERT INTO mob_droplist VALUES(4029,0,0,1000,26963,200); -- Onca Suit / Escha Zitah NM Urmahlullu
INSERT INTO mob_droplist VALUES(4029,0,0,1000,28415,350); -- Eschan Stone / Escha Zitah NM Urmahlullu
INSERT INTO mob_droplist VALUES(4029,0,0,1000,27783,200); -- Skormoth Mask / Escha Zitah NM Urmahlullu
INSERT INTO mob_droplist VALUES(4029,0,0,1000,20523,10); -- Chastisers / Escha Zitah NM Urmahlullu
INSERT INTO mob_droplist VALUES(4029,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Urmahlullu
INSERT INTO mob_droplist VALUES(4029,0,1,1000,9078,333); -- Ashweed / Escha Zitah NM Urmahlullu
INSERT INTO mob_droplist VALUES(4029,0,1,1000,9077,333); -- Duskcrawler / Escha Zitah NM Urmahlullu
INSERT INTO mob_droplist VALUES(4029,0,1,1000,9076,333); -- Gravewood Log / Escha Zitah NM Urmahlullu
INSERT INTO mob_droplist VALUES(4030,0,0,1000,28477,350); -- Hermetic Earring / Escha Zitah NM Alpluachra
INSERT INTO mob_droplist VALUES(4030,0,0,1000,26960,200); -- Annointed Kalasiris / Escha Zitah NM Alpluachra
INSERT INTO mob_droplist VALUES(4030,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Alpluachra
INSERT INTO mob_droplist VALUES(4031,0,0,1000,22253,350); -- Falcon Eye / Escha Zitah NM Blazewing
INSERT INTO mob_droplist VALUES(4031,0,0,1000,26959,250); -- Kubira Meikogai / Escha Zitah NM Blazewing
INSERT INTO mob_droplist VALUES(4031,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Blazewing
INSERT INTO mob_droplist VALUES(4032,0,0,1000,27514,350); -- Empath Necklace / Escha Zitah NM Pazuzu
INSERT INTO mob_droplist VALUES(4032,0,0,1000,26961,250); -- Makora Meikogai / Escha Zitah NM Pazuzu
INSERT INTO mob_droplist VALUES(4032,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Pazuzu
INSERT INTO mob_droplist VALUES(4033,0,0,1000,27555,350); -- Wardens Ring / Escha Zitah NM Wrathare
INSERT INTO mob_droplist VALUES(4033,0,0,1000,26962,250); -- Enforcers Harness / Escha Zitah NM Wrathare
INSERT INTO mob_droplist VALUES(4033,0,0,1000,9086,1000); -- Eschalixir +2 / Escha Zitah NM Wrathare
INSERT INTO mob_droplist VALUES(4034,0,0,250,28192,500); -- cizin breeches / VWNM Sallow_Seymour
INSERT INTO mob_droplist VALUES(4034,0,0,250,28333,500); -- otronif boots / VWNM Sallow_Seymour
INSERT INTO mob_droplist VALUES(4034,1,1,1000,4272,500); -- Dragon Meat / VWNM Sallow_Seymour
INSERT INTO mob_droplist VALUES(4034,1,1,1000,4272,500); -- Dragon Meat / VWNM Sallow_Seymour
INSERT INTO mob_droplist VALUES(4035,0,0,250,28332,500); -- cizin greaves / VWNM Ushumgal
INSERT INTO mob_droplist VALUES(4035,0,0,250,28193,500); -- otronif brais / VWNM Ushumgal
INSERT INTO mob_droplist VALUES(4035,1,1,1000,3318,500); -- Breeze Gem / VWNM Ushumgal
INSERT INTO mob_droplist VALUES(4035,1,1,1000,1764,500); -- Kejusu Satin / VWNM Ushumgal
INSERT INTO mob_droplist VALUES(4036,0,0,250,27768,500); -- cizin helm / VWNM Sarimanok
INSERT INTO mob_droplist VALUES(4036,0,0,250,28052,500); -- otronif gloves / VWNM Sarimanok
INSERT INTO mob_droplist VALUES(4036,1,1,1000,1305,500); -- Light Bead / VWNM Sarimanok
INSERT INTO mob_droplist VALUES(4036,1,1,1000,3319,500); -- Soil Gem / VWNM Sarimanok
INSERT INTO mob_droplist VALUES(4037,0,0,250,27912,500); -- cizin mail / VWNM Cottus
INSERT INTO mob_droplist VALUES(4037,0,0,250,27913,500); -- otronif harness / VWNM Cottus
INSERT INTO mob_droplist VALUES(4037,1,1,1000,735,500); -- Thokcha Ingot / VWNM Cottus
INSERT INTO mob_droplist VALUES(4037,1,1,1000,1713,500); -- Cashmere Thread / VWNM Cottus
INSERT INTO mob_droplist VALUES(4038,0,0,250,28051,500); -- cizin mufflers / VWNM Virvatuli
INSERT INTO mob_droplist VALUES(4038,0,0,250,27769,500); -- otronif mask / VWNM Virvatuli
INSERT INTO mob_droplist VALUES(4038,1,1,1000,1302,500); -- Earth Bead / VWNM Virvatuli
INSERT INTO mob_droplist VALUES(4038,1,1,1000,3320,500); -- Thunder Gem / VWNM Virvatuli
INSERT INTO mob_droplist VALUES(4039,0,0,250,27915,500); -- gendewitha bliaut / VWNM Pancimanci
INSERT INTO mob_droplist VALUES(4039,0,0,250,28334,500); -- iuitl gaiters / VWNM Pancimanci
INSERT INTO mob_droplist VALUES(4039,1,1,1000,3319,500); -- Soil Gem / VWNM Pancimanci
INSERT INTO mob_droplist VALUES(4039,1,1,1000,1304,500); -- Water Bead / VWNM Pancimanci
INSERT INTO mob_droplist VALUES(4040,0,0,250,27771,500); -- gendewitha caubeen / VWNM Goji
INSERT INTO mob_droplist VALUES(4040,0,0,250,27770,500); -- iuitl headgear / VWNM Goji
INSERT INTO mob_droplist VALUES(4040,1,1,1000,3317,500); -- Snow Gem / VWNM Goji
INSERT INTO mob_droplist VALUES(4040,1,1,1000,1301,500); -- Wind Bead / VWNM Goji
INSERT INTO mob_droplist VALUES(4041,0,0,250,28054,500); -- gendewitha gages / VWNM Gugalanna
INSERT INTO mob_droplist VALUES(4041,0,0,250,28194,500); -- iuitl tights / VWNM Gugalanna
INSERT INTO mob_droplist VALUES(4041,1,1,1000,1304,500); -- Water Bead / VWNM Gugalanna
INSERT INTO mob_droplist VALUES(4041,1,1,1000,3323,500); -- Shadow Gem / VWNM Gugalanna
INSERT INTO mob_droplist VALUES(4042,0,0,250,28335,500); -- gendewitha galoshes / VWNM Yatagarasu
INSERT INTO mob_droplist VALUES(4042,0,0,250,27914,500); -- iuitl vest / VWNM Yatagarasu
INSERT INTO mob_droplist VALUES(4042,1,1,1000,1301,500); -- Wind Bead / VWNM Yatagarasu
INSERT INTO mob_droplist VALUES(4042,1,1,1000,1302,500); -- Earth Bead / VWNM Yatagarasu
INSERT INTO mob_droplist VALUES(4043,0,0,250,28195,500); -- gendewitha spats / VWNM Agathos
INSERT INTO mob_droplist VALUES(4043,0,0,250,28053,500); -- iuitl wristbands / VWNM Agathos
INSERT INTO mob_droplist VALUES(4043,1,1,1000,3321,500); -- Aqua Gem / VWNM Agathos
INSERT INTO mob_droplist VALUES(4043,1,1,1000,3316,500); -- Flame Gem / VWNM Agathos
INSERT INTO mob_droplist VALUES(4044,0,0,250,27916,500); -- hagondes coat / VWNM Cherufe
INSERT INTO mob_droplist VALUES(4044,0,0,250,28192,500); -- cizin breeches / VWNM Cherufe
INSERT INTO mob_droplist VALUES(4044,1,1,1000,3923,500); -- Rhodium Ingot / VWNM Cherufe
INSERT INTO mob_droplist VALUES(4044,1,1,1000,1300,500); -- Ice Bead / VWNM Cherufe
INSERT INTO mob_droplist VALUES(4045,0,0,250,28055,500); -- hagondes cuffs / VWNM Taweret
INSERT INTO mob_droplist VALUES(4045,0,0,250,28332,500); -- cizin greaves / VWNM Taweret
INSERT INTO mob_droplist VALUES(4045,1,1,1000,1713,500); -- Cashmere Thread / VWNM Taweret
INSERT INTO mob_droplist VALUES(4045,1,1,1000,1133,500); -- Dragon Blood / VWNM Taweret
INSERT INTO mob_droplist VALUES(4046,0,0,250,27772,500); -- hagondes hat / VWNM Holy_Moly
INSERT INTO mob_droplist VALUES(4046,0,0,250,27768,500); -- cizin helm / VWNM Holy_Moly
INSERT INTO mob_droplist VALUES(4046,1,1,1000,1303,500); -- Lightning Bead / VWNM Holy_Moly
INSERT INTO mob_droplist VALUES(4046,1,1,1000,3317,500); -- Snow Gem / VWNM Holy_Moly
INSERT INTO mob_droplist VALUES(4047,0,0,250,28196,500); -- hagondes pants / VWNM Ildebrann
INSERT INTO mob_droplist VALUES(4047,0,0,250,27912,500); -- cizin mail / VWNM Ildebrann
INSERT INTO mob_droplist VALUES(4047,1,1,1000,3322,500); -- Light Gem / VWNM Ildebrann
INSERT INTO mob_droplist VALUES(4047,1,1,1000,735,500); -- Thokcha Ingot / VWNM Ildebrann
INSERT INTO mob_droplist VALUES(4048,0,0,250,28336,500); -- hagondes sabots / VWNM Neith
INSERT INTO mob_droplist VALUES(4048,0,0,250,28051,500); -- cizin mufflers / VWNM Neith
INSERT INTO mob_droplist VALUES(4048,1,1,1000,3926,500); -- Urunday Log / VWNM Neith
INSERT INTO mob_droplist VALUES(4048,1,1,1000,1303,500); -- Lightning Bead / VWNM Neith
INSERT INTO mob_droplist VALUES(4049,0,0,250,28334,500); -- iuitl gaiters / VWNM Sabotender_Campeador
INSERT INTO mob_droplist VALUES(4049,0,0,250,27916,500); -- hagondes coat / VWNM Sabotender_Campeador
INSERT INTO mob_droplist VALUES(4049,1,1,1000,1300,500); -- Ice Bead / VWNM Sabotender_Campeador
INSERT INTO mob_droplist VALUES(4049,1,1,1000,3318,500); -- Breeze Gem / VWNM Sabotender_Campeador
INSERT INTO mob_droplist VALUES(4050,0,0,250,27770,500); -- iuitl headgear / VWNM Tangaroa
INSERT INTO mob_droplist VALUES(4050,0,0,250,28055,500); -- hagondes cuffs / VWNM Tangaroa
INSERT INTO mob_droplist VALUES(4050,1,1,1000,1299,500); -- Fire Bead / VWNM Tangaroa
INSERT INTO mob_droplist VALUES(4050,1,1,1000,3321,500); -- Aqua Gem / VWNM Tangaroa
INSERT INTO mob_droplist VALUES(4051,0,0,250,28194,500); -- iuitl tights / VWNM Malleator_Maurok
INSERT INTO mob_droplist VALUES(4051,0,0,250,27772,500); -- hagondes hat / VWNM Malleator_Maurok
INSERT INTO mob_droplist VALUES(4051,1,1,1000,1306,500); -- Dark Bead / VWNM Malleator_Maurok
INSERT INTO mob_droplist VALUES(4051,1,1,1000,1306,500); -- Dark Bead / VWNM Malleator_Maurok
INSERT INTO mob_droplist VALUES(4052,0,0,250,27914,500); -- iuitl vest / VWNM Fjalar
INSERT INTO mob_droplist VALUES(4052,0,0,250,28196,500); -- hagondes pants / VWNM Fjalar
INSERT INTO mob_droplist VALUES(4052,1,1,1000,3919,500); -- Midrium Ingot / VWNM Fjalar
INSERT INTO mob_droplist VALUES(4052,1,1,1000,1299,500); -- Fire Bead / VWNM Fjalar
INSERT INTO mob_droplist VALUES(4053,0,0,250,28053,500); -- iuitl wristbands / VWNM Abununnu
INSERT INTO mob_droplist VALUES(4053,0,0,250,28336,500); -- hagondes sabots / VWNM Abununnu
INSERT INTO mob_droplist VALUES(4053,1,1,1000,747,500); -- Orichalcum Ingot / VWNM Abununnu
INSERT INTO mob_droplist VALUES(4053,1,1,1000,3322,500); -- Light Gem / VWNM Abununnu
INSERT INTO mob_droplist VALUES(4054,0,0,250,28333,500); -- otronif boots / VWNM Tsui-Goab
INSERT INTO mob_droplist VALUES(4054,0,0,250,27915,500); -- gendewitha bliaut / VWNM Tsui-Goab
INSERT INTO mob_droplist VALUES(4054,1,1,1000,3320,500); -- Thunder Gem / VWNM Tsui-Goab
INSERT INTO mob_droplist VALUES(4054,1,1,1000,3919,500); -- Midrium Ingot / VWNM Tsui-Goab
INSERT INTO mob_droplist VALUES(4055,0,0,250,28193,500); -- otronif brais / VWNM Isarukitsck
INSERT INTO mob_droplist VALUES(4055,0,0,250,27771,500); -- gendewitha caubeen / VWNM Isarukitsck
INSERT INTO mob_droplist VALUES(4055,1,1,1000,3316,500); -- Flame Gem / VWNM Isarukitsck
INSERT INTO mob_droplist VALUES(4055,1,1,1000,3926,500); -- Urunday Log / VWNM Isarukitsck
INSERT INTO mob_droplist VALUES(4056,0,0,250,28052,500); -- otronif gloves / VWNM Dimgruzub
INSERT INTO mob_droplist VALUES(4056,0,0,250,28054,500); -- gendewitha gages / VWNM Dimgruzub
INSERT INTO mob_droplist VALUES(4056,1,1,1000,3323,500); -- Shadow Gem / VWNM Dimgruzub
INSERT INTO mob_droplist VALUES(4056,1,1,1000,942,500); -- Philosophers Stone / VWNM Dimgruzub
INSERT INTO mob_droplist VALUES(4057,0,0,250,27913,500); -- otronif harness / VWNM Brekekekex
INSERT INTO mob_droplist VALUES(4057,0,0,250,28335,500); -- gendewitha galoshes / VWNM Brekekekex
INSERT INTO mob_droplist VALUES(4057,1,1,1000,1764,500); -- Kejusu Satin / VWNM Brekekekex
INSERT INTO mob_droplist VALUES(4057,1,1,1000,747,500); -- Orichalcum Ingot / VWNM Brekekekex
INSERT INTO mob_droplist VALUES(4058,0,0,250,27769,500); -- otronif mask / VWNM Yalungur
INSERT INTO mob_droplist VALUES(4058,0,0,250,28195,500); -- gendewitha spats / VWNM Yalungur
INSERT INTO mob_droplist VALUES(4058,1,1,1000,1133,500); -- Dragon Blood / VWNM Yalungur
INSERT INTO mob_droplist VALUES(4058,1,1,1000,1305,500); -- Light Bead / VWNM Yalungur
INSERT INTO mob_droplist VALUES(4059,0,0,250,27771,500); -- gendewitha caubeen / VWNM Vanasarvik
INSERT INTO mob_droplist VALUES(4059,0,0,250,27770,500); -- iuitl headgear / VWNM Vanasarvik
INSERT INTO mob_droplist VALUES(4059,1,1,1000,942,500); -- Philosophers Stone / VWNM Vanasarvik
INSERT INTO mob_droplist VALUES(4059,1,1,1000,3923,500); -- Rhodium Ingot / VWNM Vanasarvik
INSERT INTO mob_droplist VALUES(4060,0,0,250,28662,333); -- beatific shield / VWNM Lorbulcrud
INSERT INTO mob_droplist VALUES(4060,0,0,250,20553,333); -- ninzas / VWNM Lorbulcrud
INSERT INTO mob_droplist VALUES(4060,0,0,250,20641,334); -- leisilonu / VWNM Lorbulcrud
INSERT INTO mob_droplist VALUES(4060,1,1,1000,3317,500); -- Snow Gem / VWNM Lorbulcrud
INSERT INTO mob_droplist VALUES(4060,1,1,1000,1764,500); -- Kejusu Satin / VWNM Lorbulcrud
INSERT INTO mob_droplist VALUES(4061,0,0,250,20553,333); -- ninzas / VWNM Krabimanjaro
INSERT INTO mob_droplist VALUES(4061,0,0,250,20641,333); -- leisilonu / VWNM Krabimanjaro
INSERT INTO mob_droplist VALUES(4061,0,0,250,21208,334); -- lehbrailg / VWNM Krabimanjaro
INSERT INTO mob_droplist VALUES(4061,1,1,1000,1304,500); -- Water Bead / VWNM Krabimanjaro
INSERT INTO mob_droplist VALUES(4061,1,1,1000,735,500); -- Thokcha Ingot / VWNM Krabimanjaro
INSERT INTO mob_droplist VALUES(4062,0,0,250,20641,333); -- leisilonu / VWNM Ogbunabali
INSERT INTO mob_droplist VALUES(4062,0,0,250,20742,333); -- iztaasu / VWNM Ogbunabali
INSERT INTO mob_droplist VALUES(4062,0,0,250,21294,334); -- hgafircian / VWNM Ogbunabali
INSERT INTO mob_droplist VALUES(4062,1,1,1000,1301,500); -- Wind Bead / VWNM Ogbunabali
INSERT INTO mob_droplist VALUES(4062,1,1,1000,1303,500); -- Lightning Bead / VWNM Ogbunabali
INSERT INTO mob_droplist VALUES(4063,0,0,250,20742,333); -- iztaasu / VWNM Roly-Poly
INSERT INTO mob_droplist VALUES(4063,0,0,250,20924,333); -- iizamal / VWNM Roly-Poly
INSERT INTO mob_droplist VALUES(4063,0,0,250,21132,334); -- aedold / VWNM Roly-Poly
INSERT INTO mob_droplist VALUES(4063,1,1,1000,3321,500); -- Aqua Gem / VWNM Roly-Poly
INSERT INTO mob_droplist VALUES(4063,1,1,1000,3318,500); -- Breeze Gem / VWNM Roly-Poly
INSERT INTO mob_droplist VALUES(4064,0,0,250,20924,333); -- iizamal / VWNM Laidly_Laurence
INSERT INTO mob_droplist VALUES(4064,0,0,250,20967,333); -- qatsunoci / VWNM Laidly_Laurence
INSERT INTO mob_droplist VALUES(4064,0,0,250,21013,334); -- kannakiri / VWNM Laidly_Laurence
INSERT INTO mob_droplist VALUES(4064,1,1,1000,3923,500); -- Rhodium Ingot / VWNM Laidly_Laurence
INSERT INTO mob_droplist VALUES(4064,1,1,1000,3321,500); -- Aqua Gem / VWNM Laidly_Laurence
INSERT INTO mob_droplist VALUES(4065,0,0,250,20967,333); -- qatsunoci / VWNM Mellonia
INSERT INTO mob_droplist VALUES(4065,0,0,250,21058,333); -- shichishito / VWNM Mellonia
INSERT INTO mob_droplist VALUES(4065,0,0,250,20877,334); -- iclamar / VWNM Mellonia
INSERT INTO mob_droplist VALUES(4065,1,1,1000,1713,500); -- Cashmere Thread / VWNM Mellonia
INSERT INTO mob_droplist VALUES(4065,1,1,1000,1306,500); -- Dark Bead / VWNM Mellonia
INSERT INTO mob_droplist VALUES(4066,0,0,250,21058,333); -- shichishito / VWNM Nympha_Eunomia
INSERT INTO mob_droplist VALUES(4066,0,0,250,21209,333); -- uffrat / VWNM Nympha_Eunomia
INSERT INTO mob_droplist VALUES(4066,0,0,250,20833,334); -- faizzeer / VWNM Nympha_Eunomia
INSERT INTO mob_droplist VALUES(4066,1,1,1000,1303,500); -- Lightning Bead / VWNM Nympha_Eunomia
INSERT INTO mob_droplist VALUES(4066,1,1,1000,1299,500); -- Fire Bead / VWNM Nympha_Eunomia
INSERT INTO mob_droplist VALUES(4067,0,0,250,21209,333); -- uffrat / VWNM Gasha
INSERT INTO mob_droplist VALUES(4067,0,0,250,21242,333); -- bocluamni / VWNM Gasha
INSERT INTO mob_droplist VALUES(4067,0,0,250,20787,334); -- crobaci / VWNM Gasha
INSERT INTO mob_droplist VALUES(4067,1,1,1000,3322,500); -- Light Gem / VWNM Gasha
INSERT INTO mob_droplist VALUES(4067,1,1,1000,3322,500); -- Light Gem / VWNM Gasha
INSERT INTO mob_droplist VALUES(4068,0,0,250,21242,333); -- bocluamni / VWNM Giltine
INSERT INTO mob_droplist VALUES(4068,0,0,250,20787,333); -- crobaci / VWNM Giltine
INSERT INTO mob_droplist VALUES(4068,0,0,250,20553,334); -- ninzas / VWNM Giltine
INSERT INTO mob_droplist VALUES(4068,1,1,1000,3926,500); -- Urunday Log / VWNM Giltine
INSERT INTO mob_droplist VALUES(4068,1,1,1000,3919,500); -- Midrium Ingot / VWNM Giltine
INSERT INTO mob_droplist VALUES(4069,0,0,250,20787,333); -- crobaci / VWNM Cath_Palug
INSERT INTO mob_droplist VALUES(4069,0,0,250,20833,333); -- faizzeer / VWNM Cath_Palug
INSERT INTO mob_droplist VALUES(4069,0,0,250,21209,334); -- uffrat / VWNM Cath_Palug
INSERT INTO mob_droplist VALUES(4069,1,1,1000,1300,500); -- Ice Bead / VWNM Cath_Palug
INSERT INTO mob_droplist VALUES(4069,1,1,1000,3926,500); -- Urunday Log / VWNM Cath_Palug
INSERT INTO mob_droplist VALUES(4070,0,0,250,20833,333); -- faizzeer / VWNM Modron
INSERT INTO mob_droplist VALUES(4070,0,0,250,20877,333); -- iclamar / VWNM Modron
INSERT INTO mob_droplist VALUES(4070,0,0,250,21058,334); -- shichishito / VWNM Modron
INSERT INTO mob_droplist VALUES(4070,1,1,1000,1299,500); -- Fire Bead / VWNM Modron
INSERT INTO mob_droplist VALUES(4070,1,1,1000,942,500); -- Philosophers Stone / VWNM Modron
INSERT INTO mob_droplist VALUES(4071,0,0,250,20877,333); -- iclamar / VWNM Mimic_King
INSERT INTO mob_droplist VALUES(4071,0,0,250,21013,333); -- kannakiri / VWNM Mimic_King
INSERT INTO mob_droplist VALUES(4071,0,0,250,20967,334); -- qatsunoci / VWNM Mimic_King
INSERT INTO mob_droplist VALUES(4071,1,1,1000,1306,500); -- Dark Bead / VWNM Mimic_King
INSERT INTO mob_droplist VALUES(4071,1,1,1000,747,500); -- Orichalcum Ingot / VWNM Mimic_King
INSERT INTO mob_droplist VALUES(4072,0,0,250,21013,333); -- kannakiri / VWNM Bismarck
INSERT INTO mob_droplist VALUES(4072,0,0,250,21132,333); -- aedold / VWNM Bismarck
INSERT INTO mob_droplist VALUES(4072,0,0,250,20924,334); -- iizamal / VWNM Bismarck
INSERT INTO mob_droplist VALUES(4072,1,1,1000,3919,500); -- Midrium Ingot / VWNM Bismarck
INSERT INTO mob_droplist VALUES(4072,1,1,1000,1305,500); -- Light Bead / VWNM Bismarck
INSERT INTO mob_droplist VALUES(4073,0,0,250,21132,333); -- aedold / VWNM Morta
INSERT INTO mob_droplist VALUES(4073,0,0,250,21294,333); -- hgafircian / VWNM Morta
INSERT INTO mob_droplist VALUES(4073,0,0,250,20742,334); -- iztaasu / VWNM Morta
INSERT INTO mob_droplist VALUES(4073,1,1,1000,747,500); -- Orichalcum Ingot / VWNM Morta
INSERT INTO mob_droplist VALUES(4073,1,1,1000,3923,500); -- Rhodium Ingot / VWNM Morta
INSERT INTO mob_droplist VALUES(4074,0,0,250,26092,333); -- Hretha Earring / VWNM Murk-Veined_Baneberry
INSERT INTO mob_droplist VALUES(4074,0,0,250,20530,333); -- Ohrmazd / VWNM Murk-Veined_Baneberry
INSERT INTO mob_droplist VALUES(4074,0,0,250,21476,334); -- doomsday / VWNM Murk-Veined_Baneberry
INSERT INTO mob_droplist VALUES(4074,1,1,1000,4272,500); -- Dragon Meat / VWNM Murk-Veined_Baneberry
INSERT INTO mob_droplist VALUES(4075,0,0,250,26089,333); -- Ran Earring / VWNM Melancholic_Moira
INSERT INTO mob_droplist VALUES(4075,0,0,250,20616,333); -- ipetam / VWNM Melancholic_Moira
INSERT INTO mob_droplist VALUES(4075,0,0,250,21224,334); -- phaosphaelia / VWNM Melancholic_Moira
INSERT INTO mob_droplist VALUES(4075,1,1,1000,1764,500); -- Kejusu Satin / VWNM Melancholic_Moira
INSERT INTO mob_droplist VALUES(4076,0,0,250,26091,333); -- Foresti Earring / VWNM Belphoebe
INSERT INTO mob_droplist VALUES(4076,0,0,250,20759,333); -- macbain / VWNM Belphoebe
INSERT INTO mob_droplist VALUES(4076,0,0,250,20946,334); -- olyndicus / VWNM Belphoebe
INSERT INTO mob_droplist VALUES(4076,1,1,1000,3319,500); -- Soil Gem / VWNM Belphoebe
INSERT INTO mob_droplist VALUES(4077,0,0,250,26090,333); -- Hermodr Earring / VWNM Kholomodumo
INSERT INTO mob_droplist VALUES(4077,0,0,250,20901,333); -- inanna / VWNM Kholomodumo
INSERT INTO mob_droplist VALUES(4077,0,0,250,21105,334); -- nehushtan / VWNM Kholomodumo
INSERT INTO mob_droplist VALUES(4077,1,1,1000,1713,500); -- Cashmere Thread / VWNM Kholomodumo
INSERT INTO mob_droplist VALUES(4078,0,0,250,26093,333); -- Saxnot Earring / VWNM Lord_Asag
INSERT INTO mob_droplist VALUES(4078,0,0,250,20809,333); -- kumbhakarna / VWNM Lord_Asag
INSERT INTO mob_droplist VALUES(4078,0,0,250,21169,334); -- keraunos / VWNM Lord_Asag
INSERT INTO mob_droplist VALUES(4078,1,1,1000,3320,500); -- Thunder Gem / VWNM Lord_Asag
INSERT INTO mob_droplist VALUES(4079,0,0,250,26098,333); -- Meili Earring / VWNM Akupara
INSERT INTO mob_droplist VALUES(4079,0,0,250,20857,333); -- svarga / VWNM Akupara
INSERT INTO mob_droplist VALUES(4079,0,0,250,20718,334); -- claidheamh soluis / VWNM Akupara
INSERT INTO mob_droplist VALUES(4079,1,1,1000,1304,500); -- Water Bead / VWNM Akupara
INSERT INTO mob_droplist VALUES(4080,0,0,250,26095,333); -- Mimir Earring / VWNM Kaggen
INSERT INTO mob_droplist VALUES(4080,0,0,250,20718,333); -- claidheamh soluis / VWNM Kaggen
INSERT INTO mob_droplist VALUES(4080,0,0,250,20857,334); -- svarga / VWNM Kaggen
INSERT INTO mob_droplist VALUES(4080,1,1,1000,1301,500); -- Wind Bead / VWNM Kaggen
INSERT INTO mob_droplist VALUES(4080,1,2,1000,3492,1000); -- Kaggens Cuticle / VWNM Kaggen
INSERT INTO mob_droplist VALUES(4080,1,2,1000,3492,500); -- Kaggens Cuticle / VWNM Kaggen
INSERT INTO mob_droplist VALUES(4081,0,0,250,26096,333); -- Vor Earring / VWNM Akvan
INSERT INTO mob_droplist VALUES(4081,0,0,250,21169,333); -- keraunos / VWNM Akvan
INSERT INTO mob_droplist VALUES(4081,0,0,250,20809,334); -- kumbhakarna / VWNM Akvan
INSERT INTO mob_droplist VALUES(4081,1,1,1000,3323,500); -- Shadow Gem / VWNM Akvan
INSERT INTO mob_droplist VALUES(4081,1,2,1000,3491,1000); -- Akvans Pennon / VWNM Akvan
INSERT INTO mob_droplist VALUES(4081,1,2,1000,3491,500); -- Akvans Pennon / VWNM Akvan
INSERT INTO mob_droplist VALUES(4082,0,0,250,26097,333); -- Ilmr Earring / VWNM Pil
INSERT INTO mob_droplist VALUES(4082,0,0,250,21105,333); -- nehushtan / VWNM Pil
INSERT INTO mob_droplist VALUES(4082,0,0,250,20901,334); -- inanna / VWNM Pil
INSERT INTO mob_droplist VALUES(4082,1,1,1000,1302,500); -- Earth Bead / VWNM Pil
INSERT INTO mob_droplist VALUES(4082,1,2,1000,3490,1000); -- Pils Tuille / VWNM Pil
INSERT INTO mob_droplist VALUES(4082,1,2,1000,3490,500); -- Pils Tuille / VWNM Pil
INSERT INTO mob_droplist VALUES(4083,0,0,250,26094,333); -- Mani Earring / VWNM Aello
INSERT INTO mob_droplist VALUES(4083,0,0,250,20946,333); -- olyndicus / VWNM Aello
INSERT INTO mob_droplist VALUES(4083,0,0,250,20759,334); -- macbain / VWNM Aello
INSERT INTO mob_droplist VALUES(4083,1,1,1000,3316,500); -- Flame Gem / VWNM Aello
INSERT INTO mob_droplist VALUES(4084,0,0,250,26099,333); -- Lodurr Earring / VWNM Uptala
INSERT INTO mob_droplist VALUES(4084,0,0,250,21224,333); -- phaosphaelia / VWNM Uptala
INSERT INTO mob_droplist VALUES(4084,0,0,250,20616,334); -- ipetam / VWNM Uptala
INSERT INTO mob_droplist VALUES(4084,1,1,1000,1300,500); -- Ice Bead / VWNM Uptala
INSERT INTO mob_droplist VALUES(4085,0,0,250,26104,333); -- Njordr Earring / VWNM Qilin
INSERT INTO mob_droplist VALUES(4085,0,0,250,21476,333); -- doomsday / VWNM Qilin
INSERT INTO mob_droplist VALUES(4085,0,0,250,20530,334); -- Ohrmazd / VWNM Qilin
INSERT INTO mob_droplist VALUES(4085,1,1,1000,1133,500); -- Dragon Blood / VWNM Qilin
INSERT INTO mob_droplist VALUES(4086,0,0,250,26101,333); -- Bragi Earring / VWNM Celaeno
INSERT INTO mob_droplist VALUES(4086,0,0,250,21037,333); -- nenekirimaru / VWNM Celaeno
INSERT INTO mob_droplist VALUES(4086,0,0,250,20759,334); -- macbain / VWNM Celaeno
INSERT INTO mob_droplist VALUES(4086,1,1,1000,3919,500); -- Midrium Ingot / VWNM Celaeno
INSERT INTO mob_droplist VALUES(4086,1,2,1000,3449,1000); -- Celaenos Cloth / VWNM Celaeno
INSERT INTO mob_droplist VALUES(4086,1,2,1000,3449,500); -- Celaenos Cloth / VWNM Celaeno
INSERT INTO mob_droplist VALUES(4087,0,0,250,26103,333); -- Dellingr Earring / VWNM Hahava
INSERT INTO mob_droplist VALUES(4087,0,0,250,20989,333); -- izuna / VWNM Hahava
INSERT INTO mob_droplist VALUES(4087,0,0,250,20901,334); -- inanna / VWNM Hahava
INSERT INTO mob_droplist VALUES(4087,1,1,1000,3926,500); -- Urunday Log / VWNM Hahava
INSERT INTO mob_droplist VALUES(4087,1,2,1000,3445,1000); -- Hahavas Mail / VWNM Hahava
INSERT INTO mob_droplist VALUES(4087,1,2,1000,3445,500); -- Hahavas Mail / VWNM Hahava
INSERT INTO mob_droplist VALUES(4088,0,0,250,26102,333); -- Gersemi Earring / VWNM Voidwrought
INSERT INTO mob_droplist VALUES(4088,0,0,250,27627,333); -- svalinn / VWNM Voidwrought
INSERT INTO mob_droplist VALUES(4088,0,0,250,20809,334); -- kumbhakarna / VWNM Voidwrought
INSERT INTO mob_droplist VALUES(4088,1,1,1000,942,500); -- Philosophers Stone / VWNM Voidwrought
INSERT INTO mob_droplist VALUES(4088,1,2,1000,3447,1000); -- Voidwrought Plate / VWNM Voidwrought
INSERT INTO mob_droplist VALUES(4088,1,2,1000,3447,500); -- Voidwrought Plate / VWNM Voidwrought
INSERT INTO mob_droplist VALUES(4089,0,0,250,26100,333); -- Hnoss Earring / VWNM Lancing_Lamorak
INSERT INTO mob_droplist VALUES(4089,0,0,250,21404,333); -- linos / VWNM Lancing_Lamorak
INSERT INTO mob_droplist VALUES(4089,0,0,250,20857,334); -- svarga / VWNM Lancing_Lamorak
INSERT INTO mob_droplist VALUES(4089,1,1,1000,747,500); -- Orichalcum Ingot / VWNM Lancing_Lamorak
INSERT INTO mob_droplist VALUES(4090,0,0,250,26105,333); -- Gna Earring / VWNM Bhishani
INSERT INTO mob_droplist VALUES(4090,0,0,250,20530,333); -- Ohrmazd / VWNM Bhishani
INSERT INTO mob_droplist VALUES(4090,0,0,250,20718,334); -- claidheamh soluis / VWNM Bhishani
INSERT INTO mob_droplist VALUES(4090,1,1,1000,1305,500); -- Light Bead / VWNM Bhishani
INSERT INTO mob_droplist VALUES(4091,0,0,250,26106,333); -- Fulla Earring / VWNM RW_NW_Prt_M_Hrw
INSERT INTO mob_droplist VALUES(4091,0,0,250,20616,333); -- ipetam / VWNM RW_NW_Prt_M_Hrw
INSERT INTO mob_droplist VALUES(4091,0,0,250,21169,334); -- keraunos / VWNM RW_NW_Prt_M_Hrw
INSERT INTO mob_droplist VALUES(4091,1,1,1000,3923,500); -- Rhodium Ingot / VWNM RW_NW_Prt_M_Hrw
INSERT INTO mob_droplist VALUES(4092,0,0,250,27046,200); -- Acro Gauntlets / VWNM Stachysaurus
INSERT INTO mob_droplist VALUES(4092,0,0,250,27045,200); -- Yorium Gauntlets / VWNM Stachysaurus
INSERT INTO mob_droplist VALUES(4092,0,0,250,27047,200); -- Taeon Gloves / VWNM Stachysaurus
INSERT INTO mob_droplist VALUES(4092,0,0,250,27048,200); -- Telchine Gloves / VWNM Stachysaurus
INSERT INTO mob_droplist VALUES(4092,0,0,250,27049,200); -- Helios Gloves / VWNM Stachysaurus
INSERT INTO mob_droplist VALUES(4093,0,0,250,27233,200); -- Acro Breeches / VWNM Gwynn_Ap_Nudd
INSERT INTO mob_droplist VALUES(4093,0,0,250,27232,200); -- Yorium Cuisses / VWNM Gwynn_Ap_Nudd
INSERT INTO mob_droplist VALUES(4093,0,0,250,27234,200); -- Taeon Tights / VWNM Gwynn_Ap_Nudd
INSERT INTO mob_droplist VALUES(4093,0,0,250,27235,200); -- Telchine Braconi / VWNM Gwynn_Ap_Nudd
INSERT INTO mob_droplist VALUES(4093,0,0,250,27236,200); -- Helios Spats / VWNM Gwynn_Ap_Nudd
INSERT INTO mob_droplist VALUES(4094,0,0,250,27403,200); -- Acro Leggings / VWNM Smierc
INSERT INTO mob_droplist VALUES(4094,0,0,250,27402,200); -- Yorium Sabatons / VWNM Smierc
INSERT INTO mob_droplist VALUES(4094,0,0,250,27404,200); -- Taeon Boots / VWNM Smierc
INSERT INTO mob_droplist VALUES(4094,0,0,250,27405,200); -- Telchine Pigaches / VWNM Smierc
INSERT INTO mob_droplist VALUES(4094,0,0,250,27406,200); -- Helios Boots / VWNM Smierc
INSERT INTO mob_droplist VALUES(4095,0,0,250,26892,500); -- Acro Surcoat / VWNM Gaunab
INSERT INTO mob_droplist VALUES(4095,0,0,250,26734,500); -- Acro Helm / VWNM Gaunab
INSERT INTO mob_droplist VALUES(4095,1,1,1000,3954,333); -- Ghastly Stone / VWNM Gaunab
INSERT INTO mob_droplist VALUES(4095,1,1,1000,4033,333); -- Verdigris Stone / VWNM Gaunab
INSERT INTO mob_droplist VALUES(4095,1,1,1000,3951,334); -- Wailing Stone / VWNM Gaunab
INSERT INTO mob_droplist VALUES(4096,0,0,250,26895,500); -- Helios Jacket / VWNM Ocythoe
INSERT INTO mob_droplist VALUES(4096,0,0,250,26737,500); -- Helios Band / VWNM Ocythoe
INSERT INTO mob_droplist VALUES(4096,1,1,1000,3954,333); -- Ghastly Stone / VWNM Ocythoe
INSERT INTO mob_droplist VALUES(4096,1,1,1000,4033,333); -- Verdigris Stone / VWNM Ocythoe
INSERT INTO mob_droplist VALUES(4096,1,1,1000,3951,334); -- Wailing Stone / VWNM Ocythoe
INSERT INTO mob_droplist VALUES(4097,0,0,250,26893,500); -- Taeon Tabard / VWNM Kalasutrax
INSERT INTO mob_droplist VALUES(4097,0,0,250,26735,500); -- Taeon Chapeau / VWNM Kalasutrax
INSERT INTO mob_droplist VALUES(4097,1,1,1000,3954,333); -- Ghastly Stone / VWNM Kalasutrax
INSERT INTO mob_droplist VALUES(4097,1,1,1000,4033,333); -- Verdigris Stone / VWNM Kalasutrax
INSERT INTO mob_droplist VALUES(4097,1,1,1000,3951,334); -- Wailing Stone / VWNM Kalasutrax
INSERT INTO mob_droplist VALUES(4098,0,0,250,26891,500); -- Yorium Cuirass / VWNM Ig-Alima
INSERT INTO mob_droplist VALUES(4098,0,0,250,26733,500); -- Yorium Barbuta / VWNM Ig-Alima
INSERT INTO mob_droplist VALUES(4098,1,1,1000,3954,333); -- Ghastly Stone / VWNM Ig-Alima
INSERT INTO mob_droplist VALUES(4098,1,1,1000,4033,333); -- Verdigris Stone / VWNM Ig-Alima
INSERT INTO mob_droplist VALUES(4098,1,1,1000,3951,334); -- Wailing Stone / VWNM Ig-Alima
INSERT INTO mob_droplist VALUES(4099,0,0,250,26894,500); -- Telchine Chas. / VWNM Botulus_Rex
INSERT INTO mob_droplist VALUES(4099,0,0,250,26736,500); -- Telchine Cap / VWNM Botulus_Rex
INSERT INTO mob_droplist VALUES(4099,1,1,1000,3954,333); -- Ghastly Stone / VWNM Botulus_Rex
INSERT INTO mob_droplist VALUES(4099,1,1,1000,4033,333); -- Verdigris Stone / VWNM Botulus_Rex
INSERT INTO mob_droplist VALUES(4099,1,1,1000,3951,334); -- Wailing Stone / VWNM Botulus_Rex
INSERT INTO mob_droplist VALUES(4100,1,1,1000,4065,250); -- Rem tale 2 / NMs Ix'aern (MNK)
INSERT INTO mob_droplist VALUES(4100,1,1,1000,4066,250); -- Rem tale 3 / NMs Ix'aern (MNK)
INSERT INTO mob_droplist VALUES(4100,1,2,1000,837,250); -- Malboro Fiber / NMs Ix'aern (MNK)
INSERT INTO mob_droplist VALUES(4100,1,2,1000,844,250); -- Phoenix Feather / NMs Ix'aern (MNK)
INSERT INTO mob_droplist VALUES(4100,1,3,1000,20819,500); -- Antican Axe / NMs Ix'aern (MNK)
INSERT INTO mob_droplist VALUES(4100,1,3,1000,20730,500); -- Predatrice / NMs Ix'aern (MNK)
INSERT INTO mob_droplist VALUES(4101,0,0,1000,4072,1000); -- Rem's Tale Ch. 9 Leviathan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4101,1,1,500,4072,250); -- Rem's Tale Ch. 9 Leviathan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4101,1,2,1000,20944,333); -- Pelagos Lance Leviathan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4101,1,2,1000,21103,333); -- Vadose Rod Leviathan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4101,1,2,1000,20856,334); -- Phreatic Axe Leviathan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4101,1,3,1000,21420,500); -- Benthos Grip Leviathan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4101,1,3,1000,28493,500); -- Neritic Earring Leviathan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4101,1,4,1000,8720,200); -- Maliyakaleya Coral Leviathan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4101,1,4,1000,8721,200); -- Hepatizon Ore Leviathan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4101,1,4,1000,8723,200); -- Beryllium Ore Leviathan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4101,1,4,1000,8725,200); -- Exalted Log Leviathan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4101,1,4,1000,8727,200); -- Sif's Lock Leviathan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4102,0,0,1000,4069,1000); -- Rem's Tale Ch. 6 Garuda_Prime_HTBF
INSERT INTO mob_droplist VALUES(4102,1,1,500,4069,250); -- Rem's Tale Ch. 6 Garuda_Prime_HTBF
INSERT INTO mob_droplist VALUES(4102,1,2,1000,20615,333); -- Levante Dagger Garuda_Prime_HTBF
INSERT INTO mob_droplist VALUES(4102,1,2,1000,20808,333); -- Tramontane Axe Garuda_Prime_HTBF
INSERT INTO mob_droplist VALUES(4102,1,2,1000,28538,334); -- Lebeche Ring Garuda_Prime_HTBF
INSERT INTO mob_droplist VALUES(4102,1,3,1000,28441,500); -- Ponente Sash Garuda_Prime_HTBF
INSERT INTO mob_droplist VALUES(4102,1,3,1000,28286,500); -- Ostro Greaves Garuda_Prime_HTBF
INSERT INTO mob_droplist VALUES(4102,1,4,1000,8720,200); -- Maliyakaleya Coral Garuda_Prime_HTBF
INSERT INTO mob_droplist VALUES(4102,1,4,1000,8721,200); -- Hepatizon Ore Garuda_Prime_HTBF
INSERT INTO mob_droplist VALUES(4102,1,4,1000,8723,200); -- Beryllium Ore Garuda_Prime_HTBF
INSERT INTO mob_droplist VALUES(4102,1,4,1000,8725,200); -- Exalted Log Garuda_Prime_HTBF
INSERT INTO mob_droplist VALUES(4102,1,4,1000,8727,200); -- Sif's Lock Garuda_Prime_HTBF
INSERT INTO mob_droplist VALUES(4103,0,0,1000,4073,1000); -- Rem's Tale Ch. 10 Shiva_Prime_HTBF
INSERT INTO mob_droplist VALUES(4103,1,1,500,4073,250); -- Rem's Tale Ch. 10 Shiva_Prime_HTBF
INSERT INTO mob_droplist VALUES(4103,1,2,1000,20529,333); -- Calved Claws Shiva_Prime_HTBF
INSERT INTO mob_droplist VALUES(4103,1,2,1000,21167,333); -- Frazil Staff Shiva_Prime_HTBF
INSERT INTO mob_droplist VALUES(4103,1,2,1000,28495,334); -- Rimeice Earring Shiva_Prime_HTBF
INSERT INTO mob_droplist VALUES(4103,1,3,1000,28008,500); -- Nilas Gloves Shiva_Prime_HTBF
INSERT INTO mob_droplist VALUES(4103,1,3,1000,21366,500); -- Floestone Shiva_Prime_HTBF
INSERT INTO mob_droplist VALUES(4103,1,4,1000,8720,200); -- Maliyakaleya Coral Shiva_Prime_HTBF
INSERT INTO mob_droplist VALUES(4103,1,4,1000,8721,200); -- Hepatizon Ore Shiva_Prime_HTBF
INSERT INTO mob_droplist VALUES(4103,1,4,1000,8723,200); -- Beryllium Ore Shiva_Prime_HTBF
INSERT INTO mob_droplist VALUES(4103,1,4,1000,8725,200); -- Exalted Log Shiva_Prime_HTBF
INSERT INTO mob_droplist VALUES(4103,1,4,1000,8727,200); -- Sif's Lock Shiva_Prime_HTBF
INSERT INTO mob_droplist VALUES(4104,0,0,1000,4070,1000); -- Rem's Tale Ch. 7 Ramuh_Prime_HTBF
INSERT INTO mob_droplist VALUES(4104,1,1,500,4070,250); -- Rem's Tale Ch. 7 Ramuh_Prime_HTBF
INSERT INTO mob_droplist VALUES(4104,1,2,1000,21166,333); -- Staccato Staff Ramuh_Prime_HTBF
INSERT INTO mob_droplist VALUES(4104,1,2,1000,21274,333); -- Donar Gun Ramuh_Prime_HTBF
INSERT INTO mob_droplist VALUES(4104,1,2,1000,28354,334); -- Voltsurge Torque Ramuh_Prime_HTBF
INSERT INTO mob_droplist VALUES(4104,1,3,1000,28432,500); -- Ukko Sash Ramuh_Prime_HTBF
INSERT INTO mob_droplist VALUES(4104,1,3,1000,28142,500); -- Brontes Cuisses Ramuh_Prime_HTBF
INSERT INTO mob_droplist VALUES(4104,1,4,1000,8720,200); -- Maliyakaleya Coral Ramuh_Prime_HTBF
INSERT INTO mob_droplist VALUES(4104,1,4,1000,8721,200); -- Hepatizon Ore Ramuh_Prime_HTBF
INSERT INTO mob_droplist VALUES(4104,1,4,1000,8723,200); -- Beryllium Ore Ramuh_Prime_HTBF
INSERT INTO mob_droplist VALUES(4104,1,4,1000,8725,200); -- Exalted Log Ramuh_Prime_HTBF
INSERT INTO mob_droplist VALUES(4104,1,4,1000,8727,200); -- Sif's Lock Ramuh_Prime_HTBF
INSERT INTO mob_droplist VALUES(4105,0,0,1000,4072,1000); -- Rem's Tale Ch. 9 Ifrit_Prime_HTBF
INSERT INTO mob_droplist VALUES(4105,1,1,500,4072,250); -- Rem's Tale Ch. 9 Ifrit_Prime_HTBF
INSERT INTO mob_droplist VALUES(4105,1,2,1000,20716,333); -- Perfervid Sword Ifrit_Prime_HTBF
INSERT INTO mob_droplist VALUES(4105,1,2,1000,21036,333); -- Atakigiri Ifrit_Prime_HTBF
INSERT INTO mob_droplist VALUES(4105,1,2,1000,28285,334); -- Coalrake Sabots Ifrit_Prime_HTBF
INSERT INTO mob_droplist VALUES(4105,1,3,1000,27594,500); -- Annealed Mantle Ifrit_Prime_HTBF
INSERT INTO mob_droplist VALUES(4105,1,3,1000,21421,500); -- Immolation Grip Ifrit_Prime_HTBF
INSERT INTO mob_droplist VALUES(4105,1,4,1000,8720,200); -- Maliyakaleya Coral Ifrit_Prime_HTBF
INSERT INTO mob_droplist VALUES(4105,1,4,1000,8721,200); -- Hepatizon Ore Ifrit_Prime_HTBF
INSERT INTO mob_droplist VALUES(4105,1,4,1000,8723,200); -- Beryllium Ore Ifrit_Prime_HTBF
INSERT INTO mob_droplist VALUES(4105,1,4,1000,8725,200); -- Exalted Log Ifrit_Prime_HTBF
INSERT INTO mob_droplist VALUES(4105,1,4,1000,8727,200); -- Sif's Lock Ifrit_Prime_HTBF
INSERT INTO mob_droplist VALUES(4106,0,0,1000,4071,1000); -- Rem's Tale Ch. 8 Titan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4106,1,1,500,4071,250); -- Rem's Tale Ch. 8 Titan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4106,1,2,1000,21102,333); -- Mafic Cudgel Titan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4106,1,2,1000,20757,333); -- Foreshock Sword Titan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4106,1,2,1000,21357,334); -- Togakushi Shuriken Titan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4106,1,3,1000,28535,500); -- Supershear Ring Titan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4106,1,3,1000,21358,500); -- Plumose Sachet Titan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4106,1,4,1000,8720,200); -- Maliyakaleya Coral Titan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4106,1,4,1000,8721,200); -- Hepatizon Ore Titan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4106,1,4,1000,8723,200); -- Beryllium Ore Titan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4106,1,4,1000,8725,200); -- Exalted Log Titan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4106,1,4,1000,8727,200); -- Sif's Lock Titan_Prime_HTBF
INSERT INTO mob_droplist VALUES(4107,0,0,1000,4069,1000); -- Rem's Tale Ch. 6 Fenrir_Prime_HTBF
INSERT INTO mob_droplist VALUES(4107,1,1,500,4069,250); -- Rem's Tale Ch. 6 Fenrir_Prime_HTBF
INSERT INTO mob_droplist VALUES(4107,1,2,1000,20707,333); -- Medeina Kilij Fenrir_Prime_HTBF
INSERT INTO mob_droplist VALUES(4107,1,2,1000,21412,333); -- Capitoline Strap Fenrir_Prime_HTBF
INSERT INTO mob_droplist VALUES(4107,1,2,1000,25600,334); -- Ma'iitsoh Haube Fenrir_Prime_HTBF
INSERT INTO mob_droplist VALUES(4107,1,3,1000,26969,500); -- Vrikodara Jupon Fenrir_Prime_HTBF
INSERT INTO mob_droplist VALUES(4107,1,3,1000,27608,500); -- Lupine Cape Fenrir_Prime_HTBF
INSERT INTO mob_droplist VALUES(4107,1,4,1000,8720,200); -- Maliyakaleya Coral Fenrir_Prime_HTBF
INSERT INTO mob_droplist VALUES(4107,1,4,1000,8721,200); -- Hepatizon Ore Fenrir_Prime_HTBF
INSERT INTO mob_droplist VALUES(4107,1,4,1000,8723,200); -- Beryllium Ore Fenrir_Prime_HTBF
INSERT INTO mob_droplist VALUES(4107,1,4,1000,8725,200); -- Exalted Log Fenrir_Prime_HTBF
INSERT INTO mob_droplist VALUES(4107,1,4,1000,8727,200); -- Sif's Lock Fenrir_Prime_HTBF
INSERT INTO mob_droplist VALUES(4108,0,0,1000,4070,1000); -- Rem's Tale Ch. 7 Carbuncle_Prime_HTBF
INSERT INTO mob_droplist VALUES(4108,1,1,500,4070,250); -- Rem's Tale Ch. 7 Carbuncle_Prime_HTBF
INSERT INTO mob_droplist VALUES(4108,1,2,1000,21155,333); -- Marquetry Staff Carbuncle_Prime_HTBF
INSERT INTO mob_droplist VALUES(4108,1,2,1000,26970,333); -- Lapidary Tunic Carbuncle_Prime_HTBF
INSERT INTO mob_droplist VALUES(4108,1,2,1000,27466,334); -- Diamantaire Sollerets Carbuncle_Prime_HTBF
INSERT INTO mob_droplist VALUES(4108,1,3,1000,27516,500); -- Satlada Necklace Carbuncle_Prime_HTBF
INSERT INTO mob_droplist VALUES(4108,1,3,1000,28414,500); -- Engraved Belt Carbuncle_Prime_HTBF
INSERT INTO mob_droplist VALUES(4108,1,4,1000,8720,200); -- Maliyakaleya Coral Carbuncle_Prime_HTBF
INSERT INTO mob_droplist VALUES(4108,1,4,1000,8721,200); -- Hepatizon Ore Carbuncle_Prime_HTBF
INSERT INTO mob_droplist VALUES(4108,1,4,1000,8723,200); -- Beryllium Ore Carbuncle_Prime_HTBF
INSERT INTO mob_droplist VALUES(4108,1,4,1000,8725,200); -- Exalted Log Carbuncle_Prime_HTBF
INSERT INTO mob_droplist VALUES(4108,1,4,1000,8727,200); -- Sif's Lock Carbuncle_Prime_HTBF
INSERT INTO mob_droplist VALUES(4109,0,0,1000,4071,1000); -- Rem's Tale Ch. 8 Diabolos_Prime_HTBF
INSERT INTO mob_droplist VALUES(4109,1,1,500,4071,250); -- Rem's Tale Ch. 8 Diabolos_Prime_HTBF
INSERT INTO mob_droplist VALUES(4109,1,2,1000,20982,333); -- Shuhansadamune Diabolos_Prime_HTBF
INSERT INTO mob_droplist VALUES(4109,1,2,1000,26971,333); -- Chozoron Coselete Diabolos_Prime_HTBF
INSERT INTO mob_droplist VALUES(4109,1,2,1000,27105,334); -- Loagaeth Cuffs Diabolos_Prime_HTBF
INSERT INTO mob_droplist VALUES(4109,1,3,1000,27531,500); -- Darkside Earring Diabolos_Prime_HTBF
INSERT INTO mob_droplist VALUES(4109,1,3,1000,10767,500); -- Pernicious Ring Diabolos_Prime_HTBF
INSERT INTO mob_droplist VALUES(4109,1,4,1000,8720,200); -- Maliyakaleya Coral Diabolos_Prime_HTBF
INSERT INTO mob_droplist VALUES(4109,1,4,1000,8721,200); -- Hepatizon Ore Diabolos_Prime_HTBF
INSERT INTO mob_droplist VALUES(4109,1,4,1000,8723,200); -- Beryllium Ore Diabolos_Prime_HTBF
INSERT INTO mob_droplist VALUES(4109,1,4,1000,8725,200); -- Exalted Log Diabolos_Prime_HTBF
INSERT INTO mob_droplist VALUES(4109,1,4,1000,8727,200); -- Sif's Lock Diabolos_Prime_HTBF
INSERT INTO mob_droplist VALUES(4110,0,0,1000,4070,1000); -- Rem Tale Ch 7 Ark_Angel_EV_HTBF
INSERT INTO mob_droplist VALUES(4110,0,0,250,4070,1000); -- Rem Tale Ch 7 Ark_Angel_EV_HTBF
INSERT INTO mob_droplist VALUES(4110,1,1,1000,8710,375); -- Buried Vestige Ark_Angel_EV_HTBF
INSERT INTO mob_droplist VALUES(4110,1,1,1000,8725,375); -- Exalted Log Ark_Angel_EV_HTBF
INSERT INTO mob_droplist VALUES(4110,1,2,1000,20734,250); -- Anahera Sword Ark_Angel_EV_HTBF
INSERT INTO mob_droplist VALUES(4110,1,2,1000,21116,250); -- Cagliostros Rod Ark_Angel_EV_HTBF
INSERT INTO mob_droplist VALUES(4110,1,3,1000,28173,225); -- Osmium Cuisses Ark_Angel_EV_HTBF
INSERT INTO mob_droplist VALUES(4110,1,3,1000,28578,225); -- Patricius Ring Ark_Angel_EV_HTBF
INSERT INTO mob_droplist VALUES(4110,1,3,1000,28034,200); -- Dynasty Mitts Ark_Angel_EV_HTBF
INSERT INTO mob_droplist VALUES(4111,0,0,1000,4072,1000); -- Rem Tale Ch 9 Ark_Angel_GK_HTBF
INSERT INTO mob_droplist VALUES(4111,0,0,250,4072,1000); -- Rem Tale Ch 9 Ark_Angel_GK_HTBF
INSERT INTO mob_droplist VALUES(4111,1,1,1000,8710,375); -- Buried Vestige Ark_Angel_GK_HTBF
INSERT INTO mob_droplist VALUES(4111,1,1,1000,8727,375); -- Sifs Lock Ark_Angel_GK_HTBF
INSERT INTO mob_droplist VALUES(4111,1,2,1000,20765,250); -- Tunglmyrkvi Ark_Angel_GK_HTBF
INSERT INTO mob_droplist VALUES(4111,1,2,1000,21049,250); -- Anahera Blade Ark_Angel_GK_HTBF
INSERT INTO mob_droplist VALUES(4111,1,3,1000,28389,225); -- Agitators Collar Ark_Angel_GK_HTBF
INSERT INTO mob_droplist VALUES(4111,1,3,1000,28035,225); -- Lurid Mitts Ark_Angel_GK_HTBF
INSERT INTO mob_droplist VALUES(4111,1,3,1000,28313,200); -- Daihanshi Habaki Ark_Angel_GK_HTBF
INSERT INTO mob_droplist VALUES(4112,0,0,1000,4069,1000); -- Rem Tale Ch 6 Ark_Angel_HM_HTBF
INSERT INTO mob_droplist VALUES(4112,0,0,250,4069,1000); -- Rem Tale Ch 6 Ark_Angel_HM_HTBF
INSERT INTO mob_droplist VALUES(4112,1,1,750,8710,375); -- Buried Vestige Ark_Angel_HM_HTBF
INSERT INTO mob_droplist VALUES(4112,1,1,750,8719,375); -- Maliyakaleya Coral Ark_Angel_HM_HTBF
INSERT INTO mob_droplist VALUES(4112,1,2,500,20864,250); -- Castigation Ark_Angel_HM_HTBF
INSERT INTO mob_droplist VALUES(4112,1,2,500,20733,250); -- Anahera Saber Ark_Angel_HM_HTBF
INSERT INTO mob_droplist VALUES(4112,1,3,750,27744,225); -- Lithelimb Cap Ark_Angel_HM_HTBF
INSERT INTO mob_droplist VALUES(4112,1,3,750,21427,225); -- Bloodrain Strap Ark_Angel_HM_HTBF
INSERT INTO mob_droplist VALUES(4112,1,3,750,28311,200); -- Manabyss Pigaches Ark_Angel_HM_HTBF
INSERT INTO mob_droplist VALUES(4113,0,0,1000,4071,1000); -- Rem Tale Ch 8 Ark_Angel_MR_HTBF
INSERT INTO mob_droplist VALUES(4113,0,0,250,4071,1000); -- Rem Tale Ch 8 Ark_Angel_MR_HTBF
INSERT INTO mob_droplist VALUES(4113,1,1,1000,8710,375); -- Buried Vestige Ark_Angel_MR_HTBF
INSERT INTO mob_droplist VALUES(4113,1,1,1000,8723,375); -- Beryllium Ore Ark_Angel_MR_HTBF
INSERT INTO mob_droplist VALUES(4113,1,2,1000,20997,250); -- Raimitsukane Ark_Angel_MR_HTBF
INSERT INTO mob_droplist VALUES(4113,1,2,1000,20822,250); -- Anahera Tabar Ark_Angel_MR_HTBF
INSERT INTO mob_droplist VALUES(4113,1,3,1000,28025,225); -- Regimen Mittens Ark_Angel_MR_HTBF
INSERT INTO mob_droplist VALUES(4113,1,3,1000,27745,225); -- Felistris Mask Ark_Angel_MR_HTBF
INSERT INTO mob_droplist VALUES(4113,1,3,1000,28461,200); -- Sekhmet Corset Ark_Angel_MR_HTBF
INSERT INTO mob_droplist VALUES(4114,0,0,1000,4073,1000); -- Rem Tale Ch 10 Ark_Angel_TT_HTBF
INSERT INTO mob_droplist VALUES(4114,0,0,250,4073,1000); -- Rem Tale Ch 10 Ark_Angel_TT_HTBF
INSERT INTO mob_droplist VALUES(4114,1,1,1000,8710,375); -- Buried Vestige Ark_Angel_TT_HTBF
INSERT INTO mob_droplist VALUES(4114,1,1,1000,8721,375); -- Hepatizon Ore Ark_Angel_TT_HTBF
INSERT INTO mob_droplist VALUES(4114,1,2,1000,20913,250); -- Anahera Scythe Ark_Angel_TT_HTBF
INSERT INTO mob_droplist VALUES(4114,1,2,1000,21181,250); -- Venabulum Ark_Angel_TT_HTBF
INSERT INTO mob_droplist VALUES(4114,1,3,1000,28174,225); -- Theurgists Slacks Ark_Angel_TT_HTBF
INSERT INTO mob_droplist VALUES(4114,1,3,1000,28312,225); -- Scamps Sollerets Ark_Angel_TT_HTBF
INSERT INTO mob_droplist VALUES(4114,1,3,1000,28616,200); -- Fravashi Mantle Ark_Angel_TT_HTBF
INSERT INTO mob_droplist VALUES(4115,0,0,1000,4073,1000); -- Rem Tale Ch 10 Lancelord_Gaheel_HTBF
INSERT INTO mob_droplist VALUES(4115,1,1,500,4073,500); -- Rem Tale Ch 10 Lancelord_Gaheel_HTBF
INSERT INTO mob_droplist VALUES(4115,1,2,1000,8719,333); -- Maliyakaleya Coral Lancelord_Gaheel_HTBF
INSERT INTO mob_droplist VALUES(4115,1,2,1000,8725,333); -- Exalted Log Lancelord_Gaheel_HTBF
INSERT INTO mob_droplist VALUES(4115,1,2,1000,8727,334); -- Sif's Lock Lancelord_Gaheel_HTBF
INSERT INTO mob_droplist VALUES(4115,1,3,750,21368,250); -- Bestas Bane Lancelord_Gaheel_HTBF
INSERT INTO mob_droplist VALUES(4115,1,3,750,21381,250); -- Seraphicaller Lancelord_Gaheel_HTBF
INSERT INTO mob_droplist VALUES(4115,1,3,750,21452,250); -- Divinator Lancelord_Gaheel_HTBF
INSERT INTO mob_droplist VALUES(4115,1,3,750,22261,250); -- Divinator II Lancelord_Gaheel_HTBF
INSERT INTO mob_droplist VALUES(4115,1,4,400,27862,100); -- Savas Jawshan Lancelord_Gaheel_HTBF
INSERT INTO mob_droplist VALUES(4115,1,4,400,28151,100); -- Sifahir Slacks Lancelord_Gaheel_HTBF
INSERT INTO mob_droplist VALUES(4115,1,4,400,27710,100); -- Sahip Helm Lancelord_Gaheel_HTBF
INSERT INTO mob_droplist VALUES(4115,1,4,400,28498,100); -- Pratik Earring Lancelord_Gaheel_HTBF
INSERT INTO mob_droplist VALUES(4116,0,0,1000,4072,1000); -- Rem Tale Ch 9 Tenzen_HTBF
INSERT INTO mob_droplist VALUES(4116,1,1,500,4072,500); -- Rem Tale Ch 9 Tenzen_HTBF
INSERT INTO mob_droplist VALUES(4116,1,2,1000,8721,250); -- Hepatizon Ore Tenzen_HTBF
INSERT INTO mob_droplist VALUES(4116,1,2,1000,8723,250); -- Beryllium Ore Tenzen_HTBF
INSERT INTO mob_droplist VALUES(4116,1,2,1000,8727,250); -- Sifs Lock Tenzen_HTBF
INSERT INTO mob_droplist VALUES(4116,1,2,1000,687,250); -- Scarletite Ingot Tenzen_HTBF
INSERT INTO mob_droplist VALUES(4116,1,3,750,21371,150); -- Ginsen Tenzen_HTBF
INSERT INTO mob_droplist VALUES(4116,1,3,750,21227,150); -- Hangaku-no-Yumi Tenzen_HTBF
INSERT INTO mob_droplist VALUES(4116,1,3,750,21381,150); -- Seraphicaller Tenzen_HTBF
INSERT INTO mob_droplist VALUES(4116,1,3,750,21452,150); -- Divinator Tenzen_HTBF
INSERT INTO mob_droplist VALUES(4116,1,3,750,22261,150); -- Divinator II Tenzen_HTBF
INSERT INTO mob_droplist VALUES(4116,1,4,600,27719,200); -- Sukeroku Hachimaki Tenzen_HTBF
INSERT INTO mob_droplist VALUES(4116,1,4,600,28292,200); -- Battlecast Gaiters Tenzen_HTBF
INSERT INTO mob_droplist VALUES(4116,1,4,600,28379,200); -- Mizukage-no-Kubikazari Tenzen_HTBF
INSERT INTO mob_droplist VALUES(4117,0,0,1000,4073,1000); -- Rem Tale Ch 10 Ultima_HTBF
INSERT INTO mob_droplist VALUES(4117,1,1,500,4073,500); -- Rem Tale Ch 10 Ultima_HTBF
INSERT INTO mob_droplist VALUES(4117,1,2,1000,8719,200); -- Maliyakaleya Coral Ultima_HTBF
INSERT INTO mob_droplist VALUES(4117,1,2,1000,8721,200); -- Hepatizon Ore Ultima_HTBF
INSERT INTO mob_droplist VALUES(4117,1,2,1000,8723,200); -- Beryllium Ore Ultima_HTBF
INSERT INTO mob_droplist VALUES(4117,1,2,1000,8725,200); -- Exalted Log Ultima_HTBF
INSERT INTO mob_droplist VALUES(4117,1,2,1000,8727,200); -- Sifs Lock Ultima_HTBF
INSERT INTO mob_droplist VALUES(4117,1,3,750,20516,375); -- Denouements Ultima_HTBF
INSERT INTO mob_droplist VALUES(4117,1,3,750,26400,375); -- Culminus Ultima_HTBF
INSERT INTO mob_droplist VALUES(4117,1,4,400,25634,100); -- Terminal Helm Ultima_HTBF
INSERT INTO mob_droplist VALUES(4117,1,4,400,25707,100); -- Terminal Plate Ultima_HTBF
INSERT INTO mob_droplist VALUES(4117,1,4,400,27541,100); -- Cessance Earring Ultima_HTBF
INSERT INTO mob_droplist VALUES(4117,1,4,400,26000,100); -- Consummation Torque Ultima_HTBF
INSERT INTO mob_droplist VALUES(4118,0,0,1000,11361,500); -- Pluviale / Ironclad_Executioner
INSERT INTO mob_droplist VALUES(4118,0,0,1000,19256,500); -- Charis Feather / Ironclad_Executioner
INSERT INTO mob_droplist VALUES(4118,1,1,750,19255,375); -- Mavi Tathlum / Ironclad_Executioner
INSERT INTO mob_droplist VALUES(4118,1,1,750,11750,375); -- Creed Baudrier / Ironclad_Executioner
INSERT INTO mob_droplist VALUES(4118,1,2,1000,3219,500); -- Coin of Wieldance / Ironclad_Executioner
INSERT INTO mob_droplist VALUES(4118,1,2,1000,3218,500); -- Stone of Wieldance / Ironclad_Executioner
INSERT INTO mob_droplist VALUES(4119,0,0,1000,4078,333); -- Moonbow Cloth / Supreme Behemoth
INSERT INTO mob_droplist VALUES(4119,0,0,1000,4079,333); -- Moonbow Leather / Supreme Behemoth
INSERT INTO mob_droplist VALUES(4119,0,0,1000,4077,333); -- Moonbow Steel / Supreme Behemoth
INSERT INTO mob_droplist VALUES(4119,1,1,500,26944,125); -- Tartarus Platemail / Supreme Behemoth
INSERT INTO mob_droplist VALUES(4119,1,1,500,20618,125); -- Sandung / Supreme Behemoth
INSERT INTO mob_droplist VALUES(4119,1,2,200,23726,50); -- Volte Gaiters / Supreme Behemoth
INSERT INTO mob_droplist VALUES(4119,1,2,200,23727,50); -- Volte Spats / Supreme Behemoth
INSERT INTO mob_droplist VALUES(4119,1,2,200,23728,50); -- Volte Sollerets / Supreme Behemoth
INSERT INTO mob_droplist VALUES(4119,1,2,200,23729,50); -- Volte Boots / Supreme Behemoth
INSERT INTO mob_droplist VALUES(4120,0,0,1000,9062,250); -- Dark Matter / Supreme Fafnir
INSERT INTO mob_droplist VALUES(4120,0,0,1000,9061,250); -- Hades Claw / Supreme Fafnir
INSERT INTO mob_droplist VALUES(4120,0,0,1000,9064,250); -- Tartarian Chain / Supreme Fafnir
INSERT INTO mob_droplist VALUES(4120,0,0,1000,9063,250); -- Tartarian Soul / Supreme Fafnir
INSERT INTO mob_droplist VALUES(4120,1,1,500,25708,125); -- Gyve Doublet / Supreme Fafnir
INSERT INTO mob_droplist VALUES(4120,1,1,500,25679,125); -- White Rarab Cap +1 / Supreme Fafnir
INSERT INTO mob_droplist VALUES(4120,1,2,200,23718,50); -- Volte Gloves / Supreme Fafnir
INSERT INTO mob_droplist VALUES(4120,1,2,200,23719,50); -- Volte Mittens / Supreme Fafnir
INSERT INTO mob_droplist VALUES(4120,1,2,200,23720,50); -- Volte Moufles / Supreme Fafnir
INSERT INTO mob_droplist VALUES(4120,1,2,200,23721,50); -- Volte Bracers / Supreme Fafnir
INSERT INTO mob_droplist VALUES(4121,0,0,1000,4081,333); -- Moonbow Stone / Supreme Aspid
INSERT INTO mob_droplist VALUES(4121,0,0,1000,4080,333); -- Moonbow Urushi / Supreme Aspid
INSERT INTO mob_droplist VALUES(4121,0,0,1000,4082,333); -- Moonlight Coral / Supreme Aspid
INSERT INTO mob_droplist VALUES(4121,1,1,500,26945,125); -- Counts Garb / Supreme Aspid
INSERT INTO mob_droplist VALUES(4121,1,1,500,28450,125); -- Chaac Belt / Supreme Aspid
INSERT INTO mob_droplist VALUES(4121,1,2,200,23710,50); -- Volte Beret / Supreme Aspid
INSERT INTO mob_droplist VALUES(4121,1,2,200,23711,50); -- Volte Tiara / Supreme Aspid
INSERT INTO mob_droplist VALUES(4121,1,2,200,23712,50); -- Volte Salade / Supreme Aspid
INSERT INTO mob_droplist VALUES(4121,1,2,200,23713,50); -- Volte Cap / Supreme Aspid
INSERT INTO mob_droplist VALUES(4122,0,0,1000,8739,333); -- Wyrm Blood / Supreme Chaos
INSERT INTO mob_droplist VALUES(4122,0,0,1000,9893,333); -- Wyrm Ash / Supreme Chaos
INSERT INTO mob_droplist VALUES(4122,0,0,1000,9251,333); -- Khoma Thread / Supreme Chaos
INSERT INTO mob_droplist VALUES(4122,1,1,500,20706,125); -- Vampirism / Supreme Chaos
INSERT INTO mob_droplist VALUES(4122,1,1,500,22281,125); -- Knobkierrie / Supreme Chaos
INSERT INTO mob_droplist VALUES(4122,1,2,200,23722,50); -- Volte Brais / Supreme Chaos
INSERT INTO mob_droplist VALUES(4122,1,2,200,23723,50); -- Volte Tights / Supreme Chaos
INSERT INTO mob_droplist VALUES(4122,1,2,200,23724,50); -- Volte Brayettes / Supreme Chaos
INSERT INTO mob_droplist VALUES(4122,1,2,200,23725,50); -- Volte Hose / Supreme Chaos
INSERT INTO mob_droplist VALUES(4123,0,0,1000,6367,1000); -- codex_of_etchings / Asb
INSERT INTO mob_droplist VALUES(4123,1,1,250,6367,500); -- codex_of_etchings / Asb
INSERT INTO mob_droplist VALUES(4123,1,2,500,3509,333); -- plate_of_heavy_metal / Asb
INSERT INTO mob_droplist VALUES(4123,1,2,500,3499,333); -- pinch_of_riftcinder / Asb
INSERT INTO mob_droplist VALUES(4123,1,2,500,3498,333); -- clump_of_riftdross / Asb
INSERT INTO mob_droplist VALUES(4124,0,0,1000,6367,1000); -- codex_of_etchings / Pil
INSERT INTO mob_droplist VALUES(4124,1,1,250,6367,500); -- codex_of_etchings / Pil
INSERT INTO mob_droplist VALUES(4124,1,2,500,3509,333); -- plate_of_heavy_metal / Pil
INSERT INTO mob_droplist VALUES(4124,1,2,500,3499,333); -- pinch_of_riftcinder / Pil
INSERT INTO mob_droplist VALUES(4124,1,2,500,3498,333); -- clump_of_riftdross / Pil
INSERT INTO mob_droplist VALUES(4125,0,0,1000,6367,1000); -- codex_of_etchings / Rukh
INSERT INTO mob_droplist VALUES(4125,1,1,250,6367,500); -- codex_of_etchings / Rukh
INSERT INTO mob_droplist VALUES(4125,1,2,500,3509,333); -- plate_of_heavy_metal / Rukh
INSERT INTO mob_droplist VALUES(4125,1,2,500,3499,333); -- pinch_of_riftcinder / Rukh
INSERT INTO mob_droplist VALUES(4125,1,2,500,3498,333); -- clump_of_riftdross / Rukh
INSERT INTO mob_droplist VALUES(4126,0,0,1000,6367,1000); -- codex_of_etchings / Sarbaz
INSERT INTO mob_droplist VALUES(4126,1,1,250,6367,500); -- codex_of_etchings / Sarbaz
INSERT INTO mob_droplist VALUES(4126,1,2,500,3509,333); -- plate_of_heavy_metal / Sarbaz
INSERT INTO mob_droplist VALUES(4126,1,2,500,3499,333); -- pinch_of_riftcinder / Sarbaz
INSERT INTO mob_droplist VALUES(4126,1,2,500,3498,333); -- clump_of_riftdross / Sarbaz
INSERT INTO mob_droplist VALUES(4127,0,0,1000,6367,1000); -- codex_of_etchings / Shah
INSERT INTO mob_droplist VALUES(4127,1,1,250,6367,500); -- codex_of_etchings / Shah
INSERT INTO mob_droplist VALUES(4127,1,2,500,3509,333); -- plate_of_heavy_metal / Shah
INSERT INTO mob_droplist VALUES(4127,1,2,500,3499,333); -- pinch_of_riftcinder / Shah
INSERT INTO mob_droplist VALUES(4127,1,2,500,3498,333); -- clump_of_riftdross / Shah
INSERT INTO mob_droplist VALUES(4128,0,0,1000,6367,1000); -- codex_of_etchings / Wazir
INSERT INTO mob_droplist VALUES(4128,1,1,250,6367,500); -- codex_of_etchings / Wazir
INSERT INTO mob_droplist VALUES(4128,1,2,500,3509,333); -- plate_of_heavy_metal / Wazir
INSERT INTO mob_droplist VALUES(4128,1,2,500,3499,333); -- pinch_of_riftcinder / Wazir
INSERT INTO mob_droplist VALUES(4128,1,2,500,3498,333); -- clump_of_riftdross / Wazir
INSERT INTO mob_droplist VALUES(4129,0,0,1000,6367,1000); -- codex_of_etchings / Provenance_Watcher
INSERT INTO mob_droplist VALUES(4129,0,0,1000,6367,1000); -- codex_of_etchings / Provenance_Watcher
INSERT INTO mob_droplist VALUES(4129,1,1,250,6367,500); -- codex_of_etchings / Provenance_Watcher
INSERT INTO mob_droplist VALUES(4129,1,1,250,6367,500); -- codex_of_etchings / Provenance_Watcher
INSERT INTO mob_droplist VALUES(4129,1,2,1000,3499,1000); -- pinch_of_riftcinder / Provenance_Watcher
INSERT INTO mob_droplist VALUES(4129,1,2,1000,3498,1000); -- clump_of_riftdross / Provenance_Watcher
INSERT INTO mob_droplist VALUES(4129,1,3,500,3509,333); -- heavy_metal_pouch / Provenance_Watcher
INSERT INTO mob_droplist VALUES(4129,1,4,500,3499,333); -- pinch_of_riftcinder / Provenance_Watcher
INSERT INTO mob_droplist VALUES(4129,1,5,500,3498,333); -- clump_of_riftdross / Provenance_Watcher

-- ZoneID: 289 - Asida
INSERT INTO mob_droplist VALUES (4130,0,0,1000,21411,150); -- Balarama Grip (Common, 26%)
INSERT INTO mob_droplist VALUES (4130,0,0,1000,10774,150); -- Vertigo Ring (Common, 26.8%)
INSERT INTO mob_droplist VALUES (4130,0,0,1000,8766,150); -- Bushin Abjuration: Feet (Common, 26.8%)
INSERT INTO mob_droplist VALUES (4130,0,0,1000,8774,150); -- Grove Abjuration: Hands (Common, 28.3%)
INSERT INTO mob_droplist VALUES (4130,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4130,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4130,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4130,1,1,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)

--ZoneID: 289 - Bia
INSERT INTO mob_droplist VALUES (4131,0,0,1000,27521,150); -- Reti Pendant (Common, 15%)
INSERT INTO mob_droplist VALUES (4131,0,0,1000,21390,150); -- Albin Bane (Common, 21%)
INSERT INTO mob_droplist VALUES (4131,0,0,1000,9107,240); -- Cronian Abjuration: Hands (VCommon, 26.8%)
INSERT INTO mob_droplist VALUES (4131,0,0,1000,8776,240); -- Grove Abjuration: Feet (VCommon, 28.3%)
INSERT INTO mob_droplist VALUES (4131,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4131,0,0,1000,9085,240); -- Eschalixir +1 (Very common, 24%)
INSERT INTO mob_droplist VALUES (4131,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4131,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4131,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)

--ZoneID: 289 - Emputa
INSERT INTO mob_droplist VALUES (4132,0,0,1000,10773,240); -- Fortified Ring (Very Common, 36.1%)
INSERT INTO mob_droplist VALUES (4132,0,0,1000,27536,240); -- Assuage Earring (Very Common, 37.1%)
INSERT INTO mob_droplist VALUES (4132,0,0,1000,9127,240); -- Cyllenian Abjuration: Hands (Very Common, 32%)
INSERT INTO mob_droplist VALUES (4132,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4132,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4132,0,0,1000,9085,240); -- Eschalixir +1 (Very common, 24%)
INSERT INTO mob_droplist VALUES (4132,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4132,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)

--ZoneID: 289 - Khon
INSERT INTO mob_droplist VALUES (4133,0,0,1000,27523,240); -- Caro Necklace (VCommon, 21.3%)
INSERT INTO mob_droplist VALUES (4133,0,0,1000,27612,240); -- Sokolski Mantle (VCommon, 23.3%)
INSERT INTO mob_droplist VALUES (4133,0,0,1000,8789,150); -- Abyssal Abjuration: Hands (Common, 30.7%)
INSERT INTO mob_droplist VALUES (4133,0,0,1000,9124,150); -- Venerian Abjuration: Feet (Common, 24.8%)
INSERT INTO mob_droplist VALUES (4133,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4133,0,0,1000,9084,150); -- Eschalixir (Common, 15%)
INSERT INTO mob_droplist VALUES (4133,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4133,0,0,1000,9085,240); -- Eschalixir +1 (Very common, 24%)
INSERT INTO mob_droplist VALUES (4133,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)

--ZoneID: 289 - Khun
INSERT INTO mob_droplist VALUES (4134,0,0,1000,28408,150); -- Grunfeld Rope (Common, 19.7%)
INSERT INTO mob_droplist VALUES (4134,0,0,1000,27535,240); -- Halasz Earring (VCommon, 27.4%)
INSERT INTO mob_droplist VALUES (4134,0,0,1000,8769,240); -- Vale Abjuration: Hands (VCommon, 28.7%)
INSERT INTO mob_droplist VALUES (4134,0,0,1000,8786,150); -- Shinryu Abjuration: Feet (Common, 22.9%)
INSERT INTO mob_droplist VALUES (4134,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4134,0,0,1000,9084,150); -- Eschalixir (Common, 15%)
INSERT INTO mob_droplist VALUES (4134,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4134,0,0,1000,9085,240); -- Eschalixir +1 (Very common, 24%)
INSERT INTO mob_droplist VALUES (4134,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)

--ZoneID: 289 - Ma
INSERT INTO mob_droplist VALUES (4135,0,0,1000,21410,240); -- Giuoco Grip (Common, 30.2%)
INSERT INTO mob_droplist VALUES (4135,0,0,1000,27611,150); -- Philidor Mantle (Common, 17.0%)
INSERT INTO mob_droplist VALUES (4135,0,0,1000,8779,240); -- Triton Abjuration: Hands (Common, 33.0%)
INSERT INTO mob_droplist VALUES (4135,0,0,1000,9109,240); -- Cronian Abjuration: Feet (Common, 23.6%)
INSERT INTO mob_droplist VALUES (4135,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4135,0,0,1000,9084,150); -- Eschalixir (Common, 15%)
INSERT INTO mob_droplist VALUES (4135,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4135,0,0,1000,9085,240); -- Eschalixir +1 (Very common, 24%)

--ZoneID: 289 - Met
INSERT INTO mob_droplist VALUES (4136,0,0,1000,27534,150); -- Evans Earring (Common, 22.3%)
INSERT INTO mob_droplist VALUES (4136,0,0,1000,22262,150); -- Amar Cluster (Common, 22.7%)
INSERT INTO mob_droplist VALUES (4136,0,0,1000,9122,240); -- Venerian Abjuration: Hands (VCommon, 27.8%)
INSERT INTO mob_droplist VALUES (4136,0,0,1000,8771,150); -- Vale Abjuration: Feet (Common, 19.6%)
INSERT INTO mob_droplist VALUES (4136,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4136,0,0,1000,9084,150); -- Eschalixir (Common, 15%)
INSERT INTO mob_droplist VALUES (4136,0,0,1000,9084,150); -- Eschalixir (Common, 15%)
INSERT INTO mob_droplist VALUES (4136,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4136,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4136,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4136,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)

--ZoneID: 289 - Peirithoos
INSERT INTO mob_droplist VALUES (4137,0,0,1000,27537,150); -- Ishvara Earring (Common, 19.2%)
INSERT INTO mob_droplist VALUES (4137,0,0,1000,22263,150); -- Hydrocera (Common, 20.5%)
INSERT INTO mob_droplist VALUES (4137,0,0,1000,9117,240); -- Jovian Abjuration: Hands (Common, 29.9%)
INSERT INTO mob_droplist VALUES (4137,0,0,1000,9129,150); -- Cyllenian Abjuration: Feet (Common, 19.6%)
INSERT INTO mob_droplist VALUES (4137,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4137,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4137,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4137,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)

--ZoneID: 289 - Ruea
INSERT INTO mob_droplist VALUES (4138,0,0,1000,27522,150); -- Diemer Gorget (Common, 19.7%)
INSERT INTO mob_droplist VALUES (4138,0,0,1000,10772,150); -- Petrov Ring (Common, 22.1%)
INSERT INTO mob_droplist VALUES (4138,0,0,1000,8764,240); -- Bushin Abjuration: Hands (Common, 34.3%)
INSERT INTO mob_droplist VALUES (4138,0,0,1000,8791,150); -- Abyssal Abjuration: Feet (Common, 22.1%)
INSERT INTO mob_droplist VALUES (4138,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4138,0,0,1000,9085,240); -- Eschalixir +1 (Very Common, 24%)

--ZoneID: 289 - Sava Savanovic
INSERT INTO mob_droplist VALUES (4139,0,0,1000,27524,150); -- Nodens Gorget (Common, 25.2%)
INSERT INTO mob_droplist VALUES (4139,0,0,1000,26160,240); -- Evanescense Ring (Common, 29.4%)
INSERT INTO mob_droplist VALUES (4139,0,0,1000,9114,240); -- Arean Abjuration: Feet (Common, 30.8%)
INSERT INTO mob_droplist VALUES (4139,0,0,1000,9119,150); -- Jovian Abjuration: Feet (Common, 21.0%)
INSERT INTO mob_droplist VALUES (4139,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4139,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4139,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4139,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)

--ZoneID: 289 - Tenodera
INSERT INTO mob_droplist VALUES (4140,0,0,1000,28410,150); -- Sulla Belt (Common, 22.6%)
INSERT INTO mob_droplist VALUES (4140,0,0,1000,22264,150); -- Mantoptera Eye (Common, 22.6%)
INSERT INTO mob_droplist VALUES (4140,0,0,1000,8781,240); -- Triton Abjuration: Feet (Common, 30.6%)
INSERT INTO mob_droplist VALUES (4140,0,0,1000,8784,240); -- Shinryu Abjuration: Hands (Common, 34.7%)
INSERT INTO mob_droplist VALUES (4140,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4140,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4140,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4140,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4140,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)

--ZoneID: 289 - Wasserspeier
INSERT INTO mob_droplist VALUES (4141,0,0,1000,28409,150); -- Porous Rope (Common, 27.8%)
INSERT INTO mob_droplist VALUES (4141,0,0,1000,27613,150); -- Quarrel Mantle (Common, 31.9%)
INSERT INTO mob_droplist VALUES (4141,0,0,1000,9112,240); -- Arean Abjuration: Hands (Common, 41.7%)
INSERT INTO mob_droplist VALUES (4141,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4141,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4141,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4141,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4141,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)

-- ZoneID: 289 - Amymone
INSERT INTO mob_droplist VALUES (4142,0,0,1000,21698,100); -- Bidenhander (12.7%)
INSERT INTO mob_droplist VALUES (4142,0,0,1000,21482,100); -- Compensator (10.7%)
INSERT INTO mob_droplist VALUES (4142,0,0,1000,20892,150); -- Deathbane (16.6%)
INSERT INTO mob_droplist VALUES (4142,0,0,1000,8775,150); -- Grove abjuration: legs (14.5%)
INSERT INTO mob_droplist VALUES (4142,0,0,1000,9118,150); -- Jovian abjuration: legs (14.8%)
INSERT INTO mob_droplist VALUES (4142,0,0,1000,20598,100); -- Shijo (13.6%)
INSERT INTO mob_droplist VALUES (4142,0,0,1000,8777,150); -- Triton abjuration: head (18.6%)
INSERT INTO mob_droplist VALUES (4142,0,0,1000,9120,100); -- Venerian abjuration: head (12.4%)
INSERT INTO mob_droplist VALUES (4142,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4142,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4142,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4142,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4142,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4142,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4142,0,0,1000,9086,100); -- Eschalixir +2 (Uncommon, 10%)

-- ZoneID: 289 - Hanbi
INSERT INTO mob_droplist VALUES (4143,0,0,1000,21150,100); -- Akademos (11.0%)
INSERT INTO mob_droplist VALUES (4143,0,0,1000,9110,100); -- Arean abjuration: head (11.0%)
INSERT INTO mob_droplist VALUES (4143,0,0,1000,8765,100); -- Bushin abjuration: legs (14.3%)
INSERT INTO mob_droplist VALUES (4143,0,0,1000,9108,100); -- Cronian abjuration: legs (13.7%)
INSERT INTO mob_droplist VALUES (4143,0,0,1000,20597,150); -- Enchufla (17.0%)
INSERT INTO mob_droplist VALUES (4143,0,0,1000,21149,100); -- Espiritus (13.9%)
INSERT INTO mob_droplist VALUES (4143,0,0,1000,20937,100); -- Rhomphaia (13.5%)
INSERT INTO mob_droplist VALUES (4143,0,0,1000,8767,150); -- Vale abjuration: head (16.6%)
INSERT INTO mob_droplist VALUES (4143,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4143,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4143,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4143,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4143,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4143,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4143,0,0,1000,9086,100); -- Eschalixir +2 (Uncommon, 10%)

-- ZoneID: 289 - Kammavaca
INSERT INTO mob_droplist VALUES (4144,0,0,1000,8787,240); -- Abyssal abjuration: head (20.0%)
INSERT INTO mob_droplist VALUES (4144,0,0,1000,9128,240); -- Cyllenian abjuration: legs (19.1%)
INSERT INTO mob_droplist VALUES (4144,0,0,1000,21027,240); -- Ichigohitofuri (19.1%)
INSERT INTO mob_droplist VALUES (4144,0,0,1000,20599,240); -- Kali (19.4%)
INSERT INTO mob_droplist VALUES (4144,0,0,1000,20520,240); -- Midnights (17.5%)
INSERT INTO mob_droplist VALUES (4144,0,0,1000,8785,240); -- Shinryu abjuration: legs (16.9%)
INSERT INTO mob_droplist VALUES (4144,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4144,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4144,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4144,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4144,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4144,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4144,0,0,1000,9086,100); -- Eschalixir +2 (Uncommon, 10%)

-- ZoneID: 289 - Naphula
INSERT INTO mob_droplist VALUES (4145,0,0,1000,9125,100); -- Cyllenian abjuration: head (12.8%)
INSERT INTO mob_droplist VALUES (4145,0,0,1000,8782,150); -- Shinryu abjuration: head (17.9%)
INSERT INTO mob_droplist VALUES (4145,0,0,1000,20797,150); -- Skullrender (20.4%)
INSERT INTO mob_droplist VALUES (4145,0,0,1000,21085,150); -- Solstice (18.1%)
INSERT INTO mob_droplist VALUES (4145,0,0,1000,8780,100); -- Triton abjuration: legs (11.5%)
INSERT INTO mob_droplist VALUES (4145,0,0,1000,9123,100); -- Venerian abjuration: legs (12.2%)
INSERT INTO mob_droplist VALUES (4145,0,0,1000,21215,150); -- Vijaya bow (17.3%)
INSERT INTO mob_droplist VALUES (4145,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4145,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4145,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4145,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4145,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4145,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4145,0,0,1000,9086,100); -- Eschalixir +2 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4145,1,1,1000,9084,150); -- Eschalixir (Common, 15%)
INSERT INTO mob_droplist VALUES (4145,1,1,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4145,1,1,1000,9086,150); -- Eschalixir +2 (Common, 15%)
INSERT INTO mob_droplist VALUES (4145,1,2,1000,9084,150); -- Eschalixir (Common, 15%)
INSERT INTO mob_droplist VALUES (4145,1,2,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4145,1,2,1000,9086,150); -- Eschalixir +2 (Common, 15%)
INSERT INTO mob_droplist VALUES (4145,1,3,1000,9084,150); -- Eschalixir (Common, 15%)
INSERT INTO mob_droplist VALUES (4145,1,3,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4145,1,3,1000,9086,150); -- Eschalixir +2 (Common, 15%)
INSERT INTO mob_droplist VALUES (4145,1,4,1000,9084,150); -- Eschalixir (Common, 15%)
INSERT INTO mob_droplist VALUES (4145,1,4,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4145,1,4,1000,9086,150); -- Eschalixir +2 (Common, 15%)
INSERT INTO mob_droplist VALUES (4145,1,5,1000,9084,150); -- Eschalixir (Common, 15%)
INSERT INTO mob_droplist VALUES (4145,1,5,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4145,1,5,1000,9086,150); -- Eschalixir +2 (Common, 15%)
INSERT INTO mob_droplist VALUES (4145,1,6,150,9084,150); -- Eschalixir (Common, 15%)
INSERT INTO mob_droplist VALUES (4145,1,6,150,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4145,1,6,150,9086,150); -- Eschalixir +2 (Common, 15%)

-- ZoneID: 289 - Palila
INSERT INTO mob_droplist VALUES (4146,0,0,1000,8790,150); -- Abyssal abjuration: legs (18.8%)
INSERT INTO mob_droplist VALUES (4146,0,0,1000,20979,100); -- Aizushintogo (11.2%)
INSERT INTO mob_droplist VALUES (4146,0,0,1000,8762,150); -- Bushin abjuration: head (21.0%)
INSERT INTO mob_droplist VALUES (4146,0,0,1000,9105,150); -- Cronian abjuration: head (19.2%)
INSERT INTO mob_droplist VALUES (4146,0,0,1000,20519,150); -- Hammerfists (14.7%)
INSERT INTO mob_droplist VALUES (4146,0,0,1000,20845,150); -- Instigator (15.6%)
INSERT INTO mob_droplist VALUES (4146,0,0,1000,20700,100); -- Nixxer (8.9%)
INSERT INTO mob_droplist VALUES (4146,0,0,1000,9086,150); -- Eschalixir +2 (Common, 15%)
INSERT INTO mob_droplist VALUES (4146,1,1,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4146,1,1,1000,9085,240); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4146,1,2,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4146,1,2,1000,9085,240); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4146,1,3,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4146,1,3,1000,9085,240); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4146,1,4,150,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4146,1,4,150,9085,240); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4146,1,5,100,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4146,1,5,100,9085,240); -- Eschalixir +1 (Always, 100%)

-- ZoneID: 289 - Yilan
INSERT INTO mob_droplist VALUES (4147,0,0,1000,9113,150); -- Arean abjuration: legs (10.8%)
INSERT INTO mob_droplist VALUES (4147,0,0,1000,20702,100); -- Emissary (10.8%)
INSERT INTO mob_droplist VALUES (4147,0,0,1000,8772,150); -- Grove abjuration: head (17.2%)
INSERT INTO mob_droplist VALUES (4147,0,0,1000,20701,150); -- Iris (13.0%)
INSERT INTO mob_droplist VALUES (4147,0,0,1000,9115,150); -- Jovian abjuration: head (13.7%)
INSERT INTO mob_droplist VALUES (4147,0,0,1000,21151,100); -- Lathi (9.9%)
INSERT INTO mob_droplist VALUES (4147,0,0,1000,21084,150); -- Queller rod (20.3%)
INSERT INTO mob_droplist VALUES (4147,0,0,1000,8770,150); -- Vale abjuration: legs (11.6%)
INSERT INTO mob_droplist VALUES (4147,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4147,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4147,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4147,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4147,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4147,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4147,0,0,1000,9086,100); -- Eschalixir +2 (Uncommon, 10%)

-- ZoneID: 289 - Duke Vepar
--One or Two of Group 1/2 - 2 drops is rare
INSERT INTO mob_droplist VALUES (4148,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4148,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4148,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4148,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4148,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4148,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4148,0,0,1000,9086,100); -- Eschalixir +2 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4148,0,0,1000,9130,455); -- Chunk of eschite ore (45.5%)
INSERT INTO mob_droplist VALUES (4148,1,1,1000,9106,150); -- Cronian abjuration: body (17.2%)
INSERT INTO mob_droplist VALUES (4148,1,1,1000,9126,150); -- Cyllenian abjuration: body (16.2%)
INSERT INTO mob_droplist VALUES (4148,1,1,1000,20518,150); -- Eshus (16.7%)
INSERT INTO mob_droplist VALUES (4148,1,1,1000,27319,150); -- Obatala subligar (17.2%)
INSERT INTO mob_droplist VALUES (4148,1,1,1000,25706,150); -- Shango robe (13.1%)
INSERT INTO mob_droplist VALUES (4148,1,1,1000,8783,150); -- Shinryu abjuration: body (19.2%)
INSERT INTO mob_droplist VALUES (4148,1,1,1000,8768,150); -- Vale abjuration: body (22.7%)
INSERT INTO mob_droplist VALUES (4148,1,1,1000,28411,150); -- Yemaya belt (19.7%)
INSERT INTO mob_droplist VALUES (4148,1,2,50,9106,150); -- Cronian abjuration: body (17.2%)
INSERT INTO mob_droplist VALUES (4148,1,2,50,9126,150); -- Cyllenian abjuration: body (16.2%)
INSERT INTO mob_droplist VALUES (4148,1,2,50,20518,150); -- Eshus (16.7%)
INSERT INTO mob_droplist VALUES (4148,1,2,50,27319,150); -- Obatala subligar (17.2%)
INSERT INTO mob_droplist VALUES (4148,1,2,50,25706,150); -- Shango robe (13.1%)
INSERT INTO mob_droplist VALUES (4148,1,2,50,8783,150); -- Shinryu abjuration: body (19.2%)
INSERT INTO mob_droplist VALUES (4148,1,2,50,8768,150); -- Vale abjuration: body (22.7%)
INSERT INTO mob_droplist VALUES (4148,1,2,50,28411,150); -- Yemaya belt (19.7%)


-- ZoneID: 289 - Pakecet
--One or Two of Group 1/2 - 2 drops is rare
INSERT INTO mob_droplist VALUES (4149,0,0,1000,9130,503); -- Chunk of eschite ore (50.3%)
INSERT INTO mob_droplist VALUES (4149,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4149,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4149,0,0,1000,9084,100);	-- Eschalixir (UnCommon, 10%)
INSERT INTO mob_droplist VALUES (4149,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4149,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4149,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4149,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4149,0,0,1000,9086,1000); -- Eschalixir +2 (Always, 100%)
INSERT INTO mob_droplist VALUES (4149,0,0,1000,9086,100); -- Eschalixir +2 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4149,0,0,1000,9086,50); -- Eschalixir +2 (Rare, 5%)
INSERT INTO mob_droplist VALUES (4149,0,0,1000,9086,50); -- Eschalixir +2 (Rare, 5%)
INSERT INTO mob_droplist VALUES (4149,1,1,1000,8763,150); -- Bushin abjuration: body (23.6%)
INSERT INTO mob_droplist VALUES (4149,1,1,1000,9116,150); -- Jovian abjuration: body (16.5%)
INSERT INTO mob_droplist VALUES (4149,1,1,1000,27134,150); -- Kurys gloves (14.7%)
INSERT INTO mob_droplist VALUES (4149,1,1,1000,8778,150); -- Triton abjuration: body (15.5%)
INSERT INTO mob_droplist VALUES (4149,1,1,1000,27490,150); -- Tutyr sabots (17.0%)
INSERT INTO mob_droplist VALUES (4149,1,1,1000,25703,150); -- Uac jerkin (21.1%)
INSERT INTO mob_droplist VALUES (4149,1,1,1000,9121,150); -- Venerian abjuration: body (18.0%)
INSERT INTO mob_droplist VALUES (4149,1,1,1000,27614,150); -- Xucau mantle (13.2%)
INSERT INTO mob_droplist VALUES (4149,1,2,50,8763,150); -- Bushin abjuration: body (23.6%)
INSERT INTO mob_droplist VALUES (4149,1,2,50,9116,150); -- Jovian abjuration: body (16.5%)
INSERT INTO mob_droplist VALUES (4149,1,2,50,27134,150); -- Kurys gloves (14.7%)
INSERT INTO mob_droplist VALUES (4149,1,2,50,8778,150); -- Triton abjuration: body (15.5%)
INSERT INTO mob_droplist VALUES (4149,1,2,50,27490,150); -- Tutyr sabots (17.0%)
INSERT INTO mob_droplist VALUES (4149,1,2,50,25703,150); -- Uac jerkin (21.1%)
INSERT INTO mob_droplist VALUES (4149,1,2,50,9121,150); -- Venerian abjuration: body (18.0%)
INSERT INTO mob_droplist VALUES (4149,1,2,50,27614,150); -- Xucau mantle (13.2%)


-- ZoneID: 289 - Vir'ava
--One or Two of Group 1/2 - 2 drops is rare
INSERT INTO mob_droplist VALUES (4150,0,0,1000,9130,586); -- Chunk of eschite ore (58.6%)
INSERT INTO mob_droplist VALUES (4150,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4150,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4150,0,0,1000,9084,100); -- Eschalixir (UnCommon, 10%)
INSERT INTO mob_droplist VALUES (4150,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4150,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4150,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4150,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4150,0,0,1000,9086,1000); -- Eschalixir +2 (Always, 100%)
INSERT INTO mob_droplist VALUES (4150,0,0,1000,9086,50); -- Eschalixir +2 (Rare, 5%)
INSERT INTO mob_droplist VALUES (4150,1,1,1000,25704,150); -- Abnoba kaftan (22.7%)
INSERT INTO mob_droplist VALUES (4150,1,1,1000,8788,150); -- Abyssal abjuration: body (27.3%)
INSERT INTO mob_droplist VALUES (4150,1,1,1000,9111,150); -- Arean abjuration: body (22.7%)
INSERT INTO mob_droplist VALUES (4150,1,1,1000,8773,150); -- Grove abjuration: body (26.3%)
INSERT INTO mob_droplist VALUES (4150,1,1,1000,27538,150); -- Lempo earring (12.1%)
INSERT INTO mob_droplist VALUES (4150,1,1,1000,27320,150); -- Selvans subligar (18.2%)
INSERT INTO mob_droplist VALUES (4150,1,1,1000,21083,150); -- Sucellus (16.2%)
INSERT INTO mob_droplist VALUES (4150,1,2,50,25704,150); -- Abnoba kaftan (22.7%)
INSERT INTO mob_droplist VALUES (4150,1,2,50,8788,150); -- Abyssal abjuration: body (27.3%)
INSERT INTO mob_droplist VALUES (4150,1,2,50,9111,150); -- Arean abjuration: body (22.7%)
INSERT INTO mob_droplist VALUES (4150,1,2,50,8773,150); -- Grove abjuration: body (26.3%)
INSERT INTO mob_droplist VALUES (4150,1,2,50,27538,150); -- Lempo earring (12.1%)
INSERT INTO mob_droplist VALUES (4150,1,2,50,27320,150); -- Selvans subligar (18.2%)
INSERT INTO mob_droplist VALUES (4150,1,2,50,21083,150); -- Sucellus (16.2%)


-- ZoneID: 289 - Ark Angel EV
INSERT INTO mob_droplist VALUES (4151,0,0,1000,9130,655); -- Chunk of eschite ore (65.5%)
INSERT INTO mob_droplist VALUES (4151,0,0,1000,20704,150); -- Deacon sword (20.7%)
INSERT INTO mob_droplist VALUES (4151,0,0,1000,22265,150); -- Elis tome (17.2%)
INSERT INTO mob_droplist VALUES (4151,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4151,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4151,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4151,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4151,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4151,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4151,0,0,1000,9086,1000); -- Eschalixir +2 (Always, 100%)
INSERT INTO mob_droplist VALUES (4151,0,0,1000,9086,100); -- Eschalixir +2 (Uncommon, 10%)

-- ZoneID: 289 - Ark Angel GK
INSERT INTO mob_droplist VALUES (4152,0,0,1000,9130,480); -- Chunk of eschite ore (48.0%)
INSERT INTO mob_droplist VALUES (4152,0,0,1000,28313,100); -- Daihanshi habaki (12.1%)
INSERT INTO mob_droplist VALUES (4152,0,0,1000,21028,100); -- Deacon blade (12.0%)
INSERT INTO mob_droplist VALUES (4152,0,0,1000,6415,240); -- Seki shuriken pouch (32.0%)
INSERT INTO mob_droplist VALUES (4152,0,0,1000,20765,50); -- Tunglmyrkvi (8.7%)
INSERT INTO mob_droplist VALUES (4152,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4152,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4152,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4152,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4152,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4152,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4152,0,0,1000,9086,1000); -- Eschalixir +2 (Always, 100%)
INSERT INTO mob_droplist VALUES (4152,0,0,1000,9086,100); -- Eschalixir +2 (Uncommon, 10%)

-- ZoneID: 289 - Ark Angel HM
INSERT INTO mob_droplist VALUES (4153,0,0,1000,9130,542); -- Chunk of eschite ore (54.2%)
INSERT INTO mob_droplist VALUES (4153,0,0,1000,20703,240); -- Deacon saber (25.0%)
INSERT INTO mob_droplist VALUES (4153,0,0,1000,26322,150); -- Kerygma belt (16.7%)
INSERT INTO mob_droplist VALUES (4153,0,0,1000,21427,150); -- Bloodrain strap (22.6%)
INSERT INTO mob_droplist VALUES (4153,0,0,1000,28311,150); -- Manabyss pigaches (15.3%)
INSERT INTO mob_droplist VALUES (4153,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4153,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4153,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4153,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4153,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4153,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4153,0,0,1000,9086,1000); -- Eschalixir +2 (Always, 100%)
INSERT INTO mob_droplist VALUES (4153,0,0,1000,9086,100); -- Eschalixir +2 (Uncommon, 10%)

-- ZoneID: 289 - Ark Angel MR
INSERT INTO mob_droplist VALUES (4154,0,0,1000,9130,391); -- Chunk of eschite ore (39.1%)
INSERT INTO mob_droplist VALUES (4154,0,0,1000,20798,150); -- Deacon tabar (21.7%)
INSERT INTO mob_droplist VALUES (4154,0,0,1000,27617,150); -- Enuma mantle (17.4%)
INSERT INTO mob_droplist VALUES (4154,0,0,1000,27745,150); -- Felistris mask (13.9%)
INSERT INTO mob_droplist VALUES (4154,0,0,1000,28461,240); -- Sekhmet corset (24.9%)
INSERT INTO mob_droplist VALUES (4154,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4154,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4154,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4154,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4154,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4154,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4154,0,0,1000,9086,1000); -- Eschalixir +2 (Always, 100%)
INSERT INTO mob_droplist VALUES (4154,0,0,1000,9086,100); -- Eschalixir +2 (Uncommon, 10%)

-- ZoneID: 289 - Ark Angel TT
INSERT INTO mob_droplist VALUES (4155,0,0,1000,9130,694); -- Chunk of eschite ore (69.4%)
INSERT INTO mob_droplist VALUES (4155,0,0,1000,20894,150); -- Deacon scythe (22.2%)
INSERT INTO mob_droplist VALUES (4155,0,0,1000,26162,100); -- Rahab ring (11.1%)
INSERT INTO mob_droplist VALUES (4155,0,0,1000,21181,100); -- Venabulum (7.9%)
INSERT INTO mob_droplist VALUES (4155,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4155,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4155,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4155,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4155,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4155,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4155,0,0,1000,9086,1000); -- Eschalixir +2 (Always, 100%)
INSERT INTO mob_droplist VALUES (4155,0,0,1000,9086,100); -- Eschalixir +2 (Uncommon, 10%)

-- ZoneID: 289 - Byakko
INSERT INTO mob_droplist VALUES (4156,0,0,1000,9130,363); -- Chunk of eschite ore (36.3%)
INSERT INTO mob_droplist VALUES (4156,0,0,1000,27525,150); -- Jokushu chain (18.4%)
INSERT INTO mob_droplist VALUES (4156,0,0,1000,27318,150); -- Jokushu haidate (15.4%)
INSERT INTO mob_droplist VALUES (4156,0,0,1000,20846,150); -- Jokushuono (22.4%)
INSERT INTO mob_droplist VALUES (4156,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4156,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4156,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4156,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4156,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4156,0,0,1000,9086,240); -- Eschalixir +2 (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4156,0,0,1000,9086,100); -- Eschalixir +2 (Uncommon, 10%)

-- ZoneID: 289 - Genbu
INSERT INTO mob_droplist VALUES (4157,0,0,1000,9130,369); -- Chunk of eschite ore (36.9%)
INSERT INTO mob_droplist VALUES (4157,0,0,1000,27539,150); -- Genmei earring (18.4%)
INSERT INTO mob_droplist VALUES (4157,0,0,1000,25629,150); -- Genmei kabuto (22.7%)
INSERT INTO mob_droplist VALUES (4157,0,0,1000,27645,240); -- Genmei shield (30.5%)
INSERT INTO mob_droplist VALUES (4157,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4157,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4157,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4157,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4157,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4157,0,0,1000,9086,240); -- Eschalixir +2 (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4157,0,0,1000,9086,100); -- Eschalixir +2 (Uncommon, 10%)

-- ZoneID: 289 - Kouryu
INSERT INTO mob_droplist VALUES (4158,0,0,1000,9130,500); -- Chunk of eschite ore (50.0%)
INSERT INTO mob_droplist VALUES (4158,0,0,1000,27615,240); -- Reiki cloak (57.6%)
INSERT INTO mob_droplist VALUES (4158,0,0,1000,25702,150); -- Reiki osode (20.3%)
INSERT INTO mob_droplist VALUES (4158,0,0,1000,26321,240); -- Reiki yotai (55.9%)
INSERT INTO mob_droplist VALUES (4158,0,0,1000,20690,240); -- Reikiko (39.0%)
INSERT INTO mob_droplist VALUES (4158,0,0,1000,21152,240); -- Reikikon (35.6%)
INSERT INTO mob_droplist VALUES (4158,0,0,1000,20842,240); -- Reikiono (44.1%)
INSERT INTO mob_droplist VALUES (4158,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4158,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4158,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4158,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4158,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4158,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4158,0,0,1000,9086,150); -- Eschalixir +2 (Common, 24%)

-- ZoneID: 289 - Seiryu
INSERT INTO mob_droplist VALUES (4159,0,0,1000,9130,377); -- Chunk of eschite ore (37.7%)
INSERT INTO mob_droplist VALUES (4159,0,0,1000,27133,240); -- Kobo kote (27.5%)
INSERT INTO mob_droplist VALUES (4159,0,0,1000,26320,150); -- Kobo obi (17.4%)
INSERT INTO mob_droplist VALUES (4159,0,0,1000,20699,150); -- Koboto (14.5%)
INSERT INTO mob_droplist VALUES (4159,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4159,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4159,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4159,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4159,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4159,0,0,1000,9086,240); -- Eschalixir +2 (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4159,0,0,1000,9086,100); -- Eschalixir +2 (Uncommon, 10%)

-- ZoneID: 289 - Suzaku
INSERT INTO mob_droplist VALUES (4160,0,0,1000,9130,238); -- Chunk of eschite ore (23.8%)
INSERT INTO mob_droplist VALUES (4160,0,0,1000,26161,150); -- Shukuyu ring (16.2%)
INSERT INTO mob_droplist VALUES (4160,0,0,1000,27489,150); -- Shukuyu sune-ate (21.2%)
INSERT INTO mob_droplist VALUES (4160,0,0,1000,20893,150); -- Shukuyu's scythe (17.5%)
INSERT INTO mob_droplist VALUES (4160,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4160,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4160,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4160,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4160,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4160,0,0,1000,9086,240); -- Eschalixir +2 (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4160,0,0,1000,9086,100); -- Eschalixir +2 (Uncommon, 10%)

-- ZoneID: 289 - Warder of Courage
INSERT INTO mob_droplist VALUES (4161,0,0,1000,22196,150); -- Alber strap (46.4%)
INSERT INTO mob_droplist VALUES (4161,0,0,1000,20887,150); -- Dacnomania (39.3%)
INSERT INTO mob_droplist VALUES (4161,0,0,1000,20932,150); -- Habile mazrak (53.6%)
INSERT INTO mob_droplist VALUES (4161,0,0,1000,19209,150); -- Molybdosis (41.1%)
INSERT INTO mob_droplist VALUES (4161,0,0,1000,27545,150); -- Telos earring (62.5%)
INSERT INTO mob_droplist VALUES (4161,0,0,1000,25728,50); -- Zendik robe (17.9%)
INSERT INTO mob_droplist VALUES (4161,0,0,1000,9085,240); -- Eschalixir +1 (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4161,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4161,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4161,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)

-- ZoneID: 289 - Warder of Dignity
INSERT INTO mob_droplist VALUES (4162,0,0,1000,26013,150); -- Henic torque (15.9%)
INSERT INTO mob_droplist VALUES (4162,0,0,1000,27622,50); -- Impassive mantle (9.8%)
INSERT INTO mob_droplist VALUES (4162,0,0,1000,27503,50); -- Thereoid greaves (11.8%)
INSERT INTO mob_droplist VALUES (4162,0,0,1000,9085,240); -- Eschalixir +1 (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4162,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4162,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4162,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)

-- ZoneID: 289 - Warder of Faith
INSERT INTO mob_droplist VALUES (4163,0,0,1000,22269,100); -- Barathrum (11.3%)
INSERT INTO mob_droplist VALUES (4163,0,0,1000,26007,150); -- Bilious torque (17.0%)
INSERT INTO mob_droplist VALUES (4163,0,0,1000,27502,240); -- Maenadic gambieras (21.7%)
INSERT INTO mob_droplist VALUES (4163,0,0,1000,9085,240); -- Eschalixir +1 (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4163,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4163,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4163,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)

-- ZoneID: 289 - Warder of Fortitude
INSERT INTO mob_droplist VALUES (4164,0,0,1000,27146,150); -- Bewegt cuffs (20.1%)
INSERT INTO mob_droplist VALUES (4164,0,0,1000,26006,150); -- Decimus torque (15.7%)
INSERT INTO mob_droplist VALUES (4164,0,0,1000,27544,100); -- Dedition earring (11.8%)
INSERT INTO mob_droplist VALUES (4164,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4164,0,0,1000,9084,150); -- Eschalixir (Common, 15%)
INSERT INTO mob_droplist VALUES (4164,0,0,1000,9084,150); -- Eschalixir (Common, 15%)
INSERT INTO mob_droplist VALUES (4164,0,0,1000,9084,100); -- Eschalixir (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4164,0,0,1000,9085,240); -- Eschalixir +1 (Very Common, 24%)

-- ZoneID: 289 - Warder of Hope
INSERT INTO mob_droplist VALUES (4165,0,0,1000,27147,100); -- Redan gloves (12.4%)
INSERT INTO mob_droplist VALUES (4165,0,0,1000,26325,100); -- Refoccilation stone (13.1%)
INSERT INTO mob_droplist VALUES (4165,0,0,1000,26009,100); -- Yarak torque (13.7%)
INSERT INTO mob_droplist VALUES (4165,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4165,0,0,1000,9084,150); -- Eschalixir (Common, 15%)
INSERT INTO mob_droplist VALUES (4165,0,0,1000,9084,150); -- Eschalixir (Common, 15%)
INSERT INTO mob_droplist VALUES (4165,0,0,1000,9084,100); -- Eschalixir (Uncommon, 10%)

-- ZoneID: 289 - Warder of Justice
INSERT INTO mob_droplist VALUES (4166,0,0,1000,26008,100); -- Agelast torque (11.8%)
INSERT INTO mob_droplist VALUES (4166,0,0,1000,22195,100); -- Flanged grip (10.1%)
INSERT INTO mob_droplist VALUES (4166,0,0,1000,25653,150); -- Halitus helm (16.3%)
INSERT INTO mob_droplist VALUES (4166,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4166,0,0,1000,9084,150); -- Eschalixir (Common, 15%)
INSERT INTO mob_droplist VALUES (4166,0,0,1000,9084,150); -- Eschalixir (Common, 15%)
INSERT INTO mob_droplist VALUES (4166,0,0,1000,9084,100); -- Eschalixir (Uncommon, 10%)

-- ZoneID: 289 - Warder of Love
INSERT INTO mob_droplist VALUES (4167,0,0,1000,26003,100); -- Baetyl pendant (12.5%)
INSERT INTO mob_droplist VALUES (4167,0,0,1000,26011,100); -- Maskirova torque (18.1%)
INSERT INTO mob_droplist VALUES (4167,0,0,1000,25727,150); -- Passion jacket (19.4%)
INSERT INTO mob_droplist VALUES (4167,0,0,1000,9085,240); -- Eschalixir +1 (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4167,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4167,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4167,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)

-- ZoneID: 289 - Warder of Loyalty
INSERT INTO mob_droplist VALUES (4168,0,0,1000,26014,100); -- Deceiver's torque (13.5%)
INSERT INTO mob_droplist VALUES (4168,0,0,1000,26004,150); -- Lissome necklace (13.7%)
INSERT INTO mob_droplist VALUES (4168,0,0,1000,25729,150); -- Vatic byrnie (15.4%)
INSERT INTO mob_droplist VALUES (4168,0,0,1000,9085,240); -- Eschalixir +1 (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4168,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4168,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4168,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)

-- ZoneID: 289 - Warder of Mercy
INSERT INTO mob_droplist VALUES (4169,0,0,1000,26012,150); -- Melic torque (16.0%)
INSERT INTO mob_droplist VALUES (4169,0,0,1000,26171,100); -- Rufescent ring (13.4%)
INSERT INTO mob_droplist VALUES (4169,0,0,1000,25654,100); -- Welkin crown (11.7%)
INSERT INTO mob_droplist VALUES (4169,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4169,0,0,1000,9084,150); -- Eschalixir (Common, 15%)
INSERT INTO mob_droplist VALUES (4169,0,0,1000,9084,150); -- Eschalixir (Common, 15%)
INSERT INTO mob_droplist VALUES (4169,0,0,1000,9084,100); -- Eschalixir (Uncommon, 10%)

-- ZoneID: 289 - Warder of Prudence
INSERT INTO mob_droplist VALUES (4170,0,0,1000,26010,100); -- Acantha torque (8.2%)
INSERT INTO mob_droplist VALUES (4170,0,0,1000,25853,100); -- Querkening brais (9.9%)
INSERT INTO mob_droplist VALUES (4170,0,0,1000,27621,50); -- Relucent cape (4.3%)
INSERT INTO mob_droplist VALUES (4170,0,0,1000,9085,240); -- Eschalixir +1 (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4170,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4170,0,0,1000,9085,150); -- Eschalixir +1 (Common, 15%)
INSERT INTO mob_droplist VALUES (4170,0,0,1000,9085,100); -- Eschalixir +1 (Uncommon, 10%)

-- ZoneID: 289 - Warder of Temperance
INSERT INTO mob_droplist VALUES (4171,0,0,1000,26005,150); -- Carnal torque (15.3%)
INSERT INTO mob_droplist VALUES (4171,0,0,1000,25852,150); -- Darraigner's brais (16.6%)
INSERT INTO mob_droplist VALUES (4171,0,0,1000,26170,150); -- Speaker's ring (13.0%)
INSERT INTO mob_droplist VALUES (4171,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4171,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4171,0,0,1000,9084,150); -- Eschalixir (Common, 15%)
INSERT INTO mob_droplist VALUES (4171,0,0,1000,9084,100); -- Eschalixir (Uncommon, 10%)
INSERT INTO mob_droplist VALUES (4171,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)

-- ZoneID: 291 - Eschan Porxie
INSERT INTO mob_droplist VALUES (4172,0,0,1000,6393,240); -- Cut of porxie pork (35.0%)
INSERT INTO mob_droplist VALUES (4172,0,0,1000,9147,240); -- Porxie wing (47.6%)
INSERT INTO mob_droplist VALUES (4172,0,0,1000,9084,1000); -- Eschalixir (Always, 100%)
INSERT INTO mob_droplist VALUES (4172,0,0,1000,9084,240); -- Eschalixir (Very Common, 24%)
INSERT INTO mob_droplist VALUES (4172,0,0,1000,9085,1000); -- Eschalixir +1 (Always, 100%)
INSERT INTO mob_droplist VALUES (4172,0,0,1000,9085,100); -- Eschalixir +1 (Common, 10%)
INSERT INTO mob_droplist VALUES (4172,1,1,240,4061,166); -- Group 1 - Riftborn boulder (16.6%)
INSERT INTO mob_droplist VALUES (4172,1,1,240,6181,166); -- Group 1 - Beitetsu parcel (16.6%)
INSERT INTO mob_droplist VALUES (4172,1,1,240,6182,166); -- Group 1 - Boulder case (16.6%)
INSERT INTO mob_droplist VALUES (4172,1,1,240,4060,166); -- Group 1 - Chunk of beitetsu (16.6%)
INSERT INTO mob_droplist VALUES (4172,1,1,240,4059,166); -- Group 1 - Pluton (16.6%)
INSERT INTO mob_droplist VALUES (4172,1,1,240,6180,166); -- Group 1 - Pluton case (16.6%)

-- ZoneID: 291 - Belphegor
INSERT INTO mob_droplist VALUES (4173,0,0,1000,26327,267); -- Asklepian belt (26.7%)
INSERT INTO mob_droplist VALUES (4173,0,0,1000,27496,334); -- Herculean boots (33.4%)
INSERT INTO mob_droplist VALUES (4173,0,0,1000,25840,429); -- Odyssean cuisses (42.9%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5

-- ZoneID: 291 - Crom Dubh
INSERT INTO mob_droplist VALUES (4174,0,0,1000,26326,287); -- Channeler's stone (28.7%)
INSERT INTO mob_droplist VALUES (4174,0,0,1000,25843,287); -- Merlinic shalwar (28.7%)
INSERT INTO mob_droplist VALUES (4174,0,0,1000,27138,415); -- Odyssean gauntlets (41.5%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5


-- ZoneID: 291 - Dazzling Dolores
INSERT INTO mob_droplist VALUES (4175,0,0,1000,25643,332); -- Merlinic hood (33.2%)
INSERT INTO mob_droplist VALUES (4175,0,0,1000,22197,197); -- Niobid strap (19.7%)
INSERT INTO mob_droplist VALUES (4175,0,0,1000,27494,391); -- Odyssean greaves (39.1%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5


-- ZoneID: 291 - Golden Kist
INSERT INTO mob_droplist VALUES (4176,0,0,1000,26240,466); -- Tantalic cape (46.6%)
INSERT INTO mob_droplist VALUES (4176,0,0,1000,27495,569); -- Valorous greaves (56.9%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5


-- ZoneID: 291 - Kabandha
INSERT INTO mob_droplist VALUES (4177,0,0,1000,27141,564); -- Merlinic dastanas (56.4%)
INSERT INTO mob_droplist VALUES (4177,0,0,1000,26241,421); -- Scintillating cape (42.1%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5


-- ZoneID: 291 - Mauve-wristed Gomberry
INSERT INTO mob_droplist VALUES (4178,0,0,1000,26172,281); -- Begrudging ring (28.1%)
INSERT INTO mob_droplist VALUES (4178,0,0,1000,25644,393); -- Chironic hat (39.3%)
INSERT INTO mob_droplist VALUES (4178,0,0,1000,27139,393); -- Valorous mitts (39.3%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5


-- ZoneID: 291 - Oryx
INSERT INTO mob_droplist VALUES (4179,0,0,1000,25642,578); -- Herculean helm (57.8%)
INSERT INTO mob_droplist VALUES (4179,0,0,1000,22198,455); -- Potent grip (45.5%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5


-- ZoneID: 291 - Sabotender Royal
INSERT INTO mob_droplist VALUES (4180,0,0,1000,27498,274); -- Chironic slippers (27.4%)
INSERT INTO mob_droplist VALUES (4180,0,0,1000,26018,387); -- Deino collar (38.7%)
INSERT INTO mob_droplist VALUES (4180,0,0,1000,25640,387); -- Odyssean helm (38.7%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5


-- ZoneID: 291 - Sang Buaya
INSERT INTO mob_droplist VALUES (4181,0,0,1000,27142,329); -- Chironic gloves (32.9%)
INSERT INTO mob_droplist VALUES (4181,0,0,1000,27546,119); -- Thureous earring (11.9%)
INSERT INTO mob_droplist VALUES (4181,0,0,1000,25641,450); -- Valorous mask (45.0%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5


-- ZoneID: 291 - Selkit
INSERT INTO mob_droplist VALUES (4182,0,0,1000,26173,245); -- Apate ring (24.5%)
INSERT INTO mob_droplist VALUES (4182,0,0,1000,25842,419); -- Herculean trousers (41.9%)
INSERT INTO mob_droplist VALUES (4182,0,0,1000,27497,350); -- Merlinic crackows (35.0%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5


-- ZoneID: 291 - Taelmoth the Diremaw
INSERT INTO mob_droplist VALUES (4183,0,0,1000,26017,284); -- Clotharius torque (28.4%)
INSERT INTO mob_droplist VALUES (4183,0,0,1000,27140,359); -- Herculean gloves (35.9%)
INSERT INTO mob_droplist VALUES (4183,0,0,1000,25841,444); -- Valorous hose (44.4%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5


-- ZoneID: 291 - Zduhac
INSERT INTO mob_droplist VALUES (4184,0,0,1000,25844,584); -- Chironic hose (58.4%)
INSERT INTO mob_droplist VALUES (4184,0,0,1000,22270,517); -- Expeditious pinion (51.7%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5

-- ZoneID: 291 - Heavenly Veela
INSERT INTO mob_droplist VALUES (4185,0,0,1000,9214,526); -- Void crystal (52.6%)
INSERT INTO mob_droplist VALUES (4185,1,1,1000,9210,250); -- Pellucid stone (25%)
INSERT INTO mob_droplist VALUES (4185,1,1,1000,9211,250); -- Fern stone (25%)
INSERT INTO mob_droplist VALUES (4185,1,1,1000,9212,250); -- Taupe stone (25%)
INSERT INTO mob_droplist VALUES (4185,1,2,1000,9210,250); -- Pellucid stone (25%)
INSERT INTO mob_droplist VALUES (4185,1,2,1000,9211,250); -- Fern stone (25%)
INSERT INTO mob_droplist VALUES (4185,1,2,1000,9212,250); -- Taupe stone (25%)
INSERT INTO mob_droplist VALUES (4185,1,3,1000,9210,250); -- Pellucid stone (25%)
INSERT INTO mob_droplist VALUES (4185,1,3,1000,9211,250); -- Fern stone (25%)
INSERT INTO mob_droplist VALUES (4185,1,3,1000,9212,250); -- Taupe stone (25%)
INSERT INTO mob_droplist VALUES (4185,1,4,1000,9210,250); -- Pellucid stone (25%)
INSERT INTO mob_droplist VALUES (4185,1,4,1000,9211,250); -- Fern stone (25%)
INSERT INTO mob_droplist VALUES (4185,1,4,1000,9212,250); -- Taupe stone (25%)
INSERT INTO mob_droplist VALUES (4185,1,5,1000,6487,350); -- Frayed sack of plenty (35%)
INSERT INTO mob_droplist VALUES (4185,1,5,1000,6486,350); -- Frayed sack of fecundity (35%)
INSERT INTO mob_droplist VALUES (4185,1,5,1000,6488,350); -- Frayed sack of opulence (35%)
INSERT INTO mob_droplist VALUES (4185,1,6,1000,6487,350); -- Frayed sack of plenty (35%)
INSERT INTO mob_droplist VALUES (4185,1,6,1000,6486,350); -- Frayed sack of fecundity (35%)
INSERT INTO mob_droplist VALUES (4185,1,6,1000,6488,300); -- Frayed sack of opulence (35%)
INSERT INTO mob_droplist VALUES (4185,1,7,350,4059,200); -- Pluton - Group 1 (25%)
INSERT INTO mob_droplist VALUES (4185,1,7,350,4060,200); -- Beitetsu - Group 1 (25%)
INSERT INTO mob_droplist VALUES (4185,1,7,350,4061,200); -- Riftborn Boulder - Group 1 (25%)
INSERT INTO mob_droplist VALUES (4185,1,7,350,6181,200); -- Beitetsu Parcel - Group 1 (15%)
INSERT INTO mob_droplist VALUES (4185,1,7,350,6182,200); -- Boulder Case - Group 1 (15%)

-- ZoneID: 291 - Bashmu
INSERT INTO mob_droplist VALUES (4186,0,0,1000,21754,355); -- Aganoshe (35.5%)
INSERT INTO mob_droplist VALUES (4186,0,0,1000,22054,310); -- Grioavolr (31.0%)
INSERT INTO mob_droplist VALUES (4186,0,0,1000,26328,414); -- Sarissaphoroi belt (41.4%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5

-- ZoneID: 291 - Gajasimha
INSERT INTO mob_droplist VALUES (4187,0,0,1000,20505,320); -- Condemners (32.0%)
INSERT INTO mob_droplist VALUES (4187,0,0,1000,21804,200); -- Obschine (20.0%)
INSERT INTO mob_droplist VALUES (4187,0,0,1000,26174,380); -- Persis ring (38.0%)
INSERT INTO mob_droplist VALUES (4187,0,0,1000,22113,220); -- Teller (22.0%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5

-- ZoneID: 291 - Ironside
INSERT INTO mob_droplist VALUES (4188,0,0,1000,20677,358); -- Colada (35.8%)
INSERT INTO mob_droplist VALUES (4188,0,0,1000,26019,400); -- Homeric gorget (40.0%)
INSERT INTO mob_droplist VALUES (4188,0,0,1000,21904,364); -- Kanaria (36.4%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5


-- ZoneID: 291 - Old Shuck
INSERT INTO mob_droplist VALUES (4189,0,0,1000,21746,361); -- Digirbalag (36.1%)
INSERT INTO mob_droplist VALUES (4189,0,0,1000,21072,246); -- Gada (24.6%)
INSERT INTO mob_droplist VALUES (4189,0,0,1000,26242,492); -- Phalangite mantle (49.2%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5

-- ZoneID: 291 - Sarsaok
INSERT INTO mob_droplist VALUES (4190,0,0,1000,22271,466); -- Pemphredo tathlum (46.6%)
INSERT INTO mob_droplist VALUES (4190,0,0,1000,21021,288); -- Umaru (28.8%)
INSERT INTO mob_droplist VALUES (4190,0,0,1000,21686,363); -- Zulfiqar (36.3%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5

-- ZoneID: 291 - Strophadia
INSERT INTO mob_droplist VALUES (4191,0,0,1000,27547,297); -- Dignitary's earring (29.7%)
INSERT INTO mob_droplist VALUES (4191,0,0,1000,22134,219); -- Holliday (21.9%)
INSERT INTO mob_droplist VALUES (4191,0,0,1000,21854,302); -- Reienkyo (30.2%)
INSERT INTO mob_droplist VALUES (4191,0,0,1000,20579,307); -- Skinflayer (30.7%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5

-- ZoneID: 291 - Maju
INSERT INTO mob_droplist VALUES (4192,0,0,1000,9130,632); -- Chunk of eschite ore (63.2%)
INSERT INTO mob_droplist VALUES (4192,0,0,1000,26175,332); -- Hetairoi ring (33.2%)
INSERT INTO mob_droplist VALUES (4192,0,0,1000,25719,384); -- Merlinic jubbah (38.4%)
INSERT INTO mob_droplist VALUES (4192,0,0,1000,25716,428); -- Odyssean chestplate (42.8%)
INSERT INTO mob_droplist VALUES (4192,0,0,1000,26243,348); -- Perimede cape (34.8%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5

-- ZoneID: 291 - Neak
INSERT INTO mob_droplist VALUES (4193,0,0,1000,9130,587); -- Chunk of eschite ore (58.7%)
INSERT INTO mob_droplist VALUES (4193,0,0,1000,26244,505); -- Agema cape (50.5%)
INSERT INTO mob_droplist VALUES (4193,0,0,1000,25718,527); -- Herculean vest (52.7%)
INSERT INTO mob_droplist VALUES (4193,0,0,1000,26329,413); -- Luminary sash (41.3%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5

-- ZoneID: 291 - Yakshi
INSERT INTO mob_droplist VALUES (4194,0,0,1000,9130,500); -- Chunk of eschite ore (50.0%)
INSERT INTO mob_droplist VALUES (4194,0,0,1000,9130,500); -- Chunk of eschite ore (25.0%)
INSERT INTO mob_droplist VALUES (4194,0,0,1000,26020,315); -- Ainia collar (31.5%)
INSERT INTO mob_droplist VALUES (4194,0,0,1000,25720,408); -- Chironic doublet (40.8%)
INSERT INTO mob_droplist VALUES (4194,0,0,1000,22199,392); -- Thrace strap (39.2%)
INSERT INTO mob_droplist VALUES (4194,0,0,1000,25717,454); -- Valorous mail (45.4%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5

-- ZoneID: 291 - Albumen
INSERT INTO mob_droplist VALUES (4195,0,0,1000,9130,500); -- Chunk of eschite ore (50.0%)
INSERT INTO mob_droplist VALUES (4195,0,0,1000,9130,500); -- Chunk of eschite ore (25.0%)
INSERT INTO mob_droplist VALUES (4195,0,0,1000,21747,421); -- Freydis (42.1%)
INSERT INTO mob_droplist VALUES (4195,0,0,1000,25921,684); -- Skaoi boots (68.4%)
INSERT INTO mob_droplist VALUES (4195,0,0,1000,22114,842); -- Steinthor (84.2%)
INSERT INTO mob_droplist VALUES (4195,0,0,1000,25656,263); -- Ynglinga sallet (26.3%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5

-- ZoneID: 291 - Erinys
INSERT INTO mob_droplist VALUES (4196,0,0,1000,9130,500); -- Chunk of eschite ore (50.0%)
INSERT INTO mob_droplist VALUES (4196,0,0,1000,9130,500); -- Chunk of eschite ore (25.0%)
INSERT INTO mob_droplist VALUES (4196,0,0,1000,21755,733); -- Hodadenon (73.3%)
INSERT INTO mob_droplist VALUES (4196,0,0,1000,25761,533); -- Iktomi dastanas (53.3%)
INSERT INTO mob_droplist VALUES (4196,0,0,1000,25731,600); -- Sayadio's kaftan (60.0%)
INSERT INTO mob_droplist VALUES (4196,0,0,1000,22119,267); -- Wochowsen (26.7%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5

-- ZoneID: 291 - Onychophora
INSERT INTO mob_droplist VALUES (4197,0,0,1000,9130,500); -- Chunk of eschite ore (50.0%)
INSERT INTO mob_droplist VALUES (4197,0,0,1000,9130,500); -- Chunk of eschite ore (25.0%)
INSERT INTO mob_droplist VALUES (4197,0,0,1000,20678,400); -- Firangi (40.0%)
INSERT INTO mob_droplist VALUES (4197,0,0,1000,22056,467); -- Gozuki Mezuki (46.7%)
INSERT INTO mob_droplist VALUES (4197,0,0,1000,21855,400); -- Lembing (40.0%)
INSERT INTO mob_droplist VALUES (4197,0,0,1000,25922,733); -- Navon crackows (73.3%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5

-- ZoneID: 291 - Teles
INSERT INTO mob_droplist VALUES (4198,0,0,1000,9130,500); -- Chunk of eschite ore (50.0%)
INSERT INTO mob_droplist VALUES (4198,0,0,1000,27143,733); -- Composer's mitts (73.3%)
INSERT INTO mob_droplist VALUES (4198,0,0,1000,27499,533); -- Composer's sabots (53.3%)
INSERT INTO mob_droplist VALUES (4198,0,0,1000,20889,400); -- Misanthropy (40.0%)
INSERT INTO mob_droplist VALUES (4198,0,0,1000,20592,467); -- Sangoma (46.7%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5

-- ZoneID: 291 - Vinipata
INSERT INTO mob_droplist VALUES (4199,0,0,1000,9130,500); -- Chunk of eschite ore (50.0%)
INSERT INTO mob_droplist VALUES (4199,0,0,1000,9130,500); -- Chunk of eschite ore (25.0%)
INSERT INTO mob_droplist VALUES (4199,0,0,1000,25655,474); -- Ipoca beret (47.4%)
INSERT INTO mob_droplist VALUES (4199,0,0,1000,21073,316); -- Izcalli (31.6%)
INSERT INTO mob_droplist VALUES (4199,0,0,1000,21022,632); -- Shishio (63.2%)
INSERT INTO mob_droplist VALUES (4199,0,0,1000,21905,579); -- Taka (57.9%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5

-- ZoneID: 291 - Zerde
INSERT INTO mob_droplist VALUES (4200,0,0,1000,9130,500); -- Chunk of eschite ore (50.0%)
INSERT INTO mob_droplist VALUES (4200,0,0,1000,9130,500); -- Chunk of eschite ore (25.0%)
INSERT INTO mob_droplist VALUES (4200,0,0,1000,25854,438); -- Arjuna breeches (43.8%)
INSERT INTO mob_droplist VALUES (4200,0,0,1000,25760,500); -- Mrigavyadha gloves (50.0%)
INSERT INTO mob_droplist VALUES (4200,0,0,1000,20506,1000); -- Suwaiyas (100.0%)
INSERT INTO mob_droplist VALUES (4200,0,0,1000,25721,438); -- Vedic coat (43.8%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5

-- ZoneID: 291 - Schah
INSERT INTO mob_droplist VALUES (4219,0,0,1000,9130,500); -- Chunk of eschite ore (50.0%)
INSERT INTO mob_droplist VALUES (4219,0,0,1000,9130,500); -- Chunk of eschite ore (25.0%)
INSERT INTO mob_droplist VALUES (4219,0,0,1000,21687,773); -- Takoba (77.3%)
INSERT INTO mob_droplist VALUES (4219,0,0,1000,22055,364); -- Oranyan (36.4%)
INSERT INTO mob_droplist VALUES (4219,0,0,1000,25730,500); -- Nzingha Cuirass  (50.0%)
INSERT INTO mob_droplist VALUES (4219,0,0,1000,25920,455); -- Ahosi Leggings (45.5%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5

-- ZoneID: 291 - Ascended Beetle
INSERT INTO mob_droplist VALUES (4201,0,0,1000,9214,250); -- Void Crystal - (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5
INSERT INTO mob_droplist VALUES (4201,1,6,125,4059,170); -- Pluton - Group 6
INSERT INTO mob_droplist VALUES (4201,1,6,125,6180,166); -- Pluton Case - Group 6
INSERT INTO mob_droplist VALUES (4201,1,6,125,4060,166); -- Beitetsu - Group 6
INSERT INTO mob_droplist VALUES (4201,1,6,125,6181,166); -- Beitetsu Parcel - Group 6
INSERT INTO mob_droplist VALUES (4201,1,6,125,4061,166); -- Riftborn Boulder - Group 6
INSERT INTO mob_droplist VALUES (4201,1,6,125,6182,166); -- Boulder Case - Group 6

-- ZoneID: 291 - Ascended Chapuli
INSERT INTO mob_droplist VALUES (4202,0,0,1000,9214,250); -- Void Crystal - (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5
INSERT INTO mob_droplist VALUES (4202,1,6,125,4059,170); -- Pluton - Group 6
INSERT INTO mob_droplist VALUES (4202,1,6,125,6180,166); -- Pluton Case - Group 6
INSERT INTO mob_droplist VALUES (4202,1,6,125,4060,166); -- Beitetsu - Group 6
INSERT INTO mob_droplist VALUES (4202,1,6,125,6181,166); -- Beitetsu Parcel - Group 6
INSERT INTO mob_droplist VALUES (4202,1,6,125,4061,166); -- Riftborn Boulder - Group 6
INSERT INTO mob_droplist VALUES (4202,1,6,125,6182,166); -- Boulder Case - Group 6

-- ZoneID: 291 - Ascended Chigoe
INSERT INTO mob_droplist VALUES (4203,0,0,1000,9214,250); -- Void Crystal - (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5
INSERT INTO mob_droplist VALUES (4203,1,6,125,4059,170); -- Pluton - Group 6
INSERT INTO mob_droplist VALUES (4203,1,6,125,6180,166); -- Pluton Case - Group 6
INSERT INTO mob_droplist VALUES (4203,1,6,125,4060,166); -- Beitetsu - Group 6
INSERT INTO mob_droplist VALUES (4203,1,6,125,6181,166); -- Beitetsu Parcel - Group 6
INSERT INTO mob_droplist VALUES (4203,1,6,125,4061,166); -- Riftborn Boulder - Group 6
INSERT INTO mob_droplist VALUES (4203,1,6,125,6182,166); -- Boulder Case - Group 6

-- ZoneID: 291 - Ascended Cyhiraeth
INSERT INTO mob_droplist VALUES (4204,0,0,1000,9215,250); -- Void Grass - (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5
INSERT INTO mob_droplist VALUES (4204,1,6,125,4059,170); -- Pluton - Group 6
INSERT INTO mob_droplist VALUES (4204,1,6,125,6180,166); -- Pluton Case - Group 6
INSERT INTO mob_droplist VALUES (4204,1,6,125,4060,166); -- Beitetsu - Group 6
INSERT INTO mob_droplist VALUES (4204,1,6,125,6181,166); -- Beitetsu Parcel - Group 6
INSERT INTO mob_droplist VALUES (4204,1,6,125,4061,166); -- Riftborn Boulder - Group 6
INSERT INTO mob_droplist VALUES (4204,1,6,125,6182,166); -- Boulder Case - Group 6

--ZoneID: 291 - Ascended Faaz
INSERT INTO mob_droplist VALUES (4205,0,0,1000,9214,250); -- Void Crystal - (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5
INSERT INTO mob_droplist VALUES (4205,1,6,125,4059,170); -- Pluton - Group 6
INSERT INTO mob_droplist VALUES (4205,1,6,125,6180,166); -- Pluton Case - Group 6
INSERT INTO mob_droplist VALUES (4205,1,6,125,4060,166); -- Beitetsu - Group 6
INSERT INTO mob_droplist VALUES (4205,1,6,125,6181,166); -- Beitetsu Parcel - Group 6
INSERT INTO mob_droplist VALUES (4205,1,6,125,4061,166); -- Riftborn Boulder - Group 6
INSERT INTO mob_droplist VALUES (4205,1,6,125,6182,166); -- Boulder Case - Group 6

-- ZoneID: 291 - Ascended Gefyrst
INSERT INTO mob_droplist VALUES (4206,0,0,1000,9215,250); -- Void Grass - (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5
INSERT INTO mob_droplist VALUES (4206,1,6,125,4059,170); -- Pluton - Group 6
INSERT INTO mob_droplist VALUES (4206,1,6,125,6180,166); -- Pluton Case - Group 6
INSERT INTO mob_droplist VALUES (4206,1,6,125,4060,166); -- Beitetsu - Group 6
INSERT INTO mob_droplist VALUES (4206,1,6,125,6181,166); -- Beitetsu Parcel - Group 6
INSERT INTO mob_droplist VALUES (4206,1,6,125,4061,166); -- Riftborn Boulder - Group 6
INSERT INTO mob_droplist VALUES (4206,1,6,125,6182,166); -- Boulder Case - Group 6

-- ZoneID: 291 - Ascended Hippogryph
INSERT INTO mob_droplist VALUES (4207,0,0,1000,9216,250); -- Void Snapper - (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5
INSERT INTO mob_droplist VALUES (4207,1,6,125,4059,170); -- Pluton - Group 6
INSERT INTO mob_droplist VALUES (4207,1,6,125,6180,166); -- Pluton Case - Group 6
INSERT INTO mob_droplist VALUES (4207,1,6,125,4060,166); -- Beitetsu - Group 6
INSERT INTO mob_droplist VALUES (4207,1,6,125,6181,166); -- Beitetsu Parcel - Group 6
INSERT INTO mob_droplist VALUES (4207,1,6,125,4061,166); -- Riftborn Boulder - Group 6
INSERT INTO mob_droplist VALUES (4207,1,6,125,6182,166); -- Boulder Case - Group 6

-- ZoneID: 291 - Ascended Lucani
INSERT INTO mob_droplist VALUES (4208,0,0,1000,9216,250); -- Void Snapper - (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5
INSERT INTO mob_droplist VALUES (4208,1,6,125,4059,170); -- Pluton - Group 6
INSERT INTO mob_droplist VALUES (4208,1,6,125,6180,166); -- Pluton Case - Group 6
INSERT INTO mob_droplist VALUES (4208,1,6,125,4060,166); -- Beitetsu - Group 6
INSERT INTO mob_droplist VALUES (4208,1,6,125,6181,166); -- Beitetsu Parcel - Group 6
INSERT INTO mob_droplist VALUES (4208,1,6,125,4061,166); -- Riftborn Boulder - Group 6
INSERT INTO mob_droplist VALUES (4208,1,6,125,6182,166); -- Boulder Case - Group 6

-- ZoneID: 291 - Ascended Luckybug
INSERT INTO mob_droplist VALUES (4209,0,0,1000,9215,250); -- Void Grass - (25%)
INSERT INTO mob_droplist VALUES (4209,1,1,1000,9210,250); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4209,1,1,1000,9211,500); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4209,1,1,1000,9212,500); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4209,1,2,250,9210,250); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4209,1,2,250,9211,500); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4209,1,2,250,9212,500); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4209,1,3,1000,6486,500); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4209,1,3,1000,6488,500); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4209,1,3,1000,6487,500); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4209,1,4,250,6486,500); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4209,1,4,250,6488,500); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4209,1,4,250,6487,500); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4209,1,5,125,6486,500); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4209,1,5,125,6488,500); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4209,1,5,125,6487,500); -- Frayed sack of plenty - Group 5
INSERT INTO mob_droplist VALUES (4209,1,6,125,4059,170); -- Pluton - Group 6
INSERT INTO mob_droplist VALUES (4209,1,6,125,6180,166); -- Pluton Case - Group 6
INSERT INTO mob_droplist VALUES (4209,1,6,125,4060,166); -- Beitetsu - Group 6
INSERT INTO mob_droplist VALUES (4209,1,6,125,6181,166); -- Beitetsu Parcel - Group 6
INSERT INTO mob_droplist VALUES (4209,1,6,125,4061,166); -- Riftborn Boulder - Group 6
INSERT INTO mob_droplist VALUES (4209,1,6,125,6182,166); -- Boulder Case - Group 6

-- ZoneID: 291 - Ascended Mantis
INSERT INTO mob_droplist VALUES (4210,0,0,1000,9216,250); -- Void Snapper - (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5
INSERT INTO mob_droplist VALUES (4210,1,6,125,4059,170); -- Pluton - Group 6
INSERT INTO mob_droplist VALUES (4210,1,6,125,6180,166); -- Pluton Case - Group 6
INSERT INTO mob_droplist VALUES (4210,1,6,125,4060,166); -- Beitetsu - Group 6
INSERT INTO mob_droplist VALUES (4210,1,6,125,6181,166); -- Beitetsu Parcel - Group 6
INSERT INTO mob_droplist VALUES (4210,1,6,125,4061,166); -- Riftborn Boulder - Group 6
INSERT INTO mob_droplist VALUES (4210,1,6,125,6182,166); -- Boulder Case - Group 6

-- ZoneID: 291 - Ascended Mosquito
INSERT INTO mob_droplist VALUES (4211,0,0,1000,9215,250); -- Void Grass - (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5
INSERT INTO mob_droplist VALUES (4211,1,6,125,4059,170); -- Pluton - Group 6
INSERT INTO mob_droplist VALUES (4211,1,6,125,6180,166); -- Pluton Case - Group 6
INSERT INTO mob_droplist VALUES (4211,1,6,125,4060,166); -- Beitetsu - Group 6
INSERT INTO mob_droplist VALUES (4211,1,6,125,6181,166); -- Beitetsu Parcel - Group 6
INSERT INTO mob_droplist VALUES (4211,1,6,125,4061,166); -- Riftborn Boulder - Group 6
INSERT INTO mob_droplist VALUES (4211,1,6,125,6182,166); -- Boulder Case - Group 6

-- ZoneID: 291 - Ascended Naraka
INSERT INTO mob_droplist VALUES (4212,0,0,1000,9214,250); -- Void Crystal - (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5
INSERT INTO mob_droplist VALUES (4212,1,6,125,4059,170); -- Pluton - Group 6
INSERT INTO mob_droplist VALUES (4212,1,6,125,6180,166); -- Pluton Case - Group 6
INSERT INTO mob_droplist VALUES (4212,1,6,125,4060,166); -- Beitetsu - Group 6
INSERT INTO mob_droplist VALUES (4212,1,6,125,6181,166); -- Beitetsu Parcel - Group 6
INSERT INTO mob_droplist VALUES (4212,1,6,125,4061,166); -- Riftborn Boulder - Group 6
INSERT INTO mob_droplist VALUES (4212,1,6,125,6182,166); -- Boulder Case - Group 6

-- ZoneID: 291 - Ascended Panopt
INSERT INTO mob_droplist VALUES (4213,0,0,1000,9215,250); -- Void Grass - (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5
INSERT INTO mob_droplist VALUES (4213,1,6,125,4059,170); -- Pluton - Group 6
INSERT INTO mob_droplist VALUES (4213,1,6,125,6180,166); -- Pluton Case - Group 6
INSERT INTO mob_droplist VALUES (4213,1,6,125,4060,166); -- Beitetsu - Group 6
INSERT INTO mob_droplist VALUES (4213,1,6,125,6181,166); -- Beitetsu Parcel - Group 6
INSERT INTO mob_droplist VALUES (4213,1,6,125,4061,166); -- Riftborn Boulder - Group 6
INSERT INTO mob_droplist VALUES (4213,1,6,125,6182,166); -- Boulder Case - Group 6

-- ZoneID: 291 - Ascended Poroggo
INSERT INTO mob_droplist VALUES (4214,0,0,1000,9216,250); -- Void Snapper - (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5
INSERT INTO mob_droplist VALUES (4214,1,6,125,4059,170); -- Pluton - Group 6
INSERT INTO mob_droplist VALUES (4214,1,6,125,6180,166); -- Pluton Case - Group 6
INSERT INTO mob_droplist VALUES (4214,1,6,125,4060,166); -- Beitetsu - Group 6
INSERT INTO mob_droplist VALUES (4214,1,6,125,6181,166); -- Beitetsu Parcel - Group 6
INSERT INTO mob_droplist VALUES (4214,1,6,125,4061,166); -- Riftborn Boulder - Group 6
INSERT INTO mob_droplist VALUES (4214,1,6,125,6182,166); -- Boulder Case - Group 6

-- ZoneID: 291 - Ascended Porxie
INSERT INTO mob_droplist VALUES (4215,0,0,1000,9214,250); -- Void Crystal - (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5
INSERT INTO mob_droplist VALUES (4215,1,6,125,4059,170); -- Pluton - Group 6
INSERT INTO mob_droplist VALUES (4215,1,6,125,6180,166); -- Pluton Case - Group 6
INSERT INTO mob_droplist VALUES (4215,1,6,125,4060,166); -- Beitetsu - Group 6
INSERT INTO mob_droplist VALUES (4215,1,6,125,6181,166); -- Beitetsu Parcel - Group 6
INSERT INTO mob_droplist VALUES (4215,1,6,125,4061,166); -- Riftborn Boulder - Group 6
INSERT INTO mob_droplist VALUES (4215,1,6,125,6182,166); -- Boulder Case - Group 6

-- ZoneID: 291 - Ascended Tiger
INSERT INTO mob_droplist VALUES (4216,0,0,1000,9216,250); -- Void Snapper - (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5
INSERT INTO mob_droplist VALUES (4216,1,6,125,4059,170); -- Pluton - Group 6
INSERT INTO mob_droplist VALUES (4216,1,6,125,6180,166); -- Pluton Case - Group 6
INSERT INTO mob_droplist VALUES (4216,1,6,125,4060,166); -- Beitetsu - Group 6
INSERT INTO mob_droplist VALUES (4216,1,6,125,6181,166); -- Beitetsu Parcel - Group 6
INSERT INTO mob_droplist VALUES (4216,1,6,125,4061,166); -- Riftborn Boulder - Group 6
INSERT INTO mob_droplist VALUES (4216,1,6,125,6182,166); -- Boulder Case - Group 6

-- ZoneID: 291 - Ascended Ungeweder
INSERT INTO mob_droplist VALUES (4217,0,0,1000,9216,250); -- Void Snapper - (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9210,333); -- Pellucid stone - Group 1  (25%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9211,333); -- Fern stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,1,1000,9212,334); -- Taupe stone - Group 1  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9210,333); -- Pellucid stone - Group 2  (25%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9211,333); -- Fern stone - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,2,250,9212,334); -- Taupe stone  - Group 2  (50%)
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6486,333); -- Frayed sack of fecundity - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6488,333); -- Frayed sack of opulence - Group 3
INSERT INTO mob_droplist VALUES (4173,1,3,1000,6487,334); -- Frayed sack of plenty - Group 3
INSERT INTO mob_droplist VALUES (4173,1,4,250,6486,333); -- Frayed sack of fecundity - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6488,333); -- Frayed sack of opulence - Group 4
INSERT INTO mob_droplist VALUES (4173,1,4,250,6487,334); -- Frayed sack of plenty - Group 4
INSERT INTO mob_droplist VALUES (4173,1,5,125,6486,333); -- Frayed sack of fecundity - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6488,333); -- Frayed sack of opulence - Group 5
INSERT INTO mob_droplist VALUES (4173,1,5,125,6487,334); -- Frayed sack of plenty - Group 5
INSERT INTO mob_droplist VALUES (4217,1,6,125,4059,170); -- Pluton - Group 6
INSERT INTO mob_droplist VALUES (4217,1,6,125,6180,166); -- Pluton Case - Group 6
INSERT INTO mob_droplist VALUES (4217,1,6,125,4060,166); -- Beitetsu - Group 6
INSERT INTO mob_droplist VALUES (4217,1,6,125,6181,166); -- Beitetsu Parcel - Group 6
INSERT INTO mob_droplist VALUES (4217,1,6,125,4061,166); -- Riftborn Boulder - Group 6
INSERT INTO mob_droplist VALUES (4217,1,6,125,6182,166); -- Boulder Case - Group 6

-- Colkhab
INSERT INTO mob_droplist VALUES (4220,0,0,1000,3980,1000);  -- Bztavian Stinger 100%
INSERT INTO mob_droplist VALUES (4220,0,0,1000,3981,1000);  -- Bztavian Wing 100%
INSERT INTO mob_droplist VALUES (4220,0,0,1000,4060,270);   -- Beitetsu 27%
INSERT INTO mob_droplist VALUES (4220,1,1,1000,20829,200); -- Icoyoca - Group 1
INSERT INTO mob_droplist VALUES (4220,1,1,1000,20965,200); -- Tlamini - Group 1
INSERT INTO mob_droplist VALUES (4220,1,1,1000,20958,200); -- Kuakuakait - Group 1
INSERT INTO mob_droplist VALUES (4220,1,1,1000,20820,200); -- Hatxiik - Group 1
INSERT INTO mob_droplist VALUES (4220,1,1,1000,20992,200); -- Taikogane - Group 1
INSERT INTO mob_droplist VALUES (4220,1,2,1000,28201,250); -- Xux Trousers - Group 2
INSERT INTO mob_droplist VALUES (4220,1,2,1000,27781,250); -- Xux Hat  - Group 2
INSERT INTO mob_droplist VALUES (4220,1,2,1000,27737,250); -- Kaabnax Hat  - Group 2
INSERT INTO mob_droplist VALUES (4220,1,2,1000,28167,250); -- Kaabnax Trousers  - Group 2
INSERT INTO mob_droplist VALUES (4220,1,3,1000,28457,250); -- Kuku Stone  - Group 3
INSERT INTO mob_droplist VALUES (4220,1,3,1000,28384,250); -- Huani Collar  - Group 3
INSERT INTO mob_droplist VALUES (4220,1,3,1000,28513,250); -- Phawaylla Earring  - Group 3
INSERT INTO mob_droplist VALUES (4220,1,3,1000,28610,250); -- Ik Cape  - Group 3
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28617,45); -- MAULERS_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28618,45); -- ANCHORETS_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28619,45); -- MENDING_CAPE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28620,45); -- BANE_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28621,45); -- GHOSTFYRE_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28622,45); -- CANNY_CAPE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28623,45); -- WEARD_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28624,45); -- NIHT_MANTLE    - Group 4 JSE
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28625,45); -- PASTORALISTS_MANTLE - Group 4 JSE
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28626,45); -- RHAPSODES_CAPE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28627,45); -- LUTIAN_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28628,45); -- TAKAHA_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28629,46); -- YOKAZE_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28630,46); -- UPDRAFT_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28631,46); -- CONVEYANCE_CAPE - Group 4 JSE
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28632,46); -- CORNFLOWER_CAPE    - Group 4 JSE
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28633,46); -- GUNSLINGERS_CAPE - Group 4 JSE
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28634,46); -- DISPERSAL_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28635,46); -- TOETAPPER_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28636,46); -- BOOKWORMS_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28637,46); -- LIFESTREAM_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4220,1,4,1000,28638,46); -- EVASIONISTS_CAPE   - Group 4 JSE


-- Achuka
INSERT INTO mob_droplist VALUES (4221,0,0,1000,3977,1000); -- Gabbrath Horn 100%
INSERT INTO mob_droplist VALUES (4221,0,0,1000,6068,1000); -- Gabbrath Meat 100%
INSERT INTO mob_droplist VALUES (4221,0,0,1000,4061,270);  -- Riftborn Boulder 27%
INSERT INTO mob_droplist VALUES (4221,1,1,1000,20554,200); -- Tlalpoloani - Group 1
INSERT INTO mob_droplist VALUES (4221,1,1,1000,20740,200); -- Camatlatia - Group 1
INSERT INTO mob_droplist VALUES (4221,1,1,1000,20731,200); -- Xiuleato - Group 1
INSERT INTO mob_droplist VALUES (4221,1,1,1000,20543,200); -- Maochinoli - Group 1
INSERT INTO mob_droplist VALUES (4221,1,1,1000,21385,200); -- Aqreqaq Bomblet - Group 1
INSERT INTO mob_droplist VALUES (4221,1,2,1000,27779,250); -- Quauhpilli Helm - Group 2
INSERT INTO mob_droplist VALUES (4221,1,2,1000,28062,250); -- Quauhpilli Gloves - Group 2
INSERT INTO mob_droplist VALUES (4221,1,2,1000,27739,250); -- Otomi Helm  - Group 2
INSERT INTO mob_droplist VALUES (4221,1,2,1000,28028,250); -- Otomi Gloves  - Group 2
INSERT INTO mob_droplist VALUES (4221,1,3,1000,21426,334); -- Achaq Grip  - Group 3
INSERT INTO mob_droplist VALUES (4221,1,3,1000,28612,333); -- Buquwik Cape  - Group 3
INSERT INTO mob_droplist VALUES (4221,1,3,1000,28386,333); -- Cuamiz Collar  - Group 3
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28617,45); -- MAULERS_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28618,45); -- ANCHORETS_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28619,45); -- MENDING_CAPE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28620,45); -- BANE_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28621,45); -- GHOSTFYRE_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28622,45); -- CANNY_CAPE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28623,45); -- WEARD_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28624,45); -- NIHT_MANTLE    - Group 4 JSE
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28625,45); -- PASTORALISTS_MANTLE - Group 4 JSE
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28626,45); -- RHAPSODES_CAPE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28627,45); -- LUTIAN_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28628,45); -- TAKAHA_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28629,46); -- YOKAZE_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28630,46); -- UPDRAFT_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28631,46); -- CONVEYANCE_CAPE - Group 4 JSE
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28632,46); -- CORNFLOWER_CAPE    - Group 4 JSE
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28633,46); -- GUNSLINGERS_CAPE - Group 4 JSE
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28634,46); -- DISPERSAL_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28635,46); -- TOETAPPER_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28636,46); -- BOOKWORMS_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28637,46); -- LIFESTREAM_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4221,1,4,1000,28638,46); -- EVASIONISTS_CAPE   - Group 4 JSE

-- Tchakka
INSERT INTO mob_droplist VALUES (4222,0,0,1000,3978,1000); -- Rockfin Fin 100%
INSERT INTO mob_droplist VALUES (4222,0,0,1000,3979,1000); -- Rockfin Tooth 100%
INSERT INTO mob_droplist VALUES (4222,0,0,1000,4059,250);  -- Pluton 25%
INSERT INTO mob_droplist VALUES (4222,0,0,1000,4060,250);  -- Bietetsu 25%
INSERT INTO mob_droplist VALUES (4222,1,1,1000,20643,167); -- Macoquetza - Group 1
INSERT INTO mob_droplist VALUES (4222,1,1,1000,21504,167); -- Suijingiri Manemitsu - Group 1
INSERT INTO mob_droplist VALUES (4222,1,1,1000,21257,167); -- Zoquittihuitz - Group 1
INSERT INTO mob_droplist VALUES (4222,1,1,1000,21047,167); -- Azukinagamitsu - Group 1
INSERT INTO mob_droplist VALUES (4222,1,1,1000,20630,166); -- Atoyac - Group 1
INSERT INTO mob_droplist VALUES (4222,1,1,1000,21253,166); -- Atetepeyorg - Group 1
INSERT INTO mob_droplist VALUES (4222,1,2,1000,27780,250); -- Chocaliztli Mask - Group 2
INSERT INTO mob_droplist VALUES (4222,1,2,1000,28343,250); -- Chocaliztli Boots - Group 2
INSERT INTO mob_droplist VALUES (4222,1,2,1000,27738,250); -- Ejekamal Mask  - Group 2
INSERT INTO mob_droplist VALUES (4222,1,2,1000,28305,250); -- Ejekamal Boots  - Group 2
INSERT INTO mob_droplist VALUES (4222,1,3,1000,28611,250); -- Tuilha Cape  - Group 3
INSERT INTO mob_droplist VALUES (4222,1,3,1000,28575,250); -- Cho'j Band  - Group 3
INSERT INTO mob_droplist VALUES (4222,1,3,1000,28385,250); -- Atzintli Necklace - Group 3
INSERT INTO mob_droplist VALUES (4222,1,3,1000,21384,250); -- Kalboron Stone - Group 3
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28617,45); -- MAULERS_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28618,45); -- ANCHORETS_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28619,45); -- MENDING_CAPE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28620,45); -- BANE_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28621,45); -- GHOSTFYRE_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28622,45); -- CANNY_CAPE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28623,45); -- WEARD_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28624,45); -- NIHT_MANTLE    - Group 4 JSE
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28625,45); -- PASTORALISTS_MANTLE - Group 4 JSE
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28626,45); -- RHAPSODES_CAPE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28627,45); -- LUTIAN_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28628,45); -- TAKAHA_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28629,46); -- YOKAZE_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28630,46); -- UPDRAFT_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28631,46); -- CONVEYANCE_CAPE - Group 4 JSE
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28632,46); -- CORNFLOWER_CAPE    - Group 4 JSE
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28633,46); -- GUNSLINGERS_CAPE - Group 4 JSE
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28634,46); -- DISPERSAL_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28635,46); -- TOETAPPER_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28636,46); -- BOOKWORMS_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28637,46); -- LIFESTREAM_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4222,1,4,1000,28638,46); -- EVASIONISTS_CAPE   - Group 4 JSE

-- Hurkan
INSERT INTO mob_droplist VALUES (4223,0,0,1000,4012,1000); -- Waktza Rostrum 100%
INSERT INTO mob_droplist VALUES (4223,0,0,1000,4013,1000); -- Waltza Crest 100%
INSERT INTO mob_droplist VALUES (4223,0,0,1000,4059,270);  -- Pluton 27%
INSERT INTO mob_droplist VALUES (4223,1,1,1000,20917,200); -- Xbalanque - Group 1
INSERT INTO mob_droplist VALUES (4223,1,1,1000,20826,200); -- Hunahpu - Group 1
INSERT INTO mob_droplist VALUES (4223,1,1,1000,20768,200); -- Kaquljaan - Group 1
INSERT INTO mob_droplist VALUES (4223,1,1,1000,21334,200); -- Animikii Bullet - Group 1
INSERT INTO mob_droplist VALUES (4223,1,1,1000,21428,200); -- Tzacab Grip - Group 1
INSERT INTO mob_droplist VALUES (4223,1,2,1000,27766,500); -- Uk'uxkaj Cap - Group 2
INSERT INTO mob_droplist VALUES (4223,1,2,1000,28331,500); -- Uk'uxkaj Boots - Group 2
INSERT INTO mob_droplist VALUES (4223,1,3,1000,28613,250); -- Kayapa Cape  - Group 3
INSERT INTO mob_droplist VALUES (4223,1,3,1000,21386,250); -- Jukukik Feather - Group 3
INSERT INTO mob_droplist VALUES (4223,1,3,1000,28458,250); -- Jaq'ij Sash  - Group 3
INSERT INTO mob_droplist VALUES (4223,1,3,1000,28576,250); -- Paqichikaji Ring  - Group 3
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28617,45); -- MAULERS_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28618,45); -- ANCHORETS_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28619,45); -- MENDING_CAPE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28620,45); -- BANE_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28621,45); -- GHOSTFYRE_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28622,45); -- CANNY_CAPE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28623,45); -- WEARD_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28624,45); -- NIHT_MANTLE    - Group 4 JSE
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28625,45); -- PASTORALISTS_MANTLE - Group 4 JSE
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28626,45); -- RHAPSODES_CAPE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28627,45); -- LUTIAN_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28628,45); -- TAKAHA_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28629,46); -- YOKAZE_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28630,46); -- UPDRAFT_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28631,46); -- CONVEYANCE_CAPE - Group 4 JSE
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28632,46); -- CORNFLOWER_CAPE    - Group 4 JSE
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28633,46); -- GUNSLINGERS_CAPE - Group 4 JSE
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28634,46); -- DISPERSAL_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28635,46); -- TOETAPPER_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28636,46); -- BOOKWORMS_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28637,46); -- LIFESTREAM_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4223,1,4,1000,28638,46); -- EVASIONISTS_CAPE   - Group 4 JSE

-- Yumcax
INSERT INTO mob_droplist VALUES (4224,0,0,1000,4014,1000); -- Yggdreant Bole 100%
INSERT INTO mob_droplist VALUES (4224,0,0,1000,4015,1000); -- Yggdreant Root 100%
INSERT INTO mob_droplist VALUES (4224,0,0,1000,4060,250);  -- Bietetsu 25%
INSERT INTO mob_droplist VALUES (4224,0,0,1000,4061,250);  -- Riftborn Boulder 25%
INSERT INTO mob_droplist VALUES (4224,1,1,1000,21125,500); -- Tamaxchi - Group 1
INSERT INTO mob_droplist VALUES (4224,1,1,1000,20872,500); -- Ixtab - Group 1
INSERT INTO mob_droplist VALUES (4224,1,2,1000,27767,500); -- Buremte Hat - Group 2
INSERT INTO mob_droplist VALUES (4224,1,2,1000,28050,500); -- Buremte Gloves - Group 2
INSERT INTO mob_droplist VALUES (4224,1,3,1000,28548,143); -- Barataria Ring  - Group 3
INSERT INTO mob_droplist VALUES (4224,1,3,1000,28640,143); -- Pahtli Cape - Group 3
INSERT INTO mob_droplist VALUES (4224,1,3,1000,28400,143); -- Ocachi Gorget  - Group 3
INSERT INTO mob_droplist VALUES (4224,1,3,1000,28577,143); -- Kunaji Ring  - Group 3
INSERT INTO mob_droplist VALUES (4224,1,3,1000,28614,143); -- Iximulew Cape  - Group 3
INSERT INTO mob_droplist VALUES (4224,1,3,1000,28387,143); -- Quanpur Necklace  - Group 3
INSERT INTO mob_droplist VALUES (4224,1,3,1000,28459,142); -- Chuq'aba Belt  - Group 3
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28617,45); -- MAULERS_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28618,45); -- ANCHORETS_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28619,45); -- MENDING_CAPE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28620,45); -- BANE_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28621,45); -- GHOSTFYRE_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28622,45); -- CANNY_CAPE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28623,45); -- WEARD_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28624,45); -- NIHT_MANTLE    - Group 4 JSE
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28625,45); -- PASTORALISTS_MANTLE - Group 4 JSE
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28626,45); -- RHAPSODES_CAPE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28627,45); -- LUTIAN_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28628,45); -- TAKAHA_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28629,46); -- YOKAZE_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28630,46); -- UPDRAFT_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28631,46); -- CONVEYANCE_CAPE - Group 4 JSE
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28632,46); -- CORNFLOWER_CAPE    - Group 4 JSE
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28633,46); -- GUNSLINGERS_CAPE - Group 4 JSE
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28634,46); -- DISPERSAL_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28635,46); -- TOETAPPER_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28636,46); -- BOOKWORMS_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28637,46); -- LIFESTREAM_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4224,1,4,1000,28638,46); -- EVASIONISTS_CAPE   - Group 4 JSE

-- Kumhau
INSERT INTO mob_droplist VALUES (4225,0,0,1000,8752,942); -- Cehuetzi Claw 94.2%
INSERT INTO mob_droplist VALUES (4225,0,0,1000,8754,726); -- Cehuetzi Pelt 72.6%
INSERT INTO mob_droplist VALUES (4225,0,0,1000,8753,733); -- Cehuetzi Ice Shard 73.3%
INSERT INTO mob_droplist VALUES (4225,1,1,1000,21186,500); -- Baqil Staff - Group 1
INSERT INTO mob_droplist VALUES (4225,1,1,1000,21233,500); -- Ajjub Bow - Group 1
INSERT INTO mob_droplist VALUES (4225,1,2,1000,28166,500); -- Quiahuiz Trousers - Group 2
INSERT INTO mob_droplist VALUES (4225,1,2,1000,27736,500); -- Quiahuiz Helm - Group 2
INSERT INTO mob_droplist VALUES (4225,1,3,1000,28460,200); -- Cetl belt  - Group 3
INSERT INTO mob_droplist VALUES (4225,1,3,1000,28388,200); -- Tlamiztli Collar - Group 3
INSERT INTO mob_droplist VALUES (4225,1,3,1000,21463,200); -- Nepote Bell  - Group 3
INSERT INTO mob_droplist VALUES (4225,1,3,1000,28514,200); -- Friomisi Earring  - Group 3
INSERT INTO mob_droplist VALUES (4225,1,3,1000,28615,200); -- Toro Cape  - Group 3
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28617,45); -- MAULERS_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28618,45); -- ANCHORETS_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28619,45); -- MENDING_CAPE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28620,45); -- BANE_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28621,45); -- GHOSTFYRE_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28622,45); -- CANNY_CAPE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28623,45); -- WEARD_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28624,45); -- NIHT_MANTLE    - Group 4 JSE
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28625,45); -- PASTORALISTS_MANTLE - Group 4 JSE
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28626,45); -- RHAPSODES_CAPE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28627,45); -- LUTIAN_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28628,45); -- TAKAHA_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28629,46); -- YOKAZE_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28630,46); -- UPDRAFT_MANTLE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28631,46); -- CONVEYANCE_CAPE - Group 4 JSE
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28632,46); -- CORNFLOWER_CAPE    - Group 4 JSE
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28633,46); -- GUNSLINGERS_CAPE - Group 4 JSE
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28634,46); -- DISPERSAL_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28635,46); -- TOETAPPER_MANTLE  - Group 4 JSE
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28636,46); -- BOOKWORMS_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28637,46); -- LIFESTREAM_CAPE   - Group 4 JSE
INSERT INTO mob_droplist VALUES (4225,1,4,1000,28638,46); -- EVASIONISTS_CAPE   - Group 4 JSE

UPDATE mob_groups SET dropid = 4000 WHERE name = 'Ground_Guzzler';
UPDATE mob_groups SET dropid = 4000 WHERE name = 'Globster';
UPDATE mob_groups SET dropid = 4000 WHERE name = 'Quagmire_Pugil';
UPDATE mob_groups SET dropid = 4000 WHERE name = 'Sunderclaw';
UPDATE mob_groups SET dropid = 4000 WHERE name = 'Rummager_Beetle';
UPDATE mob_groups SET dropid = 4000 WHERE name = 'Raker_Bee';
UPDATE mob_groups SET dropid = 4000 WHERE name = 'Aither';
UPDATE mob_groups SET dropid = 4000 WHERE name = 'Deorc';
UPDATE mob_groups SET dropid = 4000 WHERE name = 'Eorthe';
UPDATE mob_groups SET dropid = 4000 WHERE name = 'Puretos';
UPDATE mob_groups SET dropid = 4000 WHERE name = 'Pruina';
UPDATE mob_groups SET dropid = 4000 WHERE name = 'Beorht';
UPDATE mob_groups SET dropid = 4000 WHERE name = 'Thunor';
UPDATE mob_groups SET dropid = 4000 WHERE name = 'Lacus';
UPDATE mob_groups SET dropid = 4000 WHERE name = 'Gjenganger';
UPDATE mob_groups SET dropid = 4000 WHERE name = 'Gorehound';
UPDATE mob_groups SET dropid = 4000 WHERE name = 'Void_Hare';
UPDATE mob_groups SET dropid = 4000 WHERE name = 'Prickly_Sheep';
UPDATE mob_groups SET dropid = 4001 WHERE name = 'Krabkatoa';
UPDATE mob_groups SET dropid = 4002 WHERE name = 'Blobdingnag';
UPDATE mob_groups SET dropid = 4003 WHERE name = 'Orcus';
UPDATE mob_groups SET dropid = 4004 WHERE name = 'Verthandi';
UPDATE mob_groups SET dropid = 4005 WHERE name = 'Dawon';
UPDATE mob_groups SET dropid = 4006 WHERE name = 'Yilbegan';
UPDATE mob_groups SET dropid = 4007 WHERE name = 'Lord_Ruthven';
UPDATE mob_groups SET dropid = 4008 WHERE name = 'Abyssdiver' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4008 WHERE name = 'Beist' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4008 WHERE name = 'Emperor_Arthro' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4008 WHERE name = 'Eschan_Jewelweed' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4008 WHERE name = 'Hugemaw_Harold' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4008 WHERE name = 'Immanibugard' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4008 WHERE name = 'Jester_Malatrix' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4008 WHERE name = 'Keeper_of_Heiligtum' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4008 WHERE name = 'Muut' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4008 WHERE name = 'Prickly_Pitriv' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4008 WHERE name = 'Serpopard_Ninlil' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4008 WHERE name = 'Voso' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4009 WHERE name = 'Wepwawet' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4010 WHERE name = 'Lustful_Lydia' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4011 WHERE name = 'Aglaophotis' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4012 WHERE name = 'Tangata_Manu' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4013 WHERE name = 'Vidala' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4014 WHERE name = 'Gestalt' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4015 WHERE name = 'Angrboda' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4016 WHERE name = 'Cunnast' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4017 WHERE name = 'Revetaur' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4018 WHERE name = 'Ferrodon' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4019 WHERE name = 'Gulltop' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4020 WHERE name = 'Vyala' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4021 WHERE name = 'Ionos' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4022 WHERE name = 'Sensual_Sandy' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4023 WHERE name = 'Nosoi' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4024 WHERE name = 'Brittlis' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4025 WHERE name = 'Kamohoalii' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4026 WHERE name = 'Umdhlebi' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4027 WHERE name = 'Fleetstalker' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4028 WHERE name = 'Shockmaw' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4029 WHERE name = 'Urmahlullu' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4030 WHERE name = 'Alpluachra' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4031 WHERE name = 'Blazewing' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4032 WHERE name = 'Pazuzu' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4033 WHERE name = 'Wrathare' AND zoneid = 288;
UPDATE mob_groups SET dropid = 4034 WHERE name = 'Sallow_Seymour'AND groupid = 49;
UPDATE mob_groups SET dropid = 4035 WHERE name = 'Ushumgal'AND groupid = 158;
UPDATE mob_groups SET dropid = 4036 WHERE name = 'Sarimanok'AND groupid = 30;
UPDATE mob_groups SET dropid = 4037 WHERE name = 'Cottus'AND groupid = 151;
UPDATE mob_groups SET dropid = 4038 WHERE name = 'Virvatuli'AND groupid = 42;
UPDATE mob_groups SET dropid = 4039 WHERE name = 'Pancimanci'AND groupid = 164;
UPDATE mob_groups SET dropid = 4040 WHERE name = 'Goji'AND groupid = 58;
UPDATE mob_groups SET dropid = 4041 WHERE name = 'Gugalanna'AND groupid = 154;
UPDATE mob_groups SET dropid = 4042 WHERE name = 'Yatagarasu'AND groupid = 57;
UPDATE mob_groups SET dropid = 4043 WHERE name = 'Agathos'AND groupid = 167;
UPDATE mob_groups SET dropid = 4044 WHERE name = 'Cherufe'AND groupid = 62;
UPDATE mob_groups SET dropid = 4045 WHERE name = 'Taweret'AND groupid = 155;
UPDATE mob_groups SET dropid = 4046 WHERE name = 'Holy_Moly'AND groupid = 53;
UPDATE mob_groups SET dropid = 4047 WHERE name = 'Ildebrann'AND groupid = 31;
UPDATE mob_groups SET dropid = 4048 WHERE name = 'Neith'AND groupid = 48;
UPDATE mob_groups SET dropid = 4049 WHERE name = 'Sabotender_Campeador'AND groupid = 39;
UPDATE mob_groups SET dropid = 4050 WHERE name = 'Tangaroa'AND groupid = 40;
UPDATE mob_groups SET dropid = 4051 WHERE name = 'Malleator_Maurok'AND groupid = 42;
UPDATE mob_groups SET dropid = 4052 WHERE name = 'Fjalar'AND groupid = 55;
UPDATE mob_groups SET dropid = 4053 WHERE name = 'Abununnu'AND groupid = 75;
UPDATE mob_groups SET dropid = 4054 WHERE name = 'Tsui-Goab'AND groupid = 60;
UPDATE mob_groups SET dropid = 4055 WHERE name = 'Isarukitsck'AND groupid = 54;
UPDATE mob_groups SET dropid = 4056 WHERE name = 'Dimgruzub'AND groupid = 92;
UPDATE mob_groups SET dropid = 4057 WHERE name = 'Brekekekex'AND groupid = 66;
UPDATE mob_groups SET dropid = 4058 WHERE name = 'Yalungur'AND groupid = 69;
UPDATE mob_groups SET dropid = 4059 WHERE name = 'Vanasarvik'AND groupid = 55;
UPDATE mob_groups SET dropid = 4060 WHERE name = 'Lorbulcrud'AND groupid = 43;
UPDATE mob_groups SET dropid = 4061 WHERE name = 'Krabimanjaro'AND groupid = 52;
UPDATE mob_groups SET dropid = 4062 WHERE name = 'Ogbunabali'AND groupid = 43;
UPDATE mob_groups SET dropid = 4063 WHERE name = 'Roly-Poly'AND groupid = 44;
UPDATE mob_groups SET dropid = 4064 WHERE name = 'Laidly_Laurence'AND groupid = 127;
UPDATE mob_groups SET dropid = 4065 WHERE name = 'Mellonia'AND groupid = 40;
UPDATE mob_groups SET dropid = 4066 WHERE name = 'Nympha_Eunomia'AND groupid = 120;
UPDATE mob_groups SET dropid = 4067 WHERE name = 'Gasha-1stform'AND groupid = 57;
UPDATE mob_groups SET dropid = 4068 WHERE name = 'Giltine'AND groupid = 128;
UPDATE mob_groups SET dropid = 4069 WHERE name = 'Cath_Palug'AND groupid = 57;
UPDATE mob_groups SET dropid = 4070 WHERE name = 'Modron'AND groupid = 37;
UPDATE mob_groups SET dropid = 4071 WHERE name = 'Mimic_King'AND groupid = 20;
UPDATE mob_groups SET dropid = 4072 WHERE name = 'Bismarck'AND groupid = 50;
UPDATE mob_groups SET dropid = 4073 WHERE name = 'Morta'AND groupid = 35;
UPDATE mob_groups SET dropid = 4074 WHERE name = 'Murk-veined_Baneberry'AND groupid = 72;
UPDATE mob_groups SET dropid = 4075 WHERE name = 'Melancholic_Moira'AND groupid = 156;
UPDATE mob_groups SET dropid = 4076 WHERE name = 'Belphoebe'AND groupid = 79;
UPDATE mob_groups SET dropid = 4077 WHERE name = 'Kholomodumo'AND groupid = 156;
UPDATE mob_groups SET dropid = 4078 WHERE name = 'Lord_Asag'AND groupid = 70;
UPDATE mob_groups SET dropid = 4079 WHERE name = 'Akupara'AND groupid = 159;
UPDATE mob_groups SET dropid = 4080 WHERE name = 'Kaggen'AND groupid = 51;
UPDATE mob_groups SET dropid = 4081 WHERE name = 'Akvan'AND groupid = 30;
UPDATE mob_groups SET dropid = 4082 WHERE name = 'Pil-VNM'AND groupid = 17;
UPDATE mob_groups SET dropid = 4083 WHERE name = 'Aello'AND groupid = 20;
UPDATE mob_groups SET dropid = 4084 WHERE name = 'Uptala'AND groupid = 17;
UPDATE mob_groups SET dropid = 4085 WHERE name = 'Qilin'AND groupid = 33;
UPDATE mob_groups SET dropid = 4086 WHERE name = 'Celaeno'AND groupid = 34;
UPDATE mob_groups SET dropid = 4087 WHERE name = 'Hahava'AND groupid = 44;
UPDATE mob_groups SET dropid = 4088 WHERE name = 'Voidwrought'AND groupid = 69;
UPDATE mob_groups SET dropid = 4089 WHERE name = 'Lancing_Lamorak'AND groupid = 37;
UPDATE mob_groups SET dropid = 4090 WHERE name = 'Bhishani'AND groupid = 34;
UPDATE mob_groups SET dropid = 4091 WHERE name = 'Rw_Nw_Prt_M_Hrw'AND groupid = 29;
UPDATE mob_groups SET dropid = 4092 WHERE name = 'Stachysaurus'AND groupid = 55;
UPDATE mob_groups SET dropid = 4093 WHERE name = 'Gwynn_ap_Nudd'AND groupid = 44;
UPDATE mob_groups SET dropid = 4094 WHERE name = 'Smierc'AND groupid = 42;
UPDATE mob_groups SET dropid = 4095 WHERE name = 'Gaunab'AND groupid = 151;
UPDATE mob_groups SET dropid = 4096 WHERE name = 'Ocythoe'AND groupid = 156;
UPDATE mob_groups SET dropid = 4097 WHERE name = 'Kalasutrax'AND groupid = 140;
UPDATE mob_groups SET dropid = 4098 WHERE name = 'Ig-Alima'AND groupid = 71;
UPDATE mob_groups SET dropid = 4099 WHERE name = 'Botulus_Rex'AND groupid = 53;
UPDATE mob_groups SET dropid = 4100 WHERE name = 'Ixaern_mnk' AND groupid = 24;
UPDATE mob_groups SET dropid = 4101 WHERE name = 'Leviathan_Prime_HTBF';
UPDATE mob_groups SET dropid = 4102 WHERE name = 'Garuda_Prime_HTBF';
UPDATE mob_groups SET dropid = 4103 WHERE name = 'Shiva_Prime_HTBF';
UPDATE mob_groups SET dropid = 4104 WHERE name = 'Ramuh_Prime_HTBF';
UPDATE mob_groups SET dropid = 4105 WHERE name = 'Ifrit_Prime_HTBF';
UPDATE mob_groups SET dropid = 4106 WHERE name = 'Titan_Prime_HTBF';
UPDATE mob_groups SET dropid = 4107 WHERE name = 'Fenrir_Prime_HTBF';
UPDATE mob_groups SET dropid = 4108 WHERE name = 'Carbuncle_Prime_HTBF';
UPDATE mob_groups SET dropid = 4109 WHERE name = 'Diabolos_Prime_HTBF';
UPDATE mob_groups SET dropid = 4110 WHERE name = 'Ark_Angel_EV_HTBF';
UPDATE mob_groups SET dropid = 4111 WHERE name = 'Ark_Angel_GK_HTBF';
UPDATE mob_groups SET dropid = 4112 WHERE name = 'Ark_Angel_HM_HTBF';
UPDATE mob_groups SET dropid = 4113 WHERE name = 'Ark_Angel_MR_HTBF';
UPDATE mob_groups SET dropid = 4114 WHERE name = 'Ark_Angel_TT_HTBF';
UPDATE mob_groups SET dropid = 4115 WHERE name = 'Lancelord_Gaheel_HTBF';
UPDATE mob_groups SET dropid = 4116 WHERE name = 'Tenzen_HTBF';
UPDATE mob_groups SET dropid = 4117 WHERE name = 'Ultima_HTBF';
UPDATE mob_groups SET dropid = 4118 WHERE name = 'Ironclad_Executioner' AND groupid = 46;
-- 4119 = Supreme Behemoth
-- 4120 = Supreme Fafnir
-- 4121 = Supreme Aspid
-- 4122 = Supreme Bahamut
UPDATE mob_groups SET dropid = 4123 WHERE name = 'Asb' AND groupid = 11525;
UPDATE mob_groups SET dropid = 4124 WHERE name = 'Pil' AND groupid = 11526;
UPDATE mob_groups SET dropid = 4125 WHERE name = 'Rukh' AND groupid = 11527;
UPDATE mob_groups SET dropid = 4126 WHERE name = 'Sarbaz' AND groupid = 11528;
UPDATE mob_groups SET dropid = 4127 WHERE name = 'Shah' AND groupid = 11529;
UPDATE mob_groups SET dropid = 4128 WHERE name = 'Wazir' AND groupid = 11530;
UPDATE mob_groups SET dropid = 4129 WHERE name = 'Provenance_Watcher' AND groupid = 11531;
UPDATE mob_groups SET dropid = 4130 WHERE name = 'Asida' AND groupid = 54;
UPDATE mob_groups SET dropid = 4131 WHERE name = 'Bia' AND groupid = 45;
UPDATE mob_groups SET dropid = 4132 WHERE name = 'Emputa' AND groupid = 52;
UPDATE mob_groups SET dropid = 4133 WHERE name = 'Khon' AND groupid = 48;
UPDATE mob_groups SET dropid = 4134 WHERE name = 'Khun' AND groupid = 50;
UPDATE mob_groups SET dropid = 4135 WHERE name = 'Ma' AND groupid = 47;
UPDATE mob_groups SET dropid = 4136 WHERE name = 'Met' AND groupid = 49;
UPDATE mob_groups SET dropid = 4137 WHERE name = 'Peirithoos' AND groupid = 53;
UPDATE mob_groups SET dropid = 4138 WHERE name = 'Ruea' AND groupid = 46;
UPDATE mob_groups SET dropid = 4139 WHERE name = 'Sava_Savanovic' AND groupid = 56;
UPDATE mob_groups SET dropid = 4140 WHERE name = 'Tenodera' AND groupid = 55;
UPDATE mob_groups SET dropid = 4141 WHERE name = 'Wasserspeier' AND groupid = 51;
UPDATE mob_groups SET dropid = 4142 WHERE name = 'Amymone' AND groupid = 63;
UPDATE mob_groups SET dropid = 4143 WHERE name = 'Hanbi' AND groupid = 59;
UPDATE mob_groups SET dropid = 4144 WHERE name = 'Kammavaca' AND groupid = 67;
UPDATE mob_groups SET dropid = 4145 WHERE name = 'Naphula' AND groupid = 65;
UPDATE mob_groups SET dropid = 4146 WHERE name = 'Palila' AND groupid = 57;
UPDATE mob_groups SET dropid = 4147 WHERE name = 'Yilan' AND groupid = 61;
UPDATE mob_groups SET dropid = 4148 WHERE name = 'Duke_Vepar' AND groupid = 74;
UPDATE mob_groups SET dropid = 4149 WHERE name = 'Pakecet' AND groupid = 72;
UPDATE mob_groups SET dropid = 4150 WHERE name = 'Virava' AND groupid = 76;
UPDATE mob_groups SET dropid = 4151 WHERE name = 'Ark_Angel_EV' AND groupid = 90;
UPDATE mob_groups SET dropid = 4152 WHERE name = 'Ark_Angel_GK' AND groupid = 91;
UPDATE mob_groups SET dropid = 4153 WHERE name = 'Ark_Angel_HM' AND groupid = 85;
UPDATE mob_groups SET dropid = 4154 WHERE name = 'Ark_Angel_MR' AND groupid = 87;
UPDATE mob_groups SET dropid = 4155 WHERE name = 'Ark_Angel_TT' AND groupid = 86;
UPDATE mob_groups SET dropid = 4156 WHERE name = 'Byakko-Escha' AND groupid = 78;
UPDATE mob_groups SET dropid = 4157 WHERE name = 'Genbu-Escha' AND groupid = 79;
UPDATE mob_groups SET dropid = 4158 WHERE name = 'Kouryu' AND groupid = 84;
UPDATE mob_groups SET dropid = 4159 WHERE name = 'Seiryu-Escha' AND groupid = 80;
UPDATE mob_groups SET dropid = 4160 WHERE name = 'Suzaku-Escha' AND groupid = 81;
UPDATE mob_groups SET dropid = 4161 WHERE name = 'Warder_of_Courage' AND groupid = 93;
UPDATE mob_groups SET dropid = 4162 WHERE name = 'Warder_of_Dignity' AND groupid = 41;
UPDATE mob_groups SET dropid = 4163 WHERE name = 'Warder_of_Faith' AND groupid = 31;
UPDATE mob_groups SET dropid = 4164 WHERE name = 'Warder_of_Fortitude' AND groupid = 39;
UPDATE mob_groups SET dropid = 4165 WHERE name = 'Warder_of_Hope' AND groupid = 34;
UPDATE mob_groups SET dropid = 4166 WHERE name = 'Warder_of_Justice' AND groupid = 32;
UPDATE mob_groups SET dropid = 4167 WHERE name = 'Warder_of_Love' AND groupid = 36;
UPDATE mob_groups SET dropid = 4168 WHERE name = 'Warder_of_Loyalty' AND groupid = 42;
UPDATE mob_groups SET dropid = 4169 WHERE name = 'Warder_of_Mercy' AND groupid = 43;
UPDATE mob_groups SET dropid = 4170 WHERE name = 'Warder_of_Prudence' AND groupid = 35;
UPDATE mob_groups SET dropid = 4171 WHERE name = 'Warder_of_Temperance' AND groupid = 29;
UPDATE mob_groups SET dropid = 4172 WHERE name = 'Eschan_Porxie' AND groupid = 44;
UPDATE mob_groups SET dropid = 4173 WHERE name = 'Belphegor' AND groupid = 50;
UPDATE mob_groups SET dropid = 4174 WHERE name = 'Crom_Dubh' AND groupid = 45;
UPDATE mob_groups SET dropid = 4175 WHERE name = 'Dazzling_Dolores' AND groupid = 48;
UPDATE mob_groups SET dropid = 4176 WHERE name = 'Golden_Kist' AND groupid = 46;
UPDATE mob_groups SET dropid = 4177 WHERE name = 'Kabandha' AND groupid = 51;
UPDATE mob_groups SET dropid = 4178 WHERE name = 'Mauve-wristed_Gomberry' AND groupid = 47;
UPDATE mob_groups SET dropid = 4179 WHERE name = 'Oryx' AND groupid = 56;
UPDATE mob_groups SET dropid = 4180 WHERE name = 'Sabotender_Royal' AND groupid = 54;
UPDATE mob_groups SET dropid = 4181 WHERE name = 'Sang_Buaya' AND groupid = 53;
UPDATE mob_groups SET dropid = 4182 WHERE name = 'Selkit' AND groupid = 52;
UPDATE mob_groups SET dropid = 4183 WHERE name = 'Taelmoth_the_Diremaw' AND groupid = 49;
UPDATE mob_groups SET dropid = 4184 WHERE name = 'Zduhac' AND groupid = 55;
UPDATE mob_groups SET dropid = 4185 WHERE name = 'Heavenly_Veela' AND groupid = 44;
UPDATE mob_groups SET dropid = 4186 WHERE name = 'Bashmu' AND groupid = 62;
UPDATE mob_groups SET dropid = 4187 WHERE name = 'Gajasimha' AND groupid = 58;
UPDATE mob_groups SET dropid = 4188 WHERE name = 'Ironside' AND groupid = 59;
UPDATE mob_groups SET dropid = 4189 WHERE name = 'Old_Shuck' AND groupid = 61;
UPDATE mob_groups SET dropid = 4190 WHERE name = 'Sarsaok' AND groupid = 60;
UPDATE mob_groups SET dropid = 4191 WHERE name = 'Strophadia' AND groupid = 57;
UPDATE mob_groups SET dropid = 4192 WHERE name = 'Maju' AND groupid = 63;
UPDATE mob_groups SET dropid = 4193 WHERE name = 'Neak' AND groupid = 65;
UPDATE mob_groups SET dropid = 4194 WHERE name = 'Yakshi' AND groupid = 64;
UPDATE mob_groups SET dropid = 4195 WHERE name = 'Albumen' AND groupid = 80;
UPDATE mob_groups SET dropid = 4196 WHERE name = 'Erinys' AND groupid = 87;
UPDATE mob_groups SET dropid = 4197 WHERE name = 'Onychophora' AND groupid = 85;
UPDATE mob_groups SET dropid = 4198 WHERE name = 'Teles' AND groupid = 66;
UPDATE mob_groups SET dropid = 4199 WHERE name = 'Vinipata' AND groupid = 71;
UPDATE mob_groups SET dropid = 4200 WHERE name = 'Zerde' AND groupid = 67;
UPDATE mob_groups SET dropid = 4201 WHERE name = 'Ascended_Beetle' AND groupid = 30;
UPDATE mob_groups SET dropid = 4202 WHERE name = 'Ascended_Chapuli' AND groupid = 27;
UPDATE mob_groups SET dropid = 4203 WHERE name = 'Ascended_Chigoe' AND groupid = 39;
UPDATE mob_groups SET dropid = 4204 WHERE name = 'Ascended_Cyhiraeth' AND groupid = 34;
UPDATE mob_groups SET dropid = 4205 WHERE name = 'Ascended_Faaz' AND groupid = 41;
UPDATE mob_groups SET dropid = 4206 WHERE name = 'Ascended_Gefyrst' AND groupid = 42;
UPDATE mob_groups SET dropid = 4207 WHERE name = 'Ascended_Hippogryph' AND groupid = 40;
UPDATE mob_groups SET dropid = 4208 WHERE name = 'Ascended_Lucani' AND groupid = 32;
UPDATE mob_groups SET dropid = 4209 WHERE name = 'Ascended_Luckybug' AND groupid = 31;
UPDATE mob_groups SET dropid = 4210 WHERE name = 'Ascended_Mantis' AND groupid = 29;
UPDATE mob_groups SET dropid = 4211 WHERE name = 'Ascended_Mosquito' AND groupid = 28;
UPDATE mob_groups SET dropid = 4212 WHERE name = 'Ascended_Naraka' AND groupid = 36;
UPDATE mob_groups SET dropid = 4213 WHERE name = 'Ascended_Panopt' AND groupid = 37;
UPDATE mob_groups SET dropid = 4214 WHERE name = 'Ascended_Poroggo' AND groupid = 38;
UPDATE mob_groups SET dropid = 4215 WHERE name = 'Ascended_Porxie' AND groupid = 33;
UPDATE mob_groups SET dropid = 4216 WHERE name = 'Ascended_Tiger' AND groupid = 35;
UPDATE mob_groups SET dropid = 4217 WHERE name = 'Ascended_Ungeweder' AND groupid = 43;
-- 4218
UPDATE mob_groups SET dropid = 4219 WHERE name = 'Schah' AND groupid = 74;
UPDATE mob_groups SET dropid = 4220 WHERE name = 'Colkhab' AND groupid = 36;
UPDATE mob_groups SET dropid = 4221 WHERE name = 'Achuka' AND groupid = 33;
UPDATE mob_groups SET dropid = 4222 WHERE name = 'Tchakka' AND groupid = 32;
UPDATE mob_groups SET dropid = 4223 WHERE name = 'Hurkan' AND groupid = 34;
UPDATE mob_groups SET dropid = 4224 WHERE name = 'Yumcax' AND groupid = 37;
UPDATE mob_groups SET dropid = 4225 WHERE name = 'Kumhau' AND groupid = 31;