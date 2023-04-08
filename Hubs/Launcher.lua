repeat wait() until game:IsLoaded()
function GetExecutor(Name)
    local Executor = identifyexecutor and table.concat({identifyexecutor()}, " ") or "Unknown";
    if Executor:gmatch("/") then
        Executor = Executor:split("/")[1]
    end
    if Executor:lower():match(Name:lower()) then
        return true
    end
    return false
end
if not GetExecutor("Synapse X") then
    print("Executor not supported")
    return
end

getgenv().Start = tick()

local a = {
    [1582293268] = {Url = "https://raw.githubusercontent.com/Glowing-Red/Roblox/main/Games/Tower%20Blitz.lua", Id = 4739557376};
    [3104101863] = {Url = {["V2"] = "https://raw.githubusercontent.com/Glowing-Red/Roblox/main/Games/Michael's%20Zombie.lua", ["V3"] = "https://raw.githubusercontent.com/Glowing-Red/Roblox/main/Games/Synapse%20V3/Michael's%20Zombie.lua"}, Id = 8054462345};
    [32095083] = {Url = "https://raw.githubusercontent.com/Glowing-Red/Roblox/main/Games/Get%20Eaten!.lua", Id = 28586816};
    [210851291] = {Url = {["V3"] = "https://raw.githubusercontent.com/Glowing-Red/Roblox/main/Games/Synapse%20V3/Build%20A%20Boat%20For%20Treasure.lua"}, Id = 537413528};
}

local function Error(Message)
    local Library = loadstring(syn.request({Url = "https://raw.githubusercontent.com/Glowing-Red/Roblox/main/Libraries/Enhanced.lua"}).Body)()
    local Notification = loadstring(syn.request({Url = "https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"}).Body)()
    local MpS = game:GetService("MarketplaceService")
    
    for _,a in next, a do
        local b = MpS:GetProductInfo(a.Id)
        Library:AddButton({Name = b.Name, Icon = b.IconImageAssetId, Title = b.Name, Text = "Print Description", Callback = function()
            print(b.Description)
        end})
    end
    
    Notification:SendNotification("Error", (Message..", a list of all the supported games has been received and took %.2f Seconds to load."):format(tick() - Start), 12)
end

if a[game.GameId] then
    local b = GetExecutor("Synapse X v3") and a[game.GameId].Url.V3 or a[game.GameId].Url.V2 or a[game.GameId].Url
    if typeof(b) == "string" or typeof(b) == "table" and #b > 0 then
        loadstring(syn.request({Url = b}).Body)()
    else
        Error("Game was found but your executor does not meet the requirements to execute it")
    end
else
    Error("No game was found nor detected, however")
end
