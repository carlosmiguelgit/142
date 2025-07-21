local combat = COMBAT_ENERGYDAMAGE
local disteffect = CONST_ANI_ENERGY
local effect1 = CONST_ME_BIGCLOUDS    --fuerte
local effect2 = CONST_ME_ENERGYAREA   --medio
local effect3 = CONST_ME_ENERGYHIT    --bajo

area1 = createCombatArea({
{0, 1, 0},
{1, 3, 1},
{0, 1, 0}
})

area2 = createCombatArea({
{0, 1, 1, 1, 0},
{1, 1, 0, 1, 1},
{1, 0, 3, 0, 1},
{1, 1, 0, 1, 1},
{0, 1, 1, 1, 0}
})

area3 = createCombatArea({
{0, 0, 1, 1, 1, 0, 0},
{0, 1, 0, 0, 0, 1, 0},
{1, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 3, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 1},
{0, 1, 0, 0, 0, 1, 0},
{0, 0, 1, 1, 1, 0, 0}
})

function onGetFormulaValues1(player, level, magicLevel)
	local min = (4*level / 5) + (magicLevel * 2.2) + 5
	local max = (4*level / 5) + (magicLevel * 2.85) + 16
	return -min, -max
end

function onGetFormulaValues2(player, level, magicLevel)
	local min = (2*level / 5) + (magicLevel * 1.1) + 5
	local max = (2*level / 5) + (magicLevel * 1.2) + 16
	return -min, -max
end

function onGetFormulaValues3(player, level, magicLevel)
	local min = (1*level / 5) + (magicLevel * 0.7) + 5
	local max = (1*level / 5) + (magicLevel * 0.8) + 16
	return -min, -max
end

local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, combat)
combat1:setParameter(COMBAT_PARAM_EFFECT, effect1)
combat1:setParameter(COMBAT_PARAM_DISTANCEEFFECT, disteffect)
combat1:setArea(area1)
combat1:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues1")

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, combat)
combat2:setParameter(COMBAT_PARAM_EFFECT, effect2)
combat2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, disteffect)
combat2:setArea(area2)
combat2:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues2")


local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_TYPE, combat)
combat3:setParameter(COMBAT_PARAM_EFFECT, effect3)
combat3:setParameter(COMBAT_PARAM_DISTANCEEFFECT, disteffect)
combat3:setArea(area3)
combat3:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues3")

local function Meteoro3(creature, variant)	
	combat3:execute(creature, variant)
    return true
end

local function Meteoro2(creature, variant)	
	combat2:execute(creature, variant)
	local player = Player(creature)
	addEvent(Meteoro3, 50, player.uid, variant)	
    return true
end

local function Meteoro1(creature, variant)	
	combat1:execute(creature, variant)
	local player = Player(creature)
	addEvent(Meteoro2, 50, player.uid, variant)	
    return true
end

function onCastSpell(creature, variant, isHotkey)
	Meteoro1(creature.uid, variant)	
	return true
end
