local combat = COMBAT_ICEDAMAGE
local effect = CONST_ME_ICEATTACK
local disteffect = CONST_ANI_SMALLICE
local effect2 = CONST_ME_MAGIC_GREEN
local text_color = TEXTCOLOR_TEAL 
local Range = 4
local MaxHit = 3
local mana = 50

function onThink(cid, interval, lastExecution)
	
	local specs = Game.getSpectators(cid:getPosition(),false, false, Range, Range, Range, Range)
	local master = getCreatureMaster(cid)	
	local player = Creature(master)
	local hit_min = player:getLevel()*0.6 + 10
	local hit_max = player:getLevel()*0.8 + 10
	local count = 0
	
	for i = 1, #specs do
		if specs[i]:isMonster() == true then
			if specs[i] ~= cid then			
				if specs[i]:getMaster() == nil	then			
					if isSightClear(cid:getPosition(), specs[i]:getPosition(), true) then				
						if 	count < MaxHit then
						
							if player:getMana() >= mana then
								player:addMana(-mana)
								player:addManaSpent(mana)
								player:getPosition():sendMagicEffect(effect2)								
								doTargetCombatHealth(player, Creature(specs[i]), combat, -hit_min, -hit_max, effect)
								cid:getPosition():sendDistanceEffect(specs[i]:getPosition(), disteffect)	
							else
								cid:getPosition():sendMagicEffect(CONST_ME_POFF)
							end
							
							count = count +1
							
						end
					end
				end
			end			
		end 
	end
		
		
		
    return true
end