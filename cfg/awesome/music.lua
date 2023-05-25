local bling = require("bling")
local playerctl = bling.signal.playerctl.lib()

local prev = wibox.widget {
  align = 'center',
  font = beautiful.icofont,
  text = '',
  widget = wibox.widget.textbox,
}

local next = wibox.widget {
  align = 'center',
  font = beautiful.icofont,
  text = '',
  widget = wibox.widget.textbox,
}

local play = wibox.widget {
  align = 'center',
  font = beautiful.icofont,
  markup = '',
  widget = wibox.widget.textbox,
}

local name = wibox.widget {
  markup = '<b>Nothing Playing</b>',
  align = 'left',
  widget = wibox.widget.textbox
}

local art = wibox.widget {
  image = beautiful.wall,
  resize = true,
  -- clip_shape = help.rrect(beautiful.br),
  opacity = 0.75,
  forced_height = dpi(45),
  forced_width = dpi(45),
  widget = wibox.widget.imagebox
}

local artist_name = wibox.widget {
  markup = 'None',
  align = 'left',
  widget = wibox.widget.textbox
}

playerctl:connect_signal("metadata", function(_, title, artist, album_path, album, new, player_name)
    -- Set art widget  
  if new then
    art.image = beautiful.wall
  end
  art:set_image(gears.surface.load_uncached(album_path))
  name:set_markup_silently(help.fg("<b>"..title.."</b>", beautiful.pri))
  artist_name:set_markup_silently(artist)
end)

playerctl:connect_signal("playback_status", function (_, playing, _)
  if playing then
    play:set_markup_silently(help.fg("", beautiful.pri))
  else
    play:set_markup_silently("")
  end
end)

local prg = wibox.widget {
  forced_height      = dpi(3),
  color              = beautiful.pri,
  background_color   = beautiful.fg2..'4D',
  widget             = wibox.widget.progressbar,
}

playerctl:connect_signal("playback_status", function (_, playing, _)
  if playing then
    play:set_markup_silently(help.fg("", beautiful.pri))
    prg.color = beautiful.pri
  else
    play:set_markup_silently("")
    prg.color = beautiful.fg.."66"
  end
end)


playerctl:connect_signal("position", function (_, a, b, _)
  prg.max_value = b
  prg.value = a
end)

play:buttons(gears.table.join(
  awful.button({}, 1, function() playerctl:play_pause() end)))

next:buttons(gears.table.join(
  awful.button({}, 1, function() playerctl:next() end)))

prev:buttons(gears.table.join(
  awful.button({}, 1, function() playerctl:previous() end)))


client.connect_signal("property::name", function(c)
  if c.name == 'Music' then
    awful.titlebar(c, {
      size = 65,
      position = "bottom",
      fg_focus = beautiful.fg.."66",
    }):setup {
      prg,
      {
        {
          { -- Left
            art,
            {
              name,
              artist_name,
              spacing = dpi(5),
              layout = wibox.layout.fixed.vertical,
            },
            spacing = dpi(15),
            layout = wibox.layout.fixed.horizontal,
          },
          nil,
          { -- Middle
            prev,
            play,
            next,
            spacing = dpi(30),
            layout = wibox.layout.fixed.horizontal,
          },
          layout = wibox.layout.align.horizontal,
        },
        margins = dpi(10),
        widget = wibox.container.margin
      },
      layout = wibox.layout.fixed.vertical
    }
  end
end)
