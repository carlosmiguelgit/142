local effect = CONST_ME_MAGIC_GREEN
local item = 14398
local mana = 20

local function searchForTarget(cid)		
	
	--Validar
	local player = Player(cid)
	
	--Aumentar velocidad
	if player:getMana() >= mana then
		player:addMana(-mana)
		player:addManaSpent(mana)
		local speed = player:getVocation():getAttackSpeed()
		player:setAttackSpeed(speed - 500)
		player:getPosition():sendMagicEffect(effect)	
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)	
	end
	
	
	
	if getPlayerSlotItem(cid, CONST_SLOT_RING).itemid == item then
		addEvent(searchForTarget, 10000, player.uid)
	else
		player:setAttackSpeed(player:getVocation():getAttackSpeed())
	end
	
end

--Funcion principal
function onEquip(player, item, slot, var)
		
	searchForTarget(player)	
	
	return true
end





