local effect = CONST_ME_MAGIC_GREEN
local item = 14397
local Range = 8
local mana = 8

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
	
	
	--Buscar
	local specs = Game.getSpectators(player:getPosition(),false, false, Range, Range, Range, Range)
	
	if player:getMana() >= mana then
		player:addMana(-mana)
		player:addManaSpent(mana)
		for i = 1, #specs do
			if specs[i]:isMonster() == true then		
				specs[i]:removeCondition(CONDITION_INVISIBLE)
				specs[i]:getPosition():sendMagicEffect(effect)	
			end 
		end
		
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)	
	end
	
	
	
	
	
	if getPlayerSlotItem(cid, CONST_SLOT_RING).itemid == item then
		addEvent(searchForTarget, 5000, player.uid)	
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





