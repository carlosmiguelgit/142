local combat = COMBAT_LIFEDRAIN
local effect = CONST_ME_HEARTS
local effect2 = CONST_ME_MAGIC_RED
local disteffect = CONST_ANI_SMALLHOLY
local text_color = TEXTCOLOR_RED 
local item = 14396


function round(num, idp)
	return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

function Player.moveSlotToBackpack(self, slot)
    if slot == CONST_SLOT_BACKPACK then
        return false
    end
    local item = self:getSlotItem(slot)
    if item then
        local backpack = self:getSlotItem(CONST_SLOT_BACKPACK)
        if backpack then
            return item:moveTo(backpack)
        end
    end
    return false
end


	
local function searchForTarget(cid)		
	
	--Validar
	local player = Player(cid)
	
	if player then
	
		if Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
			player:moveSlotToBackpack(CONST_SLOT_RING)
			return false
		end
		
		
		local hit_min = player:getLevel()*0.2 + 20
		local hit_max = player:getLevel()*0.4 + 20
		
		
		
		--Iniciar Rutina
		local spectator = player:getTarget()
		if not spectator then
		-- no target
		
		else
			if spectator:isCreature() then
				if spectator:isMonster() then
					if isSightClear(player:getPosition(), spectator:getPosition(), true) then				
						local damage = math.random(hit_min, hit_max)							
						player:getPosition():sendMagicEffect(effect2)								
						player:addHealth(damage)
						doTargetCombatHealth(player, Creature(spectator), combat, -damage, -damage, effect)
						spectator:getPosition():sendDistanceEffect(player:getPosition(), disteffect)		
					end	
				end
			end
		end 
		
		
		if getPlayerSlotItem(cid, CONST_SLOT_RING).itemid == item then
			addEvent(searchForTarget, 2000, player.uid)
		end
	
	else
		return true
	end
	
end

--Funcion principal
function onEquip(player, item, slot, var)
		
	if Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
		player:moveSlotToBackpack(CONST_SLOT_RING)
		return true
	end
	
	searchForTarget(player)	
	
	return true
end





