local weed = Condition(CONDITION_DRUNK)
weed:setParameter(CONDITION_PARAM_TICKS, 5 * 60 * 1000)


local txtmsg = {
	[1] = "hdtp this is very good",
	[2] = "where is the mary james?",
	[3] = "the cure has arrived!",
	[4] = "jupi jupi!!",
	[5] = "smells like living without fear!",
	[6] = "you do not have any more fdp?",
	[7] = "get more weed.",
	[8] = "change mpa for more weed!",
	[9] = "don't you have something stronger?"
}











function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	
	local spectators = Game.getSpectators(toPosition, false, false, 5, 5, 5, 5)
	for i = 1, #spectators do
		local spectator = spectators[i]
		spectator:getPosition():sendMagicEffect(CONST_ME_POFF)
		spectator:say(txtmsg[math.random(9)], TALKTYPE_MONSTER_SAY)		
		spectator:addCondition(weed)		
		if spectator:isPlayer() then
			spectator:sendTextMessage(MESSAGE_INFO_DESCR,'You smell a recreational substance ... you feel dizzy')   
		end		
	end
	
	
	if math.random(10) == 1 then
		Item(item.uid):remove(1)
	end
	
	return true
end
