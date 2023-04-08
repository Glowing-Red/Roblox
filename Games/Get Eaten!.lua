repeat wait() until game:IsLoaded()
if game.GameId ~= 32095083 then
    print("This is not the correct game")
    return
elseif game.PlaceId ~= 28586816 then
    print("This does not work on the time machine")
end
getgenv().Start = getgenv().Start or tick()

local Workshop = game:GetService("Workspace")
local Players = game:GetService("Players")
local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")

local Plr = Players.LocalPlayer

local Asimo = game:GetService("Workspace"):WaitForChild("Giants"):WaitForChild("asimo3089")
local End = game:GetService("Workspace"):WaitForChild("Toilets"):WaitForChild("Toilet"):WaitForChild("End"):WaitForChild("Killer")

local auto = false

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Glowing-Red/Akrion/main/Exclusive/Enhanced-Library.lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()

function ListServers(cursor)
   local Raw = game:HttpGet(("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100"):format(game.PlaceId)..((cursor and "&cursor="..cursor) or ""))
   return game:GetService("HttpService"):JSONDecode(Raw)
end

Library:AddToggle({Name = "asimo3089", Title = "Autofarm asimo3089", Default = false, Callback = function(val)
    auto = val
    task.spawn(function()
        while task.wait() and auto and Plr.Character do
            Plr.Character:WaitForChild("HumanoidRootPart")
            if not Asimo:FindFirstChild("CharacterCounter") then
                repeat
                    Plr.Character.HumanoidRootPart.CFrame = CFrame.new(726.535156, 784.910461, -101.04261)
                    task.wait(0.5)
                until Asimo:FindFirstChild("CharacterCounter")
            end
            firetouchinterest(Plr.Character.HumanoidRootPart, Asimo.CharacterCounter, 0)
            firetouchinterest(Plr.Character.HumanoidRootPart, Asimo.CharacterCounter, 1)
            firetouchinterest(Plr.Character.HumanoidRootPart, End, 0)
            firetouchinterest(Plr.Character.HumanoidRootPart, End, 1)
        end
    end)
end})
Library:AddButton({Name = "Serverhop", Title = "Find server with low playercount", Text = "Find Server", Callback = function()
    local Server, Next; repeat
        local Servers = ListServers(Next)
        Server = Servers.data[1]
        Next = Servers.nextPageCursor
    until Server
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,Server.id,game.Players.LocalPlayer)
end})

Notification:SendNotification("Success", ("Toga's \"Get Eaten!\" has been successfully loaded, it took a total of %.2f Seconds."):format(tick() - Start), 12)
