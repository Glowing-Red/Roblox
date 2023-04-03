repeat wait() until game:IsLoaded()
local function GetExecutor(name)
    local Executor = identifyexecutor and table.concat({identifyexecutor()}, " ") or "Unknown"
    if Executor:gmatch("/") then
        Executor = Executor:split("/")[1]
    end
    if Executor:lower():match(name:lower()) then
        return true
    end
    return false
end
if not GetExecutor("Synapse X v3") then
    print("Synapse v3 only!")
    return
end

local SynapseV3 = {}

local Rng = Random.new()
local Chars = {}
for i = 48, 57 do table.insert(Chars, string.char(i)) end
for i = 65, 90 do table.insert(Chars, string.char(i)) end
for i = 97, 122 do table.insert(Chars, string.char(i)) end
local function RngChars(length)
    if length > 0 then
        return RngChars(length - 1)..Chars[Rng:NextInteger(1, #Chars)]
    else
        return ""
    end
end

function SynapseV3:SendNotification(Configs)
    Configs = typeof(Configs) == "table" and Configs or {}
    Configs.Title = typeof(Configs.Title) == "string" and Configs.Title or RngChars(Rng:NextInteger(5, 25))
    Configs.Content = typeof(Configs.Content) == "string" and Configs.Content or RngChars(Rng:NextInteger(5, 100))
    Configs.Duration = typeof(Configs.Duration) == "number" and Configs.ContDurationent or 5
    Configs.Type = typeof(Configs.Type) == "number" and Configs.Type or 0
    syn.toast_notification({
        Title = Configs.Title,
        Content = Configs.Content,
        Duration = Configs.Duration,
        Type = Configs.Type
    })
end

function SynapseV3:MakeWindow(Configs)
    Configs = typeof(Configs) == "table" and Configs or {}
    Configs.Name = typeof(Configs.Name) == "string" and Configs.Name or RngChars(Rng:NextInteger(5, 30))
    Configs.MinSize = typeof(Configs.MinSize) == "Vector2" and Configs.MinSize or nil
    Configs.MaxSize = typeof(Configs.MaxSize) == "Vector2" and Configs.MaxSize or nil
    Configs.DefaultSize = typeof(Configs.DefaultSize) == "Vector2" and Configs.DefaultSize or nil
    Configs.CanResize = typeof(Configs.CanResize) == "boolean" and Configs.CanResize or nil
    Configs.VisibilityOverride = typeof(Configs.VisibilityOverride) == "boolean" and Configs.VisibilityOverride or nil
    Configs.Visible = typeof(Configs.Visible) == "boolean" and Configs.Visible or nil
    Configs.Color = typeof(Configs.Color) == "table" and Configs.Color or {}
    
    assert(RenderWindow)
    local Window = RenderWindow.new(Configs.Name)
    local module = {}
    shared[Configs.Name] = module
    module.RenderWindow = Window

    for i,v in next, Configs do
        if not table.find({"Name", "Color"}, i) then
            Window[i] = v
        end
    end

    for i,v in next, Configs.Color do
        v = typeof(v) == "table" and v or {}
        v[1] = typeof(v[1]) == "number" and {v[1]} or typeof(v[1]) == "table" and v[1] or {}
        v[2] = typeof(v[2]) == "Color3" and v[2] or Color3.fromHex("FC5603")
        v[3] = typeof(v[3]) == "number" and v[3] or 1
        for _,a in next, v[1] do
            Window:SetColor(a, v[2], v[3])
        end
    end

    local Tabs = Window:TabMenu()
    local WindowFunctions = {}
    function WindowFunctions:AddTab(Configs)
        Configs = typeof(Configs) == "table" and Configs or {}
        Configs.Name = typeof(Configs.Name) == "string" and Configs.Name or RngChars(Rng:NextInteger(5, 15))
        local Tab = Tabs:Add(Configs.Name)
        local TabFunctions = {}
        function TabFunctions:AddButton(Configs)
            Configs = typeof(Configs) == "table" and Configs or {}
            Configs.Name = typeof(Configs.Name) == "string" and Configs.Name or RngChars(Rng:NextInteger(5, 20))
            Configs.Size = typeof(Configs.Size) == "Vector2" and Configs.Size or nil
            Configs.Callback = typeof(Configs.Callback) == "function" and Configs.Callback or function() print(("%s has been pressed"):format(Configs.Name)) end
            
            local Button = Tab:Button()
            Button.Label = Configs.Name
            if Configs.Size then
                Button.Size = Configs.Size
            end
            Button.OnUpdated:Connect(Configs.Callback)
        end
        function TabFunctions:AddToggle(Configs)
            Configs = typeof(Configs) == "table" and Configs or {}
            Configs.Name = typeof(Configs.Name) == "string" and Configs.Name or RngChars(Rng:NextInteger(5, 15))
            Configs.Default = typeof(Configs.Default) == "boolean" and Configs.Default or false
            Configs.Callback = typeof(Configs.Callback) == "function" and Configs.Callback or function(val) print(("%s: %s"):format(Configs.Name, tostring(val))) end
            
            local Toggle = Tab:CheckBox()
            Toggle.Label = Configs.Name
            Toggle.Value = Configs.Default
            pcall(Configs.Callback, Configs.Default)
            Toggle.OnUpdated:Connect(Configs.Callback)
        end
        function TabFunctions:AddSlider(Configs)
            Configs = typeof(Configs) == "table" and Configs or {}
            Configs.Name = typeof(Configs.Name) == "string" and Configs.Name or RngChars(Rng:NextInteger(5, 15))
            Configs.Min = typeof(Configs.Min) == "number" and Configs.Min or 1
            Configs.Max = typeof(Configs.Max) == "number" and Configs.Max or 10
            Configs.Default = typeof(Configs.Default) == "number" and Configs.Default or Configs.Min
            Configs.Callback = typeof(Configs.Callback) == "function" and Configs.Callback or function(val) print(("%s: %s"):format(Configs.Name, tostring(val))) end
            
            local Slider = Tab:IntSlider()
            Slider.Label = Configs.Name
            Slider.Min = Configs.Min
            Slider.Max = Configs.Max
            Slider.Value = Configs.Default
            Slider.Clamped = true
            Slider.OnUpdated:Connect(Configs.Callback)
        end
        function TabFunctions:AddSeperator()
            Tab:Separator()
        end
        return TabFunctions
    end
    return WindowFunctions
end
return SynapseV3
