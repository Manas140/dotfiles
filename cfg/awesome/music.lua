local bling = require("bling")
local playerctl = bling.signal.playerctl.lib()

local icon = require('wid.icon_btn')
local next = icon('', function() return playerctl:next() end)
local prev = icon('', function() return playerctl:previous() end)
local play = icon('', function() return playerctl:play_pause() end)

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

local prg = wibox.widget {
  forced_height      = dpi(3),
  color              = beautiful.pri,
  background_color   = beautiful.fg2..'4D',
  widget             = wibox.widget.progressbar,
}

playerctl:connect_signal("playback_status", function (_, playing, _)
  if playing then
    play:get_children_by_id("wid")[1]:set_markup_silently(help.fg("", beautiful.pri))
    prg.color = beautiful.pri
    play.text = ''
  else
    play:get_children_by_id("wid")[1]:set_markup_silently("")
    prg.color = beautiful.fg.."66"
    play.text = ''
  end
end)


playerctl:connect_signal("position", function (_, a, b, _)
  prg.max_value = b
  prg.value = a
end)

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
