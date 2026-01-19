-----------------------------------
-- Spell: Thermal Pulse
-- Deals Fire damage to enemies within area of effect. Additional effect: Blindness
-- Spell cost: 86 MP
-- Monster Type: VERMIN
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 3
-- Stat Bonus: VIT +2
-- Level: 86
-- Casting Time: 5.5 seconds
-- Recast Time: 70 seconds
-- Combos: Attack Bonus
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.VERMIN
	if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.BURST_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end
	
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.FIRE
    params.attribute = xi.mod.INT
    params.multiplier = 4.0
    params.tMultiplier = 2.0
    params.duppercap = 69
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.4
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
	
	 -- Handle status effects. effect, power, tik, duration
    local effectTable =
    {
        [1] = { xi.effect.BLINDNESS, 2500, 0, 60 },
    }

    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
        xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effectTable)

       return damage
end

return spellObject
