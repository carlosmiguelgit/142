local combat = COMBAT_PHYSICALDAMAGE
local effect = CONST_ME_HITAREA
local disteffect = CONST_ANI_WHIRLWINDSWORD
local tiempo = 200
local hits = 3
local count = 1
local Range = 3

local function reflect(cid, target, toPosi)
	local player = Player(cid)
	local spectator = Creature(target)	
	local hit_min = player:getLevel()*0.8 + 50
	local hit_max = player:getLevel()*1.5 + 50
	
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
			local specs = Game.getSpectators(spectator:getPosition(),false, false, Range, Range, Range, Range)
			local aux = 0		
			for i = 1, #specs do
				if specs[i]:isMonster() == true then		
					if aux == 0 then
						addEvent(reflect, 250, player.uid, specs[i].uid, spectator:getPosition())	
						aux = 1
					end				
				end 
			end		
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
