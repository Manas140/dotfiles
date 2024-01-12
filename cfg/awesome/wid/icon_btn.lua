return function(on, cmd, a)
  a = a or 15

  local wid = wibox.widget {
    {
      {
        id = "wid",
        widget = wibox.widget.textbox,
        font = beautiful.icofont,
        markup = on,
        halign = "center",
        align = 'center',
      },
      widget = wibox.container.margin,
      top = dpi(a),
      bottom = dpi(a),
    },
    fg = beautiful.fg2,
    shape = help.rrect(beautiful.br),
    widget = wibox.container.background,
  }

  wid:connect_signal('mouse::enter', function ()
    wid.fg = beautiful.pri
  end)

  wid:connect_signal('mouse::leave', function ()
    wid.fg = beautiful.fg2
  end)

  wid:buttons(gears.table.join(
    awful.button({}, 1, function()
      cmd()
    end)
  ))

  return wid
end
