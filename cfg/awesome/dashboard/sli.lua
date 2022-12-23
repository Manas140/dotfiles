local M = {}

M.vol = wibox.widget {
  bar_shape           = help.rrect(beautiful.br),
  bar_height          = dpi(20),
  bar_color           = beautiful.bg_minimize,
  handle_color        = beautiful.pri,
  handle_shape        = help.rrect(beautiful.br),
  forced_height       = dpi(20),
  widget              = wibox.widget.slider,
}

M.mem= wibox.widget {
  max_value          = 100,
  value              = 0,
  forced_height      = dpi(20),
  shape              = help.rrect(beautiful.br),
  color              = beautiful.pri,
  background_color   = beautiful.bg_minimize,
  widget             = wibox.widget.progressbar,
}

M.fs = wibox.widget {
  max_value          = 100,
  value              = 0,
  forced_height      = dpi(20),
  shape              = help.rrect(beautiful.br),
  color              = beautiful.pri,
  background_color   = beautiful.bg_minimize,
  widget             = wibox.widget.progressbar,
}

M.temp  = wibox.widget {
  max_value          = 80000,
  value              = 0,
  forced_height      = dpi(20),
  shape              = help.rrect(beautiful.br),
  color              = beautiful.pri,
  background_color   = beautiful.bg_minimize,
  widget             = wibox.widget.progressbar,
}

awesome.connect_signal('vol::value', function(mut, val)
  if mut == 0 then
    M.vol.handle_color = beautiful.pri
  else
    M.vol.handle_color = beautiful.fg_minimize
  end
  M.vol.value = val
end)

awesome.connect_signal('mem::value', function(val, max)
  M.mem.max_value = max
  M.mem.value = val
  if val >= tonumber(max/4*3) then
    M.mem.color = beautiful.err
  else
    M.mem.color = beautiful.pri
  end
end)

awesome.connect_signal('temp::value', function(val)
  M.temp.value = val
  if val > tonumber(M.temp.max_value/4 * 3) then
    M.temp.color = beautiful.err
  end
end)

awesome.connect_signal('fs::value', function(val, max)
  M.fs.max_value = max
  M.fs.value = val
end)

M.vol:connect_signal('property::value', function(val)
  sig.set_vol(val.value)
end)

return M
