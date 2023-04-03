local Theme = {Colour = {}, Style = {}}

local function Color4(r, g, b, a)
    return {Colour = Color3.new(r, g, b), Alpha = a or 1}
end

Theme.Colour.Text = Color4(0.75, 0.75, 0.75, 1.00)
Theme.Colour.TextDisabled = Color4(0.35, 0.35, 0.35, 1.00)
Theme.Colour.WindowBg = Color4(0.00, 0.00, 0.00, 0.94)
Theme.Colour.ChildBg = Color4(0.00, 0.00, 0.00, 0.00)
Theme.Colour.PopupBg = Color4(0.08, 0.08, 0.08, 0.94)
Theme.Colour.Border = Color4(0.00, 0.00, 0.00, 0.50)
Theme.Colour.BorderShadow = Color4(0.00, 0.00, 0.00, 0.00)
Theme.Colour.FrameBg = Color4(0.00, 0.00, 0.00, 0.54)
Theme.Colour.FrameBgHovered = Color4(0.37, 0.14, 0.14, 0.67)
Theme.Colour.FrameBgActive = Color4(0.39, 0.20, 0.20, 0.67)
Theme.Colour.TitleBg = Color4(0.04, 0.04, 0.04, 1.00)
Theme.Colour.TitleBgActive = Color4(0.48, 0.16, 0.16, 1.00)
Theme.Colour.TitleBgCollapsed = Color4(0.48, 0.16, 0.16, 1.00)
Theme.Colour.MenuBarBg = Color4(0.14, 0.14, 0.14, 1.00)
Theme.Colour.ScrollbarBg = Color4(0.02, 0.02, 0.02, 0.53)
Theme.Colour.ScrollbarGrab = Color4(0.31, 0.31, 0.31, 1.00)
Theme.Colour.ScrollbarGrabHovered = Color4(0.41, 0.41, 0.41, 1.00)
Theme.Colour.ScrollbarGrabActive = Color4(0.51, 0.51, 0.51, 1.00)
Theme.Colour.CheckMark = Color4(0.56, 0.10, 0.10, 1.00)
Theme.Colour.SliderGrab = Color4(1.00, 0.19, 0.19, 0.40)
Theme.Colour.SliderGrabActive = Color4(0.89, 0.00, 0.19, 1.00)
Theme.Colour.Button = Color4(1.00, 0.19, 0.19, 0.40)
Theme.Colour.ButtonHovered = Color4(0.80, 0.17, 0.00, 1.00)
Theme.Colour.ButtonActive = Color4(0.89, 0.00, 0.19, 1.00)
Theme.Colour.Header = Color4(0.33, 0.35, 0.36, 0.53)
Theme.Colour.HeaderHovered = Color4(0.76, 0.28, 0.44, 0.67)
Theme.Colour.HeaderActive = Color4(0.47, 0.47, 0.47, 0.67)
Theme.Colour.Separator = Color4(0.32, 0.32, 0.32, 1.00)
Theme.Colour.SeparatorHovered = Color4(0.32, 0.32, 0.32, 1.00)
Theme.Colour.SeparatorActive = Color4(0.32, 0.32, 0.32, 1.00)
Theme.Colour.ResizeGrip = Color4(1.00, 1.00, 1.00, 0.85)
Theme.Colour.ResizeGripHovered = Color4(1.00, 1.00, 1.00, 0.60)
Theme.Colour.ResizeGripActive = Color4(1.00, 1.00, 1.00, 0.90)
Theme.Colour.Tab = Color4(0.07, 0.07, 0.07, 0.51)
Theme.Colour.TabHovered = Color4(0.86, 0.23, 0.43, 0.67)
Theme.Colour.TabActive = Color4(0.19, 0.19, 0.19, 0.57)
Theme.Colour.TabUnfocused = Color4(0.05, 0.05, 0.05, 0.90)
Theme.Colour.TabUnfocusedActive = Color4(0.13, 0.13, 0.13, 0.74)
Theme.Colour.DockingPreview = Color4(0.47, 0.47, 0.47, 0.47)
Theme.Colour.DockingEmptyBg = Color4(0.20, 0.20, 0.20, 1.00)
Theme.Colour.PlotLines = Color4(0.61, 0.61, 0.61, 1.00)
Theme.Colour.PlotLinesHovered = Color4(1.00, 0.43, 0.35, 1.00)
Theme.Colour.PlotHistogram = Color4(0.90, 0.70, 0.00, 1.00)
Theme.Colour.PlotHistogramHovered = Color4(1.00, 0.60, 0.00, 1.00)
Theme.Colour.TableHeaderBg = Color4(0.19, 0.19, 0.20, 1.00)
Theme.Colour.TableBorderStrong = Color4(0.31, 0.31, 0.35, 1.00)
Theme.Colour.TableBorderLight = Color4(0.23, 0.23, 0.25, 1.00)
Theme.Colour.TableRowBg = Color4(0.00, 0.00, 0.00, 0.00)
Theme.Colour.TableRowBgAlt = Color4(1.00, 1.00, 1.00, 0.07)
Theme.Colour.TextSelectedBg = Color4(0.26, 0.59, 0.98, 0.35)
Theme.Colour.DragDropTarget = Color4(1.00, 1.00, 0.00, 0.90)
Theme.Colour.NavHighlight = Color4(0.26, 0.59, 0.98, 1.00)
Theme.Colour.NavWindowingHighlight = Color4(1.00, 1.00, 1.00, 0.70)
Theme.Colour.NavWindowingDimBg = Color4(0.80, 0.80, 0.80, 0.20)
Theme.Colour.ModalWindowDimBg = Color4(0.80, 0.80, 0.80, 0.35)

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
