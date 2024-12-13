local supportedPlaceIds = {
    [6516141723] = "Doors/lobby.lua",
    [6839171747] = "Doors/hotel.lua",
    [10549820578] = "Doors/Fools23.lua",
    [189707] = "NaturalDisaster/places/game.lua",
    [12137249458] = "CampoFFA/ArmasFFA.lua",
}

local scriptUrl = "https://raw.githubusercontent.com/Sc-Rhyan57/Msdoors/main/Src/Loaders/"
local vipScriptUrl = "https://raw.githubusercontent.com/Sc-Rhyan57/Msdoors/main/Src/VipLoaders/"
local Utils = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sc-Rhyan57/Msdoors/main/library/shared/Utils.lua"))()

local function getScriptUrl(placeId, isVip)
    local scriptName = supportedPlaceIds[placeId]
    if not scriptName then
        warn("[Loader] Este jogo não é suportado.")
        return nil
    end
    return (isVip and vipScriptUrl or scriptUrl) .. scriptName
end

local function loadScriptForGame(placeId, isVip)
    local url = getScriptUrl(placeId, isVip)
    if not url then
        return
    end

    local content = Utils:HttpGet(url)
    if content then
        Utils:SafeLoadString(content)
    end
end

local placeId = game.PlaceId
local isVip = false
loadScriptForGame(placeId, isVip)
