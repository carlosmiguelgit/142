
local config = {

	[13067] = { 		
		{12802,1}, --glass of goo
		{12803,1}, --essence of wishful thinking
		{12804,1}, --small crystal bell
		{12805,1}, --vial of liquid silver
		{12806,30}, --ultimate mana potion
		{12807,30}, --ultimate spirit potion
		{12808,30}, --supreme health potion
		{12809,30}, --phial of fresh water
		{12810,1}, --dragon blood
		{12811,1}, --pink fluid
		{12812,1}, --gleaming starlight vial
		{12813,1}, --sample of monster blood
		{12814,1}, --perfume flacon
		{12815,1}, --bottle of sun fruit juice
		{12816,1}, --flask with snake poison
		{12817,1}, --vial of cactus milk
		{12818,1}, --box with waterproof balm
		{12819,1}, --vial with a skull cork
		{12820,1}, --ensouled essence
		{12821,1}, --love elixir
		{12822,1}, --vial of hatred
		{12823,1}, --megalomania's essence
		{12824,1}, --katex' blood
		{12825,1}, --spicy green jalapeno sauce
		{12826,1}, --goblet of gloom
		{12827,1}, --fitzwilliam's special reserve
		{12961,1}, --deepling backpack
		{12962,1}, --buggy backpack
		{12963,1}, --anniversary backpack
		{12964,1}, --mushroom backpack
		{12965,1}, --crystal backpack
		{12966,1}, --cake backpack
		{12967,1}, --feedbag
		{12968,1}, --glooth backpack
		{12969,1}, --shopping bag
		{12970,1}, --war backpack
		{12971,1}, --wolf backpack
		{12972,1}, --energetic backpack
		{12973,1}, --gold pouch
		{12974,1}, --pillow backpack
		{12975,1}, --birthday backpack
		{12976,1}, --blossom bag
		{12977,1}, --festive backpack
		{12978,1}, --winged backpack
		{12979,1}, --ghost backpack
		{12980,1}, --bag you desire
		{13029,1}, --premium scroll
		{13030,1}, --receipt (success)
		{13031,1}, --Retro Citizen
		{13032,1}, --Retro Hunter
		{13033,1}, --Retro Mage
		{13034,1}, --Retro Knight
		{13035,1}, --Retro Nobleman
		{13036,1}, --Retro Summoner
		{13037,1}, --Retro Warrior
		{13038,1}, --Golden Outfit
		{13039,1}, --imbuing crystal
		{13040,1}, --blue crystal (item)
		{13041,1}, --violet crystal
		{13042,1}, --green crystal
		{13043,1}, --hexagonal ruby
		{13044,1}, --blue memory shard
		{13045,1}, --green crystal shard
		{13046,1}, --violet crystal shard
		{13047,1}, --blue marble
		{13048,1}, --blue marble (ii)
		{13049,1}, --blue marble (iii)
		{13050,1}, --onyx marble
		{13051,1}, --versicoloured marble
		{13052,1}, --turqoise marble
		{13053,1}, --Golden Marble
		{13054,1}, --orange marble
		{13055,1}, --psychedelic marble
		{13056,1}, --white gem
		{13057,1}, --giant ruby
		{13058,1}, --giant emerald
		{13059,1}, --giant sapphire
		{13060,1}, --giant amethyst
		{13061,1}, --giant topaz
		{13062,10}, --luminescent crystal
		{13063,10}, --diamond
		{13069,1}, --iron token
		{13071,1}, --copper token
		{13072,1}, --platinum token
		{13074,5}, --skull token		
		{13095,1}, --training sword
		{13096,1}, --training axe
		{13097,1}, --training club
		{13098,1}, --training bow
		{13099,1}, --training rod
		{13100,1}, --training wand 
		{13101,1}, --tarsal arrow
		{13102,300}, --vortex bolt
		{13103,300}, --prismatic bolt
		{13104,300}, --drill bolt
		{13105,300}, --envenomed arrow
		{13106,300}, --diamond arrow
		{13107,300}, --spectral bolt
		{13108,300}, --royal star
		{13109,1}, --lisa's doll
		{13110,1}, --ferumbras puppet
		{13111,1}, --plushie of gaz'haragoth
		{13112,1}, --plushie of devovorga
		{13113,1}, --plushie of king tibianus
		{13114,1}, --plushie of sea serpent
		{13115,1}, --plushie of hive
		{13116,1}, --demon doll
		{13117,1}, --badbara
		{13118,1}, --tearesa
		{13119,1}, --cryana
		{13129,1}, --backpack for keys
		{13130,1}, --backpack for uh
		{13131,1}, --backpack for sd
		{13132,1}, --backpack for hmm
		{13133,1}, --backpack for manas fluid
		{13134,1}, --backpack for magic wall
		{13135,1}, --backpack for gfb
		{13136,1}, --backpack for destroy field
		{13137,1}, --backpack for paralyse rune
		{13139,20}, --ultimate uh rune
		{13140,20}, --ultimate sd rune
		{13141,20}, --ultimate paralyse rune
		{13142,20}, --ultimate magic wall rune
		{13143,20}, --ultimate gfb rune
		{13144,20}, --ultimate hmm rune
		{13145,20}, --ultimate explotion rune
		{13174,300} --crystalline arrow
	}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local present = config[item.itemid]
	if not present then
		return false
	end

	local count = 1
	local gift = present[math.random(1, #present)]
	if type(gift) == "table" then
		count = gift[2]
		gift = gift[1]
	end

	
	Player(cid):addItem(gift, count)
	Item(item.uid):remove(1)
	
	
	
	
	fromPosition:sendMagicEffect(CONST_ME_GIFT_WRAPS)
	return true
end
