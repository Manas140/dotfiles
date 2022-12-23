local theme = {}

local gfs = require("gears.filesystem")
local theme_path = gfs.get_configuration_dir() .. "/theme/"
local themes_path = gfs.get_themes_dir()

theme.font = 'JetBrains Mono 10'
theme.barfont = 'JetBrains Mono 12'
theme.icofont = 'Material Icons Round 14'

theme.ok = "#8C977D"
theme.err = "#B66467"
theme.pri = "#8DA3B9"

theme.br = dpi(2)

theme.wall = theme_path..'wall.png'

theme.fg_focus= "#e8e3e3"
theme.fg_normal = "#484646"
theme.fg_minimize = "#484646"

theme.bg_normal = "#121212"
theme.bg_focus= "#282828"
theme.bg_urgent = "#101010"
theme.bg_minimize = "#181818"

theme.useless_gap = dpi(5)
theme.snap_bg = theme.fg_focus

theme.border_width = dpi(5)
theme.border_color = theme.bg_normal

theme.titlebar_fg = theme.fg_normal
theme.titlebar_fg_normal = theme.fg_minimize
theme.titlebar_fg_focus = theme.fg_focus
theme.titlebar_bg = theme.bg_normal
theme.titlebar_bg_normal = theme.bg_normal
theme.titlebar_font = theme.font

theme.taglist_bg = theme.bg_normal
theme.taglist_bg_focus = theme.bg_focus
theme.taglist_font = theme.barfont

theme.menu_bg_normal = theme.bg_normal
theme.menu_bg_focus = theme.bg_minimize
theme.menu_font = theme.font
theme.menu_border_color = theme.bg_normal
theme.menu_height = dpi(30)
theme.menu_width  = dpi(130)
theme.menu_border_width = dpi(10)
theme.menu_submenu_icon = theme_path.."menu.svg"

theme.tasklist_plain_task_name = true

theme.notification_bg = theme.bg_normal
theme.notification_fg = theme.fg_normal
theme.notification_width = dpi(200)

theme.separator_color = theme.fg_minimize

theme.titlebar_minimize_button_normal = theme_path.."minimize.svg"
theme.titlebar_minimize_button_focus= theme_path.."minimize.svg"

theme.titlebar_close_button_normal = theme_path.."close.svg"
theme.titlebar_close_button_focus= theme_path.."close.svg"

theme.titlebar_maximized_button_normal_inactive = theme_path.."maximize.svg"
theme.titlebar_maximized_button_focus_inactive= theme_path.."maximize.svg"
theme.titlebar_maximized_button_normal_active = theme_path.."maximized.svg"
theme.titlebar_maximized_button_focus_active= theme_path.."maximized.svg"

theme.titlebar_floating_button_normal_active = theme_path.."float.svg"
theme.titlebar_floating_button_focus_active= theme_path.."float.svg"

theme.layout_fairh = gears.color.recolor_image(themes_path.."default/layouts/fairhw.png", theme.bg_focus)
theme.layout_fairv = gears.color.recolor_image(themes_path.."default/layouts/fairvw.png", theme.bg_focus)
theme.layout_floating = gears.color.recolor_image(themes_path.."default/layouts/floatingw.png", theme.bg_focus)
theme.layout_magnifier = gears.color.recolor_image(themes_path.."default/layouts/magnifierw.png", theme.bg_focus)
theme.layout_max = gears.color.recolor_image(themes_path.."default/layouts/maxw.png", theme.bg_focus)
theme.layout_fullscreen = gears.color.recolor_image(themes_path.."default/layouts/fullscreenw.png", theme.bg_focus)
theme.layout_tilebottom = gears.color.recolor_image(themes_path.."default/layouts/tilebottomw.png", theme.bg_focus)
theme.layout_tileleft = gears.color.recolor_image(themes_path.."default/layouts/tileleftw.png", theme.bg_focus)
theme.layout_tile = gears.color.recolor_image(themes_path.."default/layouts/tilew.png", theme.bg_focus)
theme.layout_tiletop = gears.color.recolor_image(themes_path.."default/layouts/tiletopw.png", theme.bg_focus)
theme.layout_spiral = gears.color.recolor_image(themes_path.."default/layouts/spiralw.png", theme.bg_focus)
theme.layout_dwindle = gears.color.recolor_image(themes_path.."default/layouts/dwindlew.png", theme.bg_focus)

theme.layoutlist_fg_normal = theme.fg_normal
theme.layoutlist_bg_normal = theme.bg_normal
theme.layoutlist_fg_selected = theme.fg_focus
theme.layoutlist_bg_selected = theme.bg_normal

theme.icon_theme = nil

return theme
