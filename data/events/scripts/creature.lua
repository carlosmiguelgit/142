-- Scripted by Alkurius --

-- Speed
local speed10 = Condition(CONDITION_HASTE)
speed10:setParameter(CONDITION_PARAM_TICKS, -1)
speed10:setParameter(CONDITION_PARAM_SPEED, 10)
speed10:setParameter(CONDITION_PARAM_SUBID, 100)

local speed30 = Condition(CONDITION_HASTE)
speed30:setParameter(CONDITION_PARAM_TICKS, -1)
speed30:setParameter(CONDITION_PARAM_SPEED, 30)
speed10:setParameter(CONDITION_PARAM_SUBID, 100)

local speed60 = Condition(CONDITION_HASTE)
speed60:setParameter(CONDITION_PARAM_TICKS, -1)
speed60:setParameter(CONDITION_PARAM_SPEED, 60)
speed10:setParameter(CONDITION_PARAM_SUBID, 100)


-- HP
local hp200 = Condition(CONDITION_ATTRIBUTES)
hp200:setParameter(CONDITION_PARAM_TICKS, -1)
hp200:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTS, 200)
hp200:setParameter(CONDITION_PARAM_SUBID, 101)

local hp250 = Condition(CONDITION_ATTRIBUTES)
hp250:setParameter(CONDITION_PARAM_TICKS, -1)
hp250:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTS, 250)
hp250:setParameter(CONDITION_PARAM_SUBID, 101)

local hp300 = Condition(CONDITION_ATTRIBUTES)
hp300:setParameter(CONDITION_PARAM_TICKS, -1)
hp300:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTS, 300)
hp300:setParameter(CONDITION_PARAM_SUBID, 101)

local hp500 = Condition(CONDITION_ATTRIBUTES)
hp500:setParameter(CONDITION_PARAM_TICKS, -1)
hp500:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTS, 500)
hp500:setParameter(CONDITION_PARAM_SUBID, 101)

-- MP
local mp200 = Condition(CONDITION_ATTRIBUTES)
mp200:setParameter(CONDITION_PARAM_TICKS, -1)
mp200:setParameter(CONDITION_PARAM_STAT_MAXMANAPOINTS, 200)
mp200:setParameter(CONDITION_PARAM_SUBID, 102)

local mp250 = Condition(CONDITION_ATTRIBUTES)
mp250:setParameter(CONDITION_PARAM_TICKS, -1)
mp250:setParameter(CONDITION_PARAM_SUBID, 102)
mp250:setParameter(CONDITION_PARAM_STAT_MAXMANAPOINTS, 250)

local mp300 = Condition(CONDITION_ATTRIBUTES)
mp300:setParameter(CONDITION_PARAM_TICKS, -1)
mp300:setParameter(CONDITION_PARAM_SUBID, 102)
mp300:setParameter(CONDITION_PARAM_STAT_MAXMANAPOINTS, 300)

local mp500 = Condition(CONDITION_ATTRIBUTES)
mp500:setParameter(CONDITION_PARAM_TICKS, -1)
mp500:setParameter(CONDITION_PARAM_SUBID, 102)
mp500:setParameter(CONDITION_PARAM_STAT_MAXMANAPOINTS, 500)


-- HP Reg
local hp3Reg = Condition(CONDITION_REGENERATION)
hp3Reg:setParameter(CONDITION_PARAM_TICKS, -1)
hp3Reg:setParameter(CONDITION_PARAM_HEALTHGAIN, 30)
hp3Reg:setParameter(CONDITION_PARAM_HEALTHTICKS, 10000)
hp3Reg:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
hp3Reg:setParameter(CONDITION_PARAM_SUBID, 103)

local hp5Reg = Condition(CONDITION_REGENERATION)
hp5Reg:setParameter(CONDITION_PARAM_TICKS, -1)
hp5Reg:setParameter(CONDITION_PARAM_HEALTHGAIN, 50)
hp5Reg:setParameter(CONDITION_PARAM_HEALTHTICKS, 10000)
hp5Reg:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
hp5Reg:setParameter(CONDITION_PARAM_SUBID, 103)


-- MP Reg
local mp3Reg = Condition(CONDITION_REGENERATION)
mp3Reg:setParameter(CONDITION_PARAM_TICKS, -1)
mp3Reg:setParameter(CONDITION_PARAM_MANAGAIN, 30)
mp3Reg:setParameter(CONDITION_PARAM_MANATICKS, 10000)
mp3Reg:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
mp3Reg:setParameter(CONDITION_PARAM_SUBID, 104)

local mp5Reg = Condition(CONDITION_REGENERATION)
mp5Reg:setParameter(CONDITION_PARAM_TICKS, -1)
mp5Reg:setParameter(CONDITION_PARAM_MANAGAIN, 50)
mp5Reg:setParameter(CONDITION_PARAM_MANATICKS, 10000)
mp5Reg:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
mp5Reg:setParameter(CONDITION_PARAM_SUBID, 104)


-- Distance
local dis2 = Condition(CONDITION_ATTRIBUTES)
dis2:setParameter(CONDITION_PARAM_TICKS, -1)
dis2:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 2)
dis2:setParameter(CONDITION_PARAM_SUBID, 104)

local dis3 = Condition(CONDITION_ATTRIBUTES)
dis3:setParameter(CONDITION_PARAM_TICKS, -1)
dis3:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 3)
dis3:setParameter(CONDITION_PARAM_SUBID, 104)

local dis5 = Condition(CONDITION_ATTRIBUTES)
dis5:setParameter(CONDITION_PARAM_TICKS, -1)
dis5:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 5)
dis5:setParameter(CONDITION_PARAM_SUBID, 104)


-- shield
local shield2 = Condition(CONDITION_ATTRIBUTES)
shield2:setParameter(CONDITION_PARAM_TICKS, -1)
shield2:setParameter(CONDITION_PARAM_SKILL_SHIELD, 2)
shield2:setParameter(CONDITION_PARAM_SUBID, 105)

local shield3 = Condition(CONDITION_ATTRIBUTES)
shield3:setParameter(CONDITION_PARAM_TICKS, -1)
shield3:setParameter(CONDITION_PARAM_SKILL_SHIELD, 3)
shield3:setParameter(CONDITION_PARAM_SUBID, 105)

local shield5 = Condition(CONDITION_ATTRIBUTES)
shield5:setParameter(CONDITION_PARAM_TICKS, -1)
shield5:setParameter(CONDITION_PARAM_SKILL_SHIELD, 5)
shield5:setParameter(CONDITION_PARAM_SUBID, 105)

-- melee
local melee2 = Condition(CONDITION_ATTRIBUTES)
melee2:setParameter(CONDITION_PARAM_TICKS, -1)
melee2:setParameter(CONDITION_PARAM_SKILL_MELEE, 2)
melee2:setParameter(CONDITION_PARAM_SUBID, 106)

local melee3 = Condition(CONDITION_ATTRIBUTES)
melee3:setParameter(CONDITION_PARAM_TICKS, -1)
melee3:setParameter(CONDITION_PARAM_SKILL_MELEE, 3)
melee3:setParameter(CONDITION_PARAM_SUBID, 106)

local melee5 = Condition(CONDITION_ATTRIBUTES)
melee5:setParameter(CONDITION_PARAM_TICKS, -1)
melee5:setParameter(CONDITION_PARAM_SKILL_MELEE, 5)
melee5:setParameter(CONDITION_PARAM_SUBID, 106)

-- Magic
local magic1 = Condition(CONDITION_ATTRIBUTES)
magic1:setParameter(CONDITION_PARAM_TICKS, -1)
magic1:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 1)
magic1:setParameter(CONDITION_PARAM_SUBID, 107)

local magic2 = Condition(CONDITION_ATTRIBUTES)
magic2:setParameter(CONDITION_PARAM_TICKS, -1)
magic2:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 2)
magic2:setParameter(CONDITION_PARAM_SUBID, 107)

local magic3 = Condition(CONDITION_ATTRIBUTES)
magic3:setParameter(CONDITION_PARAM_TICKS, -1)
magic3:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 3)
magic3:setParameter(CONDITION_PARAM_SUBID, 107)


oldOutfit = {}

outfitBonuses = {							
    [128] = {[3] = {condition = {speed10, hp250, mp250}, Desc ="Speed +10, Hit Point +250, Mana Point +250"}},							
	[129] = {[3] = {condition = {hp200, mp200, dis5}, Desc ="Hit Point +200, Mana Point +200, Distance +5"}},						
	[130] = {[3] = {condition = {mp500, mp5Reg, magic3}, Desc ="Mana Point +500, MP Regeneration 50/10 sec., Magic +3"}},						
	[131] = {[3] = {condition = {hp300, shield3, melee5}, Desc ="Hit Point +300, Shield +3, Melee +5"}},						
	[132] = {[3] = {condition = {hp200, hp3Reg, mp200, mp3Reg}, Desc ="Hit Point +200, HP Regeneration 30/10 sec., Mana Point +200, MP Regeneration 30/10 sec."}},						
	[133] = {[3] = {condition = {mp500, mp5Reg, magic3}, Desc ="Mana Point +500, MP Regeneration 50/10 sec., Magic +3"}},						
	[134] = {[3] = {condition = {hp300, shield3, melee3}, Desc ="Hit Point +300, Shield +3, Melee +3"}},						
	[136] = {[3] = {condition = {speed10, hp250, mp250}, Desc ="Speed +10, Hit Point +250, Mana Point +250"}},						
	[137] = {[3] = {condition = {hp200, mp200, dis5}, Desc ="Hit Point +200, Mana Point +200, Distance +5"}},						
	[138] = {[3] = {condition = {mp500, mp5Reg, magic3}, Desc ="Mana Point +500, MP Regeneration 50/10 sec., Magic +3"}},						
	[139] = {[3] = {condition = {hp300, shield3, melee5}, Desc ="Hit Point +300, Shield +3, Melee +5"}},						
	[140] = {[3] = {condition = {hp200, hp3Reg, mp200, mp3Reg}, Desc ="Hit Point +200, HP Regeneration 30/10 sec., Mana Point +200, MP Regeneration 30/10 sec."}},						
	[141] = {[3] = {condition = {mp500, mp5Reg, magic3}, Desc ="Mana Point +500, MP Regeneration 50/10 sec., Magic +3"}},						
	[142] = {[3] = {condition = {hp300, shield3, melee3}, Desc ="Hit Point +300, Shield +3, Melee +3"}},						
	[143] = {[3] = {condition = {hp300, dis3, shield2, melee3}, Desc ="Hit Point +300, Distance +3, Shield +2, Melee +3"}},						
	[144] = {[3] = {condition = {mp300, mp5Reg, magic2}, Desc ="Mana Point +300, MP Regeneration 50/10 sec., Magic +2"}},						
	[145] = {[3] = {condition = {mp300, mp5Reg, magic3}, Desc ="Mana Point +300, MP Regeneration 50/10 sec., Magic +3"}},						
	[146] = {[3] = {condition = {hp200, shield2, melee2}, Desc ="Hit Point +200, Shield +2, Melee +2"}},						
	[147] = {[3] = {condition = {hp300, dis3, shield2, melee3}, Desc ="Hit Point +300, Distance +3, Shield +2, Melee +3"}},						
	[148] = {[3] = {condition = {mp300, mp5Reg, magic2}, Desc ="Mana Point +300, MP Regeneration 50/10 sec., Magic +2"}},						
	[149] = {[3] = {condition = {mp300, mp5Reg, magic3}, Desc ="Mana Point +300, MP Regeneration 50/10 sec., Magic +3"}},						
	[150] = {[3] = {condition = {hp200, shield2, melee2}, Desc ="Hit Point +200, Shield +2, Melee +2"}},						
	[151] = {[3] = {condition = {hp200, shield2, melee2}, Desc ="Hit Point +200, Shield +2, Melee +2"}},						
	[152] = {[3] = {condition = {speed10, hp200, mp200, dis2, melee2}, Desc ="Speed +10, Hit Point +200, Mana Point +200, Distance +2, Melee +2"}},						
	[153] = {[3] = {condition = {hp200, mp200}, Desc ="Hit Point +200, Mana Point +200"}},						
	[154] = {[3] = {condition = {hp200, hp3Reg, mp250, mp5Reg, magic3}, Desc ="Hit Point +200, HP Regeneration 30/10 sec., Mana Point +250, MP Regeneration 50/10 sec., Magic +3"}},						
	[155] = {[3] = {condition = {hp200, shield2, melee2}, Desc ="Hit Point +200, Shield +2, Melee +2"}},						
	[156] = {[3] = {condition = {speed10, hp200, mp200, dis2, melee2}, Desc ="Speed +10, Hit Point +200, Mana Point +200, Distance +2, Melee +2"}},						
	[157] = {[3] = {condition = {hp200, mp200}, Desc ="Hit Point +200, Mana Point +200"}},						
	[158] = {[3] = {condition = {hp200, hp3Reg, mp250, mp5Reg, magic3}, Desc ="Hit Point +200, HP Regeneration 30/10 sec., Mana Point +250, MP Regeneration 50/10 sec., Magic +3"}},						
	[251] = {[3] = {condition = {hp200, shield2, melee2}, Desc ="Hit Point +200, Shield +2, Melee +2"}},						
	[252] = {[3] = {condition = {hp200, shield2, melee2}, Desc ="Hit Point +200, Shield +2, Melee +2"}},						
	[268] = {[3] = {condition = {hp300, hp3Reg, shield5, melee2}, Desc ="Hit Point +300, HP Regeneration 30/10 sec., Shield +5, Melee +2"}},						
	[269] = {[3] = {condition = {hp300, hp3Reg, shield5, melee2}, Desc ="Hit Point +300, HP Regeneration 30/10 sec., Shield +5, Melee +2"}},						
	[270] = {[3] = {condition = {hp200, mp200}, Desc ="Hit Point +200, Mana Point +200"}},						
	[273] = {[3] = {condition = {hp200, mp200}, Desc ="Hit Point +200, Mana Point +200"}},						
	[278] = {[3] = {condition = {mp250, mp5Reg, magic1}, Desc ="Mana Point +250, MP Regeneration 50/10 sec., Magic +1"}},						
	[279] = {[3] = {condition = {mp250, mp5Reg, magic1}, Desc ="Mana Point +250, MP Regeneration 50/10 sec., Magic +1"}},						
	[288] = {[3] = {condition = {mp250, mp5Reg, dis2, melee2, magic1}, Desc ="Mana Point +250, MP Regeneration 50/10 sec., Distance +2, Melee +2, Magic +1"}},						
	[289] = {[3] = {condition = {mp250, mp5Reg, dis2, melee2, magic1}, Desc ="Mana Point +250, MP Regeneration 50/10 sec., Distance +2, Melee +2, Magic +1"}},						
	[324] = {[3] = {condition = {hp250, mp250, dis2, shield2, melee2, magic2}, Desc ="Hit Point +250, Mana Point +250, Distance +2, Shield +2, Melee +2, Magic +2"}},						
	[325] = {[3] = {condition = {hp250, mp250, dis2, shield2, melee2, magic2}, Desc ="Hit Point +250, Mana Point +250, Distance +2, Shield +2, Melee +2, Magic +2"}},						
	[328] = {[0] = {condition = {hp200, mp200}, Desc ="Hit Point +200, Mana Point +200"}},						
	[329] = {[0] = {condition = {hp200, mp200}, Desc ="Hit Point +200, Mana Point +200"}},						
	[335] = {[3] = {condition = {hp300, dis2, shield2, melee2}, Desc ="Hit Point +300, Distance +2, Shield +2, Melee +2"}},						
	[336] = {[3] = {condition = {hp300, dis2, shield2, melee2}, Desc ="Hit Point +300, Distance +2, Shield +2, Melee +2"}},						
	[366] = {[3] = {condition = {hp200, mp200, shield3, melee5}, Desc ="Hit Point +200, Mana Point +200, Shield +3, Melee +5"}},						
	[367] = {[3] = {condition = {hp200, mp200, shield3, melee5}, Desc ="Hit Point +200, Mana Point +200, Shield +3, Melee +5"}},						
	[370] = {[0] = {condition = {hp250, mp250}, Desc ="Hit Point +250, Mana Point +250"}},						
	[371] = {[0] = {condition = {hp200, mp200, dis5}, Desc ="Hit Point +200, Mana Point +200, Distance +5"}},						
	[372] = {[0] = {condition = {mp500, mp5Reg, magic3}, Desc ="Mana Point +500, MP Regeneration 50/10 sec., Magic +3"}},						
	[373] = {[0] = {condition = {hp300, shield3, melee5}, Desc ="Hit Point +300, Shield +3, Melee +5"}},						
	[374] = {[0] = {condition = {hp200, hp3Reg, mp200, mp3Reg}, Desc ="Hit Point +200, HP Regeneration 30/10 sec., Mana Point +200, MP Regeneration 30/10 sec."}},						
	[375] = {[0] = {condition = {mp500, mp5Reg, magic3}, Desc ="Mana Point +500, MP Regeneration 50/10 sec., Magic +3"}},						
	[376] = {[0] = {condition = {hp300, shield3, melee3}, Desc ="Hit Point +300, Shield +3, Melee +3"}},						
	[377] = {[0] = {condition = {hp250, mp250}, Desc ="Hit Point +250, Mana Point +250"}},						
	[378] = {[0] = {condition = {hp200, mp200, dis5}, Desc ="Hit Point +200, Mana Point +200, Distance +5"}},						
	[379] = {[0] = {condition = {mp500, mp5Reg, magic3}, Desc ="Mana Point +500, MP Regeneration 50/10 sec., Magic +3"}},						
	[380] = {[0] = {condition = {hp300, shield3, melee5}, Desc ="Hit Point +300, Shield +3, Melee +5"}},						
	[381] = {[0] = {condition = {hp200, hp3Reg, mp200, mp3Reg}, Desc ="Hit Point +200, HP Regeneration 30/10 sec., Mana Point +200, MP Regeneration 30/10 sec."}},						
	[382] = {[0] = {condition = {mp500, mp5Reg, magic3}, Desc ="Mana Point +500, MP Regeneration 50/10 sec., Magic +3"}},						
	[383] = {[0] = {condition = {hp300, shield3, melee3}, Desc ="Hit Point +300, Shield +3, Melee +3"}},						
	[413] = {[0] = {condition = {speed60, hp300, hp5Reg, mp300, mp5Reg, magic3}, Desc ="Speed +60, Hit Point +300, HP Regeneration 50/10 sec., Mana Point +300, MP Regeneration 50/10 sec., Magic +3"}},						
	[414] = {[0] = {condition = {speed60, hp300, hp5Reg, mp300, mp5Reg, magic3}, Desc ="Speed +60, Hit Point +300, HP Regeneration 50/10 sec., Mana Point +300, MP Regeneration 50/10 sec., Magic +3"}},						
	[432] = {[0] = {condition = {hp300, hp5Reg, dis3, shield3, melee3}, Desc ="Hit Point +300, HP Regeneration 50/10 sec., Distance +3, Shield +3, Melee +3"}},						
	[432] = {[0] = {condition = {hp300, hp5Reg, dis3, shield3, melee3}, Desc ="Hit Point +300, HP Regeneration 50/10 sec., Distance +3, Shield +3, Melee +3"}},						
	[452] = {[0] = {condition = {hp250, hp5Reg, mp250, mp5Reg, shield2, melee2}, Desc ="Hit Point +250, HP Regeneration 50/10 sec., Mana Point +250, MP Regeneration 50/10 sec., Shield +2, Melee +2"}},						
	[452] = {[0] = {condition = {hp250, hp5Reg, mp250, mp5Reg, shield2, melee2}, Desc ="Hit Point +250, HP Regeneration 50/10 sec., Mana Point +250, MP Regeneration 50/10 sec., Shield +2, Melee +2"}},						
	[453] = {[3] = {condition = {hp250, hp5Reg, mp250, mp5Reg, shield2}, Desc ="Hit Point +250, HP Regeneration 50/10 sec., Mana Point +250, MP Regeneration 50/10 sec., Shield +2"}},						
	[454] = {[3] = {condition = {hp250, hp5Reg, mp250, mp5Reg, shield2}, Desc ="Hit Point +250, HP Regeneration 50/10 sec., Mana Point +250, MP Regeneration 50/10 sec., Shield +2"}},						
	[455] = {[0] = {condition = {hp300, hp5Reg, shield3, melee2}, Desc ="Hit Point +300, HP Regeneration 50/10 sec., Shield +3, Melee +2"}},						
	[455] = {[0] = {condition = {hp300, hp5Reg, shield3, melee2}, Desc ="Hit Point +300, HP Regeneration 50/10 sec., Shield +3, Melee +2"}},						
	[459] = {[0] = {condition = {speed10, hp250, hp3Reg, mp250, mp3Reg, dis2, shield2, melee2}, Desc ="Speed +10, Hit Point +250, HP Regeneration 30/10 sec., Mana Point +250, MP Regeneration 30/10 sec., Distance +2, Shield +2, Melee +2"}},						
	[459] = {[0] = {condition = {speed10, hp250, hp3Reg, mp250, mp3Reg, dis2, shield2, melee2}, Desc ="Speed +10, Hit Point +250, HP Regeneration 30/10 sec., Mana Point +250, MP Regeneration 30/10 sec., Distance +2, Shield +2, Melee +2"}},						
	[460] = {[0] = {condition = {speed10, hp250, hp3Reg, mp250, mp3Reg, dis2, shield2, melee2}, Desc ="Speed +10, Hit Point +250, HP Regeneration 30/10 sec., Mana Point +250, MP Regeneration 30/10 sec., Distance +2, Shield +2, Melee +2"}},						
	[460] = {[0] = {condition = {speed10, hp250, hp3Reg, mp250, mp3Reg, dis2, shield2, melee2}, Desc ="Speed +10, Hit Point +250, HP Regeneration 30/10 sec., Mana Point +250, MP Regeneration 30/10 sec., Distance +2, Shield +2, Melee +2"}},						
	[461] = {[0] = {condition = {speed10, hp250, hp3Reg, mp250, mp3Reg, dis2, shield2, melee2}, Desc ="Speed +10, Hit Point +250, HP Regeneration 30/10 sec., Mana Point +250, MP Regeneration 30/10 sec., Distance +2, Shield +2, Melee +2"}},						
	[461] = {[0] = {condition = {speed10, hp250, hp3Reg, mp250, mp3Reg, dis2, shield2, melee2}, Desc ="Speed +10, Hit Point +250, HP Regeneration 30/10 sec., Mana Point +250, MP Regeneration 30/10 sec., Distance +2, Shield +2, Melee +2"}},						
	[463] = {[3] = {condition = {speed30, hp250, hp3Reg, mp250, mp5Reg, magic3}, Desc ="Speed +30, Hit Point +250, HP Regeneration 30/10 sec., Mana Point +250, MP Regeneration 50/10 sec., Magic +3"}},						
	[464] = {[3] = {condition = {speed30, hp300, shield3, melee3}, Desc ="Speed +30, Hit Point +300, Shield +3, Melee +3"}},						
	[465] = {[3] = {condition = {speed30, hp300, shield3, melee3}, Desc ="Speed +30, Hit Point +300, Shield +3, Melee +3"}},						
	[466] = {[3] = {condition = {speed30, mp250, mp5Reg, dis2, melee2}, Desc ="Speed +30, Mana Point +250, MP Regeneration 50/10 sec., Distance +2, Melee +2"}},						
	[467] = {[3] = {condition = {speed30, mp250, mp5Reg, dis2, melee2}, Desc ="Speed +30, Mana Point +250, MP Regeneration 50/10 sec., Distance +2, Melee +2"}},						
	[468] = {[3] = {condition = {speed30, hp250, hp3Reg, mp250, mp5Reg, magic3}, Desc ="Speed +30, Hit Point +250, HP Regeneration 30/10 sec., Mana Point +250, MP Regeneration 50/10 sec., Magic +3"}},						
	[469] = {[0] = {condition = {speed30, hp300, hp5Reg, dis2, shield2, melee2}, Desc ="Speed +30, Hit Point +300, HP Regeneration 50/10 sec., Distance +2, Shield +2, Melee +2"}},						
	[469] = {[0] = {condition = {speed30, hp300, hp5Reg, dis2, shield2, melee2}, Desc ="Speed +30, Hit Point +300, HP Regeneration 50/10 sec., Distance +2, Shield +2, Melee +2"}},						
	[470] = {[0] = {condition = {speed30, hp250, hp5Reg, mp250, mp5Reg, shield3, magic1}, Desc ="Speed +30, Hit Point +250, HP Regeneration 50/10 sec., Mana Point +250, MP Regeneration 50/10 sec., Shield +3, Magic +1"}},						
	[470] = {[0] = {condition = {speed30, hp250, hp5Reg, mp250, mp5Reg, shield3, magic1}, Desc ="Speed +30, Hit Point +250, HP Regeneration 50/10 sec., Mana Point +250, MP Regeneration 50/10 sec., Shield +3, Magic +1"}},						
	[471] = {[0] = {condition = {speed30, mp200, mp5Reg, dis2, melee2, magic2}, Desc ="Speed +30, Mana Point +200, MP Regeneration 50/10 sec., Distance +2, Melee +2, Magic +2"}},						
	[471] = {[0] = {condition = {speed30, mp200, mp5Reg, dis2, melee2, magic2}, Desc ="Speed +30, Mana Point +200, MP Regeneration 50/10 sec., Distance +2, Melee +2, Magic +2"}},						
	[472] = {[3] = {condition = {speed30, hp200, hp3Reg, mp500, mp5Reg, magic3}, Desc ="Speed +30, Hit Point +200, HP Regeneration 30/10 sec., Mana Point +500, MP Regeneration 50/10 sec., Magic +3"}},						
	[473] = {[3] = {condition = {speed30, hp200, hp3Reg, mp500, mp5Reg, magic3}, Desc ="Speed +30, Hit Point +200, HP Regeneration 30/10 sec., Mana Point +500, MP Regeneration 50/10 sec., Magic +3"}}						
}							





function Creature:onChangeOutfit(outfit)

	if self == nil then
		return true
    end
	 
    if self:isPlayer() then        
		local getOutfit = self:getOutfit()
        oldOutfit[self:getId()] = { 
            lookHead = getOutfit.lookHead;
            lookBody = getOutfit.lookBody;
            lookLegs = getOutfit.lookLegs;
            lookFeet = getOutfit.lookFeet;
            lookType = getOutfit.lookType;
            lookTypeEx = getOutfit.lookTypeEx;
            lookAddons = getOutfit.lookAddons;
            lookMount = getOutfit.lookMount;
        }
        local old = oldOutfit[self:getId()]
        local oldOutfit_t = outfitBonuses[old.lookType]
        if oldOutfit_t and oldOutfit_t[old.lookAddons] then
            local oldCondition = oldOutfit_t[old.lookAddons].condition
            if type(oldCondition) == "table" then
                for _, condition in pairs(oldCondition) do
                    self:removeCondition(condition:getType(), condition:getId(), condition:getSubId())
                end
            else
                self:removeCondition(oldCondition:getType(), oldCondition:getId(), oldCondition:getSubId())
            end
        end

        local currentOutfit = outfitBonuses[outfit.lookType]
        if currentOutfit and currentOutfit[outfit.lookAddons] then
            local newCondition = currentOutfit[outfit.lookAddons].condition
			
            if type(newCondition) == "table" then
                for _, condition in pairs(newCondition) do
                    self:addCondition(condition)
                end
            else
                self:addCondition(newCondition)
            end
			
			self:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE,'Outfit Boosted: ' ..currentOutfit[outfit.lookAddons].Desc .. "!" )  
        end
		
    end
	 
	 
	return true
end

function Creature:onAreaCombat(tile, isAggressive)
	return RETURNVALUE_NOERROR
end

function Creature:onTargetCombat(target)
   return stat_onTargetCombat(self, target)
end

