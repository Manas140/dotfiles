local name = wibox.widget {
  {
    id = 'name',
    align = 'center',
    valign = 'center',
    forced_height = dpi(70),
    widget = wibox.widget.textbox,
  },
  fg = beautiful.pri,
  widget = wibox.container.background,
}

local prev = wibox.widget {
  align = 'center',
  font = beautiful.icofont,
  text = '',
  widget = wibox.widget.textbox,
}

local next = wibox.widget {
  align = 'center',
  font = beautiful.icofont,
  text = '',
  widget = wibox.widget.textbox,
}

local play = wibox.widget {
  {
    id = 'play',
    align = 'center',
    font = beautiful.icofont,
    text = '',
    widget = wibox.widget.textbox,
  },
  widget = wibox.container.background, 
}

local s = false

awesome.connect_signal('play::value', function(s, a, b)
  if s:match("Playing") then
    play:get_children_by_id('play')[1].text = ''
    play.fg = beautiful.pri
    s = true
  else
    play.fg = beautiful.fg_minimize
    play:get_children_by_id('play')[1].text = ''
    s = false
  end

  if a == "" then a = 'Unkown\n' end
  if b == "" then b = 'Unkown\n' end
  name:get_children_by_id('name')[1].text = string.format('%s by %s', a, b)
end)

play:buttons(gears.table.join(
  awful.button({}, 1, function()
    s = not s
    if s then
      awful.spawn.with_shell("playerctl pause")
      play.fg = beautiful.fg_minimize
      play:get_children_by_id('play')[1].text = ''
    else
      awful.spawn.with_shell("playerctl play")
      play:get_children_by_id('play')[1].text = ''
      play.fg = beautiful.pri
    end 
  end)
))

next:buttons(gears.table.join(
  awful.button({}, 1, function()
    awful.spawn.with_shell("playerctl next")
  end)
))

prev:buttons(gears.table.join(
  awful.button({}, 1, function()
    awful.spawn.with_shell("playerctl previous")
  end)
))

local player = wibox.widget {
  {
    {
      -- img,
      {
        name,
        {
          prev,
          play,
          next,
          layout = wibox.layout.flex.horizontal,
        },
        layout = wibox.layout.fixed.vertical,
      },
      layout = wibox.layout.flex.horizontal,
    },
    margins = dpi(15),
    widget = wibox.container.margin,
  },
  shape = help.rrect(2),
  -- fg = beautiful.pri,
  bg = beautiful.bg_minimize,
  widget = wibox.container.background,
}

return player
