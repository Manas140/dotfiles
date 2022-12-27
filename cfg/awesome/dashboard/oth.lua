local M = {}

M.cal = wibox.widget {
  {
    {
      {
        align = 'center',
        markup = help.fg("<b>Welcome, "..os.getenv('USER'):gsub("^%l", string.upper).."</b>", beautiful.pri),
        widget = wibox.widget.textbox
      },
      {
        align = 'center',
        format="%A, %B %e",
        refresh=1,
        widget = wibox.widget.textclock
      },
      spacing = dpi(5),
      layout = wibox.layout.fixed.vertical,
    },
    widget = wibox.container.margin,
    margins = dpi(20),
  },
  shape = help.rrect(beautiful.br),
  bg = beautiful.bg2,
  fg = beautiful.fg2,
  widget = wibox.container.background,
}

return M
