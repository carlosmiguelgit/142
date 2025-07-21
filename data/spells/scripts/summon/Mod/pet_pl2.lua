local soulAmount = 1
local summonName = "Emberwing"


function onCastSpell(cid, var)	
	--si ya tiene summons	
	if table.maxn(getCreatureSummons(cid)) >= 1 then
		doPlayerSendCancel(cid, "You have reached the max amount of summons.")
		return false
	end
	
	
	player = Player(cid)
	local PlayerSoul = player:getSoul()	
		
	if PlayerSoul >= soulAmount then
		player:addSoul(-soulAmount)
	
		local position = cid:getPosition()	
		local summon = Game.createMonster(summonName, position, true)		
		if not summon then
			cid:sendCancelMessage(RETURNVALUE_NOTENOUGHROOM)
			position:sendMagicEffect(CONST_ME_POFF)
			return false
		end		
		cid:addSummon(summon)
		cid:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		summon:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else	
		doPlayerSendCancel(cid, "The invoke faill you need more soul")	
	end
	
	return true
end
