dofile('data/lib/QuestPoints/Quest.lua')

function onSay(player, words)
	local text = {}
	local QuestPoints = 0
	
	for i = 0, #Quest do			
		if player:getStorageValue(Quest[i].Store) >= Quest[i].Qvalue then			
			--text[#text+1] = "[OK] - " .. Quest[i].Name .. "  -  " .. Quest[i].City .. "\n"
			QuestPoints = QuestPoints +Quest[i].Points	
		else
			text[#text+1] =  "" .. Quest[i].Name .. " (Pts:" .. Quest[i].Points .. ")\n"
		end					
	end
	db.query("UPDATE `players` SET `QuestPoints` = " .. QuestPoints .. " WHERE `id` = " .. getPlayerGUID(player))	
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE,'You have the amount of ' .. QuestPoints .. ' Quest Points...'  )  

	player:showTextDialog(1949, table.concat(text), false)
	
	
	
		
		
		
		
		
							
					
	return true
end


