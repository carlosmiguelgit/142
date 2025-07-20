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

	if msgcontains(msg, 'book') then
		npcHandler:say({
				'there are a total of 7 books of infinity that were stolen from the libraries of the guardians ... {energy},',
				'Find them and I will help you create gems of unimaginable power.'
			}, cid)	
	elseif msgcontains(msg, 'energy') then
		if player:getStorageValue(InfinityQuestStorage) < 3 then
			npcHandler:say({
					'Maybe you need to talk to Iron-man in Cadiz first ...'
				}, cid)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(InfinityQuestStorage) == 3 then
			npcHandler:say({
					'Did you bring The book of infinite energy?'
				}, cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(InfinityQuestStorage) == 4 then
			npcHandler:say({
					'Do you want to enchant an infinity stone for an infinite energy stone?'
				}, cid)
			npcHandler.topic[cid] = 8
		end		
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then			
			if player:removeItem(14634, 1) then
				npcHandler:say({
				'perfect just bring me an infinity stone and I will create you the gem of infinite energy'
				}, cid)
				player:setStorageValue(InfinityQuestStorage, 4)
			else
				npcHandler:say("..you don't have the key..", cid)			
			end
		elseif npcHandler.topic[cid] == 8 then
			if player:removeItem(14412, 1) then
				npcHandler:say({
				'Take it..a Charm extra electric shot ... allows you to do an additional Energy Attack if you keep equipped'
				}, cid)
				player:addItem(14373, 1)					
				player:setStorageValue(InfinityQuestStorage, 5)
			else
				npcHandler:say("..you don't have an infinity stone..", cid)
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
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
