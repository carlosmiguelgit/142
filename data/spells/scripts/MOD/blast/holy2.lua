local combat = COMBAT_HOLYDAMAGE
local effect = CONST_ME_HOLYDAMAGE
local disteffect = CONST_ANI_HOLY
local tiempo = 100
local hits = 10
local count = 1


local function reflect(cid, target, toPosi)
	local player = Player(cid)
	local spectator = Creature(target)	
	local hit_min = player:getLevel()*0.15 + 5
	local hit_max = player:getLevel()*0.2 + 8
	
	if spectator ~= nil then	
		if spectator:isCreature() then
			if spectator:isMonster() then
				if isSightClear(player:getPosition(), spectator:getPosition(), true) then
					doTargetCombatHealth(player, spectator, combat, -hit_min/count, -hit_max/count, effect)
					toPosi:sendDistanceEffect(spectator:getPosition(), disteffect)
					count = count +1				
				end	
			end
		end	
	
		if(hits >= count) then
			addEvent(reflect, tiempo, player.uid, spectator.uid, player:getPosition())	
		end
	end	
	
    return true
end


function onCastSpell(creature, variant, isHotkey)
	count = 1
	
	local player = Player(creature)
	local target = Creature(variant.number)	
	reflect(player.uid, target.uid, player:getPosition())
	
	return true
end
