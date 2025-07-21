local combat = COMBAT_ICEDAMAGE
local effect = CONST_ME_ICEATTACK
local disteffect = CONST_ANI_SMALLICE
local text_color = TEXTCOLOR_TEAL 
local item = 14377
local mana = 20

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
	
	if player == nil then
		return false
	end
	
	
	if Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
		player:moveSlotToBackpack(CONST_SLOT_RING)
		return false
	end
	
	
	local hit_min = player:getLevel()*0.8 + 50
	local hit_max = player:getLevel()*1.5 + 50
	
	
	
	--Iniciar Rutina
	local spectator = player:getTarget()
	if not spectator then
    -- no target
	
    else
		if spectator:isCreature() then		
			if spectator:isMonster() then
				if isSightClear(player:getPosition(), spectator:getPosition(), true) then
					if player:getMana() >= mana then
						player:addMana(-mana)
						player:addManaSpent(mana)														
						doTargetCombatHealth(player, Creature(spectator), combat, -hit_min, -hit_max, effect)
						player:getPosition():sendDistanceEffect(spectator:getPosition(), disteffect)	
					else
						player:getPosition():sendMagicEffect(CONST_ME_POFF)
					end		
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




