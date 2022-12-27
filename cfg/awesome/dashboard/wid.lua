local M = {}

local on = beautiful.pri
local off = beautiful.fg2

M.vol = wibox.widget {
  {
    {
      id = "vol",
      widget = wibox.widget.textbox,
      font = beautiful.icofont,
      markup = "",
      halign = "center",
      align = 'center',
    },
    widget = wibox.container.margin,
    top = dpi(15),
    bottom = dpi(15),
  },
  fg = beautiful.pri,
  bg = beautiful.bg3,
  shape = help.rrect(beautiful.br),
  widget = wibox.container.background,
}

M.wifi = wibox.widget {
  {
    {
      id = 'wifi',
      widget = wibox.widget.textbox,
      font = beautiful.icofont,
      markup = "",
      halign = "center",
      align = 'center',
    },
    widget = wibox.container.margin,
    margins = dpi(5),
  },
  fg = on,
  bg = beautiful.bg3,
  shape = help.rrect(beautiful.br),
  widget = wibox.container.background,
}

M.nig = wibox.widget {
  {
    {
      id = "nig",
      widget = wibox.widget.textbox,
      font = beautiful.icofont,
      markup = "",
      halign = "center",
      align = 'center',
    },
    widget = wibox.container.margin,
    margins = dpi(5),
  },
  fg = beautiful.pri,
  bg = beautiful.bg3,
  shape = help.rrect(beautiful.br),
  widget = wibox.container.background,
}

M.blu = wibox.widget {
  {
    {
      id = 'blu',
      widget = wibox.widget.textbox,
      font = beautiful.icofont,
      markup = "",
      halign = "center",
      align = 'center',
    },
    widget = wibox.container.margin,
    margins = dpi(5),
  },
  fg = on,
  bg = beautiful.bg3,
  shape = help.rrect(beautiful.br),
  widget = wibox.container.background,
}

local blue = true

M.blu:buttons(gears.table.join(
  awful.button({}, 1, function()
    blue = not blue
    if blue then
      awful.spawn.with_shell("bluetoothctl power on")
      M.blu:get_children_by_id("blu")[1].markup = ""
      M.blu.fg = on
    else
      awful.spawn.with_shell("bluetoothctl power off")
      M.blu:get_children_by_id("blu")[1].markup = ""
      M.blu.fg = off
    end
  end)
))

local vol = true

awesome.connect_signal('vol::value', function(mut, val)
  if mut == 0 then
    M.vol:get_children_by_id("vol")[1].markup = ""
    M.vol.fg = on
    vol = true
  else
    M.vol:get_children_by_id("vol")[1].markup = ""
    M.vol.fg = off
    vol = false
  end
end)

M.vol:buttons(gears.table.join(
  awful.button({}, 1, function()
    vol = not vol
    if vol then
      awful.spawn.with_shell("pulsemixer --unmute")
    else
      awful.spawn.with_shell("pulsemixer --mute")
    end
    sig.vol()
  end)
))

local wifi = true

awesome.connect_signal("net::value", function(_, stat)
  if stat:match("up") then
    M.wifi.fg = on
    M.wifi:get_children_by_id("wifi")[1].markup = ""
    wifi = true
  else
    M.wifi.fg = off
    M.wifi:get_children_by_id("wifi")[1].markup = ""
    wifi = false
  end
end)

M.wifi:buttons(gears.table.join(
  awful.button({}, 1, function()
    wifi = not wifi
    if wifi then
      M.wifi.fg = on
      M.wifi:get_children_by_id("wifi")[1].markup = ""
      awful.spawn.with_shell("nmcli radio wifi on")
    else
      M.wifi.fg = off
      M.wifi:get_children_by_id("wifi")[1].markup = ""
      awful.spawn.with_shell("nmcli radio wifi off")
    end
  end)
))

local nig = true -- enabled in rc.lua using autostart

M.nig:buttons(gears.table.join(
  awful.button({}, 1, function()
    nig = not nig
    if nig then
      M.nig:get_children_by_id("nig")[1].markup = ""
      M.nig.fg = on
      awful.spawn.with_shell("redshift -x && redshift -O 4000K")
    else
      M.nig:get_children_by_id("nig")[1].markup = ""
      M.nig.fg = off
      awful.spawn.with_shell("redshift -x")
    end
  end)
))

return M
