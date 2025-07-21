local combat = COMBAT_ENERGYDAMAGE
local effect = CONST_ME_ENERGYAREA
local disteffect = CONST_ANI_ENERGY

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 4.3) + 900
	local max = (level / 5) + (magicLevel * 7.4) + 1200
	return -min, -max
end

local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, combat)
combat1:setParameter(COMBAT_PARAM_EFFECT, effect)
combat1:setParameter(COMBAT_PARAM_DISTANCEEFFECT, disteffect)
combat1:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	return combat1:execute(creature, variant)
end
