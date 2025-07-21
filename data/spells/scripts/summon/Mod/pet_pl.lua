local soulAmount = 50
local summonName = "Leo Nidas"


function onCastSpell(cid, var)	
	player = Player(cid)
	--si ya tiene summons	
	local QPoints = 0	
	for i = 0, #Quest do			
		if player:getStorageValue(Quest[i].Store) >= Quest[i].Qvalue then
			QPoints = QPoints +Quest[i].Points
		end					
	end
	
	if QPoints < 150 then
		if table.maxn(getCreatureSummons(cid)) >= 1 then
			doPlayerSendCancel(cid, "You have reached the max amount of summons.")
			return false
		end
	else
		if table.maxn(getCreatureSummons(cid)) >= 2 then
			doPlayerSendCancel(cid, "You have reached the max amount of summons.")
			return false
		end
	end
	
	
	
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
