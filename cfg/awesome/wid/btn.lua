return function(on, cmd_on, off, cmd_off, a)
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
      margins = dpi(a),
    },
    fg = beautiful.pri,
    bg = beautiful.fg..'0d',
    shape = help.rrect(beautiful.br),
    widget = wibox.container.background,
  }

  wid:connect_signal('mouse::enter', function ()
    wid.bg = beautiful.fg..'1a'
  end)

  wid:connect_signal('mouse::leave', function ()
    wid.bg = beautiful.fg..'0d'
  end)

  if off ~= nil then
    local status = true

    local update = function (is_on)
      if is_on then
        wid:get_children_by_id("wid")[1].markup = on
        wid.fg = beautiful.pri
        status = true
      else
        wid:get_children_by_id("wid")[1].markup = off
        wid.fg = beautiful.fg2
        status = false
      end
    end

    wid:buttons(gears.table.join(
      awful.button({}, 1, function()
        if status then
          cmd_off()
        else
          cmd_on()
        end
        status = not status
        update(status)
      end)
    ))

    return wid, update
  else
    wid:buttons(gears.table.join(
      awful.button({}, 1, function()
        cmd_on()
      end)
    ))

    return wid
  end
end

