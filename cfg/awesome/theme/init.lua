local theme = {}

local gfs = require("gears.filesystem")
local theme_path = gfs.get_configuration_dir() .. "/theme/"

theme.font = 'JetBrains Mono 10'
theme.barfont = 'JetBrains Mono 12'
theme.icofont = 'Material 14'

theme.ok = "#8C977D"
theme.err = "#B66467"
theme.pri = "#8DA3B9"

theme.wall = theme_path..'wall.png'
theme.music = theme_path..'close.svg'

theme.fg_normal = "#424242"
theme.fg_focus= "#E8e3e3"
theme.fg_minimize = "#424242"

theme.bg_normal = "#121212"
theme.bg_focus= "#101010"
theme.bg_urgent = "#101010"
theme.bg_minimize = "#181818"

theme.useless_gap = dpi(5)
theme.snap_bg = theme.fg_focus

theme.border_width = dpi(5)
theme.border_color = theme.bg_normal

theme.titlebar_fg = theme.fg_normal
theme.titlebar_fg_normal = theme.fg_normal
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

theme.separator_color = theme.fg_normal

theme.titlebar_minimize_button_normal = theme_path.."minimize.svg"
theme.titlebar_minimize_button_focus= theme_path.."minimize.svg"

theme.titlebar_close_button_normal = theme_path.."close.svg"
theme.titlebar_close_button_focus= theme_path.."close.svg"

theme.titlebar_maximized_button_normal_inactive = theme_path.."maximize.svg"
theme.titlebar_maximized_button_focus_inactive= theme_path.."maximize.svg"
theme.titlebar_maximized_button_normal_active = theme_path.."maximize.svg"
theme.titlebar_maximized_button_focus_active= theme_path.."maximize.svg"

theme.icon_theme = nil

return theme
