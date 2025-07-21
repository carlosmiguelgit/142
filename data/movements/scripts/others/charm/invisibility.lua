local effect = CONST_ME_MAGIC_GREEN
local item = 14399
local duracion = 3000
local mana = 500


local function Visible(cid)
	local player = Player(cid)	
	player:setGhostMode(false)
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
	
	if getPlayerSlotItem(cid, CONST_SLOT_RING).itemid == item then
		player:moveSlotToBackpack(CONST_SLOT_RING)
	else
		addEvent(Visible, duracion, player.uid)
	end
	
	if player:getMana() >= mana then
		player:addMana(-mana)
		player:addManaSpent(mana)
		player:getPosition():sendMagicEffect(effect)	
		player:setGhostMode(true)
		addEvent(Visible, duracion, player.uid)
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)	
	end
	
	
	
	
	
	
end

--Funcion principal
function onEquip(player, item, slot, var)
	
	
	
	searchForTarget(player)	
	
	return true
end





