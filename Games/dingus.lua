--// Services
local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local CS = game:GetService("CollectionService")

--// Variables
local Plr = Players.LocalPlayer
local Character = Plr.Character or Plr.CharacterAdded:Wait()
local Remotes = RS:WaitForChild("Remotes")

--// Modules
local Config = require(RS:WaitForChild("config"))
local GhostRender = require(RS:WaitForChild("Client"):WaitForChild("GhostRender"))

--// Additional
local PId,GId,JId = game.PlaceId,game.GameId,game.JobId
local Library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()
Plr.CharacterAdded:Connect(function(Char)
	Character = Char
end)



--// Tabs
local Dingus = Library:CreateWindow({
    Name = "Dingus",
})
local Hider = Dingus:CreateTab({
    Name = "Hider"
})
local Hunter = Dingus:CreateTab({
    Name = "Hunter"
})
local Serverhop = Dingus:CreateTab({
    Name = "Serverhop"
})


--// Hider Sections
local HiderRisky = Hider:CreateSection({
    Name = "Risky"
})
local HiderMisc = Hider:CreateSection({
    Name = "Miscellaneous"
})

--// Hunter Sections
local HunterRisky = Hunter:CreateSection({
    Name = "Risky"
})
local HunterMisc = Hunter:CreateSection({
    Name = "Miscellaneous"
})

--// Serverhop Sections
local ServerhopOptions = Serverhop:CreateSection({
    Name = "Modes"
})



--// Hider Functions
HiderRisky:AddButton({
    Name = "Complete Tasks",
    Callback = function()
        for i,v in pairs(Remotes.RequestTaskList:InvokeServer()) do
    		if v.TaskRequired and not v.Completed then
				Remotes.InvokeTaskCompleted:InvokeServer(v.TaskId)
			end
		end
    end
})

HiderRisky:AddButton({
    Name = "Complete Non-Essential Tasks",
    Callback = function()
        for i,v in pairs(Remotes.RequestTaskList:InvokeServer()) do
    		if not v.TaskRequired and not v.Completed and v.TaskType ~= "GREEN" then
				Remotes.InvokeTaskCompleted:InvokeServer(v.TaskId)
			end
		end
    end
})

HiderRisky:AddButton({
    Name = "Complete All Tasks",
    Callback = function()
        for i,v in pairs(Remotes.RequestTaskList:InvokeServer()) do
    		if not v.Completed and v.TaskType ~= "GREEN" then
				Remotes.InvokeTaskCompleted:InvokeServer(v.TaskId)
			end
		end
    end
})

HiderMisc:AddButton({
    Name = "Hidden Animations",
    Callback = function()
		local Humanoid = Character:FindFirstChild("Humanoid")
		if Humanoid then
        	Humanoid.AnimationPlayed:Connect(function(a)
				if not table.find({"Animation1","WalkAnim","RunAnim"}, a.Animation.Name) then
					for i,v in pairs(Humanoid.Animator:GetPlayingAnimationTracks()) do			
						v:Stop()
					end
				end
			end)
		end
    end
})

HiderMisc:AddButton({
    Name = "Change Shirt",
    Callback = function()
        for i,v in pairs(Remotes.RequestTaskList:InvokeServer()) do
    		if v.TaskDescriptor == "Change shirt color" then
				Remotes.InvokeTaskCompleted:InvokeServer(v.TaskId)
				return
    		end
		end
    end
})

HiderMisc:AddButton({
    Name = "Travel to Hideout",
    Callback = function()
        for i,v in pairs(Remotes.RequestTaskList:InvokeServer()) do
    		if v.TaskDescriptor == "Enter hideout" then
				if v.TaskParent:FindFirstChild("TeleportPoint") then
					Remotes.InvokeTaskCompleted:InvokeServer(v.TaskId)
					Character.HumanoidRootPart.CFrame = v.TaskParent.TeleportPoint.CFrame
					return
				end
    		end
		end
    end
})




--// Hunter Functions
HunterRisky:AddButton({
    Name = "Kill All",
    Callback = function()
        for i,v in pairs(Players:GetChildren()) do
            if v ~= Plr then
                Remotes.KillCharacter:InvokeServer(v.Character)
            end
        end
    end
})

HunterMisc:AddToggle({
    Name = "No Shoot Cooldown",
    Callback = function(v)
		Config.HUNTER_FIRE_COOLDOWN_EXTRA = v and 0 or 1.25
    end
})

HunterMisc:AddToggle({
    Name = "No Blindness",
    Callback = function(v)
		Config.HUNTER_MISS_BLIND_TIME = v and 0 or 12
    end
})

HunterMisc:AddButton({
    Name = "Highlight Hiders",
    Callback = function()
        for i,v in pairs(Players:GetChildren()) do
            if v ~= Plr and v.Character then
				local Char = v.Character
				if Char:FindFirstChild("NameDisplay") and Char:FindFirstChild("Torso") and not Char.Torso.Transparency == 1 then
					Char:FindFirstChild("NameDisplay").Enabled = true
				end
				if Char:FindFirstChild("PlayerOutline") then
					Char:FindFirstChild("PlayerOutline").Enabled = true
				end
				if Char:FindFirstChild("Torso") and Char.Torso.Transparency == 1 then
					--GhostRender.MakeGhost(v)
				end
            end
        end
    end
})

HunterMisc:AddButton({
    Name = "Reveal Tasks",
    Callback = function()
		print()
		print("// Tasks:")
		for i,v in pairs(Remotes.RequestTaskList:InvokeServer()) do
    		if v.TaskRequired and not v.Completed and v.TaskType ~= "RED" then
				print((" %s | %s"):format(v.TaskName, v.TaskDescriptor))
			end
		end
		for i,v in pairs(Remotes.RequestTaskList:InvokeServer()) do
    		if v.TaskRequired and not v.Completed and v.TaskType == "RED" then
				print((" [!] %s | %s"):format(v.TaskName, v.TaskDescriptor))
			end
		end
		print("//")
    end
})



--// Serverhop Functions
function ListServers(servers,cursor)
   	local Raw = game:HttpGet(servers .. ((cursor and "&cursor="..cursor) or ""))
   	return Http:JSONDecode(Raw)
end

function ServerTP(v)
	v = v or "Rejoin"
	if v == "Rejoin" then
		pcall(TPS.TeleportToPlaceInstance, TPS, PId, JId, Plr)
	elseif v == "Serverhop" then
		local Next; 
		repeat
   			local Servers = ListServers(("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Desc&limit=100"):format(PId), Next)
   			for i,v in next, Servers.data do
       			if v.playing < v.maxPlayers and v.id ~= JId then
        		   	local s,r = pcall(TPS.TeleportToPlaceInstance, TPS, PId, v.id, Plr)
           			if s then
						break
					end
       			end
   			end
   			Next = Servers.nextPageCursor
		until not Next
	elseif v == "Lowest" then
		local Server, Next; 
		repeat
   			local Servers = ListServers(("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100"):format(PId), Next)
   			Server = Servers.data[1]
   			Next = Servers.nextPageCursor
		until Server
		TPS:TeleportToPlaceInstance(PId, Server.id, Plr)
	elseif v == "Highest" then
		local Server, Next; 
		repeat
			local Servers = ListServers(("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Desc&limit=100"):format(PId), Next)
			if Servers.data[1].playing < Servers.data[1].maxPlayers then
				Server = Servers.data[1]
			end
   			Next = Servers.nextPageCursor
		until Server
		TPS:TeleportToPlaceInstance(PId, Server.id, Plr)
	end
end

ServerhopOptions:AddButton({
    Name = "Rejoin",
    Callback = function()
        ServerTP("Rejoin")
    end
})

ServerhopOptions:AddButton({
    Name = "Serverhop",
    Callback = function()
        ServerTP("Serverhop")
    end
})

ServerhopOptions:AddButton({
    Name = "Join Lowest Server",
    Callback = function()
        ServerTP("Lowest")
    end
})

ServerhopOptions:AddButton({
    Name = "Join Highest Server",
    Callback = function()
        ServerTP("Highest")
    end
})
