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
elseif game.GameId ~= 210851291 then
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

local QMaker = Workshop:WaitForChild("QuestMakerEvent")
local Claim = Workshop:WaitForChild("ClaimRiverResultsGold")

local Plr = Players.LocalPlayer
local Char = Plr.Character

local Settings,Quests = {
    Main = {
        Autofarm = false,
        Delay = 6
    }
},{
    Active = {
        [1] = "Cloud",
        [2] = "Target",
        [3] = "Ramp",
        [4] = "Find Me",
        [5] = "Dragon",
        [6] = "The Box",
        [8] = "Soccer",
        [9] = "Thin Ice"
    },
    Other = {
        [99] = "Gift Battle",
        [100] = "The Boss",
        [101] = "Invasion"
    }
}

local Library = loadstring(syn.request({Url = "https://raw.githubusercontent.com/Glowing-Red/Roblox/main/Libraries/SynapseV3.lua"}).Body)()

local Window = Library:MakeWindow({
    Name = "Build A Boat For Treasure",
    CanResize = true
})
local Main = Window:AddTab({Name = "Autofarm"})
local Quest = Window:AddTab({Name = "Quests"})

local infarm = false
local cancelled = false

local function farm()
    infarm = true

    local platform = Instance.new("Part", Char)
    platform.Anchored = true
    platform.Transparency = 1
    platform.Size = Vector3.new(6, 1, 6)

    local connection
    connection = game:GetService("RunService").RenderStepped:connect(function()
        if Char:FindFirstChild("HumanoidRootPart") then
            platform.Position = Char.HumanoidRootPart.CFrame * Vector3.new(0, -3.5, 0)
        else
            connection:Disconnect()
        end
    end)

    task.spawn(function()
        task.wait(2)
        firetouchinterest(Char.HumanoidRootPart, workspace.BoatStages.NormalStages.TheEnd.GoldenChest.Trigger, 0)
    end)
    
    for i=1,10 do
        if cancelled then 
            return 
        else
            Char.HumanoidRootPart.CFrame = workspace.BoatStages.NormalStages["CaveStage" .. i].DarknessPart.CFrame + Vector3.new(0, -30, 0)
            
            task.wait(1)

            if workspace.BoatStages.NormalStages:FindFirstChild("CaveStage" .. i + 1) and Char:FindFirstChild("HumanoidRootPart") then
                Char.HumanoidRootPart.CFrame = workspace.BoatStages.NormalStages["CaveStage" .. i + 1].DarknessPart.CFrame + Vector3.new(0, -30, -20)
            end
        
            task.wait(0.5)
        end
    end

    infarm = false
end

Main:AddToggle({Name = "Autofarm", Default = Settings.Main.AutoReload, Callback = function(val)
    Settings.Main.Autofarm = val
    cancelled = not val
    if Settings.Main.Autofarm then
        if not infarm then
            farm()
        end
    end
end})
Main:AddSlider({Name = "Delay", Min = 5, Max = 10, Default = Settings.Main.Delay, Callback = function(val)
    Settings.Main.Delay = val
end})
Plr.CharacterAdded:Connect(function(char)
    Char = char
    if Settings.Main.Autofarm then
        Claim:FireServer()
        task.wait(Settings.Main.Delay)
        farm()
    end
end)
Main:AddSeperator()

local Team = Quest:AddLabel(("Team: %s"):format(tostring(Plr.Team)))
local Status = Quest:AddLabel(("Status: %s"):format(tostring(Plr.Team.TeamLeader.Value == Plr.Name and "Leader" or "Member")))
local ChallengeLabel = Quest:AddLabel(("Challenge: %s"):format(tostring(Workshop:WaitForChild(tostring(tostring(Plr.TeamColor).."Zone")) and Quests.Active[Workshop[tostring(tostring(Plr.TeamColor).."Zone")]:WaitForChild("QuestNum").Value] or Quests.Other[Workshop[tostring(tostring(Plr.TeamColor).."Zone")].QuestNum.Value] or Workshop[tostring(tostring(Plr.TeamColor).."Zone")]:WaitForChild("QuestNum").Value == 0 and "None" or ("\"%s\""):format(Workshop[tostring(tostring(Plr.TeamColor).."Zone")]:WaitForChild("QuestNum").Value))))
local Cancel = Quest:AddButton({Name = "Cancel", Visible = Plr.Team.TeamLeader.Value == Plr.Name and Workshop[tostring(tostring(Plr.TeamColor).."Zone")]:WaitForChild("QuestNum").Value ~= 0, Callback = function()
    QMaker:FireServer(0)
end})
function UpdateChallenge()
    ChallengeLabel:UpdateLabel(("Challenge: %s"):format(tostring(Workshop:WaitForChild(tostring(tostring(Plr.TeamColor).."Zone")) and Quests.Active[Workshop[tostring(tostring(Plr.TeamColor).."Zone")]:WaitForChild("QuestNum").Value] or Quests.Other[Workshop[tostring(tostring(Plr.TeamColor).."Zone")].QuestNum.Value] or Workshop[tostring(tostring(Plr.TeamColor).."Zone")]:WaitForChild("QuestNum").Value == 0 and "None" or ("\"%s\""):format(Workshop[tostring(tostring(Plr.TeamColor).."Zone")]:WaitForChild("QuestNum").Value))))
    Cancel:UpdateVisible(Plr.Team.TeamLeader.Value == Plr.Name and Workshop[tostring(tostring(Plr.TeamColor).."Zone")]:WaitForChild("QuestNum").Value ~= 0)
end
local ChallengeConnection = Workshop[tostring(tostring(Plr.TeamColor).."Zone")].QuestNum:GetPropertyChangedSignal("Value"):Connect(UpdateChallenge)
Plr:GetPropertyChangedSignal("Team"):Connect(function()
    Team:UpdateLabel(("Team: %s"):format(tostring(Plr.Team)))
    Status:UpdateLabel(("Status: %s"):format(tostring(Plr.Team.TeamLeader.Value == Plr.Name and "Leader" or "Member")))
    ChallengeConnection:Disconnect()
    UpdateChallenge()
    ChallengeConnection = Workshop[tostring(tostring(Plr.TeamColor).."Zone")].QuestNum:GetPropertyChangedSignal("Value"):Connect(UpdateChallenge)
end)
Quest:AddSeperator()
for i,v in pairs(Quests.Active) do
    Quest:AddButton({Name = v, Callback = function()
        if Plr.Team.TeamLeader.Value == Plr.Name then
            QMaker:FireServer(i)
        else
            Library:SendNotification({
                Title = "Error",
                Content = "You need to be team leader to initiate a quest!",
                Duration = 5,
                Type = 3
            })
        end
    end})
end
Quest:AddSeperator()
for i,v in pairs(Quests.Other) do
    Quest:AddButton({Name = v, Callback = function()
        if Plr.Team.TeamLeader.Value == Plr.Name then
            QMaker:FireServer(i)
        else
            Library:SendNotification({
                Title = "Error",
                Content = "You need to be team leader to initiate a quest!",
                Duration = 5,
                Type = 3
            })
        end
    end})
end
Quest:AddSeperator()

Library:Init()

Library:SendNotification({
    Title = "Menu Loaded!",
    Content = ("Toga's \"Build A Boat For Treasure\" has been successfully loaded, it took a total of %.2f Seconds."):format(tick() - Start),
    Duration = 15,
    Type = 1
})
