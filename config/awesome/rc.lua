-- Importing libraries
local gears = require('gears')
local awful = require('awful')
local wibox = require('wibox')
require('awful.autofocus')
local beautiful = require('beautiful')
local keys = require('keys')

-- Variables
theme_path = string.format('%s/.config/awesome/themes/%s.lua', os.getenv('HOME'), 'default')
beautiful.init(theme_path)

-- Layouts
awful.layout.layouts = {
  --awful.layout.suit.fair,
  awful.layout.suit.tile,
  --awful.layout.suit.spiral.dwindle,
  --awful.layout.suit.max,
  --awful.layout.suit.magnifier,
  --awful.layout.suit.tile.bottom,
  --awful.layout.suit.tile.top,
  --awful.layout.suit.corner.nw,
  --awful.layout.suit.fair.horizontal,
  --awful.layout.suit.spiral,
  --awful.layout.suit.max.fullscreen,
  --awful.layout.suit.corner.ne,
  --awful.layout.suit.corner.sw,
  --awful.layout.suit.corner.se,
  awful.layout.suit.floating,
}

-- Virtual desktops/ Tabs
awful.screen.connect_for_each_screen(function(s)
  local tagTable = {}
  for i = 1, keys.tags do
    table.insert(tagTable, tostring(i))
  end

  awful.tag(tagTable, s, awful.layout.layouts[1])
end)

awful.rules.rules = {
  -- All windows
  { rule = { },
    properties = { 
      border_width = beautiful.border_width,
      focus = awful.client.focus.filter,
      raise = true,
      keys = keys.clientkeys,
      buttons = keys.clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap+awful.placement.no_offscreen
    }
  },

  -- Floating exceptions
  { rule_any = {
      class = {'Lxappearance', 'qt5ct'},
      name = {'Event Tester'}, --xev
      role = {'pop-up', 'GtkFileChooserDialog'},
      type = {'dialog'}
    },
    properties = {floating = true}
  }
}

-- Enable sloppy focus
client.connect_signal('mouse::enter', function(c)
  c:emit_signal('request::activate', 'mouse_enter', {raise = false})
end)

-- Autostart
awful.spawn.with_shell('redshift -x && redshift -O 4000K')
awful.spawn.with_shell('$HOME/.config/polybar/launch.sh')
awful.spawn.with_shell('killall dunst; dunst')
awful.spawn.with_shell('picom -b')
awful.spawn.with_shell('feh --bg-fill -r -z $HOME/Pictures/Wallpapers')

-- Garbage Collection
collectgarbage('setpause', 110)
collectgarbage('setstepmul', 1000)
