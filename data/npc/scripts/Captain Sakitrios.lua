local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'let\'s travel around the world'} }
npcHandler:addModule(VoiceModule:new(voices))

-- Travel
local function addTravelKeyword(keyword, cost, destination, action, condition)
	if condition then
		keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m sorry but I don\'t sail there.'}, condition)
	end

	local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = 'Do you seek a passage to ' .. keyword:titleCase() .. ' for |TRAVELCOST|?', cost = cost, discount = 'postman'})
		travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, cost = cost, discount = 'postman', destination = destination}, nil, action)
		travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'We would like to serve you some time.', reset = true})
end

addTravelKeyword('thmuis', 5000, Position(33872, 31581, 6))
addTravelKeyword('avaris', 5000, Position(34456, 31299, 6))
addTravelKeyword('cadiz', 5000, Position(33779, 31260, 6))
addTravelKeyword('colony', 5000, Position(34220, 31155, 7))
addTravelKeyword('sarepta', 5000, Position(34347, 31862, 6))
addTravelKeyword('kavala', 5000, Position(34587, 31648, 6))
addTravelKeyword('eretum', 5000, Position(34010, 31446, 6))
addTravelKeyword('picera', 5000, Position(34041, 31682, 5))
addTravelKeyword('squeletio', 5000, Position(33792, 31675, 6))
addTravelKeyword('abominatia', 5000, Position(33539, 31390, 7))
addTravelKeyword('trolland', 5000, Position(34260, 31330, 6))
addTravelKeyword('dragris', 5000, Position(34299, 31226, 7))
addTravelKeyword('pharaohis', 5000, Position(34276, 31297, 7))
addTravelKeyword('jungland', 5000, Position(34612, 31453, 7))
addTravelKeyword('painptera', 5000, Position(34363, 31525, 7))
addTravelKeyword('deepsea', 5000, Position(34119, 31230, 7))



keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To {thmuis}, {avaris}, {cadiz}, {colony}, {sarepta}, {kavala}, {eretum}, {picera}, {squeletio}, {abominatia}, {trolland}, {dragris}, {pharaohis}, {jungland}, {deepsea} or {painptera}?'})
keywordHandler:addKeyword({'route'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To {thmuis}, {avaris}, {cadiz}, {colony}, {sarepta}, {kavala}, {eretum}, {picera}, {squeletio}, {abominatia}, {trolland}, {dragris}, {pharaohis}, {jungland}, {deepsea} or {painptera}?'})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To {thmuis}, {avaris}, {cadiz}, {colony}, {sarepta}, {kavala}, {eretum}, {picera}, {squeletio}, {abominatia}, {trolland}, {dragris}, {pharaohis}, {jungland}, {deepsea} or {painptera}?'})
keywordHandler:addKeyword({'town'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To {thmuis}, {avaris}, {cadiz}, {colony}, {sarepta}, {kavala}, {eretum}, {picera}, {squeletio}, {abominatia}, {trolland}, {dragris}, {pharaohis}, {jungland}, {deepsea} or {painptera}?'})
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To {thmuis}, {avaris}, {cadiz}, {colony}, {sarepta}, {kavala}, {eretum}, {picera}, {squeletio}, {abominatia}, {trolland}, {dragris}, {pharaohis}, {jungland}, {deepsea} or {painptera}?'})
keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To {thmuis}, {avaris}, {cadiz}, {colony}, {sarepta}, {kavala}, {eretum}, {picera}, {squeletio}, {abominatia}, {trolland}, {dragris}, {pharaohis}, {jungland}, {deepsea} or {painptera}?'})
keywordHandler:addKeyword({'go'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To {thmuis}, {avaris}, {cadiz}, {colony}, {sarepta}, {kavala}, {eretum}, {picera}, {squeletio}, {abominatia}, {trolland}, {dragris}, {pharaohis}, {jungland}, {deepsea} or {painptera}?'})



npcHandler:setMessage(MESSAGE_GREET, 'Welcome on board, |PLAYERNAME|. Where can I {sail} you today?')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye. Recommend us if you were satisfied with our service.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye then.')

npcHandler:addModule(FocusModule:new())
