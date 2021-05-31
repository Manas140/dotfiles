--     ___
--    /   |_      _____  _________  ________  ___ 
--   / /| | | /| / / _ \/ ___/ __ \/ __  __ \/ _ \
--  / ___ | |/ |/ /  __(__  ) /_/ / / / / / /  __/
-- /_/  |_|__/|__/\___/____/\____/_/ /_/ /_/\___/ 

-- AWESOME CONFIG (~/.config/awesome/rc.lua)
-------------------------------------------------------

-- Hide tmux keybinds from the hotkeys popup
package.loaded['awful.hotkeys_popup.keys.tmux'] = {}

-- Importing libraries
local gears = require('gears')
local awful = require('awful')
local wibox = require('wibox')
require('awful.autofocus')
local beautiful = require('beautiful')
local keys = require('keys')

-- Loading the theme
theme_path = string.format('%s/.config/awesome/themes/%s/theme.lua', os.getenv('HOME'), 'Dark')
beautiful.init(theme_path)

-- Set the wallpaper
local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        if type(wallpaper) == 'function' then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal('property::geometry', set_wallpaper)

for s = 1, screen.count() do
	gears.wallpaper.maximized(beautiful.wallpaper, s, true)
end

-- Layouts
awful.layout.layouts = {
    --awful.layout.suit.fair,
    --awful.layout.suit.floating,
    --awful.layout.suit.max,
    --awful.layout.suit.magnifier,
    awful.layout.suit.tile,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.corner.nw,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.corner.ne,
    --awful.layout.suit.corner.sw,
    --awful.layout.suit.corner.se,
}

awful.screen.connect_for_each_screen(function(s)
    local tagTable = {'Default', 'Code', 'Code2', 'Web', 'Others'}

    --[[ Uncomment this if not using custom tag names (no. of tags will be derived from `tags` variable set in keys.lua)
    -- Also uncomment `keys.tags = tags` line in the Variables section in keys.lua!
    local tagTable = {}
    for i = 1, keys.tags do
        table.insert(tagTable, tostring(i))
    end
    ]]

    awful.tag(tagTable, s, awful.layout.layouts[1])
end)

awful.rules.rules = {
    -- All windows
    { rule = { },
      properties = { border_width = beautiful.border_width,
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

-- Colored borders
client.connect_signal('focus', function(c) c.border_color = beautiful.border_focus end)
client.connect_signal('unfocus', function(c) c.border_color = beautiful.border_normal end)

-- Autostart
awful.spawn.with_shell('picom')
awful.spawn.with_shell('dunst')
awful.spawn.with_shell('feh --bg-scale ~/.config/awesome/themes/wallpaper.jpg')

-- Garbage Collection
collectgarbage('setpause', 110)
collectgarbage('setstepmul', 1000)
