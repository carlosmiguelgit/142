local effect = CONST_ME_MAGIC_GREEN
local item = 14468


local function searchForTarget(cid)		
	
	--Validar
	local player = Player(cid)
	
	--Aumentar velocidad	
    player:addSoul(1)	
	player:setStamina(player:getStamina() + 1)
	player:getPosition():sendMagicEffect(effect)	
	
	if getPlayerSlotItem(cid, CONST_SLOT_RING).itemid == item then
		addEvent(searchForTarget, 10000, player.uid)	
	end
	
end

--Funcion principal
function onEquip(player, item, slot, var)
		
	searchForTarget(player)	
	
	return true
end





