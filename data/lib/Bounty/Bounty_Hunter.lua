local config = {    
    minLevelToAddBounty = 8, -- min lvl req to place a bounty
    minLevelToBeTargeted = 8, -- min lvl req to be targeted by a bounty
    broadcastKills = true, -- Should it broadcast a message to the whole game-world when someone was killed?
    broadcastHunt = true, -- Should it broadcast a message to the whole game-world when someone is added to the bounty list?  
    currencies = {
        ['crystals'] = {minAmount = 5,     maxAmount = 1000}       --50k   / 10M    
    }
}
--------------------------------------
----------- END OF CONFIG ------------
--------------------------------------

-- HUNT! FUNCTIÓN --
function onBountyHunterSay(player, words, param)
    if player:getLevel() < config.minLevelToAddBounty then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, '[BOUNTY_HUNTER_SYSTEM] You need level ' .. config.minLevelToAddBounty .. ' to use this command.')
        return false
    end
    local t = param:split(",")
	amount = minAmount	
	for i = 0, #t do			
		if i == 1 then 	name   = t[i]	end
		if i == 2 then 	amount = t[i]	end
	end
    
	amount = amount -- in Crystals	
	local TargetID = getPlayerGUIDByName(name)		
	local PlayerID = getPlayerGUIDByName(player:getName())
	local TargetLVL = getLEVELByGUID(TargetID)		
	local PlayerName = string.upper(player:getName())
	local TargetName = string.upper(name)

	
    if not (name and amount) then        
        local text = '[BOUNTY HUNTER SYSTEM GUIDE]\n\nCommand Usage:\n!hunt playerName, amount   \n(currency in crystals(10k)) \n\nEj. HUNT! Alkurius, 1 '
        player:popupFYI(text)
        return false
    end

    if TargetLVL < config.minLevelToBeTargeted then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, '[BOUNTY_HUNTER_SYSTEM] You may only target players level ' .. config.minLevelToBeTargeted .. ' and above!')
    return false
    end
    
	if player:removeMoneyNpc(amount*10000) == false then
	   player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, '[BOUNTY_HUNTER_SYSTEM] You do not have ' .. amount .. ' (crystals). [Error: Insufficient Funds]')
       return false
    end
	
	db.query("INSERT INTO `bounty_hunter_system` VALUES (NULL," .. PlayerID .. "," .. TargetID .. ",0," .. amount .. ", 'crystals', " .. os.time() .. ", 0, 0);")
	
	if config.broadcastHunt then
      Game.broadcastMessage("[Hunt System] - " .. PlayerName .. " has put a bounty on " .. TargetName .. " for " .. amount .. " crystals.", MESSAGE_STATUS_WARNING)	  
    end

	return true	
end


-- HUNT INFO --
function onBountyHunterInfo(player, words, param)    
	local text = {}
	text[#text+1] = "BOUNTY HUNTER SYSTEM \n"
	text[#text+1] = "$      -       Lvl      -     Name\n"
	
	local resultId = db.storeQuery("SELECT * FROM `bounty_hunter_system` WHERE `killed` = 0 ORDER BY prize DESC")    
	if resultId ~= false then
		repeat
			local target = result.getDataInt(resultId, "target_id")
			local prize = result.getDataInt(resultId, "prize")
			local TargetName = getNAMEByGUID(target)
			local TargetLVL = getLEVELByGUID(target)
			
			text[#text+1] = "" ..prize .. " - " ..TargetLVL .. " - " .. TargetName .. "\n"
		until not result.next(resultId)		
		result.free(resultId)
	else
		return false	
    end	
	player:showTextDialog(1949, table.concat(text), false)	
	return true		
end

--------------------------------------
-----------     ON KILL   ------------
--------------------------------------
function onBountyHunterKill(creature, target)
    if not target:isPlayer() then
        return true
    end

    if creature:getTile():hasFlag(TILESTATE_PVPZONE) then
        return true
    end

	--Terget is Bounty?
	local TargetID = getPlayerGUIDByName(target:getName())	
	local BOUNTY = getBOUNTY(TargetID)		
	
	if BOUNTY ~= 0 then	
		local PRIZE = getBOUNTYPRIZE(BOUNTY)		
		creature:setBankBalance(creature:getBankBalance() + tonumber(PRIZE)*10000)
		
		db.query("UPDATE `bounty_hunter_system` SET `killed` = 1, `killer_id`="..creature:getGuid()..", `dateKilled` = " .. os.time() .. " WHERE `id`  = "..BOUNTY..";")		
		if config.broadcastKills then
			Game.broadcastMessage("Bounty Hunter Update: " .. creature:getName() .. " has killed " .. target:getName() .. " and earned a reward of +" .. PRIZE .. " Crystals coins!", MESSAGE_STATUS_WARNING)
		end	
	end	
end








--------------------------------------
-----------   FUNCIONES   ------------
--------------------------------------

-- GET PLAYER --
function getPlayerGUIDByName(name)
    local player = Player(name)
    if player then
        return player:getGuid()
    end

    local resultId = db.storeQuery("SELECT `id` FROM `players` WHERE `name` = " .. db.escapeString(name))
    if resultId ~= false then
        local guid = result.getNumber(resultId, "id")
        result.free(resultId)
        return guid
    end
    return 0
end

-- GET LEVEL --
function getLEVELByGUID(GUID)    
    local resultId = db.storeQuery("SELECT `level` FROM `players` WHERE `id` = " .. GUID)
    if resultId ~= false then
        local level = result.getNumber(resultId, "level")
        result.free(resultId)
        return level
    end
    return 0
end

-- GET NAME --
function getNAMEByGUID(GUID)    
    local resultId = db.storeQuery("SELECT `name` FROM `players` WHERE `id` = " .. GUID)
    if resultId ~= false then
        local name = result.getDataString(resultId, "name")
        result.free(resultId)
        return name
    end
    return 0
end


-- GET BOUNTY --
function getBOUNTY(GUID) 
    local resultId = db.storeQuery("SELECT * FROM `bounty_hunter_system` WHERE `killed` = 0 AND `target_id` = ".. GUID .. " ORDER BY prize DESC")
    if resultId ~= false then        
		local BounID = 0
        repeat
			if BounID == 0 then
				BounID = result.getNumber(resultId, "id")		
			end	
		until not result.next(resultId)		
		result.free(resultId)		
		return BounID
    end
	
    return 0	
end

-- GET PRIZE --
function getBOUNTYPRIZE(ID) 
    local resultId = db.storeQuery("SELECT `prize` FROM `bounty_hunter_system` WHERE `id` = " .. ID)
    if resultId ~= false then
        local prize = result.getNumber(resultId, "prize")
        result.free(resultId)
        return prize
    end
    return 0
end















