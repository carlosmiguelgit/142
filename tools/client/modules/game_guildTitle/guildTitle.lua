local titleFont = "verdana-11px-rounded"
local OPCODE = 134

function init()
    connect(Creature, {
        onAppear = requestData,
    })
    ProtocolGame.registerExtendedOpcode(OPCODE, handleData)
end

function terminate()
    disconnect(Creature, {
        onAppear = requestData,
    })
    ProtocolGame.unregisterExtendedOpcode(OPCODE, handleData)
end

function requestData(creature)
    if creature:isPlayer() then
        local tbl = {
            creature = creature:getId()
        }
        local protocolGame = g_game.getProtocolGame()
        if protocolGame then
            protocolGame:sendExtendedOpcode(OPCODE, json.encode(tbl))
        end
    end
end

function handleData(protocol, code, buffer)
    local json_status, json_data = pcall(function()
        return json.decode(buffer)
    end)

    if not json_status then
        return false
    end

    local data = json_data
    local response = json_data.response

    if data then
        if response == "SetguildNick" then
            updateTitle(data.creatureId, data.guildNick)
        elseif response == "SetguildName" then
            updateTitle(data.creatureId, data.guildName)
        end
    end
end

local guildColors = {}

function updateTitle(creatureId, guildName)
    local target = g_map.getCreatureById(creatureId)
    if target then
        local color
        if guildColors[guildName] then
            color = guildColors[guildName]
        else
            local red = math.random(0, 255)
            local green = math.random(0, 255)
            local blue = math.random(0, 255)
            color = string.format("#%02X%02X%02X", red, green, blue)
            guildColors[guildName] = color
        end
        
        -- Aplicando o título
        target:setTitle(guildName, titleFont, color)
    end
end
