local wid = require("dashboard.wid")
local sli = require("dashboard.sli")

local sep = wibox.widget {
  {
    forced_height = dpi(2),
    shape = gears.shape.line,
    widget = wibox.widget.separator
  },
  top = dpi(20),
  bottom = dpi(20),
  widget = wibox.container.margin
}

local dashboard = awful.popup {
  widget = {
    {
      require("dashboard.cal"),
      require("dashboard.play"),
      sep,
      {
        {
          font = beautiful.icofont,
          text = '',
          widget = wibox.widget.textbox,
        },
        sli.bri,
        spacing = dpi(10),
        layout = wibox.layout.fixed.horizontal
      },
      {
        {
          font = beautiful.icofont,
          text = '',
          widget = wibox.widget.textbox,
        },
        sli.vol,
        spacing = dpi(10),
        layout = wibox.layout.fixed.horizontal
      },
      {
        {
          font = beautiful.icofont,
          text = '',
          widget = wibox.widget.textbox,
        },
        sli.bat,
        spacing = dpi(10),
        layout = wibox.layout.fixed.horizontal
      },
      sep,
      {
        wid.wifi,
        wid.blu,
        wid.vol,
        wid.nig,
        spacing = dpi(10),
        layout = wibox.layout.flex.horizontal,
      },
      spacing = dpi(10),
      layout = wibox.layout.fixed.vertical,
    },
    top = dpi(40),
    bottom = dpi(40),
    right = dpi(30),
    left = dpi(30),
    forced_width = dpi(290),
    widget = wibox.container.margin
  },
  shape = help.rrect(2),
  visible = false,
  ontop = true,
  placement = function(c)
    (awful.placement.bottom_left)(c, { margins = { left = 55, bottom = 10 } })
  end,
}

dashboard.toggle = function()
  dashboard.visible = not dashboard.visible
end

return dashboard
