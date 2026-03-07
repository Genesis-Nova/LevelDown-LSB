UPDATE item_basic SET stackSize = 99 WHERE itemid = 4049;
INSERT INTO item_basic VALUES(9948,0,'ambuscade_chit_ring', 'a._chit_ring',1,12,7040,0,0);
UPDATE item_basic SET stackSize = 99 WHERE itemid = 2881;
UPDATE item_basic SET stackSize = 99 WHERE itemid = 2882;
UPDATE item_basic SET stackSize = 99 WHERE itemid = 2883;
UPDATE item_basic SET stackSize = 99 WHERE itemid = 2884;
UPDATE item_basic SET stackSize = 99 WHERE itemid = 2885;

--Date_Shuriken Fix
UPDATE `item_weapon` SET `subskill`=3, `ilvl_skill`=242 WHERE `itemId`=22292 AND name = 'date_shuriken';

--Lockstyle Fixes

UPDATE item_basic SET type = 7 WHERE itemID = 20931 AND name = 'celestial_spear';
UPDATE item_basic SET type = 7 WHERE itemID = 21520 AND name = 'ethereal_fists';
UPDATE item_basic SET type = 7 WHERE itemID = 21624 AND name = 'ethereal_sword';
UPDATE item_basic SET type = 7 WHERE itemID = 21666 AND name = 'ethereal_g._sword';
UPDATE item_basic SET type = 7 WHERE itemID = 21713 AND name = 'ethereal_axe';
UPDATE item_basic SET type = 7 WHERE itemID = 21771 AND name = 'ethereal_great_axe';
UPDATE item_basic SET type = 7 WHERE itemID = 21838 AND name = 'ethereal_scythe';
UPDATE item_basic SET type = 7 WHERE itemID = 21873 AND name = 'ethereal_spear';
UPDATE item_basic SET type = 7 WHERE itemID = 21911 AND name = 'ethereal_katana';
UPDATE item_basic SET type = 7 WHERE itemID = 21962 AND name = 'ethereal_tachi';
UPDATE item_basic SET type = 7 WHERE itemID = 22053 AND name = 'ethereal_club';
UPDATE item_basic SET type = 7 WHERE itemID = 22090 AND name = 'ethereal_staff';
UPDATE item_basic SET type = 7 WHERE itemID = 22146 AND name = 'ethereal_bow';
UPDATE item_basic SET type = 7 WHERE itemID = 22165 AND name = 'ethereal_gun';
UPDATE item_basic SET type = 6 WHERE itemID = 23822 AND name = 'diamond_somen';
UPDATE item_basic SET type = 6 WHERE itemID = 23823 AND name = 'diamond_haramaki';
UPDATE item_basic SET type = 6 WHERE itemID = 23824 AND name = 'diamond_kote';
UPDATE item_basic SET type = 6 WHERE itemID = 23825 AND name = 'diamond_hizayori';
UPDATE item_basic SET type = 6 WHERE itemID = 23826 AND name = 'diamond_sune-ate';
UPDATE item_basic SET type = 6 WHERE itemID = 23871 AND name = 'hebenus_gilet';
UPDATE item_basic SET type = 6 WHERE itemID = 23872 AND name = 'hebenus_boxers';
UPDATE item_basic SET type = 6 WHERE itemID = 23873 AND name = 'hebenus_top';
UPDATE item_basic SET type = 6 WHERE itemID = 23874 AND name = 'hebenus_shorts';
UPDATE item_basic SET type = 7 WHERE itemID = 20593 AND name = 'hedron_dagger';

UPDATE item_equipment SET slot = 1 WHERE itemID = 21520 AND name = 'ethereal_fists';
UPDATE item_equipment SET slot = 3 WHERE itemID = 21624 AND name = 'ethereal_sword';
UPDATE item_equipment SET slot = 1 WHERE itemID = 21771 AND name = 'ethereal_great_axe';
UPDATE item_equipment SET slot = 1 WHERE itemID = 21838 AND name = 'ethereal_scythe';
UPDATE item_equipment SET slot = 1 WHERE itemID = 21962 AND name = 'ethereal_tachi';
UPDATE item_equipment SET slot = 1 WHERE itemID = 22090 AND name = 'ethereal_staff';
UPDATE item_equipment SET slot = 4 WHERE itemID = 22146 AND name = 'ethereal_bow';
UPDATE item_equipment SET slot = 3 WHERE itemID = 21571 AND name = 'ethereal_dagger';
UPDATE item_equipment SET slot = 1 WHERE itemID = 21713 AND name = 'ethereal_axe';
UPDATE item_equipment SET slot = 1 WHERE itemID = 21666 AND name = 'ethereal_g._sword';
UPDATE item_equipment SET slot = 1 WHERE itemID = 21911 AND name = 'ethereal_katana';
UPDATE item_equipment SET slot = 1 WHERE itemID = 22053 AND name = 'ethereal_club';
UPDATE item_equipment SET slot = 3 WHERE itemID = 21873 AND name = 'ethereal_spear';
UPDATE item_equipment SET slot = 4 WHERE itemID = 22165 AND name = 'ethereal_gun';
UPDATE item_equipment SET slot = 1 WHERE itemID = 20931 AND name = 'celestial_spear';
UPDATE item_equipment SET slot = 3 WHERE itemID = 20593 AND name = 'hedron_dagger';

UPDATE item_equipment SET jobs = 337 WHERE itemID = 26487 AND name = 'sacro_bulwark';


--slots
-- two handed 1
-- shield 2
-- main or offhand 3
-- ranged 4
-- ammo 8
-- head 16
-- body 32
-- Hands 64
-- Legs 128
-- Feet 256

