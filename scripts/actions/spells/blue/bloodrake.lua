-----------------------------------
-- Spell: Blood drake

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
    params.ecosystem = xi.ecosystem.UNDEAD
    params.tpmod = xi.spells.blue.tpMod.DAMAGE
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.SLASHING
    params.attribute = xi.mod.STR
    params.attribute = xi.mod.MND
    params.skillType = xi.skill.BLUE_MAGIC
    params.scattr = xi.skillchainType.DARKNESS
    params.scattr2 = xi.skillchainType.DISTORTION
    params.numhits = 3
    params.multiplier = 4.0
    params.tp150 = 1.375
    params.tp300 = 2.0
    params.duppercap = 99
    params.str_wsc = 0.3
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.3
    params.chr_wsc = 0.0
    params.dmgMultiplier = 5

    local damage = xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
    xi.spells.blue.useDrainSpell(caster, target, spell, params, 0, false)
    caster:addHP(damage)
    spell:setMsg(xi.msg.basic.MAGIC_DRAIN_HP)

    return damage
end

return spellObject
    