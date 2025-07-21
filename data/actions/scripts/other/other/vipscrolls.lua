local outfitss = {
--los outfits por defout no se pueden quitar
	--[1]={Male = 128, Female =136, Desc = "Citizen"},
	--[2]={Male = 129, Female =137, Desc = "Hunter"},
	--[3]={Male = 130, Female =138, Desc = "Mage"},
	--[4]={Male = 131, Female =139, Desc = "Knight"},
	--[5]={Male = 132, Female =140, Desc = "Noblewoman"},
	--[6]={Male = 133, Female =141, Desc = "Summoner"},
	--[7]={Male = 134, Female =142, Desc = "Warrior"},
	--[8]={Male = 143, Female =147, Desc = "Barbarian"},
	--[9]={Male = 144, Female =148, Desc = "Druid"},
	--[10]={Male = 145, Female =149, Desc = "Wizard"},
	--[11]={Male = 146, Female =150, Desc = "Oriental"},
	[1]={Male = 151, Female =155, Desc = "Pirate"},
	[2]={Male = 152, Female =156, Desc = "Assassin"},
	[3]={Male = 153, Female =157, Desc = "Beggar"},
	[4]={Male = 154, Female =158, Desc = "Shaman"},
	[5]={Male = 251, Female =252, Desc = "Norsewoman"},
	[6]={Male = 268, Female =269, Desc = "Nightmare"},
	[7]={Male = 273, Female =270, Desc = "Jester"},
	[8]={Male = 278, Female =279, Desc = "Brotherhood"},
	[9]={Male = 289, Female =288, Desc = "Demon Hunter"},
	[10]={Male = 325, Female =324, Desc = "Yalaharian"},
	[11]={Male = 328, Female =329, Desc = "Newly Wed"},
	[12]={Male = 335, Female =336, Desc = "Warmaster"},
	[13]={Male = 367, Female =366, Desc = "Wayfarer"},
	[14]={Male = 370, Female =377, Desc = "Retro Citizen"},
	[15]={Male = 371, Female =378, Desc = "Retro Hunter"},
	[16]={Male = 372, Female =379, Desc = "Retro Mage"},
	[17]={Male = 373, Female =380, Desc = "Retro Knight"},
	[18]={Male = 374, Female =381, Desc = "Retro Nobleman"},
	[19]={Male = 375, Female =382, Desc = "Retro Summoner"},
	[20]={Male = 376, Female =383, Desc = "Retro Warrior"},
	[21]={Male = 453, Female =454, Desc = "Golden"},
	[22]={Male = 413, Female =413, Desc = "Angel"},
	[23]={Male = 414, Female =414, Desc = "Angel"},
	[24]={Male = 432, Female =432, Desc = "Demon"},
	[25]={Male = 452, Female =452, Desc = "Dragon"},
	[26]={Male = 455, Female =455, Desc = "Centurion"},
	[27]={Male = 460, Female =459, Desc = "Super Link"},
	[28]={Male = 461, Female =460, Desc = "Young Link"},
	[29]={Male = 459, Female =461, Desc = "Link"},
	[30]={Male = 463, Female =468, Desc = "Shaman Mount"},
	[31]={Male = 465, Female =464, Desc = "Warrior Mount"},
	[32]={Male = 466, Female =467, Desc = "Assassin Mount"},
	[33]={Male = 473, Female =472, Desc = "Summoner Mount"},
	[34]={Male = 469, Female =469, Desc = "Blood Warior"},
	[35]={Male = 470, Female =470, Desc = "Desert Rider"},
	[36]={Male = 471, Female =471, Desc = "Demon Hunter Mount"}
}

local config = {
	[13263] = 1,  --Dragon outfit scroll
	[13264] = 2,  --Demon outfit scroll
	[13265] = 3,  --Centurion outfit scroll,
	[13266] = 4,  --TBI secret service scroll
	[13267] = 5,  --CGB secret service scroll
	[13268] = 6,  --AVIN secret service scroll
	[13269] = 7,  --Link's outfit scroll
	[13270] = 8,  --Rashid scroll
	[13271] = 9,  --Explorer society scroll
	[13272] = 10, --Thieves Guild scroll
	[13273] = 11, --Jester outfits scroll
	[13274] = 12, --Postman scroll
	[13275] = 13, --Blue Djinn scroll
	[13276] = 14, --Green Djinn scroll
	[13277] = 15, --Angel outfit scroll
	[13278] = 16, --Warrior Mount outfit scroll
	[13279] = 17, --Demon Hunter Mount outfit scroll
	[13280] = 18, --Assassin Mount outfit scroll
	[13281] = 19, --Shaman Mount outfit scroll
	[13282] = 20, --Blood Warior outfit scroll
	[13283] = 21, --Desert Rider outfit scroll
	[13284] = 22, --Summoner Mount outfit scroll
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	local scroll = config[item.itemid]
	if not scroll then
		return true
	end
	
	local current = Player(player):getOutfit().lookType		
	local current2 = 0	
	local descpri = ""	
	for i = 1, #outfitss do		
		if 	(outfitss[i].Male == current) then 
			current2 = outfitss[i].Female  
			descpri = outfitss[i].Desc 
		end
		
		if 	(outfitss[i].Female == current) then 
			current2 = outfitss[i].Male 
			descpri = outfitss[i].Desc 
		end
	end
	
	
	if scroll == 1 then		
		if descpri == "" then
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE, "I cant remove remove a valid outfit")
		else
			Player(player):removeOutfit(current)
			Player(player):removeOutfit(current2)
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE,  "You lose " .. descpri .. " Outfit.")
			--Dragon outfit scroll
			player:addOutfit(452, 0)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you with Dragon outfit.")
			Item(item.uid):remove(1)			
		end
		
	end
	
	if scroll == 2 then
		if descpri == "" then
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE, "I cant remove remove a valid outfit")
		else
			Player(player):removeOutfit(current)
			Player(player):removeOutfit(current2)
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE,  "You lose " .. descpri .. " Outfit.")
			--Demon outfit scroll
			player:addOutfit(432, 0)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you with Demon outfit.")
			Item(item.uid):remove(1)	
		end
		
	end
	
	
	if scroll == 3 then
		if descpri == "" then
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE, "I cant remove remove a valid outfit")
		else
			Player(player):removeOutfit(current)
			Player(player):removeOutfit(current2)
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE,  "You lose " .. descpri .. " Outfit.")
			--Centurion outfit
			player:addOutfit(455, 0)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you with Centurion outfit.")
			Item(item.uid):remove(1)				
		end
		
	end
	
	
	if scroll == 4 then
		--TBI secret service scroll		
		player:setStorageValue(Storage.secretService.TBIMission01, 3)
		player:setStorageValue(Storage.secretService.TBIMission02, 2)
		player:setStorageValue(Storage.secretService.TBIMission03, 3)
		player:setStorageValue(Storage.secretService.TBIMission04, 2)
		player:setStorageValue(Storage.secretService.TBIMission05, 3)
		player:setStorageValue(Storage.secretService.TBIMission06, 3)
		player:setStorageValue(Storage.secretService.Mission07, 2)
		player:setStorageValue(Storage.secretService.Quest, 15)
		player:addItem(7960, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you.. now you has a title of Top Agent.")
		Item(item.uid):remove(1)
	end
	
	if scroll == 5 then
		--CGB secret service scroll
		player:setStorageValue(Storage.secretService.CGBMission01, 2)
		player:setStorageValue(Storage.secretService.CGBMission02, 2)
		player:setStorageValue(Storage.secretService.CGBMission03, 3)
		player:setStorageValue(Storage.secretService.CGBMission04, 2)
		player:setStorageValue(Storage.secretService.CGBMission05, 2)
		player:setStorageValue(Storage.secretService.CGBMission06, 2)
		player:setStorageValue(Storage.secretService.Mission07, 2)
		player:setStorageValue(Storage.secretService.Quest, 15)
		player:addItem(7961, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you.. now you has a title of Top Agent.")
		Item(item.uid):remove(1)
	end
	
	if scroll == 6 then
		--AVIN secret service scroll
		player:setStorageValue(Storage.secretService.AVINMission01, 4)
		player:setStorageValue(Storage.secretService.AVINMission02, 2)
		player:setStorageValue(Storage.secretService.AVINMission03, 4)
		player:setStorageValue(Storage.secretService.AVINMission04, 3)
		player:setStorageValue(Storage.secretService.AVINMission05, 2)
		player:setStorageValue(Storage.secretService.AVINMission06, 3)
		player:setStorageValue(Storage.secretService.Mission07, 2)
		player:setStorageValue(Storage.secretService.Quest, 15)
		player:addItem(7962, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you.. now you has a title of Top Agent.")
		Item(item.uid):remove(1)
	end
	
	
	if scroll == 7 then
		if descpri == "" then
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE, "I cant remove remove a valid outfit")
		else
			Player(player):removeOutfit(current)
			Player(player):removeOutfit(current2)
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE,  "You lose " .. descpri .. " Outfit.")	
			--Link's outfit scroll
			chanselink = math.random(3)		
			if chanselink == 1 then player:addOutfit(459, 0) end
			if chanselink == 2 then player:addOutfit(460, 0) end
			if chanselink == 3 then player:addOutfit(461, 0) end	
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you with Link outfit.")
			Item(item.uid):remove(1)			
		end
		
	end
	
	if scroll == 8 then
		--Rashid scroll
		player:setStorageValue(Storage.TravellingTrader.Mission01, 2)
		player:setStorageValue(Storage.TravellingTrader.Mission02, 5)
		player:setStorageValue(Storage.TravellingTrader.Mission03, 3)
		player:setStorageValue(Storage.TravellingTrader.Mission04, 3)
		player:setStorageValue(Storage.TravellingTrader.Mission05, 3)
		player:setStorageValue(Storage.TravellingTrader.Mission06, 2)
		player:setStorageValue(Storage.TravellingTrader.Mission07, 1)
		player:addAchievement('Recognised Trader')
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you.. now you has a title of Recognised Trader.")
		Item(item.uid):remove(1)
	end
	
	if scroll == 9 then
		--Explorer society scroll
		player:setStorageValue(Storage.ExplorerSociety.bonelordsDoor, 1)
		player:setStorageValue(Storage.ExplorerSociety.edronDoor, 1)
		player:setStorageValue(Storage.ExplorerSociety.giantsmithhammer, 1)
		player:setStorageValue(Storage.ExplorerSociety.orcDoor, 1)
		player:setStorageValue(Storage.ExplorerSociety.skullofratha, 1)
		player:setStorageValue(Storage.ExplorerSociety.SpectralStone, 2)
		player:setStorageValue(Storage.ExplorerSociety.TheAstralPortals, 56)
		player:setStorageValue(Storage.ExplorerSociety.TheBonelordSecret, 32)
		player:setStorageValue(Storage.ExplorerSociety.TheButterflyHunt, 16)
		player:setStorageValue(Storage.ExplorerSociety.TheEctoplasm, 47)
		player:setStorageValue(Storage.ExplorerSociety.TheElvenPoetry, 38)
		player:setStorageValue(Storage.ExplorerSociety.TheIceDelivery, 7)
		player:setStorageValue(Storage.ExplorerSociety.TheLizardUrn, 29)
		player:setStorageValue(Storage.ExplorerSociety.TheMemoryStone, 41)
		player:setStorageValue(Storage.ExplorerSociety.ThePlantCollection, 26)
		player:setStorageValue(Storage.ExplorerSociety.TheRuneWritings, 44)
		player:setStorageValue(Storage.ExplorerSociety.TheSpectralDress, 48)
		player:setStorageValue(Storage.ExplorerSociety.TheSpectralStone, 53)
		player:setStorageValue(Storage.ExplorerSociety.urnDoor, 1)
		player:setStorageValue(Storage.ExplorerSociety.JoiningtheExplorers, 4)
		player:setStorageValue(Storage.ExplorerSociety.TheOrcPowder, 35)
		player:setStorageValue(Storage.ExplorerSociety.TheIceMusic, 62)
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 62)		
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you.. now you has a the highest ranks of the Explorer Society.")
		Item(item.uid):remove(1)
	end
	
	if scroll == 10 then
		--Thieves Guild scroll
		player:setStorageValue(Storage.thievesGuild.Door, 1)
		player:setStorageValue(Storage.thievesGuild.Mission01, 2)
		player:setStorageValue(Storage.thievesGuild.Mission02, 3)
		player:setStorageValue(Storage.thievesGuild.Mission03, 3)
		player:setStorageValue(Storage.thievesGuild.Mission04, 8)
		player:setStorageValue(Storage.thievesGuild.Mission05, 2)
		player:setStorageValue(Storage.thievesGuild.Mission06, 4)
		player:setStorageValue(Storage.thievesGuild.Mission07, 2)
		player:setStorageValue(Storage.thievesGuild.Mission08, 3)		
		player:setStorageValue(Storage.thievesGuild.Quest, 9)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you.. now you part of the Thieves Guild and have the hability to trade with Black Bert.")
		Item(item.uid):remove(1)
	end
	
	
	if scroll == 11 then		
		--Jester outfits scroll
		player:setStorageValue(Storage.WhatAFoolishQuest.Mission1, 2)
		player:setStorageValue(Storage.WhatAFoolishQuest.Mission2, 2)
		player:setStorageValue(Storage.WhatAFoolishQuest.Mission3, 2)
		player:setStorageValue(Storage.WhatAFoolishQuest.Mission4, 3)
		player:setStorageValue(Storage.WhatAFoolishQuest.Mission5, 3)
		player:setStorageValue(Storage.WhatAFoolishQuest.Mission6, 5)
		player:setStorageValue(Storage.WhatAFoolishQuest.Mission7, 2)
		player:setStorageValue(Storage.WhatAFoolishQuest.Mission8, 5)
		player:setStorageValue(Storage.WhatAFoolishQuest.Mission9, 5)
		player:setStorageValue(Storage.WhatAFoolishQuest.Mission10, 2)
		player:setStorageValue(Storage.WhatAFoolishQuest.Mission11, 4)
		player:setStorageValue(Storage.WhatAFoolishQuest.JesterOutfit, 4)
		player:setStorageValue(Storage.WhatAFoolishQuest.LostDisguise, 1)
		player:setStorageValue(Storage.WhatAFoolishQuest.QueenEloiseCatDoor, 1)
		player:setStorageValue(Storage.WhatAFoolishQuest.TriangleTowerDoor, 1)
		player:setStorageValue(Storage.WhatAFoolishQuest.Questline, 36)		
		player:addAchievement('Perfect Fool')
		player:addItem(7957) 
		player:addItem(7958,1)
		player:addOutfit(270)
		player:addOutfit(273)
		player:addOutfitAddon(270, 3)
		player:addOutfitAddon(273, 3)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you.. now you become a complete fool.")
		Item(item.uid):remove(1)
	end
	
	if scroll == 12 then
		--Postman scroll
		player:setStorageValue(Storage.postman.Mission01, 6)
		player:setStorageValue(Storage.postman.Mission02, 3)
		player:setStorageValue(Storage.postman.Mission03, 3)
		player:setStorageValue(Storage.postman.Mission04, 2)
		player:setStorageValue(Storage.postman.Mission05, 4)
		player:setStorageValue(Storage.postman.Mission06, 13)
		player:setStorageValue(Storage.postman.Mission07, 8)
		player:setStorageValue(Storage.postman.Mission08, 3)
		player:setStorageValue(Storage.postman.Mission09, 4)
		player:setStorageValue(Storage.postman.Mission10, 3)
		player:setStorageValue(Storage.postman.Rank, 5)
		player:setStorageValue(Storage.postman.Door, 1)
		player:addItem(2665, 1)
		player:addItem(2078, 1)
		player:addAchievement('Archpostman')		
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you.. now you become archpostman.")
		Item(item.uid):remove(1)
	end
	
	if scroll == 13 then
		--Blue Djinn scroll
		--Marid Faction (Blue Djinn)
		player:setStorageValue(Storage.DjinnWar.MaridFaction.Mission01, 2)
		player:setStorageValue(Storage.DjinnWar.MaridFaction.Mission02, 2)		
		player:setStorageValue(Storage.DjinnWar.MaridFaction.Mission03, 3)
		player:setStorageValue(Storage.DjinnWar.MaridFaction.DoorToEfreetTerritory, 1)
		player:setStorageValue(Storage.OrcKingGreeting, 1)
		player:setStorageValue(Storage.DjinnWar.MaridFaction.DoorToLamp, 1)
		player:setStorageValue(Storage.DjinnWar.ReceivedLamp, 1)
		player:addAchievement('Marid Ally')		
		player:addItem(2146, 3)
		player:addItem(2356, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you.. now you are one Marid Ally.")
		Item(item.uid):remove(1)
	end
	
	if scroll == 14 then
		--Green Djinn scroll
		--Efreet Faction (Green Djinn)
		player:setStorageValue(Storage.DjinnWar.Faction.Efreet, 1)
		player:setStorageValue(Storage.DjinnWar.Faction.Greeting, 0)
		player:setStorageValue(Storage.DjinnWar.EfreetFaction.Start, 1)
		player:setStorageValue(Storage.DjinnWar.EfreetFaction.Mission01, 3)		
		player:setStorageValue(Storage.DjinnWar.EfreetFaction.Mission02, 3)
		player:setStorageValue(Storage.DjinnWar.EfreetFaction.Mission03, 3)
		player:setStorageValue(Storage.DjinnWar.EfreetFaction.DoorToMaridTerritory, 1)
		player:addAchievement('Efreet Ally')
		player:setStorageValue(Storage.DjinnWar.EfreetFaction.DoorToLamp, 1)
		player:setStorageValue(Storage.DjinnWar.ReceivedLamp, 1)
		player:addItem(2356, 1)		
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you.. now you are one Efreet Ally.")
		Item(item.uid):remove(1)
	end
	
	if scroll == 15 then
		if descpri == "" then
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE, "I cant remove remove a valid outfit")
		else
			Player(player):removeOutfit(current)
			Player(player):removeOutfit(current2)
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE,  "You lose " .. descpri .. " Outfit.")	
			--Angel outfit scroll
			chanseangel = math.random(2)		
			if chanseangel == 1 then player:addOutfit(413, 0) end
			if chanseangel == 2 then player:addOutfit(414, 0) end		
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you with Angel outfit.")
			Item(item.uid):remove(1)			
		end
		
	end
	
	if scroll == 16 then
		if descpri == "" then
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE, "I cant remove remove a valid outfit")
		else
			Player(player):removeOutfit(current)
			Player(player):removeOutfit(current2)
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE,  "You lose " .. descpri .. " Outfit.")
			--Warrior Mount outfit scroll
			player:addOutfit(464, 0)
			player:addOutfit(465, 0)
			player:addOutfitAddon(464, 3)
			player:addOutfitAddon(465, 3)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you with Warrior Mount outfit.")
			Item(item.uid):remove(1)			
		end		
	end
	
	
	if scroll == 17 then
		if descpri == "" then
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE, "I cant remove remove a valid outfit")
		else
			Player(player):removeOutfit(current)
			Player(player):removeOutfit(current2)
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE,  "You lose " .. descpri .. " Outfit.")
			--Demon Hunter Mount outfit scroll
			player:addOutfit(471, 0)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you with Demon Hunter Mount outfit.")
			Item(item.uid):remove(1)				
		end		
	end
	
	if scroll == 18 then
		if descpri == "" then
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE, "I cant remove remove a valid outfit")
		else
			Player(player):removeOutfit(current)
			Player(player):removeOutfit(current2)
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE,  "You lose " .. descpri .. " Outfit.")	
			--Assassin Mount outfit scroll
			player:addOutfit(466, 0)
			player:addOutfit(467, 0)
			player:addOutfitAddon(466, 3)
			player:addOutfitAddon(467, 3)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you with Assassin Mount outfit.")	
			Item(item.uid):remove(1)			
		end		
	end
		
	
	if scroll == 19 then
		if descpri == "" then
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE, "I cant remove remove a valid outfit")
		else
			Player(player):removeOutfit(current)
			Player(player):removeOutfit(current2)
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE,  "You lose " .. descpri .. " Outfit.")
			--Shaman Mount outfit scroll
			player:addOutfit(463, 0)
			player:addOutfit(468, 0)
			player:addOutfitAddon(463, 3)
			player:addOutfitAddon(468, 3)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you with Shaman Mount outfit.")	
			Item(item.uid):remove(1)	
		end		
	end
	
	
	if scroll == 20 then
		if descpri == "" then
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE, "I cant remove remove a valid outfit")
		else
			Player(player):removeOutfit(current)
			Player(player):removeOutfit(current2)
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE,  "You lose " .. descpri .. " Outfit.")	
			--Blood Warior outfit scroll
			player:addOutfit(469, 0)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you with Blood Warior outfit.")
			Item(item.uid):remove(1)				
		end		
	end
	
	if scroll == 21 then
		if descpri == "" then
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE, "I cant remove remove a valid outfit")
		else
			Player(player):removeOutfit(current)
			Player(player):removeOutfit(current2)
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE,  "You lose " .. descpri .. " Outfit.")
			--Desert Rider outfit scroll
			player:addOutfit(470, 0)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you with Desert Rider outfit.")	
			Item(item.uid):remove(1)
		end		
	end
	
	
	if scroll == 22 then
		if descpri == "" then
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE, "I cant remove remove a valid outfit")
		else
			Player(player):removeOutfit(current)
			Player(player):removeOutfit(current2)
			Player(player):sendTextMessage(MESSAGE_EVENT_ADVANCE,  "You lose " .. descpri .. " Outfit.")
			--Summoner Mount outfit scroll
			player:addOutfit(472, 0)
			player:addOutfit(473, 0)
			player:addOutfitAddon(472, 3)
			player:addOutfitAddon(473, 3)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Gods blessed you with Summoner Mount outfit.")
			Item(item.uid):remove(1)			
		end
		
	end
	
	
	return true
end
	