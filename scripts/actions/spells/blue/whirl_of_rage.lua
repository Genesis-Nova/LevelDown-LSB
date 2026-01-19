-----------------------------------
-- Spell: Whirl of Rage
-- Damage varies with TP
-- Spell cost: 73 MP
-- Monster Type: Arcana
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 2
-- Stat Bonus: STR +2, DEX +2
-- Level: 83
-- Casting Time: 1 seconds
-- Recast Time: 30 seconds
-- Skillchain Element(s): Scission, Detonation
-- Combos: Zanshin
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.ARCANA
	 if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.CHAIN_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end
	
    params.tpmod = TPMOD_DAMAGE
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.SLASHING
    params.scattr = xi.skillchainType.DETONATION
    params.scattr = xi.skillchainType.SCISSION
    params.numhits = 1
    params.multiplier = 3.0
    params.tp150 = 4.0
    params.tp300 = 4.0
    params.tp350 = 4.25
    params.azuretp = 2.53125
    params.duppercap = 35
    params.str_wsc = 0.7
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.7
    params.chr_wsc = 0.0
    params.ignorefstrcap = true -- Whirl of Rage doesn't have an fSTR cap
    params.resistThreshold = 0

        -- Handle status effects. effect, power, tik, duration
    local effectTable =
    {
        [1] = { xi.effect.STUN, 2, 0, 5 },
    }

    local damage   = xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
        xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effectTable)
        
    return damage
end

return spellObject
