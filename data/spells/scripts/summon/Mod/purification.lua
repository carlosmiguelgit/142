local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)


local conditions = {CONDITION_POISON,
                    CONDITION_FIRE,
					CONDITION_BLEEDING,
                    CONDITION_ENERGY,
                    CONDITION_PARALYZE,
                    CONDITION_DRUNK,
                    CONDITION_DROWN,
                    CONDITION_FREEZING,
                    CONDITION_DAZZLED,
                    CONDITION_CURSED
                }
				


function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 6.3) + 145
	local max = (level / 5) + (maglevel * 14.4) + 190
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, var)

		player = Player(creature)
		for _, condition in ipairs(conditions) do
            if(player:getCondition(condition)) then
                player:removeCondition(condition)
            end
        end 

	return combat:execute(creature, var)
end
