-----------------------------------
-- Spell: Bilgestorm
-- Deals damage in an area of effect. Additional effect: Lowers attack, accuracy, and defense
-- Spell cost: 122 MP
-- Monster Type: 
-- Spell Type: Physical
-- Blue Magic Points: 5
-- Stat Bonus: HP-5, MP+5
-- Level: 99
-- Casting Time: 1 seconds
-- Recast Time: 30 seconds
-- Magic Bursts on: Gravitation, and Darkness
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    if caster:hasStatusEffect(xi.effect.UNBRIDLED_LEARNING) or        
    caster:hasStatusEffect(xi.effect.UNBRIDLED_WISDOM) then
       return 0
    else
       return spell:setMsg(xi.msg.basic.STATUS_PREVENTS)
    end
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.DEMON
    params.skillType = xi.skill.BLUE_MAGIC
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.BLUNT
    params.scattr = xi.skillchainType.GRAVITATION
    params.scattr = xi.skillchainType.DARKNESS
    params.numhits = 1
    params.multiplier = 1.78
    params.tp150 = 1.78
    params.tp300 = 1.78
    params.azuretp = 1.78
    params.duppercap = 75
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    local duration = 30
    local resistThreshold = 0.5
    local resist = applyResistanceEffect(caster, target, spell, params)

        local actionOne = target:addStatusEffect(xi.effect.DEFENSE_DOWN, 25, 0, duration * resist)
        local actionTwo = target:addStatusEffect(xi.effect.ATTACK_DOWN, 25, 0, duration * resist)
        local actionThree = target:addStatusEffect(xi.effect.ACCURACY_DOWN, 10, 0, duration * resist)
            if not actionOne and not actionTwo and not actionThree then -- all statuses fail to apply
               spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
            elseif not actionOne and not actionTwo and actionThree  then -- the first 2 status fails to apply
               returnEffect = xi.effect.ACCURACY_DOWN
            elseif not actionOne and not actionThree and actionTwo then -- the 1 / 3 status fails to apply
               returnEffect = xi.effect.ATTACK_DOWN
            end

        local damage = xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
    xi.spells.blue.usePhysicalSpellAddedEffect(caster, target, spell, params, damage, power, tick, duration)

    return damage, returnEffect
end

return spellObject
