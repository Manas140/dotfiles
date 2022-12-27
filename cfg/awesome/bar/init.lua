local sys = require("bar.sys")
local oth = require("bar.oth")

local main = wibox.widget {
  {
    {
      oth.launch,
      oth.search,
      spacing = dpi(20),
      layout = wibox.layout.fixed.vertical,
    },
    left = dpi(2),
    right = dpi(2),
    bottom = dpi(10),
    top = dpi(10),
    widget = wibox.container.margin
  },
  shape = help.rrect(beautiful.br),
  bg = beautiful.bg2,
  widget = wibox.container.background,
}

local sys = wibox.widget {
  {
    {
      {
        sys.net,
        sys.blu,
        sys.vol,
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
  shape = help.rrect(beautiful.br),
  bg = beautiful.bg2,
  widget = wibox.container.background,
}

awful.screen.connect_for_each_screen(function(s)
  awful.wibar({
    position = "left",
    bg = beautiful.bg,
    fg = beautiful.fg,
    width = dpi(50),
    screen = s
  }):setup {
    layout = wibox.layout.align.vertical,
    { -- Top
      main,
      left = dpi(5),
      right = dpi(5),
      top = dpi(10),
      bottom = dpi(5),
      widget = wibox.container.margin,
    },
    { -- Middle
      {
        {
          {
            require('bar.tag')(s),
            require('bar.task')(s),
            layout = wibox.layout.fixed.vertical,
          },
          bg = beautiful.bg2,
          shape = help.rrect(beautiful.br),
          widget = wibox.container.background
        },
        top = dpi(5),
        bottom = dpi(5),
        left = dpi(5),
        right = dpi(5),
        widget = wibox.container.margin,
      },
      layout = wibox.layout.flex.vertical,
    },
    { -- Bottom
      {
        sys,
        layout = wibox.layout.fixed.vertical,
      },
      top = dpi(5),
      left = dpi(5),
      right = dpi(5),
      bottom = dpi(10),
      widget = wibox.container.margin,
    },
  }
end)
