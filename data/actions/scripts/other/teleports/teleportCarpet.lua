
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:teleportTo(Position(32521, 32327, 8), false)
	Position(Position(32521, 32327, 8)):sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
