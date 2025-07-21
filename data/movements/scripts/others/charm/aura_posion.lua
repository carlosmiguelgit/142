local combat = COMBAT_EARTHDAMAGE
local effect = CONST_ME_CARNIPHILA
local text_color = TEXTCOLOR_LIGHTGREEN 
local disteffect = CONST_ANI_SMALLEARTH
local Range = 2;
local item = 14380
local mana = 50
local block = 0

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

local function sendAttack(cid)	

	local title = Tile(Position(x, y, z))
	local player = Player(cid)	
	local hit_min = player:getLevel()*0.05 + 5
	local hit_max = player:getLevel()*0.10 + 5	
	local specs = Game.getSpectators(player:getPosition(),false, false, Range, Range, Range, Range)
			
	for i = 1, #specs do
		if specs[i]:isMonster() == true then
			if isSightClear(player:getPosition(), specs[i]:getPosition(), true) then
				if specs[i]:getMaster() == nil	then
					doTargetCombatHealth(player, Creature(specs[i]), combat, -hit_min, -hit_max, effect)					
				end				
			end	
		end 
	end
end


local function Aura(cid)	
	
	local player = Player(cid)
	if Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
		player:moveSlotToBackpack(CONST_SLOT_RING)
		return false
	end
	
	--mana
	if player:getMana() >= mana then
		player:addMana(-mana)
		player:addManaSpent(mana)
		local pos = player:getPosition()
		Position(pos.x+2, pos.y+1, pos.z):sendDistanceEffect(Position(pos.x+2, pos.y-1, pos.z), disteffect)
		Position(pos.x+2, pos.y-1, pos.z):sendDistanceEffect(Position(pos.x+1, pos.y-2, pos.z), disteffect)
		Position(pos.x+1, pos.y-2, pos.z):sendDistanceEffect(Position(pos.x-1, pos.y-2, pos.z), disteffect)
		Position(pos.x-1, pos.y-2, pos.z):sendDistanceEffect(Position(pos.x-2, pos.y-1, pos.z), disteffect)
		Position(pos.x-2, pos.y-1, pos.z):sendDistanceEffect(Position(pos.x-2, pos.y+1, pos.z), disteffect)
		Position(pos.x-2, pos.y+1, pos.z):sendDistanceEffect(Position(pos.x-1, pos.y+2, pos.z), disteffect)
		Position(pos.x-1, pos.y+2, pos.z):sendDistanceEffect(Position(pos.x+1, pos.y+2, pos.z), disteffect)
		Position(pos.x+1, pos.y+2, pos.z):sendDistanceEffect(Position(pos.x+2, pos.y+1, pos.z), disteffect)		
		sendAttack(player.uid)
			
		if getPlayerSlotItem(cid, CONST_SLOT_RING).itemid == item then
			addEvent(Aura, 200, player.uid)	
		end
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)	
	end
	
	
end



--Funcion principal
function onEquip(player, item, slot, var)
	if Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
		player:moveSlotToBackpack(CONST_SLOT_RING)
		return true
	end
	
	contador = 0
	Aura(player)	
	
	return true
end




		