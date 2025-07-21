function onUseWeapon(player, variant)
	local skillRate = 3 -- same config.lua
	player:addSkillTries(SKILL_AXE, 20*skillRate)
	player:addSkillTries(SKILL_SHIELD, 20*skillRate)		
    return true
end
