local M = {}

M.bri = wibox.widget {
  bar_shape           = help.rrect(2),
  bar_height          = dpi(20),
  bar_color           = beautiful.bg_minimize,
  handle_color        = beautiful.pri,
  handle_shape        = help.rrect(2),
  forced_height       = dpi(20),
  widget              = wibox.widget.slider,
}

M.vol = wibox.widget {
  bar_shape           = help.rrect(2),
  bar_height          = dpi(20),
  bar_color           = beautiful.bg_minimize,
  handle_color        = beautiful.pri,
  handle_shape        = help.rrect(2),
  forced_height       = dpi(20),
  widget              = wibox.widget.slider,
}

M.bat = wibox.widget {
  max_value          = 100,
  value              = 10,
  forced_height      = dpi(20),
  shape              = help.rrect(2),
  color              = beautiful.pri,
  background_color   = beautiful.bg_minimize,
  widget             = wibox.widget.progressbar,
}

awesome.connect_signal('bri::value', function(val)
  M.bri.value = val
end)

awesome.connect_signal('vol::value', function(mut, val)
  if mut == 0 then
    M.vol.handle_color = beautiful.pri
  else
    M.vol.handle_color = beautiful.fg_minimize
  end
  M.vol.value = val
end)

awesome.connect_signal('bat::value', function(stat, val)
  if stat:match("Charging") or stat:match("Full") then
    M.bat.color = beautiful.pri
  else
    M.bat.color = beautiful.fg_minimize
  end
  M.bat.value = val
end)

M.vol:connect_signal('property::value', function(val)
  sig.set_vol(val.value)
end)

M.bri:connect_signal('property::value', function(val)
  sig.set_bri(val.value)
end)

return M
