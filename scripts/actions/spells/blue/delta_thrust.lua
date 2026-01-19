-----------------------------------
-- Spell: Delta Thrust
-- Delivers a threefold attack on a single target. Additional effect: Plague
-- Spell cost: 28 MP
-- Monster Type: Lizards
-- Spell Type: Physical
-- Blue Magic Points: 2
-- Stat Bonus: HP +15 MP -5 INT -1
-- Level: 89
-- Casting Time: 0.5 seconds
-- Recast Time: 15 seconds
-- Magic Bursts on: Liquefacation / Detonation
-- Combos: Dual Wield
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.LIZARDS
    params.tpmod = TPMOD_DAMAGE
	params.bonusacc = 0
    if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.CHAIN_AFFINITY) then
       params.bonusacc = math.floor(caster:getTP() / 50)
    end
	
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.SLASHING
    params.scattr = xi.skillchainType.LIQUEFACATION
    params.scattr2 = xi.skillchainType.DETONATION
    params.attribute = xi.mod.DEX
    params.numhits = 3
    params.multiplier = 3.0
	params.tp150 = 2
    params.tp300 = 2.25
    params.tp350 = 2.36
    params.azuretp = 2.53125
    params.duppercap = 75
    params.str_wsc = 0.7
    params.dex_wsc = 0.0
    params.vit_wsc = 1.2
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
	params.ignorefstrcap = true
	
	  -- Handle status effects. effect, power, tik, duration
    local effectTable =
    {
        [1] = { xi.effect.PLAGUE,30, 0, 90 },
    }
   
	local damage   = xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
		xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effectTable)
    return damage
end

return spellObject
