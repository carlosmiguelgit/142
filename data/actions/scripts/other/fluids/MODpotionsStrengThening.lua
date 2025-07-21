local fluid_12801 = Condition(CONDITION_ATTRIBUTES)
fluid_12801:setParameter(CONDITION_PARAM_TICKS, 30 * 60 * 1000)
fluid_12801:setParameter(CONDITION_PARAM_SKILL_CLUB, 8)

local fluid_12802 = Condition(CONDITION_REGENERATION)
fluid_12802:setParameter(CONDITION_PARAM_TICKS, 30 * 60 * 1000)
fluid_12802:setParameter(CONDITION_PARAM_HEALTHGAIN, 25)
fluid_12802:setParameter(CONDITION_PARAM_HEALTHTICKS, 3000)
fluid_12802:setParameter(CONDITION_PARAM_MANAGAIN, 25)
fluid_12802:setParameter(CONDITION_PARAM_MANATICKS, 3000)
fluid_12802:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local fluid_12803 = Condition(CONDITION_ATTRIBUTES)
fluid_12803:setParameter(CONDITION_PARAM_TICKS, 30 * 60 * 1000)
fluid_12803:setParameter(CONDITION_PARAM_SKILL_AXE, 8)

local fluid_12804 = Condition(CONDITION_ATTRIBUTES)
fluid_12804:setParameter(CONDITION_PARAM_TICKS, 30 * 60 * 1000)
fluid_12804:setParameter(CONDITION_PARAM_SKILL_SWORD, 8)

local fluid_12805 = Condition(CONDITION_ATTRIBUTES)
fluid_12805:setParameter(CONDITION_PARAM_TICKS, 30 * 60 * 1000)
fluid_12805:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 8)

local fluid_12809 = Condition(CONDITION_ATTRIBUTES)
fluid_12809:setParameter(CONDITION_PARAM_TICKS, 30 * 60 * 1000)
fluid_12809:setParameter(CONDITION_PARAM_SKILL_SHIELD, 8)

local fluid_12811 = Condition(CONDITION_ATTRIBUTES)
fluid_12811:setParameter(CONDITION_PARAM_TICKS, 30 * 60 * 1000)
fluid_12811:setParameter(CONDITION_PARAM_SKILL_SWORD, 4)
fluid_12811:setParameter(CONDITION_PARAM_SKILL_SHIELD, 4)

local fluid_12813 = Condition(CONDITION_ATTRIBUTES)
fluid_12813:setParameter(CONDITION_PARAM_TICKS, 30 * 60 * 1000)
fluid_12813:setParameter(CONDITION_PARAM_SKILL_CLUB, 4)
fluid_12813:setParameter(CONDITION_PARAM_SKILL_SHIELD, 4)

local fluid_12816 = Condition(CONDITION_ATTRIBUTES)
fluid_12816:setParameter(CONDITION_PARAM_TICKS, 30 * 60 * 1000)
fluid_12816:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 4)
fluid_12816:setParameter(CONDITION_PARAM_SKILL_SHIELD, 4)

local fluid_12817 = Condition(CONDITION_ATTRIBUTES)
fluid_12817:setParameter(CONDITION_PARAM_TICKS, 30 * 60 * 1000)
fluid_12817:setParameter(CONDITION_PARAM_SKILL_FIST, 50)

local fluid_12820 = Condition(CONDITION_ATTRIBUTES)
fluid_12820:setParameter(CONDITION_PARAM_TICKS, 30 * 60 * 1000)
fluid_12820:setParameter(CONDITION_PARAM_SKILL_AXE, 4)
fluid_12820:setParameter(CONDITION_PARAM_SKILL_SHIELD, 4)

local fluid_12822 = Condition(CONDITION_REGENERATION)
fluid_12822:setParameter(CONDITION_PARAM_TICKS, 30 * 60 * 1000)
fluid_12822:setParameter(CONDITION_PARAM_MANAGAIN, 50)
fluid_12822:setParameter(CONDITION_PARAM_MANATICKS, 3000)
fluid_12822:setParameter(CONDITION_PARAM_BUFF_SPELL, true)


local fluid_12824 = Condition(CONDITION_REGENERATION)
fluid_12824:setParameter(CONDITION_PARAM_TICKS, 30 * 60 * 1000)
fluid_12824:setParameter(CONDITION_PARAM_HEALTHGAIN, 50)
fluid_12824:setParameter(CONDITION_PARAM_HEALTHTICKS, 3000)
fluid_12824:setParameter(CONDITION_PARAM_BUFF_SPELL, true)


local fluid_12825 = Condition(CONDITION_HASTE)
fluid_12825:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
fluid_12825:setParameter(CONDITION_PARAM_SPEED, 900)

local fluid_12827 = Condition(CONDITION_ATTRIBUTES)
fluid_12827:setParameter(CONDITION_PARAM_TICKS, 30 * 60 * 1000)
fluid_12827:setParameter(CONDITION_PARAM_SKILL_MELEE, 5)

local config = {
	[12801] = {fluid = fluid_12801, outfit = 70},
	[12802] = {fluid = fluid_12802, outfit = 9},
	[12803] = {fluid = fluid_12803, outfit = 234},
	[12804] = {fluid = fluid_12804, outfit = 2},
	[12805] = {fluid = fluid_12805, outfit = 73},
	[12809] = {fluid = fluid_12809, outfit = 306},
	[12811] = {fluid = fluid_12811, outfit = 22},
	[12813] = {fluid = fluid_12813, outfit = 69},
	[12816] = {fluid = fluid_12816, outfit = 299},
	[12817] = {fluid = fluid_12817, outfit = 57},
	[12820] = {fluid = fluid_12820, outfit = 8},
	[12822] = {fluid = fluid_12822, outfit = 320},
	[12824] = {fluid = fluid_12824, outfit = 68},
	[12825] = {fluid = fluid_12825, outfit = 294},
	[12827] = {fluid = fluid_12827, outfit = 308}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local useItem = config[item.itemid]
	if not useItem then
		return true
	end
	
	player:addCondition(useItem.fluid)
	player:setOutfit({lookType = useItem.outfit})
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	
	player:setStamina(player:getStamina() + 60)
	

	item:remove(1)
	return true
end
