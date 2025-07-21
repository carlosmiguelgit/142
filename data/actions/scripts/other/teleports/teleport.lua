local upFloorIds = {1386, 3678, 5543, 22845, 22846, 33397, 35005, 36097}
local DRAW_WELL = 1369



function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if(item.itemid == DRAW_WELL and item.actionid ~= 1000) then
		return false
	end
	
	if isInArray(upFloorIds, item.itemid) then
		fromPosition:moveUpstairs()
	else
		fromPosition.z = fromPosition.z + 1
	end
	player:teleportTo(fromPosition, false)
	return true
end
