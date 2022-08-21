local M = {}

-- Wifi
M.net = wibox.widget {
  font = beautiful.icofont,
  align = 'center',
  widget = wibox.widget.textbox,
}

-- Volume
M.vol = wibox.widget {
  font = beautiful.icofont,
  align = 'center',
  widget = wibox.widget.textbox,
}

-- Battery
M.bat = wibox.widget {
  font = beautiful.icofont,
  align = 'center',
  widget = wibox.widget.textbox,
}

-- Clock
M.clock = wibox.widget {
  font = beautiful.barfont,
  align = 'center',
  valign = 'center',
  widget = wibox.widget.textbox
}

awesome.connect_signal("net::value", function(stat)
  if stat:match("down") then
    M.net.markup = ""
  else
    M.net.markup = ""
  end
end)

awesome.connect_signal('vol::value', function(mut, val)
  if mut == 0 then
    if val > 60 then
      M.vol.markup = ""
    elseif val > 30 then
      M.vol.markup = ""
    else
      M.vol.markup = ""
    end
  else
    M.vol.markup = ""
  end
end)

awesome.connect_signal('bat::value', function(stat, _)
  if stat:match("Charging") then
    M.bat.markup = ""
  elseif stat:match("Full") then
    M.bat.markup = ""
  else
    M.bat.markup = ""
  end
end)

gears.timer {
  timeout = 60,
  autostart = true,
  call_now = true,
  callback = function()
    M.clock.markup = os.date("%H\n%M")
  end
}

return M
