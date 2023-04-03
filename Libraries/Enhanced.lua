local Storage = {
    Buttons = {}
}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local rng = Random.new()
local plr = Players.LocalPlayer
local ButtonsFolder = Instance.new("Folder")

local plrgui = plr:WaitForChild("PlayerGui")
local rblxgui = game.CoreGui:WaitForChild("RobloxGui")
local shield = rblxgui:WaitForChild("SettingsShield"):WaitForChild("SettingsShield")
local HelpTab = shield.MenuContainer:WaitForChild("HubBar"):WaitForChild("HubBarContainer"):WaitForChild("HelpTab")
local pageview = shield:WaitForChild("MenuContainer"):WaitForChild("PageViewClipper"):WaitForChild("PageView"):WaitForChild("PageViewInnerFrame")

HelpTab:WaitForChild("Icon"):WaitForChild("Title").Text = "Home"
HelpTab.Icon.Image = "rbxasset://textures/ui/Settings/MenuBarIcons/HomeTab.png"
HelpTab.LayoutOrder = -1

charset = {}
for i = 48,  57 do table.insert(charset, string.char(i)) end
for i = 65,  90 do table.insert(charset, string.char(i)) end
for i = 97, 122 do table.insert(charset, string.char(i)) end


local function RandomCharacters(length)
    if length > 0 then
        return RandomCharacters(length - 1) .. charset[rng:NextInteger(1, #charset)]
    else
        return ""
    end
end

ButtonsFolder.Name = RandomCharacters(rng:NextInteger(5, 20))
ButtonsFolder.Parent = game:GetService("ReplicatedStorage")

local Layout = 1
local HomeSize = 0

local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()

local function Connect(a, b)
	local c = a:Connect(b)
	return c
end

local function Object(Obj, Properties)
    local Object = Obj
    if type(Obj) == "string" then
        Object = Instance.new(Obj)
    end
    for i, v in next, Properties or {} do
        Object[i] = v
	end
	return Object
end

local function Slider(c)
    for _,a in next, {"Step1", "Step10"} do
        Connect(c[a]:GetPropertyChangedSignal("Image"), function()
            c[a].Image = ""
            c[a].BackgroundTransparency = c.Step2.BackgroundTransparency
        end)
    end
    Connect(c.Step2:GetPropertyChangedSignal("BackgroundTransparency"), function()
        c.Step1.BackgroundTransparency = c.Step2.BackgroundTransparency
        c.Step1.Image = ""
        c.Step10.BackgroundTransparency = c.Step2.BackgroundTransparency
        c.Step10.Image = ""
    end)
    for i,v in pairs(c:GetChildren()) do
        if v.Name == "Step1" or v.Name == "Step10" then
            v.Image = ""
            v.BackgroundTransparency = c.Step2.BackgroundTransparency
        end
        if v.BackgroundColor3:ToHex() == "00a2ff" then
            v.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        end
        Connect(v:GetPropertyChangedSignal("BackgroundColor3"), function()
            if v.BackgroundColor3:ToHex() == "00a2ff" then
                v.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            end
        end)
    end
end

local function UpdateFrame(a)
    local b = 0
    for i,v in next, a:GetChildren() do
        if v.Name ~= "HelpFrameKeyboardMouse" and v.Name ~= "RowListLayout" then
            b = b+v.Size.Y.Offset+a.RowListLayout.Padding.Offset
        end
    end
    return b
end

local function SetTheme(obj)
    local Images = {"rbxasset://textures/ui/dialog_white.png";"rbxasset://textures/ui/Settings/MenuBarAssets/MenuSelection.png";"rbxasset://textures/ui/Settings/MenuBarAssets/MenuBackground.png";"rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png";"rbxasset://textures/ui/VR/rectBackgroundWhite.png";}
    for i,v in pairs(obj:GetDescendants()) do
        if v:IsA("ImageButton") or v:IsA("ImageLabel") then 
            if table.find(Images, v.Image) then
                v.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                v.ImageColor3 = Color3.fromRGB(255, 0, 0)
            end
        end
        if v.Name == "Slider" and v:FindFirstChild("StepsContainer") then
            Slider(v.StepsContainer)
        end
    end
end

function Storage:AddToggle(configs)
    configs = configs or {}
    configs.Name = configs.Name or "Name"
    configs.Title = configs.Title or "Title"
    configs.Default = configs.Default or false
    configs.Callback = configs.Callback or function() print("Callback") end
    
    local Frame = Object("ImageButton", {
        Name = configs.Name,
        Active = false,
        BackgroundTransparency = 1.000,
        BorderSizePixel = 0,
        LayoutOrder = Layout,
        Selectable = false,
        Size = UDim2.new(1, 0, 0, 50),
        ZIndex = 2,
        AutoButtonColor = false,
        Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
        ImageColor3 = Color3.fromRGB(163, 162, 165),
        ImageTransparency = 1.000,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(2, 2, 18, 18),
        Visible = false
    })
    Layout = Layout + 1
    Frame:SetAttribute("Type", "Toggle")
    table.insert(Storage.Buttons, Frame)
    Object("TextLabel", {
        Name = "Title",
        Parent = Frame,
        BackgroundTransparency = 1.000,
        Position = UDim2.new(0, 10, 0, 0),
        Size = UDim2.new(0, 200, 1, 0),
        ZIndex = 2,
        Font = Enum.Font.SourceSansBold,
        Text = configs.Title,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 24.000,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    Object("ImageButton", {
        Name = "Selector",
        Parent = Frame,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 1.000,
        Position = UDim2.new(1, 0, 0.5, 0),
        Size = UDim2.new(0.600000024, 0, 0, 50),
        ZIndex = 2,
        AutoButtonColor = false
    })
    Object("ImageButton", {
        Name = "LeftArrow",
        Parent = Frame:WaitForChild("Selector"),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1.000,
        Position = UDim2.new(0, 0, 0.5, 0),
        Selectable = false,
        Size = UDim2.new(0, 50, 0, 50),
        ZIndex = 3
    })
    Object("ImageLabel", {
        Name = "Icon",
        Parent = Frame.Selector:WaitForChild("LeftArrow"),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1.000,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, 18, 0, 30),
        ZIndex = 4,
        Image = "rbxasset://textures/ui/Settings/Slider/Left.png",
        ImageColor3 = Color3.fromRGB(204, 204, 204)
    })
    Object("ImageButton", {
        Name = "RightArrow",
        Parent = Frame.Selector,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 1.000,
        Position = UDim2.new(1, 0, 0.5, 0),
        Selectable = false,
        Size = UDim2.new(0, 50, 0, 50),
        ZIndex = 3
    })
    Object("ImageLabel", {
        Name = "Icon",
        Parent = Frame.Selector:WaitForChild("RightArrow"),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1.000,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, 18, 0, 30),
        ZIndex = 4,
        Image = "rbxasset://textures/ui/Settings/Slider/Right.png",
        ImageColor3 = Color3.fromRGB(204, 204, 204)
    })
    local Button = Object("ImageButton", {
        Name = "Button",
        Parent = Frame.Selector,
        BackgroundTransparency = 1.000,
        Position = UDim2.new(0, 50, 0, 0),
        Selectable = false,
        Size = UDim2.new(1, -100, 1, 0),
        ZIndex = 2
    })
    Object("TextLabel", {
        Name = "true",
        Parent = Frame.Selector,
        BackgroundTransparency = 1.000,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 50, 0, 0),
        Size = UDim2.new(1, -100, 1, 0),
        ZIndex = 2,
        Font = Enum.Font.SourceSans,
        Text = "On",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 24.000,
        TextTransparency = 0.500
    })
    Object("TextLabel", {
        Name = "false",
        Parent = Frame.Selector,
        BackgroundTransparency = 1.000,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 50, 0, 0),
        Size = UDim2.new(1, -100, 1, 0),
        Visible = false,
        ZIndex = 2,
        Font = Enum.Font.SourceSans,
        Text = "Off",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 24.000,
        TextTransparency = 0.500
    })
    
    Frame.Parent = ButtonsFolder
    
    Frame.Selector[tostring(not configs.Default)].Visible = false
    Frame.Selector[tostring(configs.Default)].Visible = true
    
    pcall(configs.Callback, configs.Default)
    
    Connect(Frame.MouseEnter, function()
        for i,v in pairs(Storage.Buttons) do
            if v:GetAttribute("Type") == "Button" then
                if v.Button.Image == "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png" then
                    v.Button.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
                end
            elseif v:GetAttribute("Type") == "Toggle" then
                for _,i in next, {"false", "true"} do
                    if v.Selector[i].TextTransparency == 0 then
                        v.Selector[i].TextTransparency = 0.5
                    end
                end
            end
            v.BackgroundTransparency = 1
        end
        Frame.BackgroundTransparency = 0.5
        for _,i in next, {"false", "true"} do
            if Frame.Selector[i].TextTransparency == 0.5 then
                Frame.Selector[i].TextTransparency = 0
            end
        end
    end)
    
    local function Animate(a, b)
        task.spawn(function()
            Frame.Selector[tostring(not configs.Default)].Visible = true
            Frame.Selector[tostring(configs.Default)].Position = UDim2.new(0, a, 0, 0)
            Frame.Selector[tostring(configs.Default)].TextTransparency = 1
            Frame.Selector[tostring(configs.Default)].Visible = true
            TweenService:Create(Frame.Selector[tostring(not configs.Default)], TweenInfo.new(0.2), {TextTransparency = 1}):Play()
            TweenService:Create(Frame.Selector[tostring(not configs.Default)], TweenInfo.new(0.2), {Position = UDim2.new(0, b, 0, 0)}):Play()
            TweenService:Create(Frame.Selector[tostring(configs.Default)], TweenInfo.new(0.2), {TextTransparency = 0}):Play()
            TweenService:Create(Frame.Selector[tostring(configs.Default)], TweenInfo.new(0.2), {Position = UDim2.new(0, 50, 0, 0)}):Play()
            task.wait(0.2)
            Frame.Selector[tostring(not configs.Default)].Visible = false
        end)
    end
    
    Connect(Button.MouseButton1Click, function()
        configs.Default = not configs.Default
        Animate(156, -56)
        pcall(configs.Callback, configs.Default)
    end)
    Connect(Frame.Selector.RightArrow.MouseButton1Click, function()
        configs.Default = not configs.Default
        Animate(156, -56)
        pcall(configs.Callback, configs.Default)
    end)
    Connect(Frame.Selector.LeftArrow.MouseButton1Click, function()
        configs.Default = not configs.Default
        Animate(-56, 156)
        pcall(configs.Callback, configs.Default)
    end)
    for _,a in next, {"LeftArrow", "RightArrow"} do
        Connect(Frame.Selector[a].MouseEnter, function()
            Frame.Selector[a].Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
        end)
        Connect(Frame.Selector[a].MouseLeave, function()
            Frame.Selector[a].Icon.ImageColor3 = Color3.fromRGB(204, 204, 204)
        end)
    end
    return Frame
end

function Storage:AddButton(configs)
    configs = configs or {}
    configs.Name = configs.Name or "Name"
    configs.Title = configs.Title or "Title"
    configs.Text = configs.Text or "Text"
    configs.Callback = configs.Callback or function() Notification:SendNotification("Info", "Button pressed!", 1) end
    
    local Cooldown
    
    local Frame = Object("ImageButton", {
        Name = configs.Name,
        Active = false,
        BackgroundTransparency = 1.000,
        BorderSizePixel = 0,
        LayoutOrder = Layout,
        Position = UDim2.new(0, 0, 0, 550),
        Selectable = false,
        Size = UDim2.new(1, 0, 0, 50),
        ZIndex = 2,
        AutoButtonColor = false,
        Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
        ImageColor3 = Color3.fromRGB(163, 162, 165),
        ImageTransparency = 1.000,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(2, 2, 18, 18),
        Visible = false
    })
    Layout = Layout + 1
    Frame:SetAttribute("Type", "Button")
    table.insert(Storage.Buttons, Frame)
    Object("TextLabel", {
        Name = "Title",
        Parent = Frame,
        BackgroundTransparency = 1.000,
        Position = UDim2.new(0, 10, 0, 0),
        Size = UDim2.new(0, 200, 1, 0),
        ZIndex = 2,
        Font = Enum.Font.SourceSansBold,
        Text = configs.Title,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 24.000,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    local Button = Object("ImageButton", {
        Name = "Button",
        Parent = Frame,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 1.000,
        Position = UDim2.new(1, 0, 0.5, 0),
        Size = UDim2.new(0.600000024, 0, 0, 50),
        ZIndex = 2,
        AutoButtonColor = false,
        Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png",
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(8, 6, 46, 44)
    })
    Object("TextLabel", {
        Name = "Text",
        Parent = Frame:WaitForChild("Button"),
        BackgroundTransparency = 1.000,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Position = UDim2.new(0, 15, 0, 0),
        Size = UDim2.new(1, -50, 1, -8),
        ZIndex = 2,
        Font = Enum.Font.SourceSansBold,
        Text = configs.Text,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 24.000,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    Frame.Parent = ButtonsFolder
    
    Connect(Frame.MouseEnter, function()
        for i,v in pairs(Storage.Buttons) do
            if v:GetAttribute("Type") == "Button" then
                if v.Button.Image == "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png" then
                    v.Button.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
                end
            elseif v:GetAttribute("Type") == "Toggle" then
                for _,i in next, {"false", "true"} do
                    if v.Selector[i].TextTransparency == 0 then
                        v.Selector[i].TextTransparency = 0.5
                    end
                end
            end
            v.BackgroundTransparency = 1
        end
        Frame.BackgroundTransparency = 0.5
        Button.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
    end)
    if configs.Cooldown then
        Cooldown = tick()
    end
    Connect(Button.MouseButton1Click, function()
        if configs.Cooldown then
            if Cooldown - tick() > 0 then
                Notification:SendNotification("Warning", ("This action is currently on cooldown, try again in %.2f"):format(Cooldown - tick()), 5)
                return
            end
            Cooldown = tick() + configs.Cooldown
            pcall(configs.Callback)
        else
            pcall(configs.Callback)
        end
    end)
    return Frame
end

local pages = {
    ["Help"] = function(page)
        page:WaitForChild("HelpFrameKeyboardMouse").Visible = false
        for i,v in pairs(ButtonsFolder:GetChildren()) do
            if v:GetAttribute("Type") ~= nil then
                v.Parent = page
                SetTheme(page)
                v.Visible = true
                HomeSize = UpdateFrame(page)
                page.Size = UDim2.new(1, 0, 0, HomeSize)
            end
        end
        Connect(ButtonsFolder.ChildAdded, function(v)
            if v:GetAttribute("Type") ~= nil then
                v.Parent = page
                SetTheme(page)
                v.Visible = true
                HomeSize = UpdateFrame(page)
                page.Size = UDim2.new(1, 0, 0, HomeSize)
            end
        end)
        Connect(HelpTab.MouseButton1Click, function()
            if HelpTab.TabSelection.Visible == false then
                for i,v in pairs(Storage.Buttons) do
                    if v.LayoutOrder == 1 then
                        v.BackgroundTransparency = 0.5
                        if v:GetAttribute("Type") == "Button" then
                            v.Button.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
                        elseif v:GetAttribute("Type") == "Toggle" then
                            for _,i in next, {"false", "true"} do
                                if v.Selector[i].TextTransparency == 0.5 then
                                    v.Selector[i].TextTransparency = 0
                                end
                            end
                        end
                    else
                        v.BackgroundTransparency = 1
                        if v:GetAttribute("Type") == "Button" then
                            v.Button.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
                        elseif v:GetAttribute("Type") == "Toggle" then
                            for _,i in next, {"false", "true"} do
                                if v.Selector[i].TextTransparency == 0 then
                                    v.Selector[i].TextTransparency = 0.5
                                end
                            end
                        end
                    end
                end
            end
        end)
        HomeSize = UpdateFrame(page)
        page:GetPropertyChangedSignal("Size"):Connect(function()
            page.Size = UDim2.new(1, 0, 0, HomeSize)
        end)
        page.Size = UDim2.new(1, 0, 0, HomeSize)
    end
}

Connect(pageview.ChildAdded, function(page)
    if pages[page.Name] ~= nil then
        pcall(pages[page.Name], page)
    end
    SetTheme(page)
end)

Object(game:GetService("CoreGui").TopBarApp.TopBarFrame.LeftFrame.MenuIcon.Background.Icon, {
    Image = "rbxassetid://10032193438"
})
Object(shield.MenuContainer.HubBar.HubBarHomeButton.HubBarHomeButtonIcon, {
    Image = "rbxassetid://10032193438"
})
Object("UICorner", {
    Parent = game:GetService("CoreGui").TopBarApp.TopBarFrame.LeftFrame.MenuIcon.Background.Icon,
    CornerRadius = UDim.new(1, 0)
})
Object("UICorner", {
    Parent = shield.MenuContainer.HubBar.HubBarHomeButton.HubBarHomeButtonIcon,
    CornerRadius = UDim.new(1, 0)
})

for _,page in pairs(pageview:GetChildren()) do
    if pages[page.Name] ~= nil then
        pcall(pages[page.Name], page)
    end
    SetTheme(page)
end

SetTheme(rblxgui)
return Storage
