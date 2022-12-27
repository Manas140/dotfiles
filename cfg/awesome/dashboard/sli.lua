local M = {}

M.vol = wibox.widget {
  bar_shape = help.rrect(beautiful.br),
  bar_height = dpi(20),
  handle_width = dpi(10),
  bar_color = '#00000000',
  handle_color = beautiful.pri,
  handle_shape = help.rrect(beautiful.br),
  forced_height = dpi(20),
  forced_width = dpi(175),
  widget = wibox.widget.slider,
}

M.snd = wibox.widget {
  {
    id = 'prg',
    max_value = 100,
    value = M.vol.value,
    forced_height = dpi(20),
    shape = help.rrect(beautiful.br),
    color = beautiful.pri,
    background_color = beautiful.bg3,
    forced_width = dpi(175),
    widget = wibox.widget.progressbar,
  },
  M.vol,
  layout = wibox.layout.stack,
}

M.mem= wibox.widget {
  max_value = 100,
  value = 0,
  forced_height = dpi(20),
  shape = help.rrect(beautiful.br),
  color = beautiful.pri,
  background_color = beautiful.bg3,
  forced_width = dpi(175),
  widget = wibox.widget.progressbar,
}

M.fs = wibox.widget {
  max_value = 100,
  value = 0,
  forced_height = dpi(20),
  shape = help.rrect(beautiful.br),
  color = beautiful.pri,
  background_color = beautiful.bg3,
  forced_width = dpi(175),
  widget = wibox.widget.progressbar,
}

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

awesome.connect_signal('vol::value', function(mut, val)
  if mut == 0 then
    M.vol.handle_color = beautiful.pri
    M.snd:get_children_by_id('prg')[1].color = beautiful.pri 
  else
    M.vol.handle_color = beautiful.fg2
    M.snd:get_children_by_id('prg')[1].color = beautiful.fg2
  end
  M.vol.value = val
  M.snd:get_children_by_id('prg')[1].value = val
end)

awesome.connect_signal('mem::value', function(val, max)
  M.mem.max_value = max
  M.mem.value = val
end)

awesome.connect_signal('temp::value', function(val)
  M.temp.value = val
end)

awesome.connect_signal('fs::value', function(val, max)
  M.fs.max_value = max
  M.fs.value = val
end)

M.vol:connect_signal('property::value', function(val)
  sig.set_vol(val.value)
  M.snd:get_children_by_id('prg')[1].value = val.value
end)

return M
