-----------------------------------
-- Area: East_Ronfaure
-----------------------------------
zones = zones or {}

zones[xi.zone.EAST_RONFAURE] =
{
    text =
    {
        NOTHING_HAPPENS               = 141,   -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED       = 6407,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                 = 6413,  -- Obtained: <item>.
        GIL_OBTAINED                  = 6414,  -- Obtained <number> gil.
        KEYITEM_OBTAINED              = 6416,  -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY       = 6427,  -- There is nothing out of the ordinary here.
        FELLOW_MESSAGE_OFFSET         = 6442,  -- I'm ready. I suppose.
        CARRIED_OVER_POINTS           = 7024,  -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY       = 7025,  -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!
        LOGIN_NUMBER                  = 7026,  -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        MEMBERS_LEVELS_ARE_RESTRICTED = 7046,  -- Your party is unable to participate because certain members' levels are restricted.
        CONQUEST_BASE                 = 7091,  -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET        = 7250,  -- You can't fish here.
        DIG_THROW_AWAY                = 7263,  -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING                  = 7265,  -- You dig and you dig, but find nothing.
        FOUND_ITEM_WITH_EASE          = 7340,  -- It appears your chocobo found this item with ease.
        RAYOCHINDOT_DIALOG            = 7430,  -- If you are outmatched, run to the city as quickly as you can.
        CROTEILLARD_DIALOG            = 7431,  -- Sorry, no chatting while I'm on duty.
        ANDELAIN_DIALOG               = 7432,  -- My name is Andelain. As part of my devotions, I come here each day to pray.
        MAY_ONLY_EAT                  = 7433,  -- During this time, I may eat only three <item> a day for nourishment. No more, no less. And no other food may I eat.
        THANKS_TO_GODDESS             = 7434,  -- Thanks be to the Goddess in her benevolence!
        CANNOT_ACCEPT_ALMS            = 7435,  -- I am currently undergoing devotions, and as such, am not allowed to take alms from those on the road. I am sorry, but I cannot accept this.
        GATES_OF_PARADISE_OPEN        = 7436,  -- May the Gates of Paradise open to all...
        APPRECIATE_OFFER_DECLINE      = 7437,  -- I appreciate your offer, but I only need one <item>. Thank you for your kindness.
        THE_WATER_SPARKLES            = 7455,  -- The water sparkles in the light.
        CHEVAL_RIVER_WATER            = 7456,  -- You fill your waterskin with water from the river. You now have <item>.
        BLESSED_WATERSKIN             = 7475,  -- To get water, trade the waterskin you hold with the river.
        LOGGING_IS_POSSIBLE_HERE      = 7506,  -- Logging is possible here if you have <item>.
        PLAYER_OBTAINS_ITEM           = 7517,  -- <name> obtains <item>!
        UNABLE_TO_OBTAIN_ITEM         = 7518,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM      = 7519,  -- <name> obtains the temporary item: <item>!
        ALREADY_POSSESS_TEMP          = 7520,  -- You already possess that temporary item.
        NO_COMBINATION                = 7525,  -- You were unable to enter a combination.
        VOIDWALKER_DESPAWN            = 7556,  -- The monster fades before your eyes, a look of disappointment on its face.
        UNITY_WANTED_BATTLE_INTERACT  = 7587,  -- Those who have accepted % must pay # Unity accolades to participate. The content for this Wanted battle is #. [Ready to begin?/You do not have the appropriate object set, so your rewards will be limited.]
        REGIME_REGISTERED             = 9887,  -- New training regime registered!
        VOIDWALKER_NO_MOB             = 11060, -- The <keyitem> quivers ever so slightly, but emits no light. There seem to be no monsters in the area.
        VOIDWALKER_MOB_TOO_FAR        = 11061, -- The <keyitem> quivers ever so slightly and emits a faint light. There seem to be no monsters in the immediate vicinity.
        VOIDWALKER_MOB_HINT           = 11062, -- The <keyitem> resonates [feebly/softly/solidly/strongly/very strongly/furiously], sending a radiant beam of light lancing towards a spot roughly <number> [yalm/yalms] [east/southeast/south/southwest/west/northwest/north/northeast] of here.
        VOIDWALKER_SPAWN_MOB          = 11063, -- A monster materializes out of nowhere!
        VOIDWALKER_UPGRADE_KI_1       = 11065, -- The <keyitem> takes on a slightly deeper hue and becomes <keyitem>!
        VOIDWALKER_UPGRADE_KI_2       = 11066, -- The <keyitem> takes on a deeper, richer hue and becomes <keyitem>!
        VOIDWALKER_BREAK_KI           = 11067, -- The <keyitem> shatters into tiny fragments.
        VOIDWALKER_OBTAIN_KI          = 11068, -- Obtained key item: <keyitem>!
        VOIDWATCH_CLEARANCE           = 11091, -- {player:name} gains clearance to participate in the Voidwatch operation.\x07One <0105:33,82,80,80,80> expended.<7F31>
        VOIDWATCH_DISTANCE_TOFAR      = 11094, -- <1F:7B>You have ventured too far from the field of battle.\x07You will be automatically relieved of Voidwatcher status if you do not return.<7F31>
        VOIDWATCH_STATUS_REMOVED      = 11095, -- You have ventured too far from the field of battle.\x07Voidwatcher status revoked.<7F31>
        VOIDWATCH_DISTANCE_RETURNED   = 11096, -- You have returned to the field of battle.<7F31>
        VOIDWATCH_MYSTERIOUS_ENERGY   = 11104, -- You feel a mysterious energy seeping forth from an unknown source...<7F31>
        VOIDWATCH_VOIDSTONE_RESONATES = 11105, -- The <0105:33,82,80,80,80> resonates with the <0105:33,82,81,80,80>.\x07You may commence the Voidwatch operation at will.<7F31>
        VOIDWATCH_NM_SPAWN            = 11111, -- A fiend materializes from the planar rift!<7F31>
        VOIDWATCH_TRADE_CELLS         = 11180, -- {player:name} expends <0101:01> <0105:24,82,80,80,80> and increases {1:select}[blue/red/yellow/green] spectral alignment by {2}%!\x07Current value: +{3}%<7F31>
        VOIDWATCH_CELL_MAX_VAL        = 11183, -- The <0105:23,82,81,80,80> increases {0:select}[blue/red/yellow/green] spectral alignment to its maximum value.<7F31>
        OBTAINED_ALL_SPOILES          = 11190, -- You have obtained all spoils.<7F31>
        FIEND_VULNERABLE_ATTACKS      = 11209, -- The fiend appears {2:select}[/highly /extremely ]vulnerable to {0:select}[/hand-to-hand/dagger/sword/great sword/axe/great axe/scythe/polearm/katana/great katana/club/staff/archery/marksmanship/pet/automaton/avatar/wyvern] {1:select}[weapon skills/special attacks/blood pacts]!<7F31>
        FIEND_VULNERABLE_JOBABILITY   = 11210, -- The fiend appears {1:select}[/highly /extremely ]vulnerable to {0:select}[/warrior/monk/white mage/black mage/red mage/thief/paladin/dark knight/beastmaster/bard/ranger/samurai/ninja/dragoon/summoner/blue mage/corsair/puppetmaster/dancer/scholar] abilities!<7F31>
        FIEND_VULNERABLE_ELEM_MAGIC   = 11211, -- The fiend appears {1:select}[/highly /extremely ]vulnerable to {0:select}[/fire elemental /ice elemental /wind elemental /earth elemental /lightning elemental /water elemental /light elemental /darkness elemental ]magic!<7F31>
        FIEND_VULNERABLE_MAGIC_TYPE   = 11212, -- The fiend appears {1:select}[/highly /extremely ]vulnerable to {0:select}[/fire elemental /ice elemental /wind elemental /earth elemental /lightning elemental /water elemental /light elemental /darkness elemental ]{2:select}[/white magic/black magic//ninjutsu/bard songs/blue magic]!<7F31>
        FIEND_VULNERABLE_PET_ABILITY  = 11213, -- The fiend appears {2:select}[/highly /extremely ]vulnerable to {0:select}[/fire elemental /ice elemental /wind elemental /earth elemental /lightning elemental /water elemental /light elemental /darkness elemental ]{1:select}[blood pacts/wyvern abilities]!<7F31>
        FIEND_VULNERABLE_PET_SPECIAL  = 11214, -- The fiend appears {2:select}[/highly /extremely ]vulnerable to pet special attacks!<7F31>
        FIEND_VULNERABLE_ATM_SPECIAL  = 11215, -- The fiend appears {2:select}[/highly /extremely ]vulnerable to automaton special attacks!<7F31>
        PHASE_DISPLACER_TRADE         = 11229, -- Obtained {1} <0105:33,82,80,80,80> by expending {1} <0109:29,82,81,80,80,82,82,80,80>.<7F31>
        CANNOT_OBTAIN_VOIDCLUSTER     = 11231, -- You cannot obtain any more <0105:35,82,80,80,80>.<7F31>
        LEARNS_SPELL                  = 11958, -- <name> learns <spell>!
        UNCANNY_SENSATION             = 11960, -- You are assaulted by an uncanny sensation.
    },

    mob =
    {
        BIGMOUTH_BILLY = GetFirstID('Bigmouth_Billy'),
        SWAMFISK       = GetTableOfIDs('Swamfisk'), -- 2 NMs
        VOIDWATCH      = GetTableOfIDs('Sarimanok'), -- 3 NMs

        VOIDWALKER =
        {
            [xi.keyItem.CLEAR_ABYSSITE] =
            {
                17191334, -- Sunderclaw
                17191333, -- Sunderclaw
                17191332, -- Sunderclaw
                17191331, -- Sunderclaw
                17191330,  -- Quagmire Pugil
                17191329,  -- Quagmire Pugil
                17191328,  -- Quagmire Pugil
                17191327,  -- Quagmire Pugil
            },

            [xi.keyItem.COLORFUL_ABYSSITE] =
            {
                17191326, -- Capricornus
                17191325  -- Yacumama
            },

            [xi.keyItem.BLUE_ABYSSITE] =
            {
                17191324  -- Krabkatoa
            },

            [xi.keyItem.BLACK_ABYSSITE] =
            {
                17191323  -- Yilbegan
            }
        }
    },

    npc =
    {
        LOGGING        = GetTableOfIDs('Logging_Point'),
        PLANAR_RIFT    = GetTableOfIDs('Planar_Rift'),
        RIFTWORN_PYXIS = GetTableOfIDs('Riftworn_Pyxis')
    },
}

return zones[xi.zone.EAST_RONFAURE]
