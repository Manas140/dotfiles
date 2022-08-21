naughty.config.defaults.ontop = true
naughty.config.defaults.timeout = 10
naughty.config.defaults.screen = awful.screen.focused()

naughty.config.padding = dpi(10)
naughty.config.spacing = dpi(1)
naughty.config.defaults.shape = help.rrect(2)

naughty.config.defaults.border_width = dpi(10)
naughty.config.defaults.border_color = beautiful.bg_normal

naughty.config.defaults.title = "Notification"
naughty.config.defaults.position = "bottom_right"

naughty.config.defaults.fg = beautiful.fg_focus
naughty.config.defaults.bg = beautiful.bg_normal

naughty.config.presets.normal = {
  fg = beautiful.fg_focus,
  bg = beautiful.bg_normal,
}

naughty.config.presets.low = {
  fg = beautiful.ok,
  bg = beautiful.bg_normal,
}

naughty.config.presets.critical = {
  fg = beautiful.err,
  bg = beautiful.bg_normal,
}
