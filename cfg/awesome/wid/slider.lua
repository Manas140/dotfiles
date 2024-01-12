M.temp = wibox.widget {
  max_value = 80000,
  value = 0,
  forced_height = dpi(20),
  shape = help.rrect(beautiful.br),
  color = beautiful.pri,
  background_color = beautiful.bg3,
  forced_width = dpi(175),
  widget = wibox.widget.progressbar,
}
