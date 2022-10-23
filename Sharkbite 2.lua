_G.Settings = {
    Malicious = {
        HitMultiplierStatus = false,
        HitMultiplier = 1
    },
    SharkESP = {
        Status = false,
        FillColour = "1, 1, 1",
        FillTransparency = 1,
        OutlineColour = "1, 0, 0",
        OutlineTransparency = 0
    },
    PlayerESP = {
        Status = false,
        FillColour = "1, 1, 1",
        FillTransparency = 1,
        OutlineColour = "0, 1, 0",
        OutlineTransparency = 0
    }
}

local F1 = "Toga ™"
local F2 = "Sharkbite 2"
local L1 = "Settings.lua"
function SaveSettings()
    local c = game:GetService("HttpService")
    local d = c:JSONEncode(_G.Settings)
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
    end
end
function LoadSettings()
    local c = game:GetService("HttpService")
    if isfile(F1.."\\"..F2.."\\"..L1) then
        for i, v in pairs(c:JSONDecode(readfile(F1.."\\"..F2.."\\"..L1))) do
            if type(v) == "table" then 
                for i2, v2 in pairs(v) do
                    _G.Settings[i][i2] = v2
                end
            else
                _G.Settings[i] = v
            end
        end
    end
end
LoadSettings()
SaveSettings()

local a = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local b = a:MakeWindow({Name = "Unnamed", HidePremium = true})

local M = b:MakeTab({Name = "Malicious", PremiumOnly = false})
local S = b:MakeTab({Name = "Shark ESP", PremiumOnly = false})
local V = b:MakeTab({Name = "Survivor ESP", PremiumOnly = false})

local Chams = Instance.new("Folder")
Chams.Name = "Chams"
Chams.Parent = game.CoreGui

local Scham = {}
local Pcham = {}

function tocolor3(input)
    return Color3.new(unpack(game:GetService('HttpService'):JSONDecode('['..input..']')))
end

local function PlrCham(properties, tab)
    local ESP = Instance.new("Highlight", Chams)
    if _G.Settings.PlayerESP.Status == false then
        ESP.Enabled = false
    end
    
    ESP.Name = properties.Object.Name
    ESP.FillColor = properties.FillColor
    ESP.FillTransparency = properties.FillTransparency
    ESP.OutlineColor = properties.OutlineColor
    ESP.OutlineTransparency = properties.OutlineTransparency
    ESP.Adornee = properties.Object
    
    tab[properties.Plr] = ESP
end

local Players = game:GetService("Players")
local Teams = game:GetService("Teams")

for _, Plr in pairs(Players:GetPlayers()) do
    if Plr ~= Players.LocalPlayer then
        if Plr.Team == Teams["Survivor"] then
            repeat wait() until Plr.Character
            PlrCham({
                ["Plr"] = Plr,
                ["Object"] = Plr.Character,
                ["FillColor"] = tocolor3(_G.Settings.PlayerESP.FillColour),
                ["FillTransparency"] = _G.Settings.PlayerESP.FillTransparency,
                ["OutlineColor"] = tocolor3(_G.Settings.PlayerESP.OutlineColour),
                ["OutlineTransparency"] = _G.Settings.PlayerESP.OutlineTransparency
            }, Pcham) 
        end
        Plr:GetPropertyChangedSignal("Team"):Connect(function()
            if Plr.Team == Teams["Survivor"] then
                repeat wait() until Plr.Character
                PlrCham({
                    ["Plr"] = Plr,
                    ["Object"] = Plr.Character,
                    ["FillColor"] = tocolor3(_G.Settings.PlayerESP.FillColour),
                    ["FillTransparency"] = _G.Settings.PlayerESP.FillTransparency,
                    ["OutlineColor"] = tocolor3(_G.Settings.PlayerESP.OutlineColour),
                    ["OutlineTransparency"] = _G.Settings.PlayerESP.OutlineTransparency
                }, Pcham) 
            else
                if Pcham[Plr] ~= nil then
                    Pcham[Plr]:Destroy()
                    Pcham[Plr] = nil
                end
            end
        end)
    end
end

Players.PlayerAdded:Connect(function(Plr)
    Plr:GetPropertyChangedSignal("Team"):Connect(function()
        if Plr.Team == Teams["Survivor"] then
            repeat wait() until Plr.Character
            PlrCham({
                ["Plr"] = Plr,
                ["Object"] = Plr.Character,
                ["FillColor"] = tocolor3(_G.Settings.PlayerESP.FillColour),
                ["FillTransparency"] = _G.Settings.PlayerESP.FillTransparency,
                ["OutlineColor"] = tocolor3(_G.Settings.PlayerESP.OutlineColour),
                ["OutlineTransparency"] = _G.Settings.PlayerESP.OutlineTransparency
            }, Pcham) 
        else
            if Pcham[Plr] ~= nil then
                Pcham[Plr]:Destroy()
                Pcham[Plr] = nil
            end
        end
    end)
end)

Players.PlayerRemoving:Connect(function(Plr)
	if Pcham[Plr] ~= nil then
	    Pcham[Plr]:Destroy()
        Pcham[Plr] = nil
    end
end)

local function SharkCham(properties, tab)
    local ESP = Instance.new("Highlight", Chams)
    if _G.Settings.SharkESP.Status == false then
        ESP.Enabled = false
    end
    
    ESP.Name = properties.Object.Name
    ESP.FillColor = properties.FillColor
    ESP.FillTransparency = properties.FillTransparency
    ESP.OutlineColor = properties.OutlineColor
    ESP.OutlineTransparency = properties.OutlineTransparency
    ESP.Adornee = properties.Object
    table.insert(tab, ESP)
    properties.Object.AncestryChanged:Connect(function()
        table.remove(tab, table.find(tab, tab))
        ESP:Destroy()
    end)
end

for _, shark in pairs(game:GetService("Workspace").Sharks:GetChildren()) do 
    SharkCham(
        {
        ["Object"] = shark,
        ["FillColor"] = tocolor3(_G.Settings.SharkESP.FillColour),
        ["FillTransparency"] = _G.Settings.SharkESP.FillTransparency,
        ["OutlineColor"] = tocolor3(_G.Settings.SharkESP.OutlineColour),
        ["OutlineTransparency"] = _G.Settings.SharkESP.OutlineTransparency
        },
        Scham
    ) 
end

game:GetService("Workspace").Sharks.ChildAdded:Connect(function(shark)
    repeat wait() until shark:WaitForChild("SharkMain")
    repeat wait() until shark.SharkMain:WaitForChild("Mesh")
    repeat wait() until shark.SharkMain.Mesh:WaitForChild("Shark")
    SharkCham(
        {
        ["Object"] = shark,
        ["FillColor"] = tocolor3(_G.Settings.SharkESP.FillColour),
        ["FillTransparency"] = _G.Settings.SharkESP.FillTransparency,
        ["OutlineColor"] = tocolor3(_G.Settings.SharkESP.OutlineColour),
        ["OutlineTransparency"] = _G.Settings.SharkESP.OutlineTransparency
        },
        Scham
    )
end)

local old
old = hookmetamethod(game, "__namecall", function(self,...)
    local method = getnamecallmethod()
    if method:lower() == "fireserver" then
        local args = {...}
        if (tostring(self) == "HitScanHitReg") then
            if _G.Settings.Malicious.HitMultiplierStatus == true then
                for C = 1, _G.Settings.Malicious.HitMultiplier do
                    old(self, unpack(args))
                end
                return
            else
                return old(self, unpack(args))
            end
        end
    end
    return old(self,...)
end)





--Malicious
M:AddToggle({
	Name = "Multiplier Toggle",
    Default = _G.Settings.Malicious.HitMultiplierStatus,
    Callback = function(H)
        _G.Settings.Malicious.HitMultiplierStatus = H
        SaveSettings()
    end  
})
M:AddSlider({
	Name = "Hit Multiplier",
	Min = 1,
	Max = 100,
	Default = _G.Settings.Malicious.HitMultiplier,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(H)
		_G.Settings.Malicious.HitMultiplier = H
        SaveSettings()
	end    
})





--Shark ESP
S:AddToggle({
    Name = "Toggle",
    Default = _G.Settings.SharkESP.Status,
    Callback = function(H)
        _G.Settings.SharkESP.Status = H
        for _, Cham in pairs(Scham) do
            if _G.Settings.SharkESP.Status == true then
                Cham.Enabled = true
            elseif _G.Settings.SharkESP.Status == false then
                Cham.Enabled = false
            end
        end
        SaveSettings()
    end
})

S:AddColorpicker({
	Name = "FillColour",
	Default = tocolor3(_G.Settings.SharkESP.FillColour),
	Callback = function(Colour)
	    _G.Settings.SharkESP.FillColour = tostring(Colour)
	    for _, Cham in pairs(Scham) do
            Cham.FillColor = tocolor3(_G.Settings.SharkESP.FillColour)
	    end
	    SaveSettings()
	end	  
})
S:AddSlider({
	Name = "FillTransparency",
	Min = 0,
	Max = 1,
	Default = _G.Settings.SharkESP.FillTransparency,
	Color = Color3.fromRGB(255,255,255),
	Increment = 0.1,
	Callback = function(transparency)
		_G.Settings.SharkESP.FillTransparency = math.round(transparency * 100)/100
        for _, Cham in pairs(Scham) do
            Cham.FillTransparency = _G.Settings.SharkESP.FillTransparency
        end
        SaveSettings()
	end    
})

S:AddColorpicker({
	Name = "OutlineColour",
	Default = tocolor3(_G.Settings.SharkESP.OutlineColour),
	Callback = function(Colour)
	    _G.Settings.SharkESP.OutlineColour = tostring(Colour)
	    for _, Cham in pairs(Scham) do
            Cham.OutlineColor = tocolor3(_G.Settings.SharkESP.OutlineColour)
	    end
	    SaveSettings()
	end	  
})
S:AddSlider({
	Name = "OutlineTransparency",
	Min = 0,
	Max = 1,
	Default = _G.Settings.SharkESP.OutlineTransparency,
	Color = Color3.fromRGB(255,255,255),
	Increment = 0.1,
	Callback = function(transparency)
        _G.Settings.SharkESP.OutlineTransparency = math.round(transparency * 100)/100
        for _, Cham in pairs(Scham) do
            Cham.OutlineTransparency = _G.Settings.SharkESP.OutlineTransparency
        end
        SaveSettings()
    end
})





--Survivor ESP
V:AddToggle({
    Name = "Toggle",
    Default = _G.Settings.PlayerESP.Status,
    Callback = function(H)
        _G.Settings.PlayerESP.Status = H
        for _, Cham in pairs(Pcham) do
            if _G.Settings.PlayerESP.Status == true then
                Cham.Enabled = true
            elseif _G.Settings.PlayerESP.Status == false then
                Cham.Enabled = false
            end
        end
        SaveSettings()
    end
})

V:AddColorpicker({
	Name = "FillColour",
	Default = tocolor3(_G.Settings.PlayerESP.FillColour),
	Callback = function(Colour)
	    _G.Settings.PlayerESP.FillColour = tostring(Colour)
	    for _, Cham in pairs(Pcham) do
            Cham.FillColor = tocolor3(_G.Settings.PlayerESP.FillColour)
	    end
	    SaveSettings()
	end	  
})
V:AddSlider({
	Name = "FillTransparency",
	Min = 0,
	Max = 1,
	Default = _G.Settings.PlayerESP.FillTransparency,
	Color = Color3.fromRGB(255,255,255),
	Increment = 0.1,
	Callback = function(transparency)
		_G.Settings.PlayerESP.FillTransparency = math.round(transparency * 100)/100
        for _, Cham in pairs(Pcham) do
            Cham.FillTransparency = _G.Settings.PlayerESP.FillTransparency
        end
        SaveSettings()
	end    
})

V:AddColorpicker({
	Name = "OutlineColour",
	Default = tocolor3(_G.Settings.PlayerESP.OutlineColour),
	Callback = function(Colour)
	    _G.Settings.PlayerESP.OutlineColour = tostring(Colour)
	    for _, Cham in pairs(Pcham) do
            Cham.OutlineColor = tocolor3(_G.Settings.PlayerESP.OutlineColour)
	    end
	    SaveSettings()
	end	  
})
V:AddSlider({
	Name = "OutlineTransparency",
	Min = 0,
	Max = 1,
	Default = _G.Settings.PlayerESP.OutlineTransparency,
	Color = Color3.fromRGB(255,255,255),
	Increment = 0.1,
	Callback = function(transparency)
        _G.Settings.PlayerESP.OutlineTransparency = math.round(transparency * 100)/100
        for _, Cham in pairs(Pcham) do
            Cham.OutlineTransparency = _G.Settings.PlayerESP.OutlineTransparency
        end
        SaveSettings()
    end
})
