return function (wid)
  wid:connect_signal('mouse::enter', function ()
    wid.bg = beautiful.fg..'1a'
    wid.background_color = beautiful.fg..'1a'
  end)

  wid:connect_signal('mouse::leave', function ()
    wid.bg = beautiful.fg..'0d'
    wid.background_color = beautiful.fg..'0d'
  end)
end
