function onUseWeapon(player, variant)
	local magicRate = 3 -- same config.lua
	player:addManaSpent(math.ceil(100*magicRate))	
	player:addSkillTries(SKILL_SHIELD, 20*skillRate)
    return true
end
