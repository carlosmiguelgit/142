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
	[13031] = {Male = 370,  Female = 377, Addon = 0, description = "Retro Citizen Outfit"},
	[13032] = {Male = 371,  Female = 378, Addon = 0, description = "Retro Hunter Outfit"},
	[13033] = {Male = 372,  Female = 379, Addon = 0, description = "Retro Mage Outfit"},
	[13034] = {Male = 373,  Female = 380, Addon = 0, description = "Retro Knight Outfit"},
	[13035] = {Male = 374,  Female = 381, Addon = 0, description = "Retro Nobleman Outfit"},
	[13036] = {Male = 375,  Female = 382, Addon = 0, description = "Retro Summoner Outfit"},
	[13037] = {Male = 376,  Female = 383, Addon = 0, description = "Retro Warrior Outfit"},
	[13038] = {Male = 385,  Female = 385, Addon = 1, description = "Golden Outfit"}

}

function onUse(cid, item, fromPosition, itemEx, toPosition)	
	local Outfits = config[item.itemid]
	if not Outfits then
		return true
	end
		
	local current = Player(cid):getOutfit().lookType
		
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
	
	if descpri == "" then
		Player(cid):sendTextMessage(MESSAGE_EVENT_ADVANCE, "I cant remove remove a valid outfit")
	else
		Player(cid):removeOutfit(current)
		Player(cid):removeOutfit(current2)
		Player(cid):sendTextMessage(MESSAGE_EVENT_ADVANCE,  "You lose " .. descpri .. " Outfit.")
		
		Player(cid):sendTextMessage(MESSAGE_EVENT_ADVANCE, "You got " .. Outfits.description)
		Player(cid):addOutfit(Outfits.Female, 0)
		Player(cid):addOutfit(Outfits.Male, 0)
		
		if Outfits.Addon == 1 then
			Player(cid):addOutfitAddon(Outfits.Female, 3)
			Player(cid):addOutfitAddon(Outfits.Male, 3)
		end		
		
		Item(item.uid):remove(1)
		fromPosition:sendMagicEffect(CONST_ME_GIFT_WRAPS)		
		end
	
	
	return true
end