UPDATE item_basic SET stackSize = 99 WHERE itemid = 4049;
INSERT INTO item_basic VALUES(9948,0,'ambuscade_chit_ring', 'a._chit_ring',1,12,7040,0,0);
UPDATE item_basic SET stackSize = 99 WHERE itemid = 2881;
UPDATE item_basic SET stackSize = 99 WHERE itemid = 2882;
UPDATE item_basic SET stackSize = 99 WHERE itemid = 2883;
UPDATE item_basic SET stackSize = 99 WHERE itemid = 2884;
UPDATE item_basic SET stackSize = 99 WHERE itemid = 2885;

--Date_Shuriken Fix
UPDATE `item_weapon` SET `subskill`=3, `ilvl_skill`=242 WHERE `itemId`=22292 AND name = 'date_shuriken';
