function onSay(player, words)
	if player:removeMoneyNpc(50000) == false then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE,'You dont have 50k'  )  
		return false
    end
				
	doPlayerAddItem(player,2173,1)				
					
	return true
end