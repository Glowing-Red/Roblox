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
if not GetExecutor("Synapse X v3") then
    if GetExecutor("Synapse X") then
        print("Sorry, Version 3 Users only.")
    else
        print("Executor not supported")
    end
    return
elseif game.GameId ~= 3104101863 then
    syn.toast_notification({
        Title = "Wrong game!",
        Content = "You've executed this script on the wrong game.",
        Duration = 15,
        Type = 3
    })
    return
end
getgenv().Start = getgenv().Start or tick()

local Workshop = game:GetService("Workspace")
local Players = game:GetService("Players")

local Plr = Players.LocalPlayer
local Char = Plr.Character

local Settings,Powers,Guns,Damages,Damage = {
    Main = {
        OneHitMelee = false,
        AlwaysHeadshot = false,
        AutoReload = false,
        MeleeAura = false,
        AuraRange = 15,
        AutoCollect = false
    },
    Esp = {
        Zombie = false,
        MysteryBox = false,
        Powerups = false,
        Parts = false
    },
},{},{},{},0

function SaveSettings()
    local a = game:GetService("HttpService"):JSONEncode(Settings)
    if writefile then
        if isfolder("Toga ™/Michael's Zombies") then
            writefile("Toga ™/Michael's Zombies/Settings.lua", a)
        else
            if not isfolder("Toga ™") then
                makefolder("Toga ™")
            end
            if not isfolder("Toga ™/Michael's Zombies") then
                makefolder("Toga ™/Michael's Zombies")
            end
            writefile("Toga ™/Michael's Zombies/Settings.lua", a)
        end
    end
end
function LoadSettings()
    if isfile("Toga ™/Michael's Zombies/Settings.lua") then
        for a, b in pairs(game:GetService("HttpService"):JSONDecode(readfile("Toga ™/Michael's Zombies/Settings.lua"))) do
            if Settings[a] ~= nil then
                Settings[a] = b
            end
        end
    end
end
LoadSettings()
SaveSettings()

local Library = loadstring(syn.request({Url = "https://raw.githubusercontent.com/Glowing-Red/Roblox/main/Libraries/SynapseV3.lua"}).Body)()
local ESP = loadstring(syn.request({Url = "https://raw.githubusercontent.com/andrewc0de/Roblox/main/Dependencies/ESP.lua"}).Body)()

ESP:Toggle(true)

ESP.Boxes = true
ESP.Names = false
ESP.Tracers = false
ESP.Players = false

function Mod_Powerup(child)
    local a = Instance.new("Part", child)
    a.CanCollide = false
    a.Anchored = true
    a.Transparency = 1
    a.CFrame = a.Parent.CFrame * CFrame.new(0, 1.5, 0)
    a.Orientation = Vector3.new(0,90,0)
    a.Name = "HumanoidRootPart"
    
    table.insert(Powers, child)
end

for _,child in next, game:GetService("Workspace").Ignore["_Powerups"]:GetChildren() do Mod_Powerup(child) end
game:GetService("Workspace").Ignore["_Powerups"].ChildAdded:Connect(function(child) Mod_Powerup(child) end)

ESP:AddObjectListener(Workshop:WaitForChild("Ignore"):WaitForChild("Zombies"), {
    Type = "Model",
    Color = Color3.fromRGB(255, 0, 4),
    PrimaryPart = function(obj)
        local root
        repeat
            root = obj:FindFirstChild("HumanoidRootPart")
            task.wait()
        until root
        return root
    end,
    IsEnabled = "Zombie"
})
ESP:AddObjectListener(Workshop:WaitForChild("_MapComponents"), {
    Name = "MysteryBox",
    Type = "Model",
    Color = Color3.fromRGB(0, 0, 255),
    PrimaryPart = function(obj)
        local root
        repeat
            root = obj:FindFirstChild("HumanoidRootPart")
            task.wait()
        until root
        return root
    end,
    IsEnabled = "MysteryBox"
})
ESP:AddObjectListener(Workshop:WaitForChild("Ignore"):WaitForChild("_Powerups"), {
    Type = "MeshPart",
    Color = Color3.fromRGB(0, 255, 0),
    PrimaryPart = function(obj)
        local root
        repeat
            root = obj:FindFirstChild("HumanoidRootPart")
            task.wait()
        until root
        return root
    end,
    IsEnabled = "Powerups"
})
ESP:AddObjectListener(Workshop:waitForChild("_Parts"), {
    Type = "Model",
    Color = Color3.fromRGB(150, 0, 150),
    PrimaryPart = function(obj)
        local root
        repeat
            root = obj:FindFirstChild("PartPickup")
            task.wait()
        until root
        return root
    end,
    IsEnabled = "Parts"
})
for _,a in next, game:GetService("ReplicatedStorage").Framework.Knives:GetChildren() do
    local b = require(a:WaitForChild("Module"):WaitForChild("Settings"))
    Damages[a.Name] = b.DAMAGE
end
for _,a in next, game:GetService("ReplicatedStorage").Framework.Guns:GetChildren() do
    local b = require(a:WaitForChild("Module"):WaitForChild("Settings"))
    Guns[a.Name] = b.AMMO.MAG_CAPACITY
end

function Range(zombie, dist)
    if zombie:FindFirstChild("HumanoidRootPart") and Char and Char:FindFirstChild("HumanoidRootPart") then
        return (Char.HumanoidRootPart.Position - zombie.HumanoidRootPart.Position).Magnitude <= (dist or 10)
    end
    return false
end
function GetKnife(char)
    local Char = char or Plr.Character
    Char:WaitForChild("CharStats")
    if Char.Parent ~= nil then
        Char.CharStats:WaitForChild("Knife")
        if Damages[Char.CharStats.Knife.Value] ~= nil then
            Damage = Damages[Char.CharStats.Knife.Value]
        end
        Char.CharStats.Knife:GetPropertyChangedSignal("Value"):Connect(function()
            Damage = Damages[Char.CharStats.Knife.Value]
        end)
    end
end

if Char then
    GetKnife(Char)
end
Plr.CharacterAdded:Connect(function(char)
    Char = char
    GetKnife(Char)
end)

local Window = Library:MakeWindow({
    Name = "Michael's Zombies",
    DefaultSize = Vector2.new(290, 300),
    CanResize = true,
    Color = {
        {{5,10,11,20,23,27,32,35}, Color3.fromRGB(190, 0, 0), 1};
        {{12,18,19,21,30,33}, Color3.fromRGB(175, 0, 0), 1};
        {{22,31,34}, Color3.fromRGB(160, 0, 0), 1};
    }
})
local Main = Window:AddTab({Name = "Main"})
local Esp = Window:AddTab({Name = "Esp"})

Main:AddToggle({Name = "Always Headshot", Default = Settings.Main.AlwaysHeadshot, Callback = function(val)
    Settings.Main.AlwaysHeadshot = val
    SaveSettings()
end})
Main:AddToggle({Name = "Auto Reload", Default = Settings.Main.AlwaysHeadshot, Callback = function(val)
    Settings.Main.AutoReload = val
    SaveSettings()
    task.spawn(function()
        while task.wait() and Settings.Main.AutoReload do
            if Char and Char:FindFirstChild("CharStats") then
                local gun = Char.CharStats:WaitForChild("GunInventory"):FindFirstChild("Gun"..Char.CharStats:WaitForChild("EquippedGunIndex").Value)
                if gun and Guns[gun.Value] and gun.Clip.Value < Guns[gun.Value] and gun.Storage.Value > 0 then
                    game:GetService("Players").LocalPlayer.Character.Remotes.Reload:FireServer()
                    task.wait(0.2)
                end
            end
        end
    end)
end})
Main:AddButton({Name = "Modifies the stats of every gun", Callback = function()
    for _,a in next, game:GetService("ReplicatedStorage").Framework.Guns:GetChildren() do
        local a = require(a:WaitForChild("Module"):WaitForChild("Settings"))
        a.FIRE_TYPE = "AUTO"
        a.PENETRATION = 500
        a.RPM = 999
        a.SPREAD.DEFAULT = 0.01
        a.SPREAD.MIN = 0.01
        a.SPREAD.MAX = 0.01
        for b,_ in next, a.CAMERA_RECOIL do
            a.CAMERA_RECOIL[b] = function()
                return Vector3.new(0,0,0)
            end
        end
        for b,_ in next, a.RIG_RECOIL do
            a.RIG_RECOIL[b] = function()
                return Vector3.new(0,0,0)
            end
        end
    end
end})
Main:AddSeperator()
Main:AddToggle({Name = "One hit Melee", Default = Settings.Main.OneHitMelee, Callback = function(val)
    Settings.Main.OneHitMelee = val
    SaveSettings()
end})
Main:AddToggle({Name = "Melee Aura", Default = Settings.Main.MeleeAura, Callback = function(val)
    Settings.Main.MeleeAura = val
    SaveSettings()
    task.spawn(function()
        while task.wait(.2) and Settings.Main.MeleeAura do
            for i,v in pairs(Workshop.Ignore.Zombies:GetChildren()) do
                if v and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and Range(v, Settings.Main.AuraRange) then
                    game:GetService("ReplicatedStorage").Framework.Remotes.KnifeHitbox:FireServer(v.Humanoid)
                end
            end
        end
    end)
end})
Main:AddSlider({Name = "Aura Range", Min = 10, Max = 30, Default = Settings.Main.AuraRange, Callback = function(val)
    Settings.Main.AutoCollect = val
    SaveSettings()
end})
Main:AddSeperator()
Main:AddToggle({Name = "Auto Collect Powerups", Default = Settings.Main.AutoCollect, Callback = function(val)
    Settings.Main.AutoCollect = val
    SaveSettings()
    task.spawn(function()
        while wait() and Settings.Main.AutoCollect do
            if #Powers > 0 and Char:FindFirstChild("HumanoidRootPart") then
                firetouchinterest(Char.HumanoidRootPart, Powers[1], 0)
                firetouchinterest(Char.HumanoidRootPart, Powers[1], 1)
                table.remove(Powers, table.find(Powers, Powers[1]))
            end
        end
    end)
end})
Main:AddSeperator()
Esp:AddToggle({Name = "Zombie ESP", Default = Settings.Esp.Zombie, Callback = function(val)
    Settings.Esp.Zombie = val
    SaveSettings()
    ESP.Zombie = Settings.Esp.Zombie
end})
Esp:AddToggle({Name = "Mystery Box ESP", Default = Settings.Esp.Mystery, Callback = function(val)
    Settings.Esp.MysteryBox = val
    SaveSettings()
    ESP.MysteryBox = Settings.Esp.MysteryBox
end})
Esp:AddToggle({Name = "Powerups ESP", Default = Settings.Esp.Powerups, Callback = function(val)
    Settings.Esp.Powerups = val
    SaveSettings()
    ESP.Powerups = Settings.Esp.Powerups
end})
Esp:AddToggle({Name = "Parts ESP", Default = Settings.Esp.Parts, Callback = function(val)
    Settings.Esp.Parts = val
    SaveSettings()
    ESP.Parts = Settings.Esp.Parts
end})
Esp:AddSeperator()

task.spawn(function()
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)
    mt.__namecall = function(self, ...)
        local args = {...}
        if getnamecallmethod() == "FireServer" and tostring(self) == "KnifeHitbox" then
            if Settings.Main.OneHitMelee == true and typeof(args) == "table" and math.ceil(args[1].Health/Damage) > 1 then
                for _=1,math.ceil(args[1].Health/Damage)-1 do
                    old(self, ...)
                end
            end
        end
        return old(self, ...)
    end
    setreadonly(mt, true)
end)
task.spawn(function()
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)
    mt.__namecall = newcclosure(function(self, ...)
        local args = {...}
        if getnamecallmethod() == 'FireServer' and self.Name == 'ClientBulletHit' then
            if Settings.Main.AlwaysHeadshot == true and typeof(args) == "table" then
                args[1] = args[1].Parent.Head
            end
        end
        return old(self, unpack(args))
    end)
    setreadonly(mt, true)
end)

Library:SendNotification({
    Title = "Menu Loaded!",
    Content = ("Toga's \"Michael's Zombies\" has been successfully loaded, it took a total of %.2f Seconds."):format(tick() - Start),
    Duration = 15,
    Type = 1
})
