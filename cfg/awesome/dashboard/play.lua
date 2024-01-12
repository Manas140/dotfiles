local bling = require("bling")
local playerctl = bling.signal.playerctl.lib()

local icon = require('wid.icon_btn')
local next = icon('', function() return playerctl:next() end, 0)
local prev = icon('', function() return playerctl:previous() end, 0)
local play = icon('', function() return playerctl:play_pause() end, 0)

local art = wibox.widget {
  image = beautiful.wall,
  resize = true,
  -- clip_shape = help.rrect(beautiful.br),
  opacity = 0.5,
  forced_height = dpi(120),
  forced_width = dpi(120),
  widget = wibox.widget.imagebox
}

local name = wibox.widget {
  markup = '<b>Nothing Playing</b>',
  align = 'center',
  valign = 'center',
  forced_height = dpi(15),
  widget = wibox.widget.textbox
}

local artist_name = wibox.widget {
  markup = 'None',
  align = 'center',
  valign = 'center',
  forced_height = dpi(20),
  widget = wibox.widget.textbox
}

local prg = wibox.widget {
  forced_height      = dpi(3),
  shape              = help.rrect(beautiful.br),
  color              = beautiful.pri,
  background_color   = beautiful.fg2..'4D',
  forced_width       = dpi(175),
  widget             = wibox.widget.progressbar,
}


local player = wibox.widget {
  {
    art,
    {
      {
        widget = wibox.widget.textbox,
      },
      bg = {
        type = "linear",
        from = { 0, 0},
        to = { 120, 0},
        stops = { { 0, beautiful.bg2.."00" }, { 1, beautiful.bg2.."FF" } }
      },
      widget = wibox.container.background,
    },
    {
      {
        name,
        artist_name,
        prg,
        {
          prev,
          play,
          next,
          layout = wibox.layout.flex.horizontal,
        },
        spacing = dpi(10),
        layout = wibox.layout.fixed.vertical,
      },
      margins = dpi(20),
      widget = wibox.container.margin,
    },
    layout = wibox.layout.stack,
  },
  forced_height = dpi(120),
  shape = help.rrect(beautiful.br),
  fg = beautiful.pri..'99',
  bg = beautiful.bg2,
  widget = wibox.container.background,
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

return player
