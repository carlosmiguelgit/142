local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local InfinityQuestStorage = 54001

local function releasePlayer(cid)
	if not Player(cid) then
		return
	end

	npcHandler:releaseFocus(cid)
	npcHandler:resetNpc(cid)
end

function creatureSayCallback(cid, type, msg)
	if(not(npcHandler:isFocused(cid))) then
		return false
	end
	local player = Player(cid)
	
	if msgcontains(msg, 'mission') then
		if player:getStorageValue(InfinityQuestStorage) == -1 then
			npcHandler:say({
				'In fact, there is something you can do for me...',
				'You must know that I am in search of the gems of infinity and i am sure they are hidden in this chest',
				'but I do not have the key',
				'there is an inscription that says ... owned by {Sauron}',
				'and I only know one legend that {Sauron} is only one of the minions of {Mephisto} the evil god',				
				'Will you help me?'
			}, cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(InfinityQuestStorage) == 2 then
			npcHandler:say({
				'Do yo kill {Sauron}?... and bring the key?'				
			}, cid)
			npcHandler.topic[cid] = 2	
		elseif player:getStorageValue(InfinityQuestStorage) == 3 then
		end	
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then			
			player:setStorageValue(InfinityQuestStorage, 1)
			npcHandler:say({
				'Great! Investigate the cursed castle near Cadiz and bring me the key.'
			}, cid)
			addEvent(releasePlayer, 1000, cid)
		end
		
		if npcHandler.topic[cid] == 2 then			
			if player:removeItem(14552, 1) then
				npcHandler:say({
				'Perfect I\'ll open the chest...',
				'ooo unfortunately the gem is not here, it just keeps an old book ...',				
				'take it .. maybe doctor strange knows something about this book.'
				}, cid)
				player:setStorageValue(InfinityQuestStorage, 3)
				player:addItem(14634, 1)				
				npcHandler.topic[cid] = 3
			else
				npcHandler:say("..you don't have the key..", cid)
				npcHandler.topic[cid] = 0
			end			
		end
		
	elseif msgcontains(msg, 'no') then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say('Ohh, then I need to find another adventurer who wants to earn a great reward. Bye!', cid)
			addEvent(releasePlayer, 1000, cid)
		end
	end


	

	return true
end

npcHandler:setMessage(MESSAGE_GREET, 'Greetings, |PLAYERNAME|! looking for a new adventure, eh?')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Farewell.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Farewell.')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
