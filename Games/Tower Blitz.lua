repeat wait() until game:IsLoaded()
if game.GameId ~= 1582293268 then
    return
end
getgenv().Start = getgenv().Start or tick()
local Settings,Frozen = {
    Theme = "Default",
    Pos = {
        Content = "{0.5, 0}, {0.5, 0}", 
        Shadow = "{0.5, 2}, {0.5, 2}"
    },
    Main = {
        Unfreeze = false
    },
    Map = {
        Map = "Grassy Island"
    },
    Autofarm = {
        Activated = false, 
        path = "None"
    }
},{}

local F1 = "Toga ™"
local F2 = "Tower Blitz"
local L1 = "Settings.lua"
local F3 = "Macro"
function SaveSettings()
    local c = game:GetService("HttpService")
    local d = c:JSONEncode(Settings)
    if writefile then
        if isfolder(F1) and isfolder(F2) then
            writefile(F1.."\\"..F2.."\\"..L1, d)
        else
            if not isfolder(F1) then
                makefolder(F1)
            end
            if not isfolder(F2) then
                makefolder(F1.."\\"..F2)
            end
            writefile(F1.."\\"..F2.."\\"..L1, d)
        end
        if not isfolder(F3) then
            makefolder(F1.."\\"..F2.."\\"..F3)
        end
    end
end
function LoadSettings()
    local c = game:GetService("HttpService")
    if isfile(F1.."\\"..F2.."\\"..L1) then
        for i, v in pairs(c:JSONDecode(readfile(F1.."\\"..F2.."\\"..L1))) do
            if type(v) == "table" then 
                for i2, v2 in pairs(v) do
                    Settings[i][i2] = v2
                end
            else
                Settings[i] = v
            end
        end
    end
end
LoadSettings()
SaveSettings()

local t = {
    Objects = {},
    refs = {}
}
t.__index = t
setrawmetatable(function() end, t)

local objs = t.Objects
function t:New(props)
    local properties = setmetatable(props, t)
    
    local obj = setmetatable({connections = {}}, {
        __newindex = function(self2, prop, v)
            properties[prop] = v
            
            local connections = self2.connections
            if not connections[prop] then return end
            
            for _, v2 in next, connections[prop] do
                if t.refs[v2] then
                    task.spawn(v2)
                end
            end
        end,
        
        __index = properties
    })
    
    objs[obj] = obj
    
    return obj
end

function t:GetPropertyChangedSignal(prop, func)
    local connections = self.connections
    connections[prop] = connections[prop] or {}
    
    t.refs[func] = func
    
    local o = connections[prop]
    o[#o + 1] = func
    
    return func
end

function t:Disconnect()
    t.refs[self] = nil
end

function Thawed(v)
    if v:GetAttribute("IceFrozen") then
        table.insert(Frozen, v)
    end
    v:GetAttributeChangedSignal("IceFrozen"):Connect(function()
        if table.find(Frozen, v) and not v:GetAttribute("IceFrozen") then 
            table.remove(Frozen, table.find(Frozen, v))
        elseif not table.find(Frozen, v) and v:GetAttribute("IceFrozen") then
            table.insert(Frozen, v)
        end
    end)
end

GuiName = "Tower Blitz"
Theme = {
    ["Default"] = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(51, 175, 255)), ColorSequenceKeypoint.new(0.10, Color3.fromRGB(51, 113, 255)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(51, 52, 255)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(110, 51, 255)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(171, 51, 255)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(232, 51, 255)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(255, 51, 215)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(255, 51, 154)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(255, 51, 93)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 69, 51)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 130, 51))},
    ["Rainbow"] = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 88, 51)), ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 161, 51)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(255, 234, 51)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(201, 255, 51)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(128, 255, 51)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(54, 255, 51)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(51, 255, 120)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(51, 255, 194)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(51, 242, 255)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(51, 168, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(51, 95, 255))},
    ["Innovation"] = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(247, 225, 130)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(247, 225, 130))}
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Glowing-Red/Akrion/main/Exclusive/Re-Skinned/robloxscripts%20Library"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()

local Forums = Library.new(GuiName, Theme[Settings.Theme], Settings.Pos.Content, Settings.Pos.Shadow)

local Main = Forums:NewSection("Main")
local Map = Forums:NewSection("Map")
local Autofarm = Forums:NewSection("Macro")
local GuiSettings = Forums:NewSection("Settings")

local Player = game:GetService("Players").LocalPlayer

local Rs = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local plr = Players.LocalPlayer

Main:Seperator()
if game.PlaceId ~= 4739557376 then
    for i,v in next, game:GetService("Workspace").Game.Towers:GetChildren() do Thawed(v) end
    game:GetService("Workspace").Game.Towers.ChildAdded:Connect(function(v) Thawed(v) end)
end
Main:NewToggle("Auto Unfreeze", Settings.Main.Unfreeze, function(val)
    Settings.Main.Unfreeze = val
    SaveSettings()
    task.spawn(function()
        while wait() and Settings.Main.Unfreeze do
            if #Frozen > 0 then
                game:GetService("ReplicatedStorage").Events.UnfreezeTower:FireServer(Frozen[1]) 
            end
        end
    end)
end)
Main:Seperator()

Map:Seperator()
function GetMaps()
    local a = {}
    for b,c in pairs(Rs.MapInfo:GetChildren()) do
        local d = require(c)
        if not d.Unusable == true then
            a[c.Name] = d.Title
        end
    end
    return a
end

local Maps = GetMaps()

function GetMap(map)
    for a,b in pairs(Maps) do
        if b == map then
            return a
        end
    end
    return nil
end

Map:NewButton("Create", function()
    game:GetService("ReplicatedStorage").Events.StartServer:InvokeServer("Solo", "Invite")
end)
Map:NewDropdown("Chosen Map: ", Settings.Map.Map, Maps, function(map)
    Settings.Map.Map = map
    SaveSettings()
end)
Map:NewButton("Map", function()
    game:GetService("ReplicatedStorage").Events.UpdateMap:InvokeServer(GetMap(Settings.Map.Map))
end)
Map:NewButton("Start", function()
    game:GetService("ReplicatedStorage").Events.StartGame:InvokeServer()
end)
Map:Seperator()


Autofarm:Seperator()
local Macro = t:New({Name = "Default", Status = "Postponed", RU = ""})
function RecordMacro(Filename)
local FileName = Filename..".json"
local RecordedMacro = {
    ["Units"] = {},
    ["Recording"] = {}
}

function SaveRecording()
    local c = game:GetService("HttpService")
    local d = c:JSONEncode(RecordedMacro)
    if writefile then
        if isfolder(F1) and isfolder(F2) and isfolder(F3) then
            writefile(F1.."\\"..F2.."\\"..F3.."\\"..FileName, d)
        else
            if not isfolder(F1) then
                makefolder(F1)
            end
            if not isfolder(F2) then
                makefolder(F1.."\\"..F2)
            end
            if not isfolder(F3) then
                makefolder(F1.."\\"..F2.."\\"..F3)
            end
            writefile(F1.."\\"..F2.."\\"..F3.."\\"..FileName, d)
        end
    end
end

WatermarkCount = 0
game:GetService("Workspace").Game.Towers.ChildAdded:Connect(function(child)
    if child:WaitForChild("Configuration") and child.Configuration:WaitForChild("Owner").Value == game:GetService("Players").LocalPlayer then
        WatermarkCount = WatermarkCount + 1
        Watermark = Instance.new("NumberValue", child)
        Watermark.Value = WatermarkCount
        Watermark.Name = "Watermark"
    end
end)

task.spawn(function()
    while task.wait(1) do
        SaveRecording()
    end
end)

local Wave_Num = game:GetService("Workspace").Game.GameStats.Wave
local Wave_Time = game:GetService("Workspace").Game.GameStats.TimeLeft

local old
old = hookmetamethod(game,"__namecall",function(self,...)
    local method = getnamecallmethod()
    if method:lower() == "invokeserver" and not checkcaller() then
        local args = {...}
        if (tostring(self) == "PlaceTower") then
            if not table.find(RecordedMacro.Units, args[1]) then
                table.insert(RecordedMacro.Units, args[1])
            end
            table.insert(RecordedMacro.Recording, {type = "Place", Unit = args[1], Position = tostring(args[2]), Number = args[3]})
            return old(self,unpack(args))
        elseif (tostring(self) == "UpgradeTower") then
            table.insert(RecordedMacro.Recording, {type = "Upgrade", Unit = args[1].Watermark.Value, Path = args[2]})
            return old(self,unpack(args))
        elseif (tostring(self) == "SellTower") then
            table.insert(RecordedMacro.Recording, {type = "Sell", Unit = args[1].Watermark.Value, Wave = Wave_Num.Value, Time = Wave_Time.Value})
            return old(self, unpack(args))
        elseif (tostring(self) == "ChangeTargetting") then
            table.insert(RecordedMacro.Recording, {type = "Targetting", Unit = args[1].Watermark.Value, Targetting = args[2]})
            return old(self,unpack(args))
        end
    end
    return old(self,...)
end)
end

function LoadMacro(Filename)
local Events = game:GetService("ReplicatedStorage"):WaitForChild("Events")

local Place = Events:WaitForChild("PlaceTower")
local Upgrade = Events:WaitForChild("UpgradeTower")
local Sell = Events:WaitForChild("SellTower")
local Priority = Events:WaitForChild("ChangeTargetting")

local Money = game:GetService("Players").LocalPlayer:WaitForChild("Cash")

Step = 1
local RecordedMacro = {
    ["Units"] = {},
    ["Recording"] = {}
}

ChosenTower = nil
WatermarkCount = 0

local c = game:GetService("HttpService")

RecordedMacro = c:JSONDecode(readfile(Filename))

function tovector3(input)
    return Vector3.new(unpack(game:GetService('HttpService'):JSONDecode('['..input..']')))
end

game:GetService("Workspace").Game.Towers.ChildAdded:Connect(function(child)
    if child:WaitForChild("Configuration") and child.Configuration:WaitForChild("Owner").Value == game:GetService("Players").LocalPlayer then
        WatermarkCount = WatermarkCount + 1
        Watermark = Instance.new("NumberValue", child)
        Watermark.Value = WatermarkCount
        Watermark.Name = "Watermark"
    end
end)

function UpdateChosenTower(Number)
    if not ChosenTower == nil then
        return
    end
    for i, FolderTower in next, game:GetService("Workspace").Game.Towers:GetChildren() do
        if FolderTower:FindFirstChild("Watermark") then
            if FolderTower.Watermark.Value == Number then
                ChosenTower = FolderTower
                break
            else
                ChosenTower = nil
            end
        end
    end
end

local Wave_Num = game:GetService("Workspace").Game.GameStats.Wave
local Wave_Time = game:GetService("Workspace").Game.GameStats.TimeLeft

local TowersData = {}

for i,v in pairs(game:GetService("ReplicatedStorage").TowerStorage:GetChildren()) do
    TowerData = require(v)
    
    TowersData[TowerData.StarterStats.DisplayName] = TowerData
end

function CountUpgrades(tab)
    local upgrade = 0
    
    for i,v in pairs(tab) do
        upgrade = upgrade + 1
    end
    
    return upgrade
end

function UpgradePrice(tower, path)
    local upgrade = tower:GetAttribute("Path"..path.."Level") + 1
    if upgrade <= CountUpgrades(TowersData[tower.Name].UpgradeList["Path"..path]) then
        return TowersData[tower.Name].UpgradeList["Path"..path]["Upgrade"..upgrade].Price
    else
        return 0
    end
end

while wait(.25) do
    if Step >= #RecordedMacro.Recording + 1 then
        break
    end
    if RecordedMacro.Recording[Step].type == "Place" then
        if Money.Value >= TowersData[RecordedMacro.Recording[Step].Unit].StarterStats.Price then
            Place:InvokeServer(
                RecordedMacro.Recording[Step].Unit, 
                tovector3(RecordedMacro.Recording[Step].Position),
                RecordedMacro.Recording[Step].Number
            )
            Step = Step + 1
        end
    elseif RecordedMacro.Recording[Step].type == "Upgrade" then
        UpdateChosenTower(RecordedMacro.Recording[Step].Unit)
        if Money.Value >= UpgradePrice(ChosenTower, RecordedMacro.Recording[Step].Path) then
            Upgrade:InvokeServer(ChosenTower, RecordedMacro.Recording[Step].Path)
            ChosenTower = nil
            Step = Step + 1
        end
    elseif RecordedMacro.Recording[Step].type == "Sell" then
        UpdateChosenTower(RecordedMacro.Recording[Step].Unit)
        if Wave_Num.Value == RecordedMacro.Recording[Step].Wave then
            if Wave_Time.Value <= RecordedMacro.Recording[Step].Time then
                Sell:InvokeServer(ChosenTower)
                ChosenTower = nil
                Step = Step + 1
            end
        elseif Wave_Num.Value > RecordedMacro.Recording[Step].Wave then
            Sell:InvokeServer(ChosenTower)
            Step = Step + 1
        end
    elseif RecordedMacro.Recording[Step].type == "Targetting" then
        UpdateChosenTower(RecordedMacro.Recording[Step].Unit)
        Priority:InvokeServer(ChosenTower, RecordedMacro.Recording[Step].Targetting)
        Step = Step + 1
    end
end
end

if getgenv().Autofarm and not getgenv().Recording then
    Macro.Status = "Playing"
elseif getgenv().Recording then
    Macro.Status = "Recording"
end
Autofarm:NewButton("Play Macro", function()
    getgenv().Autofarm = true
    if not getgenv().Recording then
        if game.PlaceId ~= 8349889591 then
            Macro.Status = "Playing"
            task.spawn(LoadMacro, Settings.Autofarm.path)
        end
    end
end)
Autofarm:NewToggle("Auto Play", Settings.Autofarm.Activated, function(status)
    Settings.Autofarm.Activated = status
    SaveSettings()
    if not getgenv().Autofarm and not getgenv().Recording then
        if game.PlaceId ~= 8349889591 then
            getgenv().Autofarm = true
            Macro.Status = "Playing"
            task.spawn(LoadMacro, Settings.Autofarm.path)
        end
    end
end)
Autofarm:Seperator()
local RequiredUnitsTab = {
    ["Units"] = {},
    ["Recording"] = {}
}
if isfile(Settings.Autofarm.path) then
    RequiredUnitsTab = game:GetService("HttpService"):JSONDecode(readfile(Settings.Autofarm.path))
end

function UpdateReqUnits()
    ReqUnits = ""
    RUC = 1
    for i,v in next, RequiredUnitsTab.Units do
        if RUC == 1 then
            ReqUnits = ReqUnits..v
            RUC = RUC+1
        elseif RUC >= 2 and RUC < #RequiredUnitsTab.Units then
            ReqUnits = ReqUnits..",  "..v
            RUC = RUC+1
        elseif RUC == #RequiredUnitsTab.Units then
            ReqUnits = ReqUnits..",  "..v.."."
            RUC = RUC+1
        end
    end
    Macro.RU = ReqUnits
end
UpdateReqUnits()

MacroStatus = Autofarm:NewLabel("Status:  "..Macro.Status)
RUStatus = Autofarm:NewLabel("Required Units:  "..Macro.RU)

Macro:GetPropertyChangedSignal("Status", function()
    MacroStatus:Update("Status:  "..Macro.Status)
end)
Macro:GetPropertyChangedSignal("RU", function()
    RUStatus:Update("Required Units:  "..Macro.RU)
end)

Autofarm:Seperator()
Autofarm:NewButton("Record Macro", function()
    if not getgenv().Recording and not getgenv().Autofarm then
        getgenv().Recording = true
        getgenv().Autofarm = true
        task.spawn(RecordMacro, Macro.Name)
        Macro.Status = "Recording"
    end
end)
ChangeMacroName = Autofarm:NewTextBox("Macro Name:  "..Macro.Name, function(ChosenName)
    if not isfile(F1.."\\".. F2.."\\".. F3.."\\"..ChosenName..".json") then
        Macro.Name = ChosenName
    end
end)
Macro:GetPropertyChangedSignal("Name", function()
    ChangeMacroName:Update("Macro Name:  "..Macro.Name)
end)
local Macros = listfiles(F1.."\\".. F2.."\\".. F3)
Autofarm:Seperator()
if not isfile(Settings.Autofarm.path) then
    Settings.Autofarm.path = "None"
end
local FilesDrop = Autofarm:NewDropdown("Chosen File:  ", Settings.Autofarm.path, Macros, function(path)
    Settings.Autofarm.path = tostring(path)
    RequiredUnitsTab = game:GetService("HttpService"):JSONDecode(readfile(Settings.Autofarm.path))
    UpdateReqUnits()
    SaveSettings()
end)
Autofarm:NewButton("Refresh Files", function()
    FilesDrop:Refresh(listfiles(F1.."\\"..F2.."\\"..F3))
end)
Autofarm:NewButton("Delete File", function()
    delfile(Settings.Autofarm.path)
    Settings.Autofarm.path = "None"
    Macros = listfiles(F1.."\\".. F2.."\\".. F3)
    FilesDrop:Refresh(listfiles(F1.."\\"..F2.."\\"..F3))
end)
Autofarm:Seperator()

GuiSettings:Seperator()
local Gui = game:GetService("CoreGui"):WaitForChild(GuiName)
local Content = Gui.Content
local Shadow = Gui.shadow
GuiSettings:NewButton("Save Position", function()
    Settings.Pos.Content = tostring(Content.Position)
    Settings.Pos.Shadow = tostring(Shadow.Position)
    SaveSettings()
end)
Themes = {
    "Default",
    "Rainbow",
    "Innovation"
}
GuiSettings:NewDropdown("Theme:  ", Settings.Theme, Themes, function(Option)
    for i,v in pairs(game:GetService("CoreGui")[GuiName]:GetDescendants()) do
        if v:IsA("UIGradient") then
            v.Color = Theme[Option]
            getgenv().ThemeSequence = Theme[Option]
        end
    end
    wait()
    for i,v in pairs(game:GetService("CoreGui")[GuiName]:GetDescendants()) do
        if v:IsA("TextLabel") and v.Name == "btnText" then
            if Theme[v.Text] then
                v.Parent.UIGradient.Color = Theme[v.Text]
            end
        end
    end
    Settings.Theme = Option
    SaveSettings()
end)

for i,v in pairs(game:GetService("CoreGui")[GuiName]:GetDescendants()) do
    if v:IsA("TextLabel") and v.Name == "btnText" then
        if Theme[v.Text] then
            v.Parent.UIGradient.Color = Theme[v.Text]
        end
    end
end
GuiSettings:Seperator()


Notification:SendNotification("Success", ("Toga's \"Tower Blitz\" has been successfully loaded, it took a total of %.2f Seconds."):format(tick() - Start), 12)
