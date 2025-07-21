function onCastSpell(creature, variant)
	creature:addItem(12654, 1)
	creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	return true
end
