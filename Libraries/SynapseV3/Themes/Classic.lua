local Theme = {Colour = {}, Style = {}}

local function Color4(r, g, b, a)
    return {Colour = Color3.new(r, g, b), Alpha = a or 1}
end

Theme.Colour.Text = Color4(0.90, 0.90, 0.90, 1.00)
Theme.Colour.TextDisabled = Color4(0.60, 0.60, 0.60, 1.00)
Theme.Colour.WindowBg = Color4(0.00, 0.00, 0.00, 0.85)
Theme.Colour.ChildBg = Color4(0.00, 0.00, 0.00, 0.00)
Theme.Colour.PopupBg = Color4(0.11, 0.11, 0.14, 0.92)
Theme.Colour.Border = Color4(0.50, 0.50, 0.50, 0.50)
Theme.Colour.BorderShadow = Color4(0.00, 0.00, 0.00, 0.00)
Theme.Colour.FrameBg = Color4(0.43, 0.43, 0.43, 0.39)
Theme.Colour.FrameBgHovered = Color4(0.47, 0.47, 0.69, 0.40)
Theme.Colour.FrameBgActive = Color4(0.42, 0.41, 0.64, 0.69)
Theme.Colour.TitleBg = Color4(0.27, 0.27, 0.54, 0.83)
Theme.Colour.TitleBgActive = Color4(0.32, 0.32, 0.63, 0.87)
Theme.Colour.TitleBgCollapsed = Color4(0.40, 0.40, 0.80, 0.20)
Theme.Colour.MenuBarBg = Color4(0.40, 0.40, 0.55, 0.80)
Theme.Colour.ScrollbarBg = Color4(0.20, 0.25, 0.30, 0.60)
Theme.Colour.ScrollbarGrab = Color4(0.40, 0.40, 0.80, 0.30)
Theme.Colour.ScrollbarGrabHovered = Color4(0.40, 0.40, 0.80, 0.40)
Theme.Colour.ScrollbarGrabActive = Color4(0.41, 0.39, 0.80, 0.60)
Theme.Colour.CheckMark = Color4(0.90, 0.90, 0.90, 0.50)
Theme.Colour.SliderGrab = Color4(1.00, 1.00, 1.00, 0.30)
Theme.Colour.SliderGrabActive = Color4(0.41, 0.39, 0.80, 0.60)
Theme.Colour.Button = Color4(0.35, 0.40, 0.61, 0.62)
Theme.Colour.ButtonHovered = Color4(0.40, 0.48, 0.71, 0.79)
Theme.Colour.ButtonActive = Color4(0.46, 0.54, 0.80, 1.00)
Theme.Colour.Header = Color4(0.40, 0.40, 0.90, 0.45)
Theme.Colour.HeaderHovered = Color4(0.45, 0.45, 0.90, 0.80)
Theme.Colour.HeaderActive = Color4(0.53, 0.53, 0.87, 0.80)
Theme.Colour.Separator = Color4(0.50, 0.50, 0.50, 0.60)
Theme.Colour.SeparatorHovered = Color4(0.60, 0.60, 0.70, 1.00)
Theme.Colour.SeparatorActive = Color4(0.70, 0.70, 0.90, 1.00)
Theme.Colour.ResizeGrip = Color4(1.00, 1.00, 1.00, 0.10)
Theme.Colour.ResizeGripHovered = Color4(0.78, 0.82, 1.00, 0.60)
Theme.Colour.ResizeGripActive = Color4(0.78, 0.82, 1.00, 0.90)
Theme.Colour.Tab = Color4(0.34, 0.34, 0.68, 0.79)
Theme.Colour.TabHovered = Color4(0.45, 0.45, 0.90, 0.80)
Theme.Colour.TabActive = Color4(0.40, 0.40, 0.73, 0.84)
Theme.Colour.TabUnfocused = Color4(0.28, 0.28, 0.57, 0.82)
Theme.Colour.TabUnfocusedActive = Color4(0.35, 0.35, 0.65, 0.84)
Theme.Colour.PlotLines = Color4(1.00, 1.00, 1.00, 1.00)
Theme.Colour.PlotLinesHovered = Color4(0.90, 0.70, 0.00, 1.00)
Theme.Colour.PlotHistogram = Color4(0.90, 0.70, 0.00, 1.00)
Theme.Colour.PlotHistogramHovered = Color4(1.00, 0.60, 0.00, 1.00)
Theme.Colour.TableHeaderBg = Color4(0.27, 0.27, 0.38, 1.00)
Theme.Colour.TableBorderStrong = Color4(0.31, 0.31, 0.45, 1.00)
Theme.Colour.TableBorderLight = Color4(0.26, 0.26, 0.28, 1.00)
Theme.Colour.TableRowBg = Color4(0.00, 0.00, 0.00, 0.00)
Theme.Colour.TableRowBgAlt = Color4(1.00, 1.00, 1.00, 0.07)
Theme.Colour.TextSelectedBg = Color4(0.00, 0.00, 1.00, 0.35)
Theme.Colour.DragDropTarget = Color4(1.00, 1.00, 0.00, 0.90)
Theme.Colour.NavHighlight = Color4(0.45, 0.45, 0.90, 0.80)
Theme.Colour.NavWindowingHighlight = Color4(1.00, 1.00, 1.00, 0.70)
Theme.Colour.NavWindowingDimBg = Color4(0.80, 0.80, 0.80, 0.20)
Theme.Colour.ModalWindowDimBg = Color4(0.20, 0.20, 0.20, 0.35)

Theme.Style.WindowPadding = Vector2.new(8, 8)
Theme.Style.FramePadding = Vector2.new(4, 3)
Theme.Style.CellPadding = Vector2.new(4, 2)
Theme.Style.ItemSpacing = Vector2.new(8, 4)
Theme.Style.ItemInnerSpacing = Vector2.new(4, 4)
Theme.Style.IndentSpacing = 21
Theme.Style.ScrollbarSize = 14
Theme.Style.GrabMinSize = 10
Theme.Style.WindowBorderSize = 1
Theme.Style.ChildBorderSize = 1
Theme.Style.PopupBorderSize = 1
Theme.Style.FrameBorderSize = 0
Theme.Style.WindowRounding = 0
Theme.Style.ChildRounding = 0
Theme.Style.FrameRounding = 0
Theme.Style.PopupRounding = 0
Theme.Style.ScrollbarRounding = 9
Theme.Style.GrabRounding = 0
Theme.Style.TabRounding = 4

return Theme
