function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	--Rookgaard	
	player:setStorageValue(50094, 1) 
	player:setStorageValue(64130, 1)
	player:setStorageValue(64114, 1)
	player:setStorageValue(64118, 1)
	player:setStorageValue(64119, 1)
	player:setStorageValue(64122, 1)
	player:setStorageValue(64124, 1)
	player:setStorageValue(64111, 1)
	player:setStorageValue(64125, 1)
	player:setStorageValue(64120, 1)
	player:setStorageValue(64117, 1)
	player:setStorageValue(64128, 1)
	player:setStorageValue(63002, 1)
	player:setStorageValue(63001, 1)
	player:setStorageValue(64100, 1)
	player:setStorageValue(Storage.QuestChests.BananaPalm, 1)
	player:setStorageValue(Storage.QuestChests.DoubletQuest, 1)
	player:setStorageValue(Storage.QuestChests.HoneyFlower, 1)
	
	--Ab'Dendriel
	player:setStorageValue(50052, 1) 
	player:setStorageValue(9903, 1) 
	
	--Ankrahmun	
	player:setStorageValue(9195, 1) 
	
	--Carlin
	player:setStorageValue(2282, 1) 
		
	--Desert
	player:setStorageValue(19912, 1) 
	
	--Kazordoon	
	player:setStorageValue(19912, 1) 
	player:setStorageValue(50075, 1) 
	player:setStorageValue(21996, 1) 
	player:setStorageValue(50046, 1) 
	player:setStorageValue(1325, 1) 
	
	--Port Hope
	player:setStorageValue(2280, 1) 
	
	--Thais
	player:setStorageValue(9217, 1) 
	player:setStorageValue(50045, 1) 
	player:setStorageValue(19909, 1) 
	player:setStorageValue(50076, 1) 
	player:setStorageValue(1246, 1) 
	
	--Venore
	player:setStorageValue(50048, 1)	
	
	player:say('receive the curse of the god ... your quest tracking has been updated use the command {! quest} to know your progress.', TALKTYPE_MONSTER_SAY)
	
	item:remove(1)
	return true
end
	
	
	
	