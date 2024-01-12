local btn = require('wid.btn')
local M = {}

-- Separator
M.sep = wibox.widget {
  {
    forced_height = dpi(2),
    shape = gears.shape.line,
    widget = wibox.widget.separator
  },
  top = dpi(15),
  left = dpi(5),
  right = dpi(5),
  bottom = dpi(15),
  widget = wibox.container.margin
}

local c = function (a) return function() awful.spawn.with_shell(a) end end

M.search = btn('', c'rofi -show drun', _, _, 10)

-- local col = function()
--   return awful.spawn.easy_async_with_shell('. ~/usr/local/bin/pluck', function (out)
--     naughty.notify({ title=out, icon='/tmp/image.png' })
--   end)
-- end

-- M.col = btn('', c'sleep 0.1s; /usr/local/bin/pluck', _, _, 10)
M.scr = btn('', c'flameshot gui', _, _, 10)

return M
