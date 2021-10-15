-- Awesome keybindings

-- Importing libraries
local gears = require('gears')
local awful = require('awful')

-- Variables
local keys = {}

mod = 'Mod4'
tags = 7
keys.tags = tags   --Uncomment this if not using custom tag names
terminal = 'kitty'
lock = string.format('sh %s/.local/bin/lock', os.getenv('HOME'))

-- Keybindings
keys.globalkeys = gears.table.join(
  -- Awesome
  awful.key({mod, 'Shift'}, 'r', awesome.restart),
  awful.key({mod, 'Shift'}, 'e', awesome.quit),
  awful.key({mod, 'Shift'}, 'l', function() awful.util.spawn(lock) end),

  --Hardware
  awful.key({}, 'XF86MonBrightnessUp', function() awful.util.spawn('xbacklight +5') end),
  awful.key({}, 'XF86MonBrightnessDown', function() awful.util.spawn('xbacklight -5') end),
  awful.key({}, 'XF86AudioRaiseVolume', function() awful.util.spawn('pactl set-sink-volume @DEFAULT_SINK@ +5%') end),
  awful.key({}, 'XF86AudioLowerVolume', function() awful.util.spawn('pactl set-sink-volume @DEFAULT_SINK@ -5%') end),
  -- Window management
  awful.key({'Mod1'}, 'Tab', function() awful.client.focus.byidx(1) end),
  awful.key({mod}, 'Right', function () awful.tag.incmwfact(0.05) end),
  awful.key({mod}, 'Left', function () awful.tag.incmwfact(-0.05) end),
  awful.key({mod}, 'Up', function () awful.client.incwfact(0.05) end),
  awful.key({mod}, 'Down', function () awful.client.incwfact(-0.05) end),

  -- Applications
  awful.key({mod}, 'Return', function() awful.util.spawn(terminal) end),
  awful.key({mod}, 'r', function() awful.util.spawn('rofi -show drun') end),

  -- Screenshots
  awful.key({}, 'Print', function() awful.util.spawn('flameshot gui') end)
)

keys.clientkeys = gears.table.join(
  awful.key({mod}, 'q', function(c) c:kill() end),
  awful.key({mod}, 'space', function(c) c.fullscreen = not c.fullscreen; c:raise() end),
  awful.key({mod}, 'Tab', function() awful.client.floating.toggle() end)
)

-- Mouse controls
keys.clientbuttons = gears.table.join(
  awful.button({}, 1, function(c) client.focus = c end),
  awful.button({mod}, 1, function() awful.mouse.client.move() end),
  awful.button({mod}, 2, function(c) c:kill() end),
  awful.button({mod}, 3, function() awful.mouse.client.resize() end)
)

for i = 1, tags do
  keys.globalkeys = gears.table.join(keys.globalkeys,
  -- View tag
  awful.key({mod}, '#'..i + 9,
    function ()
      local tag = awful.screen.focused().tags[i]
      if tag then
         tag:view_only()
      end
    end),
  -- Move window to tag
  awful.key({mod, 'Shift'}, '#'..i + 9,
    function ()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:move_to_tag(tag)
        end
     end
    end),
  awful.key({mod, 'Control'}, '#'..i + 9,
    function ()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end))
end

-- Set globalkeys
root.keys(keys.globalkeys)

return keys
