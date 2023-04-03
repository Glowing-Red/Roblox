repeat wait() until game:IsLoaded()
local Akrion = loadstring(game:HttpGet("https://raw.githubusercontent.com/Glowing-Red/Roblox/main/Libraries/Akrion.lua"))()
local Window = Akrion:MakeWindow({})
local Hubs = Window:MakeTab({Name = "Hub"})
local Menus = Window:MakeTab({Name = "Menu"})
local Universals = Window:MakeTab({Name = "Universal"})

--// Functions
function Component(file)
    local Sucess, Response = pcall(function()
        file = loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/Glowing-Red/Akrion/main/Components/%s.lua"):format(file)), file..'.lua')()
    end)
    if Sucess then
        return file
    end
    Akrion:SendNotification({
        Title = "Component Error";
        Content = ("An error occured whilst loading the component %s!"):format(file);
        Time = 3;
    })
    return nil
end

function GameDetect(a)
    if typeof(a) == "table" then
        for _,b in ipairs(a) do
            if game.GameId == b or game.PlaceId == b then
                return true
            end
        end
    else
        if game.GameId == a or game.PlaceId == a then
            return true
        end
    end
    return false
end

for a,b in pairs({["Hub"] = Hubs, ["Menu"] = Menus, ["Universal"] = Universals}) do
    local c = Component(a)
    if type(c) == "table" then
        for d,e in pairs(Component(a)) do
            b:AddButton({
                Title = e.Name;
                Description = e.Description;
                Search = e.SearchName;
                Url = e.Url;
                Callback = function()
                    if type(e.Url) == "string" and e.Url ~= "" then
                        local Success, Response = pcall(function()
                            loadstring(game:HttpGet(e.Url))()
                        end)
                        if not Success then
                            Akrion:SendNotification({
                                Title = "Loadstring Error";
                                Content = Response;
                                Time = 6;
                            })
                        end	
                    else
                        Akrion:SendNotification({
                            Title = "Url Error";
                            Content = "Please double check that the url is a string and actually contains anything";
                            Time = 5;
                        })
                    end
                end
            })
        end
    end
end

game:GetService("Players").LocalPlayer.OnTeleport:Connect(function()
    syn.queue_on_teleport([[loadstring(game:HttpGet("https://raw.githubusercontent.com/Glowing-Red/Roblox/main/Hubs/Akrion.lua"))()]])
end)

Window:Init()
