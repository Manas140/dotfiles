local sys = require("bar.sys")
local oth = require("bar.oth")

local grp = wibox.widget {
  {
    {
      {
        sys.bri,
        sys.net,
        sys.vol,
        sys.bat,
        spacing = dpi(20),
        layout = wibox.layout.fixed.vertical,
      },
      oth.sep,
      sys.clock,
      layout = wibox.layout.fixed.vertical,
    },
    left = dpi(2),
    right = dpi(2),
    bottom = dpi(10),
    top = dpi(10),
    widget = wibox.container.margin
  },
  shape = help.rrect(2),
  widget = wibox.container.background,
}

grp:buttons(gears.table.join(
  awful.button({}, 1, function ()
    s = not s
    if s then
      grp.fg = beautiful.pri
      grp.bg = beautiful.bg_minimize
    else
      grp.bg = beautiful.bg_normal
      grp.fg = beautiful.fg_normal
    end
    dashboard.toggle()
  end)
))

awful.screen.connect_for_each_screen(function(s)
  awful.wibar({
    position = "left",
    bg = beautiful.bg_normal,
    fg = beautiful.fg_normal,
    width = dpi(45),
    screen = s
  }):setup {
    layout = wibox.layout.align.vertical,
    { -- Top 
      {
        require('bar.tag')(s),
        require('bar.task')(s),
        layout = wibox.layout.fixed.vertical,
      },
      left = dpi(5),
      right = dpi(5),
      top = dpi(10),
      widget = wibox.container.margin,
    },
    { -- Middle 
      layout = wibox.layout.fixed.vertical,
    },
    { -- Bottom
      grp,
      left = dpi(5),
      right = dpi(5),
      bottom = dpi(10),
      widget = wibox.container.margin,
    },
  }
end)
