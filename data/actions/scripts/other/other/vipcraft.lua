local config = {
	[45201] = {item = 12663, coins = 20}, 
	[45202] = {item = 12664, coins = 80}, 
	[45203] = {item = 12665, coins = 150}, 
	[45204] = {item = 12667, coins = 200}, 
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)	
	local player = Player(player)	
	if player:removeItem(13191, config[item.actionid].coins) then
		player:addItem(config[item.actionid].item, 1)	
		player:getPosition():sendMagicEffect(12)
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
    
    return true
	
	
end
