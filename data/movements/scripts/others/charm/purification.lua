local effect = CONST_ME_MAGIC_GREEN
local item = 14467

local conditions = {CONDITION_POISON,
                    CONDITION_FIRE,
					CONDITION_BLEEDING,
                    CONDITION_ENERGY,
                    CONDITION_PARALYZE,
                    CONDITION_DRUNK,
                    CONDITION_DROWN,
                    CONDITION_FREEZING,
                    CONDITION_DAZZLED,
                    CONDITION_CURSED
                }

	
local function searchForTarget(cid)		
	
	--Validar
	local player = Player(cid)
	
	--Iniciar Rutina
	player:getPosition():sendMagicEffect(effect)
	player:feed(1)
	
	for _, condition in ipairs(conditions) do
		if(player:getCondition(condition)) then
			player:removeCondition(condition)
		end
	end 
	
	
	if getPlayerSlotItem(cid, CONST_SLOT_RING).itemid == item then
		addEvent(searchForTarget, 2000, player.uid)
	end
	
end

--Funcion principal
function onEquip(player, item, slot, var)
		
	searchForTarget(player)	
	
	return true
end





