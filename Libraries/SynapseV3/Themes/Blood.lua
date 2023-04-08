local Theme = {Colour = {}, Style = {}}

local function LerpColour3(c1, c2, t)
    return {Colour = c1.Colour:Lerp(c2.Colour, t), Alpha = c1.Alpha * (1 - t) + (c2.Alpha * t)}
end

local function Colour4(r, g, b, a)
    return {Colour = Color3.new(r, g, b), Alpha = a or 1}
end

Theme.Colour.Text = Colour4(0.75, 0.75, 0.75, 1.00)
Theme.Colour.TextDisabled = Colour4(0.35, 0.35, 0.35, 1.00)
Theme.Colour.WindowBg = Colour4(0.00, 0.00, 0.00, 0.94)
Theme.Colour.ChildBg = Colour4(0.00, 0.00, 0.00, 0.00)
Theme.Colour.PopupBg = Colour4(0.08, 0.08, 0.08, 0.94)
Theme.Colour.Border = Colour4(0.00, 0.00, 0.00, 0.50)
Theme.Colour.BorderShadow = Colour4(0.00, 0.00, 0.00, 0.00)
Theme.Colour.FrameBg = Colour4(0.00, 0.00, 0.00, 0.54)
Theme.Colour.FrameBgHovered = Colour4(0.37, 0.14, 0.14, 0.67)
Theme.Colour.FrameBgActive = Colour4(0.39, 0.20, 0.20, 0.67)
Theme.Colour.TitleBg = Colour4(0.04, 0.04, 0.04, 1.00)
Theme.Colour.TitleBgActive = Colour4(0.48, 0.16, 0.16, 1.00)
Theme.Colour.TitleBgCollapsed = Colour4(0.48, 0.16, 0.16, 1.00)
Theme.Colour.MenuBarBg = Colour4(0.14, 0.14, 0.14, 1.00)
Theme.Colour.ScrollbarBg = Colour4(0.02, 0.02, 0.02, 0.53)
Theme.Colour.ScrollbarGrab = Colour4(0.31, 0.31, 0.31, 1.00)
Theme.Colour.ScrollbarGrabHovered = Colour4(0.41, 0.41, 0.41, 1.00)
Theme.Colour.ScrollbarGrabActive = Colour4(0.51, 0.51, 0.51, 1.00)
Theme.Colour.CheckMark = Colour4(0.56, 0.10, 0.10, 1.00)
Theme.Colour.SliderGrab = Colour4(1.00, 0.19, 0.19, 0.40)
Theme.Colour.SliderGrabActive = Colour4(0.89, 0.00, 0.19, 1.00)
Theme.Colour.Button = Colour4(1.00, 0.19, 0.19, 0.40)
Theme.Colour.ButtonHovered = Colour4(0.80, 0.17, 0.00, 1.00)
Theme.Colour.ButtonActive = Colour4(0.89, 0.00, 0.19, 1.00)
Theme.Colour.Header = Colour4(0.33, 0.35, 0.36, 0.53)
Theme.Colour.HeaderHovered = Colour4(0.76, 0.28, 0.44, 0.67)
Theme.Colour.HeaderActive = Colour4(0.47, 0.47, 0.47, 0.67)
Theme.Colour.Separator = Colour4(0.32, 0.32, 0.32, 1.00)
Theme.Colour.SeparatorHovered = Colour4(0.32, 0.32, 0.32, 1.00)
Theme.Colour.SeparatorActive = Colour4(0.32, 0.32, 0.32, 1.00)
Theme.Colour.ResizeGrip = Colour4(1.00, 1.00, 1.00, 0.85)
Theme.Colour.ResizeGripHovered = Colour4(1.00, 1.00, 1.00, 0.60)
Theme.Colour.ResizeGripActive = Colour4(1.00, 1.00, 1.00, 0.90)
Theme.Colour.Tab = LerpColour3(Theme.Colour.Header, Theme.Colour.TitleBgActive, 0.8)
Theme.Colour.TabHovered = Colour4(0.76, 0.28, 0.44, 0.67)
Theme.Colour.TabActive = LerpColour3(Theme.Colour.HeaderActive, Theme.Colour.TitleBgActive, 0.6)
Theme.Colour.TabUnfocused = LerpColour3(Theme.Colour.Tab, Theme.Colour.TitleBg, 0.8)
Theme.Colour.TabUnfocusedActive = LerpColour3(Theme.Colour.TabActive, Theme.Colour.TitleBg, 0.4)
Theme.Colour.DockingPreview = Colour4(0.47, 0.47, 0.47, 0.47)
Theme.Colour.DockingEmptyBg = Colour4(0.20, 0.20, 0.20, 1.00)
Theme.Colour.PlotLines = Colour4(0.61, 0.61, 0.61, 1.00)
Theme.Colour.PlotLinesHovered = Colour4(1.00, 0.43, 0.35, 1.00)
Theme.Colour.PlotHistogram = Colour4(0.90, 0.70, 0.00, 1.00)
Theme.Colour.PlotHistogramHovered = Colour4(1.00, 0.60, 0.00, 1.00)
Theme.Colour.TableHeaderBg = Colour4(0.19, 0.19, 0.20, 1.00)
Theme.Colour.TableBorderStrong = Colour4(0.31, 0.31, 0.35, 1.00)
Theme.Colour.TableBorderLight = Colour4(0.23, 0.23, 0.25, 1.00)
Theme.Colour.TableRowBg = Colour4(0.00, 0.00, 0.00, 0.00)
Theme.Colour.TableRowBgAlt = Colour4(1.00, 1.00, 1.00, 0.07)
Theme.Colour.TextSelectedBg = Colour4(0.26, 0.59, 0.98, 0.35)
Theme.Colour.DragDropTarget = Colour4(1.00, 1.00, 0.00, 0.90)
Theme.Colour.NavHighlight = Colour4(0.26, 0.59, 0.98, 1.00)
Theme.Colour.NavWindowingHighlight = Colour4(1.00, 1.00, 1.00, 0.70)
Theme.Colour.NavWindowingDimBg = Colour4(0.80, 0.80, 0.80, 0.20)
Theme.Colour.ModalWindowDimBg = Colour4(0.80, 0.80, 0.80, 0.35)

Theme.Style.WindowPadding = Vector2.new(8, 8)
Theme.Style.FramePadding = Vector2.new(5, 2)
Theme.Style.CellPadding = Vector2.new(6, 6)
Theme.Style.ItemSpacing = Vector2.new(6, 6)
Theme.Style.ItemInnerSpacing = Vector2.new(6, 6)
Theme.Style.IndentSpacing = 25
Theme.Style.ScrollbarSize = 15
Theme.Style.GrabMinSize = 10
Theme.Style.WindowBorderSize = 1
Theme.Style.ChildBorderSize = 1
Theme.Style.PopupBorderSize = 1
Theme.Style.FrameBorderSize = 1
Theme.Style.WindowRounding = 7
Theme.Style.ChildRounding = 4
Theme.Style.FrameRounding = 3
Theme.Style.PopupRounding = 4
Theme.Style.ScrollbarRounding = 9
Theme.Style.GrabRounding = 3
Theme.Style.TabRounding = 4

return Theme
