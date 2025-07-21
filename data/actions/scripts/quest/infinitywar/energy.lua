local InfinityQuestStorage = 54001
local teleport = Position(34289, 31258, 9)

 
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	if player:getStorageValue(InfinityQuestStorage) == 1 then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Mission: find the key and kill Sauron")
		player:setStorageValue(InfinityQuestStorage, 2)
	end	
	
	if player:getStorageValue(InfinityQuestStorage) >= 2 then
		player:teleportTo(teleport)		
	else
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Mephisto statue...maybe in the city of Cadiz they know something about this statue.")
	end	
	
	
	return true
end




