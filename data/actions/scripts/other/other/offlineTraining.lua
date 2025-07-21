local statues = {
	[13175] = 1, --SKILL_SWORD,
	[13176] = 2, --SKILL_AXE,
	[13177] = 3, --SKILL_CLUB,
	[13178] = 4, --SKILL_DISTANCE,
	[13179] = 5, --SKILL_MAGLEVEL
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local skill = statues[item:getId()]
	player:setStorageValue(45254, skill)
	player:remove()
	return true
end
