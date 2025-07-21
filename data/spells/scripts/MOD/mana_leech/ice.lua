local combat = COMBAT_ICEDAMAGE
local effect = CONST_ME_ICEATTACK
local disteffect = CONST_ANI_SMALLICE
local effect2 = CONST_ME_MAGIC_BLUE

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 1.4) + 8
	local max = (level / 5) + (magicLevel * 2.2) + 14
	
	local damage = math.random(min, max)	
	player:getPosition():sendMagicEffect(effect2)								
	player:addMana(damage)
					
	return -damage, -damage
end

local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, combat)
combat1:setParameter(COMBAT_PARAM_EFFECT, effect)
combat1:setParameter(COMBAT_PARAM_DISTANCEEFFECT, disteffect)
combat1:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	return combat1:execute(creature, variant)
end
