local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")

local Plr = Players.LocalPlayer
local Character = Plr.Character or Plr.CharacterAdded:Wait()
local Remotes = RS:WaitForChild("Remotes")

local PId,GId,JId = game.PlaceId,game.GameId,game.JobId

local Library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()
local Wait = Library.subs.Wait
local Config = require(RS:WaitForChild("config"))


local a = Library:CreateWindow({
    Name = "Dingus",
})
local b = a:CreateTab({
    Name = "Hider"
})
local c = a:CreateTab({
    Name = "Hunter"
})
local d = a:CreateTab({
    Name = "Miscellaneous"
})


local Hider = b:CreateSection({
    Name = "Hider"
})
local Hunter = c:CreateSection({
    Name = "Hunter"
})
local Miscellaneous = d:CreateSection({
    Name = "Miscellaneous"
})



Hider:AddButton({
    Name = "Complete Tasks",
    Callback = function()
        for i,v in pairs(Remotes.RequestTaskList:InvokeServer()) do
    		if v.TaskRequired and not v.Completed then
				Remotes.InvokeTaskCompleted:InvokeServer(v.TaskId)
			end
		end
    end
})

Hider:AddButton({
    Name = "Change Shirt",
    Callback = function()
        for i,v in pairs(Remotes.RequestTaskList:InvokeServer()) do
    		if v.TaskDescriptor == "Change shirt color" then
				Remotes.InvokeTaskCompleted:InvokeServer(v.TaskId)
    		end
		end
    end
})





Hunter:AddButton({
    Name = "kill all",
    Callback = function()
        for i,v in pairs(Players:GetChildren()) do
            if v ~= Plr then
                Remotes.KillCharacter:InvokeServer(v.Character)
            end
        end
    end
})

Hunter:AddToggle({
    Name = "No Shoot Cooldown",
    Callback = function(v)
		Config.HUNTER_FIRE_COOLDOWN_EXTRA = v and 0 or 1.25
    end
})

Hunter:AddToggle({
    Name = "No Blindness",
    Callback = function(v)
		Config.HUNTER_MISS_BLIND_TIME = v and 0 or 12
    end
})

Hunter:AddButton({
    Name = "View All",
    Callback = function()
        for i,v in pairs(Players:GetChildren()) do
            if v ~= Plr and v.Character then
				if v.Character:FindFirstChild("NameDisplay") then
					v.Character:FindFirstChild("NameDisplay").Enabled = true
				end
				if v.Character:FindFirstChild("PlayerOutline") then
					v.Character:FindFirstChild("PlayerOutline").Enabled = true
				end
            end
        end
    end
})




function ListServers(servers,cursor)
   	local Raw = game:HttpGet(servers .. ((cursor and "&cursor="..cursor) or ""))
   	return Http:JSONDecode(Raw)
end

function ServerTP(v)
	v = v or "Serverhop"
	if v == "Serverhop" then
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

Miscellaneous:AddButton({
    Name = "Serverhop",
    Callback = function()
        ServerTP("Serverhop")
    end
})

Miscellaneous:AddButton({
    Name = "Join Lowest Server",
    Callback = function()
        ServerTP("Lowest")
    end
})

Miscellaneous:AddButton({
    Name = "Join Highest Server",
    Callback = function()
        ServerTP("Highest")
    end
})
