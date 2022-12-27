local M = {}

-- Separator
M.sep = wibox.widget {
  {
    forced_height = dpi(2),
    shape = gears.shape.line,
    widget = wibox.widget.separator
  },
  top = dpi(15),
  left = dpi(5),
  right = dpi(5),
  bottom = dpi(15),
  widget = wibox.container.margin
}

M.launch = wibox.widget {
  {
    markup = "",
    font = beautiful.icofont,
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
  },
  widget = wibox.container.background,
}

M.search = wibox.widget {
  {
    markup = "",
    font = beautiful.icofont,
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
  },
  widget = wibox.container.background,
}

M.search:buttons(gears.table.join(
  awful.button({}, 1, function ()
    awful.spawn.with_shell("rofi -show drun")
  end)
))

M.launch:buttons(gears.table.join(
  awful.button({}, 1, function ()
    if not dashboard.visible then
      M.launch.fg = beautiful.pri
    else
      M.launch.fg = beautiful.fg
    end
    dashboard.toggle()
  end)
))

return M
