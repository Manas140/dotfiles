naughty.config.defaults.ontop = true
naughty.config.defaults.timeout = 3 
naughty.config.defaults.screen = awful.screen.focused()

naughty.config.padding = dpi(10)

naughty.config.spacing = dpi(5)
naughty.config.defaults.shape = help.rrect(beautiful.br)

naughty.config.defaults.border_width = dpi(15)
naughty.config.defaults.border_color = beautiful.bg

naughty.config.defaults.title = "Notification"
naughty.config.defaults.position = "bottom_right"

naughty.config.defaults.fg = beautiful.fg
naughty.config.defaults.bg = beautiful.bg

naughty.config.presets.normal = {
  fg = beautiful.fg,
  bg = beautiful.bg,
}

naughty.config.presets.low = {
  fg = beautiful.ok,
  bg = beautiful.bg,
}

naughty.config.presets.critical = {
  fg = beautiful.err,
  bg = beautiful.bg,
}
