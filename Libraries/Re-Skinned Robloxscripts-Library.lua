local Forums = {}
local minimized = false

local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")

function Forums:DraggingEnabled(frame, parent)
        
    parent = parent or frame
    
    -- stolen from wally or kiriot, kek
    local dragging = false
    local dragInput, mousePos, framePos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = parent.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    input.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            game.TweenService:Create(parent, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
            }):Play()
            --parent.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end)
end
function Forums:DraggingEnabled2(frame, parent)
        
    parent = parent or frame
    
    -- stolen from wally or kiriot, kek
    local dragging = false
    local dragInput, mousePos, framePos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = parent.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    input.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            game.TweenService:Create(parent, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
            }):Play()
            --parent.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end)
end
function Forums:UIMinimize()
        if minimized then
            game.TweenService:Create(game.CoreGui[getgenv().libName].Content.Main, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                Size = UDim2.new(0, 486, 0, 283)
            }):Play()
            wait()
            game.TweenService:Create(game.CoreGui[getgenv().libName].shadow, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                ImageTransparency = 0
            }):Play()
            minimized = false
        else
            game.TweenService:Create(game.CoreGui[getgenv().libName].shadow, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                ImageTransparency = 1
            }):Play()
            wait()
            game.TweenService:Create(game.CoreGui[getgenv().libName].Content, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                Size = UDim2.new(0,0,0,0)
            }):Play()
            minimized = true
        end
    end

function Forums.new(newName, Themesequence, Poson, Posow)
    for i,v in pairs(game.CoreGui:GetChildren()) do
	if v.Name == newName then
           v:Destroy()             
        end
    end

    getgenv().libName = newName
    newName = newName or "forum.robloxscripts.com"

    Themesequence = Themesequence or ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(51, 175, 255)), ColorSequenceKeypoint.new(0.10, Color3.fromRGB(51, 113, 255)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(51, 52, 255)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(110, 51, 255)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(171, 51, 255)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(232, 51, 255)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(255, 51, 215)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(255, 51, 154)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(255, 51, 93)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 69, 51)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 130, 51))}
    getgenv().ThemeSequence = Themesequence

    Poson = Poson or "{0.5, 0}, {0.5, 0}"

    Posow = Posow or "{0.5, 2}, {0.5, 2}"

    local _81asf91z9asf1 = Instance.new("ScreenGui")
    local shadow = Instance.new("ImageLabel")
    local Content = Instance.new("ImageLabel")
    local UIAspectRatioConstraintContent = Instance.new("UIAspectRatioConstraint")
    local UISizeConstraintContent = Instance.new("UISizeConstraint")
    local Shadow = Instance.new("ImageLabel")
    local Close = Instance.new("ImageButton")
    local Icon = Instance.new("ImageLabel")
    local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
    local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
    local UIGradient = Instance.new("UIGradient")
    local UISizeConstraint = Instance.new("UISizeConstraint")
    local Glow_100 = Instance.new("ImageLabel")
    local UIGradient_2 = Instance.new("UIGradient")
    local headerContent = Instance.new("ImageLabel")
    local titleContent = Instance.new("TextLabel")
    local UIGradientContent = Instance.new("UIGradient")
    local Main = Instance.new("Frame")
    local header = Instance.new("Frame")
    local containerHolder = Instance.new("Frame")
    local pages = Instance.new("Folder")
    local newPage = Instance.new("ScrollingFrame")
    local sectionList = Instance.new("UIListLayout")
    local UIListLayout = Instance.new("UIListLayout")
    local UIListLayout_2 = Instance.new("UIListLayout")

    Forums:DraggingEnabled(headerContent, Content)
    Forums:DraggingEnabled2(headerContent, shadow)
    
    UIListLayout.Parent = Main
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    _81asf91z9asf1.Name = newName
    _81asf91z9asf1.Parent = game.CoreGui
    _81asf91z9asf1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    shadow.Name = "shadow"
    shadow.Parent = _81asf91z9asf1
    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    shadow.BackgroundTransparency = 1.000
    local xScale, xOffset, yScale, yOffset = string.match(Posow, "^{(.-), (.-)}, {(.-), (.+)}")
    shadow.Position = UDim2.new(xScale, xOffset, yScale, yOffset)
    shadow.Size = UDim2.new(0.800000012, 0, 0.5, 0)
    shadow.ZIndex = 0
    shadow.Image = "rbxassetid://8993270989"
    
    Content.Name = "Content"
    Content.Parent = _81asf91z9asf1
    Content.AnchorPoint = Vector2.new(0.5, 0.5)
    Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Content.BackgroundTransparency = 1.000
    local xScale, xOffset, yScale, yOffset = string.match(Poson, "^{(.-), (.-)}, {(.-), (.+)}")
    Content.Position = UDim2.new(xScale, xOffset, yScale, yOffset)
    Content.Size = UDim2.new(0.800000012, 0, 0.5, 0)
    Content.Image = "rbxassetid://8942119552"
    Content.ImageColor3 = Color3.fromRGB(107, 107, 107)
    Content.ScaleType = Enum.ScaleType.Fit
    
    UIAspectRatioConstraintContent.Parent = Content
    UIAspectRatioConstraintContent.AspectRatio = 1.994
    
    UISizeConstraintContent.Parent = Content
    UISizeConstraintContent.MaxSize = Vector2.new(700, math.huge)
    UISizeConstraintContent.MinSize = Vector2.new(0, 250)
    
    Shadow.Name = "shadow"
    Shadow.Parent = Content
    Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Shadow.BackgroundTransparency = 1.000
    Shadow.Position = UDim2.new(-0.000942429528, -3, -0.0883159637, 2)
    Shadow.Size = UDim2.new(0.949999988, 0, 0.197453007, 0)
    Shadow.ZIndex = 0
    Shadow.Image = "http://www.roblox.com/asset/?id=7129038420"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ScaleType = Enum.ScaleType.Fit
    
    Close.Name = "Close"
    Close.Parent = Content
    Close.AnchorPoint = Vector2.new(0.5, 0.5)
    Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Close.BackgroundTransparency = 1.000
    Close.Position = UDim2.new(0.985000014, 0, 0.0399999991, 0)
    Close.Selectable = false
    Close.Size = UDim2.new(0.200000003, 0, 0.189999998, 0)
    Close.ZIndex = 2
    Close.Image = "http://www.roblox.com/asset/?id=6214665748"
    Close.ImageColor3 = Color3.fromRGB(255, 0, 0)
    Close.ScaleType = Enum.ScaleType.Fit
    Close.MouseButton1Click:Connect(function()
        local Tween1 = game.TweenService:Create(Content, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            Position = UDim2.new(-0.5, 0, 0.5, Content.Position.Y.Offset)
        })
        local Tween2 = game.TweenService:Create(shadow, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            Position = UDim2.new(-0.5, 0, 0.5, shadow.Position.Y.Offset)
        })
        Tween1:Play()
        Tween2:Play()
        Tween2.Completed:Connect(function()
            _81asf91z9asf1:Destroy()
        end)
    end)
    
    Icon.Name = "Icon"
    Icon.Parent = Close
    Icon.AnchorPoint = Vector2.new(0.5, 0.5)
    Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Icon.BackgroundTransparency = 1.000
    Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
    Icon.Size = UDim2.new(0.400000006, 0, 0.400000006, 0)
    Icon.Image = "http://www.roblox.com/asset/?id=5755239863"
    Icon.ScaleType = Enum.ScaleType.Fit
    
    UIAspectRatioConstraint_2.Parent = Close
    
    UIAspectRatioConstraint.Parent = shadow
    UIAspectRatioConstraint.AspectRatio = 1.994
    
    UIGradient.Color = getgenv().ThemeSequence
    UIGradient.Rotation = 90
    UIGradient.Parent = shadow
    
    UISizeConstraint.Parent = shadow
    UISizeConstraint.MaxSize = Vector2.new(700, math.huge)
    UISizeConstraint.MinSize = Vector2.new(0, 250)
    
    Glow_100.Name = "Glow_100"
    Glow_100.Parent = shadow
    Glow_100.AnchorPoint = Vector2.new(0.5, 0.5)
    Glow_100.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Glow_100.BackgroundTransparency = 1.000
    Glow_100.Position = UDim2.new(0.5, 0, 0.5, 0)
    Glow_100.Size = UDim2.new(2, 0, 2, 0)
    Glow_100.Image = "rbxassetid://8998039938"
    Glow_100.ScaleType = Enum.ScaleType.Crop
    Glow_100.SliceCenter = Rect.new(122, 122, 600, 600)
    Glow_100.SliceScale = 0.000
    
    UIGradient_2.Color = getgenv().ThemeSequence
    UIGradient_2.Rotation = 90
    UIGradient_2.Parent = Glow_100
    
    headerContent.Name = "header"
    headerContent.Parent = Content
    headerContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    headerContent.BackgroundTransparency = 1.000
    headerContent.Position = UDim2.new(-0.000942429528, 0, -0.0883159637, 0)
    headerContent.Size = UDim2.new(0.949999988, 0, 0.197453007, 0)
    headerContent.Image = "http://www.roblox.com/asset/?id=7129038420"
    headerContent.ScaleType = Enum.ScaleType.Fit
    
    titleContent.Name = "title"
    titleContent.Parent = headerContent
    titleContent.AnchorPoint = Vector2.new(0, 0.5)
    titleContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    titleContent.BackgroundTransparency = 1.000
    titleContent.Position = UDim2.new(0.0680000037, 0, 0.400000006, 0)
    titleContent.Size = UDim2.new(0.458673835, 0, 0.479999989, 0)
    titleContent.Font = Enum.Font.FredokaOne
    titleContent.Text = newName
    titleContent.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleContent.TextScaled = true
    titleContent.TextSize = 14.000
    titleContent.TextStrokeTransparency = 0.000
    titleContent.TextWrapped = true
    titleContent.TextXAlignment = Enum.TextXAlignment.Left
    
    UIGradientContent.Color = getgenv().ThemeSequence
    UIGradientContent.Rotation = 180
    UIGradientContent.Parent = headerContent
    
    Main.Name = "Main"
    Main.Parent = Content
    Main.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
    Main.BorderColor3 = Color3.fromRGB(27, 27, 27)
    Main.ClipsDescendants = true
    Main.BackgroundTransparency = 1.000
    Main.Position = UDim2.new(0.075, 0,0.065, 0)
    Main.Size = UDim2.new(0.875, 0,0.9, 0) --0, 486, 0, 283
    
    containerHolder.Name = "containerHolder"
    containerHolder.Parent = Main
    containerHolder.BackgroundTransparency = 1.000
    containerHolder.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
    containerHolder.BorderSizePixel = 0
    containerHolder.Position = UDim2.new(0, 0, 0.124251083, 0)
    containerHolder.Size = UDim2.new(0, 485,0, 247)

    pages.Name = "pages"
    pages.Parent = containerHolder

    UIListLayout_2.Parent = shadow
    UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center

    game.TweenService:Create(Main, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
        Size = UDim2.new(0.875, 0,0.9, 0)
    }):Play()
    wait()
    game.TweenService:Create(shadow, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
        ImageTransparency = 0
    }):Play()

    newPage.Name = "newPage"
    newPage.Parent = pages
    newPage.Active = true
    newPage.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
    newPage.BackgroundTransparency = 1.000
    newPage.BorderColor3 = Color3.fromRGB(27, 27, 27)
    newPage.Position = UDim2.new(-0.148, 0,0, 0)
    newPage.Size = UDim2.new(1.278, 0,1.279, 0)
    newPage.ScrollBarThickness = 0
    newPage.ScrollBarImageColor3 = Color3.fromRGB(20, 20, 20)
    sectionList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        newPage.CanvasSize = UDim2.new(0,0,0,sectionList.AbsoluteContentSize.Y) 
    end)

    sectionList.Name = "sectionList"
    sectionList.Parent = newPage
    sectionList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    sectionList.SortOrder = Enum.SortOrder.LayoutOrder

    local sections = {}

    function sections:NewSection(title)
        title = title or "Section"

        local sectionMain = Instance.new("Frame")
        local itemsList = Instance.new("UIListLayout")
        local sectionOpen = Instance.new("TextButton")
        local sectionTitle = Instance.new("TextLabel")

        sectionMain.Name = "sectionMain"
        sectionMain.Parent = newPage
        sectionMain.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
        sectionMain.BorderColor3 = Color3.fromRGB(27, 27, 27)
        sectionMain.ClipsDescendants = true
        sectionMain.Position = UDim2.new(0, 0, 0.0040487065, 0)-- 0.075, 0,0.065, 0
        sectionMain.Size = UDim2.new(0, 485, 0, 36)

        itemsList.Name = "itemsList"
        itemsList.Parent = sectionMain
        itemsList.HorizontalAlignment = Enum.HorizontalAlignment.Center
        itemsList.SortOrder = Enum.SortOrder.LayoutOrder
        itemsList.Padding = UDim.new(0, 5)

        sectionOpen.Name = "sectionOpen"
        sectionOpen.Parent = sectionMain
        sectionOpen.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
        sectionOpen.BorderColor3 = Color3.fromRGB(27, 27, 27)
        sectionOpen.Size = UDim2.new(0, 485, 0, 36)
        sectionOpen.AutoButtonColor = false
        sectionOpen.Text = ""
        sectionOpen.Font = Enum.Font.FredokaOne
        sectionOpen.TextStrokeTransparency = 0.000
        sectionOpen.TextColor3 = Color3.fromRGB(0, 0, 0)
        sectionOpen.TextSize = 14.000

        sectionTitle.Name = "sectionTitle"
        sectionTitle.Parent = sectionOpen
        sectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        sectionTitle.BackgroundTransparency = 1.000
        sectionTitle.Position = UDim2.new(0.0222204365, 0, 0.245634928, 0)
        sectionTitle.Size = UDim2.new(0, 184, 0, 18)
        sectionTitle.Font = Enum.Font.FredokaOne
        sectionTitle.TextStrokeTransparency = 0.000
        sectionTitle.Text = title
        sectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        sectionTitle.TextSize = 14.000
        sectionTitle.TextXAlignment = Enum.TextXAlignment.Left

        local btn = sectionOpen
        local opened = false
        btn.MouseButton1Click:Connect(function()
            if opened then
                game.TweenService:Create(sectionMain, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    Size = UDim2.new(0, 485, 0, 36)
                }):Play()
                opened = false
            else
                game.TweenService:Create(sectionMain, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    Size = UDim2.new(0,itemsList.AbsoluteContentSize.X,0, itemsList.AbsoluteContentSize.Y + 5)
                }):Play()
                opened = true
            end
        end)
        btn.MouseEnter:Connect(function()
            game.TweenService:Create(sectionTitle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                TextColor3 = Color3.fromRGB(205, 205, 205)
            }):Play()
        end)

        btn.MouseLeave:Connect(function()
            game.TweenService:Create(sectionTitle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
        end)

        local fElements = {}

        function fElements:NewButton(title, callback)
            local ButtonFunctions = {}
            title = title or "New Button"
            callback = callback or function() end

            local btnFrame = Instance.new("TextButton")
            local btnText = Instance.new("TextLabel")
            local triangle = Instance.new("ImageLabel")
            local Sample = Instance.new("ImageLabel")
            local UIGradient = Instance.new("UIGradient")

            btnFrame.Name = "btnFrame"
            btnFrame.Parent = sectionMain
            btnFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            btnFrame.BorderColor3 = Color3.fromRGB(27, 27, 27)
            btnFrame.ClipsDescendants = true
            btnFrame.Position = UDim2.new(0.00720164599, 0, 0.241830066, 0)
            btnFrame.Size = UDim2.new(0, 474, 0, 32)
            btnFrame.Text = ""
            btnFrame.AutoButtonColor = false
            btnFrame.Font = Enum.Font.FredokaOne
            btnFrame.TextStrokeTransparency = 0.000
            btnFrame.TextColor3 = Color3.fromRGB(0, 0, 0)
            btnFrame.TextSize = 14.000

            btnText.Name = "btnText"
            btnText.Parent = btnFrame
            btnText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            btnText.BackgroundTransparency = 1.000
            btnText.Position = UDim2.new(0.01774057, 0, 0.200000182, 0)
            btnText.Size = UDim2.new(0, 175, 0, 18)
            btnText.ZIndex = 5
            btnText.Font = Enum.Font.FredokaOne
            btnText.TextStrokeTransparency = 0.000
            btnText.Text = title
            btnText.TextColor3 = Color3.fromRGB(255, 255, 255)
            btnText.TextSize = 14.000
            btnText.TextXAlignment = Enum.TextXAlignment.Left

            triangle.Name = "triangle"
            triangle.Parent = btnFrame
            triangle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            triangle.BackgroundTransparency = 1.000
            triangle.BorderSizePixel = 0
            triangle.ClipsDescendants = true
            triangle.Position = UDim2.new(0.839998424, 0, -1.29596233, 0)
            triangle.Size = UDim2.new(0, 132, 0, 85)
            triangle.ZIndex = 5
            triangle.Image = "http://www.roblox.com/asset/?id=6676220228"
            triangle.ImageColor3 = Color3.fromRGB(0, 0, 0)
            triangle.ImageTransparency = 0.7

            Sample.Name = "Sample"
            Sample.Parent = btnFrame
            Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Sample.BackgroundTransparency = 1.000
            Sample.ZIndex = 2
            Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
            Sample.ImageColor3 = Color3.fromRGB(255, 255, 255)
            Sample.ImageTransparency = 0.600

            UIGradient.Color = getgenv().ThemeSequence
            UIGradient.Rotation = 180
            UIGradient.Parent = btnFrame

            local ms = game.Players.LocalPlayer:GetMouse()

            local btn = btnFrame
            local sample = btn:WaitForChild("Sample")

            btn.MouseButton1Click:Connect(function()
                callback()
                local c = sample:Clone()
                c.Parent = btn
                local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                c.Position = UDim2.new(0, x, 0, y)
                local len, size = 0.35, nil
                if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then
                    size = (btn.AbsoluteSize.X * 1.5)
                else
                    size = (btn.AbsoluteSize.Y * 1.5)
                end
                c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                for i = 1, 10 do
                    c.ImageTransparency = c.ImageTransparency + 0.05
                    wait(len / 12)
                end
                c:Destroy()
            end)
            btn.MouseEnter:Connect(function()
                game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    BackgroundColor3 = Color3.fromRGB(205, 205, 205)
                }):Play()
            end)
            btn.MouseLeave:Connect(function()
                game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                }):Play()
            end)
            function ButtonFunctions:Update(textB)
                if btnText.Text ~= textB then
                    game.TweenService:Create(btnText, TweenInfo.new(0.14, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        TextTransparency = 1
                    }):Play()
                    wait(0.14)
                    btnText.Text = textB
                    game.TweenService:Create(btnText, TweenInfo.new(0.14, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        TextTransparency = 0
                    }):Play()
                end 
            end
            return ButtonFunctions
        end

        function fElements:NewToggle(title, status, callback)
            title = title or "New Toggle"
            callback = callback or function() end
            local ToggleFunctions = {}

            local toggleFrame = Instance.new("TextButton")
            local toggleFrame_2 = Instance.new("TextLabel")
            local triangle = Instance.new("ImageLabel")
            local checkedFramesFrame = Instance.new("Frame")
            local checked = Instance.new("ImageButton")
            local unchecked = Instance.new("ImageButton")
            local UIListLayout = Instance.new("UIListLayout")
            local UIListLayout_2 = Instance.new("UIListLayout")
            local Sample = Instance.new("ImageLabel")
            local circle1 = Instance.new("Frame")
            local UIListLayout_3 = Instance.new("UIListLayout")
            local circle = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local UIGradient = Instance.new("UIGradient")

            toggleFrame.Name = "toggleFrame"
            toggleFrame.Parent = sectionMain
            toggleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            toggleFrame.BorderColor3 = Color3.fromRGB(27, 27, 27)
            toggleFrame.ClipsDescendants = true
            toggleFrame.Position = UDim2.new(0.00720164599, 0, 0.241830066, 0)
            toggleFrame.Size = UDim2.new(0, 474, 0, 32)
            toggleFrame.AutoButtonColor = false
            toggleFrame.Font = Enum.Font.FredokaOne
            toggleFrame.TextStrokeTransparency = 0.000
            toggleFrame.Text = ""
            toggleFrame.TextColor3 = Color3.fromRGB(0, 0, 0)
            toggleFrame.TextSize = 14.000

            toggleFrame_2.Name = "toggleFrame"
            toggleFrame_2.Parent = toggleFrame
            toggleFrame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            toggleFrame_2.BackgroundTransparency = 1.000
            toggleFrame_2.Position = UDim2.new(0.0680000037, 0, 0.200000003, 0)
            toggleFrame_2.Size = UDim2.new(0, 154, 0, 18)
            toggleFrame_2.ZIndex = 5
            toggleFrame_2.Font = Enum.Font.FredokaOne
            toggleFrame_2.TextStrokeTransparency = 0.000
            toggleFrame_2.Text = title
            toggleFrame_2.TextColor3 = Color3.fromRGB(255, 255, 255)
            toggleFrame_2.TextSize = 14.000
            toggleFrame_2.TextXAlignment = Enum.TextXAlignment.Left

            triangle.Name = "triangle"
            triangle.Parent = toggleFrame
            triangle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            triangle.BackgroundTransparency = 1.000
            triangle.BorderSizePixel = 0
            triangle.ClipsDescendants = true
            triangle.Position = UDim2.new(0.839998424, 0, -1.29596233, 0)
            triangle.Size = UDim2.new(0, 132, 0, 85)
            triangle.ZIndex = 5
            triangle.Image = "http://www.roblox.com/asset/?id=6676220228"
            triangle.ImageColor3 = Color3.fromRGB(0, 0, 0)
            triangle.ImageTransparency = 0.7

            checkedFramesFrame.Name = "checkedFramesFrame"
            checkedFramesFrame.Parent = toggleFrame
            checkedFramesFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            checkedFramesFrame.BackgroundTransparency = 1.000
            checkedFramesFrame.Size = UDim2.new(0, 32, 0, 32)
            checkedFramesFrame.ZIndex = 5

            checked.Name = "checked"
            checked.Parent = checkedFramesFrame
            checked.BackgroundTransparency = 1.000
            checked.LayoutOrder = 9
            checked.Position = UDim2.new(0.00843881816, 0, 0.09375, 0)
            checked.Size = UDim2.new(0, 24, 0, 24)
            checked.ImageTransparency = 1
            checked.ZIndex = 55
            checked.Image = "rbxassetid://3926311105"
            checked.ImageRectOffset = Vector2.new(4, 836)
            checked.ImageRectSize = Vector2.new(48, 48)

            unchecked.Name = "unchecked"
            unchecked.Parent = checked
            unchecked.BackgroundTransparency = 1.000
            unchecked.Position = UDim2.new(0.00800000038, 0, 0.0939999968, 0)
            unchecked.Size = UDim2.new(0, 24, 0, 24)
            unchecked.ZIndex = 50
            unchecked.Image = "rbxassetid://3926305904"
            unchecked.ImageRectOffset = Vector2.new(724, 724)
            unchecked.ImageRectSize = Vector2.new(36, 36)

            UIListLayout.Parent = checked
            UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

            UIListLayout_2.Parent = checkedFramesFrame
            UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center

            Sample.Name = "Sample"
            Sample.Parent = toggleFrame
            Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Sample.BackgroundTransparency = 1.000
            Sample.ZIndex = 2
            Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
            Sample.ImageColor3 = Color3.fromRGB(255, 255, 255)
            Sample.ImageTransparency = 0.600

            circle1.Name = "circle1"
            circle1.Parent = toggleFrame
            circle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            circle1.BackgroundTransparency = 1.000
            circle1.Size = UDim2.new(0, 32, 0, 32)
            circle1.ZIndex = 5

            UIListLayout_3.Parent = circle1
            UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_3.VerticalAlignment = Enum.VerticalAlignment.Center

            circle.Name = "circle"
            circle.Parent = circle1
            circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            circle.BackgroundTransparency = 1
            circle.Position = UDim2.new(0.00843881816, 0, 0.09375, 0)
            circle.Size = UDim2.new(0, 0, 0, 0)

            UICorner.CornerRadius = UDim.new(0, 99)
            UICorner.Parent = circle

            UIGradient.Color = getgenv().ThemeSequence
            UIGradient.Rotation = 180
            UIGradient.Parent = toggleFrame

            local ms = game.Players.LocalPlayer:GetMouse()

            local btn = toggleFrame
            local sample = btn:WaitForChild('Sample')

            btn.MouseButton1Click:Connect(function()
                local c = sample:Clone()
                c.Parent = btn
                local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                c.Position = UDim2.new(0, x, 0, y)
                local len, size = 0.35, nil
                if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then
                    size = (btn.AbsoluteSize.X * 1.5)
                else
                    size = (btn.AbsoluteSize.Y * 1.5)
                end
                c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                for i = 1, 10 do
                    c.ImageTransparency = c.ImageTransparency + 0.05
                    wait(len / 12)
                end
                c:Destroy()
            end)
            local toggled = status
            if toggled then
                game.TweenService:Create(checked, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    Size = UDim2.new(0,20,0,20)
                }):Play()
                game.TweenService:Create(unchecked, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    Size = UDim2.new(0,20,0,20)
                }):Play()
                wait(0.08)
                game.TweenService:Create(checked, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    Size = UDim2.new(0,24,0,24)
                }):Play()
                game.TweenService:Create(unchecked, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    Size = UDim2.new(0,24,0,24)
                }):Play()
                game.TweenService:Create(checked, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    ImageTransparency = 0
                }):Play()
                game.TweenService:Create(unchecked, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    ImageTransparency = 1
                }):Play()
                game.TweenService:Create(circle, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    Size = UDim2.new(0,30,0,30),
                    BackgroundTransparency = 0.7
                }):Play()
                wait(0.15)
                game.TweenService:Create(circle, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    Size = UDim2.new(0,0,0,0),
                    BackgroundTransparency = 1
                }):Play()
                pcall(callback, toggled)
            end
            btn.MouseButton1Click:Connect(function()
                if toggled then
                    game.TweenService:Create(checked, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                        Size = UDim2.new(0,20,0,20)
                    }):Play()
                    game.TweenService:Create(unchecked, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                        Size = UDim2.new(0,20,0,20)
                    }):Play()
                    wait(0.08)
                    game.TweenService:Create(checked, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                        Size = UDim2.new(0,24,0,24)
                    }):Play()
                    game.TweenService:Create(unchecked, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                        Size = UDim2.new(0,24,0,24)
                    }):Play()
                    game.TweenService:Create(checked, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                        ImageTransparency = 1,
                    }):Play()
                    game.TweenService:Create(unchecked, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                        ImageTransparency = 0
                    }):Play()
                else
                    game.TweenService:Create(checked, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                        Size = UDim2.new(0,20,0,20)
                    }):Play()
                    game.TweenService:Create(unchecked, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                        Size = UDim2.new(0,20,0,20)
                    }):Play()
                    wait(0.08)
                    game.TweenService:Create(checked, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                        Size = UDim2.new(0,24,0,24)
                    }):Play()
                    game.TweenService:Create(unchecked, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                        Size = UDim2.new(0,24,0,24)
                    }):Play()
                    game.TweenService:Create(checked, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                        ImageTransparency = 0
                    }):Play()
                    game.TweenService:Create(unchecked, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                        ImageTransparency = 1
                    }):Play()
                end
                game.TweenService:Create(circle, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    Size = UDim2.new(0,30,0,30),
                    BackgroundTransparency = 0.7
                }):Play()
                wait(0.15)
                game.TweenService:Create(circle, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    Size = UDim2.new(0,0,0,0),
                    BackgroundTransparency = 1
                }):Play()
                toggled = not toggled
                pcall(callback, toggled)
            end)
            btn.MouseButton1Down:Connect(function()
                game.TweenService:Create(circle, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    BackgroundTransparency = 0.8
                }):Play()
            end)
            btn.MouseButton1Up:Connect(function()
                game.TweenService:Create(circle, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    BackgroundTransparency = 1
                }):Play()
            end)
            btn.MouseEnter:Connect(function()
                game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    BackgroundColor3 = Color3.fromRGB(205, 205, 205)
                }):Play()
            end)
            btn.MouseLeave:Connect(function()
                game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                }):Play()
            end)
            function ToggleFunctions:Update(textT)
                if toggleFrame_2.Text ~= textT then
                    game.TweenService:Create(toggleFrame_2, TweenInfo.new(0.14, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        TextTransparency = 1
                    }):Play()
                    wait(0.14)
                    toggleFrame_2.Text = textT
                    game.TweenService:Create(toggleFrame_2, TweenInfo.new(0.14, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        TextTransparency = 0
                    }):Play()
                end
                return toggle
            end
            return ToggleFunctions
        end
        function fElements:NewTextBox(title, callback)
            local BoxFunctions = {}
            title = title or ""
            callback = callback or function() end

            local textboxFrame = Instance.new("TextButton")
            local txtboxText = Instance.new("TextLabel")
            local triangle = Instance.new("ImageLabel")
            local txtbox = Instance.new("Frame")
            local TextBox = Instance.new("TextBox")
            local Sample = Instance.new("ImageLabel")
            local UIGradient = Instance.new("UIGradient")

            textboxFrame.Name = "textboxFrame"
            textboxFrame.Parent = sectionMain
            textboxFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            textboxFrame.BorderColor3 = Color3.fromRGB(27, 27, 27)
            textboxFrame.ClipsDescendants = true
            textboxFrame.Position = UDim2.new(0.00720164599, 0, 0.241830066, 0)
            textboxFrame.Size = UDim2.new(0, 474, 0, 32)
            textboxFrame.AutoButtonColor = false
            textboxFrame.Font = Enum.Font.FredokaOne
            textboxFrame.TextStrokeTransparency = 0.000
            textboxFrame.Text = ""
            textboxFrame.TextColor3 = Color3.fromRGB(0, 0, 0)
            textboxFrame.TextSize = 14.000

            txtboxText.Name = "txtboxText"
            txtboxText.Parent = textboxFrame
            txtboxText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            txtboxText.BackgroundTransparency = 1.000
            txtboxText.Position = UDim2.new(0.0177406278, 0, 0.199999809, 0)
            txtboxText.Size = UDim2.new(0, 175, 0, 18)
            txtboxText.Font = Enum.Font.FredokaOne
            txtboxText.TextStrokeTransparency = 0.000
            txtboxText.Text = title
            txtboxText.TextColor3 = Color3.fromRGB(255, 255, 255)
            txtboxText.TextSize = 14.000
            txtboxText.TextXAlignment = Enum.TextXAlignment.Left

            triangle.Name = "triangle"
            triangle.Parent = textboxFrame
            triangle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            triangle.BackgroundTransparency = 1.000
            triangle.BorderSizePixel = 0
            triangle.ClipsDescendants = true
            triangle.Position = UDim2.new(0.839998424, 0, -1.29596233, 0)
            triangle.Size = UDim2.new(0, 132, 0, 85)
            triangle.ZIndex = 5
            triangle.Image = "http://www.roblox.com/asset/?id=6676220228"
            triangle.ImageColor3 = Color3.fromRGB(0, 0, 0)
            triangle.ImageTransparency = 0.7

            txtbox.Name = "txtbox"
            txtbox.Parent = textboxFrame
            txtbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            txtbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
            txtbox.BackgroundTransparency = 0.7
            txtbox.Position = UDim2.new(0.549000025, 0, 0.172999993, 0)
            txtbox.Size = UDim2.new(0, 176, 0, 20)

            TextBox.Parent = txtbox
            TextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TextBox.BackgroundTransparency = 1
            TextBox.ClipsDescendants = true
            TextBox.Position = UDim2.new(0.0340909101, 0, 0, 0)
            TextBox.Size = UDim2.new(0, 149, 0, 20)
            TextBox.ZIndex = 2
            TextBox.ClearTextOnFocus = false
            TextBox.Font = Enum.Font.FredokaOne
            TextBox.TextStrokeTransparency = 0.000
            TextBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.PlaceholderText = "Type Here"
            TextBox.Text = ""
            TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.TextSize = 12.000
            TextBox.TextXAlignment = Enum.TextXAlignment.Right

            Sample.Name = "Sample"
            Sample.Parent = textboxFrame
            Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Sample.BackgroundTransparency = 1.000
            Sample.ZIndex = 2
            Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
            Sample.ImageColor3 = Color3.fromRGB(255, 255, 255)
            Sample.ImageTransparency = 0.600

            UIGradient.Color = getgenv().ThemeSequence
            UIGradient.Rotation = 180
            UIGradient.Parent = textboxFrame

            local btn = textboxFrame
            btn.MouseEnter:Connect(function()
                game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    BackgroundColor3 = Color3.fromRGB(205, 205, 205)
                }):Play()
            end)
            btn.MouseLeave:Connect(function()
                game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                }):Play()
            end)
            TextBox.FocusLost:Connect(function(EnterPressed)
                if not EnterPressed then 
                    return
                else
                    callback(TextBox.Text)
                    wait(0.10)
                    TextBox.Text = ""  
                end
            end)
            function BoxFunctions:Update(textB)
                if txtboxText.Text ~= textB then
                    game.TweenService:Create(txtboxText, TweenInfo.new(0.14, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        TextTransparency = 1
                    }):Play()
                    wait(0.14)
                    txtboxText.Text = textB
                    game.TweenService:Create(txtboxText, TweenInfo.new(0.14, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        TextTransparency = 0
                    }):Play()
                end
            end
            return BoxFunctions
        end
        function fElements:NewSlider(title, minvalue, maxvalue, callback)
            title = title or ""
            minvalue = minvalue or 16
            maxvalue = maxvalue or 200

            local sliderFrame = Instance.new("TextButton")
            local Sample = Instance.new("ImageLabel")
            local triangle = Instance.new("ImageLabel")
            local sliderText = Instance.new("TextLabel")
            local sliderText_2 = Instance.new("TextLabel")
            local SliderButton = Instance.new("TextButton")
            local sliderDrag = Instance.new("Frame")
            local UIListLayout = Instance.new("UIListLayout")
            local UIGradient = Instance.new("UIGradient")

            sliderFrame.Name = "sliderFrame"
            sliderFrame.Parent = sectionMain
            sliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            sliderFrame.BorderColor3 = Color3.fromRGB(27, 27, 27)
            sliderFrame.ClipsDescendants = true
            sliderFrame.Position = UDim2.new(0.00720164599, 0, 0.241830066, 0)
            sliderFrame.Size = UDim2.new(0, 474, 0, 32)
            sliderFrame.AutoButtonColor = false
            sliderFrame.Font = Enum.Font.FredokaOne
            sliderFrame.TextStrokeTransparency = 0.000
            sliderFrame.Text = ""
            sliderFrame.TextColor3 = Color3.fromRGB(0, 0, 0)
            sliderFrame.TextSize = 14.000

            Sample.Name = "Sample"
            Sample.Parent = sliderFrame
            Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Sample.BackgroundTransparency = 1.000
            Sample.ZIndex = 2
            Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
            Sample.ImageColor3 = Color3.fromRGB(255, 255, 255)
            Sample.ImageTransparency = 0.600

            triangle.Name = "triangle"
            triangle.Parent = sliderFrame
            triangle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            triangle.BackgroundTransparency = 1.000
            triangle.BorderSizePixel = 0
            triangle.ClipsDescendants = true
            triangle.Position = UDim2.new(0.839998424, 0, -1.29596233, 0)
            triangle.Size = UDim2.new(0, 132, 0, 85)
            triangle.ZIndex = 5
            triangle.Image = "http://www.roblox.com/asset/?id=6676220228"
            triangle.ImageColor3 = Color3.fromRGB(0, 0, 0)
            triangle.ImageTransparency = 0.7

            sliderText.Name = "sliderText"
            sliderText.Parent = sliderFrame
            sliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            sliderText.BackgroundTransparency = 1.000
            sliderText.Position = UDim2.new(0.01774057, 0, 0.200000182, 0)
            sliderText.Size = UDim2.new(0, 175, 0, 18)
            sliderText.ZIndex = 5
            sliderText.Font = Enum.Font.FredokaOne
            sliderText.TextStrokeTransparency = 0.000
            sliderText.Text = title
            sliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
            sliderText.TextSize = 14.000
            sliderText.TextXAlignment = Enum.TextXAlignment.Left

            sliderText_2.Name = "sliderText"
            sliderText_2.Parent = sliderFrame
            sliderText_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            sliderText_2.BackgroundTransparency = 1.000
            sliderText_2.Position = UDim2.new(0.907649934, 0, 0.200000763, 0)
            sliderText_2.Size = UDim2.new(0, 34, 0, 18)
            sliderText_2.ZIndex = 5
            sliderText_2.Font = Enum.Font.FredokaOne
            sliderText_2.TextStrokeTransparency = 0.000
            sliderText_2.Text = minvalue
            sliderText_2.TextColor3 = Color3.fromRGB(235, 93, 93)
            sliderText_2.TextSize = 14.000
            sliderText_2.TextXAlignment = Enum.TextXAlignment.Right

            SliderButton.Name = "SliderButton"
            SliderButton.Parent = sliderFrame
            SliderButton.BackgroundColor3 = Color3.fromRGB(141, 56, 56)
            SliderButton.BorderColor3 = Color3.fromRGB(109, 43, 43)
            SliderButton.Position = UDim2.new(0.397000015, 0, 0.405999988, 0)
            SliderButton.Size = UDim2.new(0, 215, 0, 6)
            SliderButton.AutoButtonColor = false
            SliderButton.Font = Enum.Font.FredokaOne
            SliderButton.TextStrokeTransparency = 0.000
            SliderButton.Text = ""
            SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            SliderButton.TextSize = 14.000

            sliderDrag.Name = "sliderDrag"
            sliderDrag.Parent = SliderButton
            sliderDrag.BackgroundColor3 = Color3.fromRGB(109, 43, 43)
            sliderDrag.BorderSizePixel = 0
            sliderDrag.Position = UDim2.new(0, 0, -0.166666672, 0)
            sliderDrag.Size = UDim2.new(0, 0, 0, 8)
            sliderDrag.ZIndex = 6

            UIListLayout.Parent = SliderButton
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            local Value
            local uis = game:GetService("UserInputService")
            local mouse = game:GetService("Players").LocalPlayer:GetMouse()
            UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            
            UIGradient.Color = getgenv().ThemeSequence
            UIGradient.Rotation = 180
            UIGradient.Parent = sliderFrame

            SliderButton.MouseButton1Down:Connect(function()
                Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 215) * sliderDrag.AbsoluteSize.X) + tonumber(minvalue)) or 0
                pcall(function()
                    callback(Value)
                end)
                sliderDrag:TweenSize(UDim2.new(0, math.clamp(mouse.X - sliderDrag.AbsolutePosition.X, 0, 215), 0, 8), "InOut", "Linear", 0.05, true)
                moveconnection = mouse.Move:Connect(function()
                    sliderText_2.Text = Value
                    Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 215) * sliderDrag.AbsoluteSize.X) + tonumber(minvalue))
                    pcall(function()
                        callback(Value)
                    end)
                    sliderDrag:TweenSize(UDim2.new(0, math.clamp(mouse.X - sliderDrag.AbsolutePosition.X, 0, 215), 0, 8), "InOut", "Linear", 0.05, true)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 215) * sliderDrag.AbsoluteSize.X) + tonumber(minvalue))
                        pcall(function()
                            callback(Value)
                        end)
                        sliderText_2.Text = Value
                        sliderDrag:TweenSize(UDim2.new(0, math.clamp(mouse.X - sliderDrag.AbsolutePosition.X, 0, 215), 0, 8), "InOut", "Linear", 0.05, true)
                        moveconnection:Disconnect()
                        releaseconnection:Disconnect()
                    end
                end)
            end)

            local btn = sliderFrame
            btn.MouseEnter:Connect(function()
                game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    BackgroundColor3 = Color3.fromRGB(205, 205, 205)
                }):Play()
            end)
            btn.MouseLeave:Connect(function()
                game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                }):Play()
            end)
        end
        function fElements:NewKeybind(title, currentKey, callback)
            title = title or ""
            local oldKey = currentKey.Name
            callback = callback or function() end
            local KeyFunctions = {}
            local mouse = game:GetService("Players").LocalPlayer:GetMouse()
            local keybindFrame = Instance.new("TextButton")
            local keyText = Instance.new("TextLabel")
            local triangle = Instance.new("ImageLabel")
            local Sample = Instance.new("ImageLabel")
            local currentKey = Instance.new("TextLabel")
            local UIGradient = Instance.new("UIGradient")

            keybindFrame.Name = "keybindFrame"
            keybindFrame.Parent = sectionMain
            keybindFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            keybindFrame.BorderColor3 = Color3.fromRGB(27, 27, 27)
            keybindFrame.ClipsDescendants = true
            keybindFrame.Position = UDim2.new(0.00720164599, 0, 0.241830066, 0)
            keybindFrame.Size = UDim2.new(0, 474, 0, 32)
            keybindFrame.AutoButtonColor = false
            keybindFrame.Font = Enum.Font.FredokaOne
            keybindFrame.TextStrokeTransparency = 0.000
            keybindFrame.Text = ""
            keybindFrame.TextColor3 = Color3.fromRGB(0, 0, 0)
            keybindFrame.TextSize = 14.000

            keyText.Name = "keyText"
            keyText.Parent = keybindFrame
            keyText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            keyText.BackgroundTransparency = 1.000
            keyText.Position = UDim2.new(0.01774057, 0, 0.200000182, 0)
            keyText.Size = UDim2.new(0, 175, 0, 18)
            keyText.ZIndex = 5
            keyText.Font = Enum.Font.FredokaOne
            keyText.TextStrokeTransparency = 0.000
            keyText.Text = title
            keyText.TextColor3 = Color3.fromRGB(255, 255, 255)
            keyText.TextSize = 14.000
            keyText.TextXAlignment = Enum.TextXAlignment.Left

            triangle.Name = "triangle"
            triangle.Parent = keybindFrame
            triangle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            triangle.BackgroundTransparency = 1.000
            triangle.BorderSizePixel = 0
            triangle.ClipsDescendants = true
            triangle.Position = UDim2.new(0.839998424, 0, -1.29596233, 0)
            triangle.Size = UDim2.new(0, 132, 0, 85)
            triangle.ZIndex = 5
            triangle.Image = "http://www.roblox.com/asset/?id=6676220228"
            triangle.ImageColor3 = Color3.fromRGB(0, 0, 0)
            triangle.ImageTransparency = 0.7

            Sample.Name = "Sample"
            Sample.Parent = keybindFrame
            Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Sample.BackgroundTransparency = 1.000
            Sample.ZIndex = 2
            Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
            Sample.ImageColor3 = Color3.fromRGB(255, 255, 255)
            Sample.ImageTransparency = 0.600

            currentKey.Name = "currentKey"
            currentKey.Parent = keybindFrame
            currentKey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            currentKey.BackgroundTransparency = 1.000
            currentKey.Position = UDim2.new(0.679801822, 0, 0.200000763, 0)
            currentKey.Size = UDim2.new(0, 80, 0, 18)
            currentKey.ZIndex = 5
            currentKey.Font = Enum.Font.FredokaOne
            currentKey.TextStrokeTransparency = 0.000
            currentKey.Text = oldKey
            currentKey.TextColor3 = Color3.fromRGB(255, 255, 255)
            currentKey.TextSize = 14.000
            currentKey.TextXAlignment = Enum.TextXAlignment.Right
            
            UIGradient.Color = getgenv().ThemeSequence
            UIGradient.Rotation = 180
            UIGradient.Parent = keybindFrame
            
            local ms = mouse

            local btn = keybindFrame
            local sample = btn:WaitForChild("Sample")

            btn.MouseButton1Click:Connect(function()
                game.TweenService:Create(currentKey, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    TextTransparency = 1
                }):Play()
                wait(0.14)
                currentKey.Text = ". . ."
                game.TweenService:Create(currentKey, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    TextTransparency = 0
                }):Play()
                local a, b = game:GetService('UserInputService').InputBegan:wait();
                if a.KeyCode.Name ~= "Unknown" then
                    game.TweenService:Create(currentKey, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        TextTransparency = 1
                    }):Play()
                    wait(0.14)
                    currentKey.Text = a.KeyCode.Name
                    oldKey = a.KeyCode.Name;
                    game.TweenService:Create(currentKey, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        TextTransparency = 0
                    }):Play()
                end
                local c = sample:Clone()
                c.Parent = btn
                local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                c.Position = UDim2.new(0, x, 0, y)
                local len, size = 0.35, nil
                if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then
                    size = (btn.AbsoluteSize.X * 1.5)
                else
                    size = (btn.AbsoluteSize.Y * 1.5)
                end
                c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                for i = 1, 10 do
                    c.ImageTransparency = c.ImageTransparency + 0.05
                    wait(len / 12)
                end
                c:Destroy()
            end)
            btn.MouseEnter:Connect(function()
                game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    BackgroundColor3 = Color3.fromRGB(205, 205, 205)
                }):Play()
            end)
            btn.MouseLeave:Connect(function()
                game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                }):Play()
            end)

            game:GetService("UserInputService").InputBegan:connect(function(current, ok) 
                if not ok then 
                    if current.KeyCode.Name == oldKey then 
                        callback()
                    end
                end
            end)

            function KeyFunctions:Update(newKey)
                if currentKey.Text ~= newKey.Name then
                    game.TweenService:Create(currentKey, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        TextTransparency = 1
                    }):Play()
                    wait(0.14)
                    oldKey = newKey.Name
                    currentKey.Text = oldKey
                    game.TweenService:Create(currentKey, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        TextTransparency = 0
                    }):Play()
                end
            end
            return KeyFunctions
        end
        
        function fElements:NewDropdown(title, selected, list, callback)
            local DropdownFunc = {}
            title = title or "nil"
            selected = selected or "nil"
            list = list or {}
            callback = callback or function() end
            local dOpened = false
            local dropFrame = Instance.new("Frame")
            local dropOpen = Instance.new("TextButton")
            local mouse = game:GetService("Players").LocalPlayer:GetMouse()
            local ms = mouse
            local dropInf = Instance.new("TextLabel")
            local triangle = Instance.new("ImageLabel")
            local Sample = Instance.new("ImageLabel")
            local expand_more = Instance.new("ImageButton")
            local UIGradient = Instance.new("UIGradient")
            local dropList = Instance.new("UIListLayout")

            dropFrame.Name = "dropFrame"
            dropFrame.Parent = sectionMain
            dropFrame.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
            dropFrame.BorderColor3 = Color3.fromRGB(33, 33, 33)
            dropFrame.ClipsDescendants = true
            dropFrame.Position = UDim2.new(0.0113402065, 0, 0.593175828, 0)
            dropFrame.Size = UDim2.new(0, 474, 0, 32)

            dropOpen.Name = "dropOpen"
            dropOpen.Parent = dropFrame
            dropOpen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            dropOpen.BorderColor3 = Color3.fromRGB(27, 27, 27)
            dropOpen.ClipsDescendants = true
            dropOpen.Position = UDim2.new(0.00720164599, 0, 0.241830066, 0)
            dropOpen.Size = UDim2.new(0, 474, 0, 32)
            dropOpen.AutoButtonColor = false
            dropOpen.Font = Enum.Font.FredokaOne
            dropOpen.TextStrokeTransparency = 0.000
            dropOpen.Text = ""
            dropOpen.TextColor3 = Color3.fromRGB(0, 0, 0)
            dropOpen.TextSize = 14.000

            UIGradient.Color = getgenv().ThemeSequence
            UIGradient.Rotation = 180
            UIGradient.Parent = dropOpen

            dropOpen.MouseButton1Click:Connect(function()
                if dOpened then
                    dOpened = false
                    game.TweenService:Create(dropFrame, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        Size = UDim2.new(0,474,0,32)
                    }):Play()
                    game.TweenService:Create(expand_more, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        Rotation = 0
                    }):Play()
                    wait(0.1)
                    game.TweenService:Create(sectionMain, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        Size = UDim2.new(0,itemsList.AbsoluteContentSize.X,0, itemsList.AbsoluteContentSize.Y + 5)
                    }):Play()
                else
                    dOpened = true
                    game.TweenService:Create(dropFrame, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        Size = UDim2.new(0,474,0,dropList.AbsoluteContentSize.Y + 5)
                    }):Play()
                    game.TweenService:Create(expand_more, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        Rotation = 180
                    }):Play()
                    wait(0.1)
                    game.TweenService:Create(sectionMain, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        Size = UDim2.new(0,itemsList.AbsoluteContentSize.X,0, itemsList.AbsoluteContentSize.Y + 5)
                    }):Play()
                end
                local c = Sample:Clone()
                c.Parent = dropOpen
                local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                c.Position = UDim2.new(0, x, 0, y)
                local len, size = 0.35, nil
                if dropOpen.AbsoluteSize.X >= dropOpen.AbsoluteSize.Y then
                    size = (dropOpen.AbsoluteSize.X * 1.5)
                else
                    size = (dropOpen.AbsoluteSize.Y * 1.5)
                end
                c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                for i = 1, 10 do
                    c.ImageTransparency = c.ImageTransparency + 0.05
                    wait(len / 12)
                end
                c:Destroy()
            end)

            dropOpen.MouseEnter:Connect(function()
                game.TweenService:Create(dropOpen, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    BackgroundColor3 = Color3.fromRGB(205, 205, 205)
                }):Play()
            end)
            dropOpen.MouseLeave:Connect(function()
                game.TweenService:Create(dropOpen, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                }):Play()
            end)

            dropInf.Name = "dropInf"
            dropInf.Parent = dropOpen
            dropInf.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            dropInf.BackgroundTransparency = 1.000
            dropInf.Position = UDim2.new(0.0177406278, 0, 0.199999809, 0)
            dropInf.Size = UDim2.new(0, 81, 0, 18)
            dropInf.ZIndex = 5
            dropInf.Font = Enum.Font.FredokaOne
            dropInf.TextStrokeTransparency = 0.000
            dropInf.Text = title..selected
            dropInf.TextColor3 = Color3.fromRGB(255, 255, 255)
            dropInf.TextSize = 14.000
            dropInf.TextXAlignment = Enum.TextXAlignment.Left

            triangle.Name = "triangle"
            triangle.Parent = dropOpen
            triangle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            triangle.BackgroundTransparency = 1.000
            triangle.BorderSizePixel = 0
            triangle.ClipsDescendants = true
            triangle.Position = UDim2.new(0.839998424, 0, -1.29596233, 0)
            triangle.Size = UDim2.new(0, 132, 0, 85)
            triangle.ZIndex = 5
            triangle.Image = "http://www.roblox.com/asset/?id=6676220228"
            triangle.ImageColor3 = Color3.fromRGB(0, 0, 0)
            triangle.ImageTransparency = 0.7

            Sample.Name = "Sample"
            Sample.Parent = dropOpen
            Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Sample.BackgroundTransparency = 1.000
            Sample.ZIndex = 2
            Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
            Sample.ImageColor3 = Color3.fromRGB(255, 255, 255)
            Sample.ImageTransparency = 0.600

            expand_more.Name = "expand_more"
            expand_more.Parent = dropOpen
            expand_more.BackgroundTransparency = 1.000
            expand_more.LayoutOrder = 9
            expand_more.Position = UDim2.new(0.935426176, 0, 0.075000003, 0)
            expand_more.Size = UDim2.new(0, 25, 0, 25)
            expand_more.ZIndex = 55
            expand_more.Image = "rbxassetid://3926305904"
            expand_more.ImageColor3 = Color3.fromRGB(255, 255, 255)
            expand_more.ImageRectOffset = Vector2.new(564, 284)
            expand_more.ImageRectSize = Vector2.new(36, 36)

            dropList.Name = "dropList"
            dropList.Parent = dropFrame
            dropList.HorizontalAlignment = Enum.HorizontalAlignment.Center
            dropList.SortOrder = Enum.SortOrder.LayoutOrder
            dropList.Padding = UDim.new(0, 5)

            for i,v in next, list do
                local dropOption = Instance.new("TextButton")
                local btnText = Instance.new("TextLabel")
                local Sample_2 = Instance.new("ImageLabel")
                local UIGradient = Instance.new("UIGradient")

                dropOption.Name = "dropOption"
                dropOption.Parent = dropFrame
                dropOption.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                dropOption.BorderColor3 = Color3.fromRGB(30, 30, 30)
                dropOption.ClipsDescendants = true
                dropOption.Position = UDim2.new(0, 0, 0.25179857, 0)
                dropOption.Size = UDim2.new(0, 464, 0, 32)
                dropOption.AutoButtonColor = false
                dropOption.Font = Enum.Font.FredokaOne
                dropOption.TextStrokeTransparency = 0.000
                dropOption.Text = ""
                dropOption.TextColor3 = Color3.fromRGB(0, 0, 0)
                dropOption.TextSize = 14.000

                btnText.Name = "btnText"
                btnText.Parent = dropOption
                btnText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                btnText.BackgroundTransparency = 1.000
                btnText.Position = UDim2.new(0.01774057, 0, 0.200000182, 0)
                btnText.Size = UDim2.new(0, 175, 0, 18)
                btnText.ZIndex = 5
                btnText.Font = Enum.Font.FredokaOne
                btnText.TextStrokeTransparency = 0.000
                btnText.Text = v
                btnText.TextColor3 = Color3.fromRGB(255, 255, 255)
                btnText.TextSize = 14.000
                btnText.TextXAlignment = Enum.TextXAlignment.Left

                Sample_2.Name = "Sample"
                Sample_2.Parent = dropOption
                Sample_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Sample_2.BackgroundTransparency = 1.000
                Sample_2.ZIndex = 2
                Sample_2.Image = "http://www.roblox.com/asset/?id=4560909609"
                Sample_2.ImageColor3 = Color3.fromRGB(71, 27, 27)
                Sample_2.ImageTransparency = 0.600
                
                UIGradient.Color = getgenv().ThemeSequence
                UIGradient.Rotation = 180
                UIGradient.Parent = dropOption

                local btn = dropOption
                local sample = Sample_2
                btn.MouseButton1Click:Connect(function()
                    dropInf.Text = title..tostring(v)
                    callback(v)
                    game.TweenService:Create(dropFrame, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        Size = UDim2.new(0,474,0,32)
                    }):Play()
                    game.TweenService:Create(expand_more, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        Rotation = 0
                    }):Play()
                    wait(0.1)
                    game.TweenService:Create(sectionMain, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        Size = UDim2.new(0,itemsList.AbsoluteContentSize.X,0, itemsList.AbsoluteContentSize.Y + 5)
                    }):Play()
                    dOpened = false
                    local c = Sample:Clone()
                    c.Parent = dropOpen
                    local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                    c.Position = UDim2.new(0, x, 0, y)
                    local len, size = 0.35, nil
                    if dropOpen.AbsoluteSize.X >= dropOpen.AbsoluteSize.Y then
                        size = (dropOpen.AbsoluteSize.X * 1.5)
                    else
                        size = (dropOpen.AbsoluteSize.Y * 1.5)
                    end
                    c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                    for i = 1, 10 do
                        c.ImageTransparency = c.ImageTransparency + 0.05
                        wait(len / 12)
                    end
                    c:Destroy()
                end)

                btn.MouseEnter:Connect(function()
                    game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        BackgroundColor3 = Color3.fromRGB(205, 205, 205)
                    }):Play()
                end)
                btn.MouseLeave:Connect(function()
                    game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    }):Play()
                end)
            end
            function DropdownFunc:Refresh(newList)
                newList = newList or {}
                for i,v in next, dropFrame:GetChildren() do
                    if v.Name == "dropOption" then
                        v:Destroy()
                    end
                end
                for i,v in next, newList do
                    local dropOption = Instance.new("TextButton")
                    local btnText = Instance.new("TextLabel")
                    local Sample_2 = Instance.new("ImageLabel")
                    local UIGradient = Instance.new("UIGradient")

                    dropOption.Name = "dropOption"
                    dropOption.Parent = dropFrame
                    dropOption.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    dropOption.BorderColor3 = Color3.fromRGB(30, 30, 30)
                    dropOption.ClipsDescendants = true
                    dropOption.Position = UDim2.new(0, 0, 0.25179857, 0)
                    dropOption.Size = UDim2.new(0, 464, 0, 32)
                    dropOption.AutoButtonColor = false
                    dropOption.Font = Enum.Font.FredokaOne
                    dropOption.TextStrokeTransparency = 0.000
                    dropOption.Text = ""
                    dropOption.TextColor3 = Color3.fromRGB(0, 0, 0)
                    dropOption.TextSize = 14.000

                    btnText.Name = "btnText"
                    btnText.Parent = dropOption
                    btnText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    btnText.BackgroundTransparency = 1.000
                    btnText.Position = UDim2.new(0.01774057, 0, 0.200000182, 0)
                    btnText.Size = UDim2.new(0, 175, 0, 18)
                    btnText.ZIndex = 5
                    btnText.Font = Enum.Font.FredokaOne
                    btnText.TextStrokeTransparency = 0.000
                    btnText.Text = v
                    btnText.TextColor3 = Color3.fromRGB(255, 255, 255)
                    btnText.TextSize = 14.000
                    btnText.TextXAlignment = Enum.TextXAlignment.Left

                    Sample_2.Name = "Sample"
                    Sample_2.Parent = dropOption
                    Sample_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Sample_2.BackgroundTransparency = 1.000
                    Sample_2.ZIndex = 2
                    Sample_2.Image = "http://www.roblox.com/asset/?id=4560909609"
                    Sample_2.ImageColor3 = Color3.fromRGB(71, 27, 27)
                    Sample_2.ImageTransparency = 0.600

                    UIGradient.Color = getgenv().ThemeSequence
                    UIGradient.Rotation = 180
                    UIGradient.Parent = dropOption

                    local btn = dropOption
                    local sample = Sample_2
                    local mouse = game:GetService("Players").LocalPlayer:GetMouse()
                    local ms = mouse
                    btn.MouseButton1Click:Connect(function()
                        dropInf.Text = title..tostring(v)
                        callback(v)
                        game.TweenService:Create(dropFrame, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                            Size = UDim2.new(0,474,0,32)
                        }):Play()
                        game.TweenService:Create(expand_more, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                            Rotation = 0
                        }):Play()
                        wait(0.1)
                        game.TweenService:Create(sectionMain, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                            Size = UDim2.new(0,itemsList.AbsoluteContentSize.X,0, itemsList.AbsoluteContentSize.Y + 5)
                        }):Play()
                        dOpened = false
                        local c = Sample:Clone()
                        c.Parent = dropOpen
                        local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                        c.Position = UDim2.new(0, x, 0, y)
                        local len, size = 0.35, nil
                        if dropOpen.AbsoluteSize.X >= dropOpen.AbsoluteSize.Y then
                            size = (dropOpen.AbsoluteSize.X * 1.5)
                        else
                            size = (dropOpen.AbsoluteSize.Y * 1.5)
                        end
                        c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                        for i = 1, 10 do
                            c.ImageTransparency = c.ImageTransparency + 0.05
                            wait(len / 12)
                        end
                        c:Destroy()
                    end)

                    btn.MouseEnter:Connect(function()
                        game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                            BackgroundColor3 = Color3.fromRGB(205, 205, 205)
                        }):Play()
                    end)
                    btn.MouseLeave:Connect(function()
                        game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        }):Play()
                    end)
                end
                if dOpened then 
                    game.TweenService:Create(dropFrame, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        Size = UDim2.new(0,474,0,dropList.AbsoluteContentSize.Y + 5)
                    }):Play()
                    game.TweenService:Create(expand_more, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        Rotation = 180
                    }):Play()
                    wait(0.1)
                    game.TweenService:Create(sectionMain, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        Size = UDim2.new(0,itemsList.AbsoluteContentSize.X,0, itemsList.AbsoluteContentSize.Y + 5)
                    }):Play()
                else
                    game.TweenService:Create(dropFrame, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        Size = UDim2.new(0,474,0,32)
                    }):Play()
                    game.TweenService:Create(expand_more, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        Rotation = 0
                    }):Play()
                    wait(0.1)
                    game.TweenService:Create(sectionMain, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        Size = UDim2.new(0,itemsList.AbsoluteContentSize.X,0, itemsList.AbsoluteContentSize.Y + 5)
                    }):Play()
                end
            end
            return DropdownFunc
        end
        function fElements:Seperator()
            local seperator = Instance.new("Frame")
            local UIGradient = Instance.new("UIGradient")

            seperator.Name = "seperator"
            seperator.Parent = sectionMain
            seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            seperator.BorderColor3 = Color3.fromRGB(27, 27, 27)
            seperator.Size = UDim2.new(0, 474, 0, 2)

            UIGradient.Color = getgenv().ThemeSequence
            UIGradient.Rotation = 180
            UIGradient.Parent = seperator
        end
        function fElements:NewLabel(title)
            local LabelFunctions = {}
            title = title or "New Button"

            local btnFrame = Instance.new("Frame")
            local btnText = Instance.new("TextLabel")
            local triangle = Instance.new("ImageLabel")
            local UIGradient = Instance.new("UIGradient")

            btnFrame.Name = "btnFrame"
            btnFrame.Parent = sectionMain
            btnFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            btnFrame.BorderColor3 = Color3.fromRGB(27, 27, 27)
            btnFrame.ClipsDescendants = true
            btnFrame.Position = UDim2.new(0.00720164599, 0, 0.241830066, 0)
            btnFrame.Size = UDim2.new(0, 474, 0, 32)

            btnText.Name = "btnText"
            btnText.Parent = btnFrame
            btnText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            btnText.BackgroundTransparency = 1.000
            btnText.Position = UDim2.new(0.01774057, 0, 0.200000182, 0)
            btnText.Size = UDim2.new(0, 175, 0, 18)
            btnText.ZIndex = 5
            btnText.Font = Enum.Font.FredokaOne
            btnText.TextStrokeTransparency = 0.000
            btnText.Text = title
            btnText.TextColor3 = Color3.fromRGB(255, 255, 255)
            btnText.TextSize = 14.000
            btnText.TextXAlignment = Enum.TextXAlignment.Left

            triangle.Name = "triangle"
            triangle.Parent = btnFrame
            triangle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            triangle.BackgroundTransparency = 1.000
            triangle.BorderSizePixel = 0
            triangle.ClipsDescendants = true
            triangle.Position = UDim2.new(0.839998424, 0, -1.29596233, 0)
            triangle.Size = UDim2.new(0, 132, 0, 85)
            triangle.ZIndex = 5
            triangle.Image = "http://www.roblox.com/asset/?id=6676220228"
            triangle.ImageColor3 = Color3.fromRGB(0, 0, 0)
            triangle.ImageTransparency = 0.7

            UIGradient.Color = getgenv().ThemeSequence
            UIGradient.Rotation = 180
            UIGradient.Parent = btnFrame

            function LabelFunctions:Update(textB)
                if btnText.Text ~= textB then
                    game.TweenService:Create(btnText, TweenInfo.new(0.14, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        TextTransparency = 1
                    }):Play()
                    wait(0.14)
                    btnText.Text = textB
                    game.TweenService:Create(btnText, TweenInfo.new(0.14, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        TextTransparency = 0
                    }):Play()
                end 
            end
            return LabelFunctions
        end
        return fElements
    end
    return sections
end
return Forums
