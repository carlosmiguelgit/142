
function onUse(player, item, fromPosition, target, toPosition, isHotkey)	
	player:addPremiumDays(30)
	Item(item.uid):remove(1)
	player:say("+30 Premium Days.", TALKTYPE_MONSTER_SAY)
	fromPosition:sendMagicEffect(CONST_ME_GIFT_WRAPS)
	return true
end
