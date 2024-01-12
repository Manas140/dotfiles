local theme = {}

local gfs = require("gears.filesystem")
local theme_path = gfs.get_configuration_dir() .. "/theme/"
theme.font = 'JetBrains Mono Medium 10'
theme.barfont = 'JetBrains Mono Medium 12'
theme.icofont = 'Material Icons Round 14'

theme.ok = "#8C977D"
theme.err = "#B66467"
theme.pri = "#a8a3a3"

theme.br = dpi(8)

theme.wall = theme_path..'wall.png'

theme.fg = "#e8e3e3"
theme.fg2 = "#626262"

theme.bg = "#101010"
theme.bg2 = '#1b1b1b'
theme.bg3 = '#222222'

theme.fg_focus = theme.fg
theme.fg_normal = theme.fg.."40"
theme.fg_minimize = theme.fg2

theme.bg_normal = theme.bg2
theme.bg_urgent = theme.err.."40"
theme.bg_minimize = theme.fg.."10"
theme.bg_focus = theme.fg2.."cc"

theme.useless_gap = dpi(5)
theme.snap_bg = theme.fg2

theme.border_width = dpi(5)
theme.border_color = theme.bg

theme.titlebar_fg = theme.fg.."40"
theme.titlebar_fg_normal = theme.fg2
theme.titlebar_fg_focus = theme.fg
theme.titlebar_bg = theme.bg
theme.titlebar_bg_normal = theme.bg
theme.titlebar_font = theme.font

theme.taglist_bg = theme.bg
theme.taglist_bg_focus = theme.pri
theme.taglist_font = theme.barfont

theme.menu_bg_normal = theme.bg
theme.menu_bg_focus = theme.bg2
theme.menu_font = theme.font
theme.menu_border_color = theme.bg
theme.menu_height = dpi(30)
theme.menu_width  = dpi(130)
theme.menu_border_width = dpi(10)
theme.menu_submenu_icon = theme_path.."menu.svg"

theme.tasklist_plain_task_name = true

theme.notification_bg = theme.bg
theme.notification_fg = theme.fg
theme.notification_width = dpi(225)
theme.notification_max_height = dpi(80)
theme.notification_icon_size = dpi(80)

theme.separator_color = theme.fg2

theme.titlebar_minimize_button_focus= gears.color.recolor_image(theme_path.."circle.svg", theme.ok)
theme.titlebar_minimize_button_normal= theme_path.."circle.svg"

theme.titlebar_close_button_normal = theme_path.."circle.svg"
theme.titlebar_close_button_focus= gears.color.recolor_image(theme_path.."circle.svg", theme.err)

theme.icon_theme = "Reversal"

theme.playerctl_player  = {"mpd",  "%any"}

return theme
