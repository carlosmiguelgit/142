local effect = CONST_ME_MAGIC_GREEN
local item = 14394


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
	if Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
		player:moveSlotToBackpack(CONST_SLOT_RING)
		return false
	end
	
	
	
	--Iniciar Rutina
	local spectator = player:getTarget()
	if not spectator then
    -- no target
	
    else
		if spectator:isCreature() then
		local count = 0	
		
			
			if spectator:isMonster() then
				if isSightClear(player:getPosition(), spectator:getPosition(), true) then				
					if 	count == 0 then	
												
						spectator:getPosition():sendMagicEffect(effect)							
						doChallengeCreature(player, spectator)
						count = 1						
					end
					--fin de script					
				end		
					
			end
			
		end
	end 
	
	
	if getPlayerSlotItem(cid, CONST_SLOT_RING).itemid == item then
		addEvent(searchForTarget, 2000, player.uid)
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





