local monsterName = "Electric Arcane"
local effect = CONST_ME_ENERGYAREA
local disteffect = CONST_ANI_ENERGY
local tiempo = 8000

local combat = Combat()
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, disteffect)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)

local function RemoveSummon(creature)
	if Creature(creature) ~= nil then
		Creature(creature):getPosition():sendMagicEffect(effect)
		Creature(creature):remove()	
	end
    return true
end



function onCastSpell(creature, variant, isHotkey)

	if table.maxn(getCreatureSummons(creature)) >= 2 then
		doPlayerSendCancel(creature, "You have reached the max amount of summons.")
		return false
	end
		
	local summon = Game.createMonster(monsterName, variant:getPosition(), true)
	creature:addSummon(summon)	
	addEvent(RemoveSummon, tiempo, summon.uid)
	return combat:execute(creature, variant)
end
