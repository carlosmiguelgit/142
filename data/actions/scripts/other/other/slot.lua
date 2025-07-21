local descartar = {
	[6132] = 0,  --pair of soft boots
	[2640] = 0   --pair of soft boots
}


function onUse(player, item, fromPosition, itemEx, toPosition)

	local filtro = descartar[itemEx.itemid]
	if filtro then
		Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE, "This object cannot be enchanted.")
		return true
	end
	
	return stat_onUse(player, item, fromPosition, itemEx, toPosition)


end