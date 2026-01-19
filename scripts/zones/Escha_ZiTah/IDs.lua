-----------------------------------
-- Area: Escha_ZiTah
-----------------------------------
zones = zones or {}

zones[xi.zone.ESCHA_ZITAH] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED       = 6385, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                 = 6391, -- Obtained: <item>.
        GIL_OBTAINED                  = 6392, -- Obtained <number> gil.
        KEYITEM_OBTAINED              = 6394, -- Obtained key item: <keyitem>.
        ITEMS_OBTAINED                = 6400, -- You obtain <number> <item>!
        CARRIED_OVER_POINTS           = 7002, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY       = 7003, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!
        LOGIN_NUMBER                  = 7004, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        MEMBERS_LEVELS_ARE_RESTRICTED = 7024, -- Your party is unable to participate because certain members' levels are restricted.
        AFFI_KEYITEM_OBTAINED         = 7473, -- A pleasure. A bloomin' pleasure.<7F31>
    },
    mob =
    {
        PRICKLY_PITRIV       = GetFirstID('Prickly_Pitriv'),
        HUGEMAW_HAROLD       = GetFirstID('Hugemaw_Harold'),
        SERPOPARD_NINLIL     = GetFirstID('Serpopard_Ninlil'),
        ABYSSDIVER           = GetFirstID('Abyssdiver'),
        IMMANIBUGARD         = GetFirstID('Immanibugard'),
        JESTER_MALATRIX      = GetFirstID('Jester_Malatrix'),
        KEEPER_OF_HEILIGTUM  = GetFirstID('Keeper_of_Heiligtum'),
        VOSO                 = GetFirstID('Voso'),
        BEIST                = GetFirstID('Beist'),
        MUUT                 = GetFirstID('Muut'),
        ESCHAN_JEWELWEED     = GetFirstID('Eschan_Jewelweed'),
        ESCHAN_COEURL        = GetTableOfIDs('Eschan_Coeurl'),
        ESCHAN_DHALMEL       = GetTableOfIDs('Eschan_Dhalmel'),
        ESCHAN_CORSE         = GetTableOfIDs('Eschan_Corse'),
        ESCHAN_GOOBBUE       = GetTableOfIDs('Eschan_Goobbue'),
        ESCHAN_WEAPON        = GetTableOfIDs('Eschan_Weapon'),
        ESCHAN_BUGARD        = GetTableOfIDs('Eschan_Bugard'),
        ESCHAN_WORM          = GetTableOfIDs('Eschan_Worm'),
        ESCHAN_SNAPWEED      = GetTableOfIDs('Eschan_Snapweed'),
        ESCHAN_SHADOW_DRAGON = GetTableOfIDs('Eschan_Shadow_Dragon'),
        ESCHAN_VULTURE       = GetTableOfIDs('Eschan_Vulture'),
        ESCHAN_CRAWLER       = GetTableOfIDs('Eschan_Crawler'),
    },
    npc =
    {
    },
}

return zones[xi.zone.ESCHA_ZITAH]
