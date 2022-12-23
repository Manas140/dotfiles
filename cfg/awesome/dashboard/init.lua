local wid = require("dashboard.wid")
local sli = require("dashboard.sli")

local sep = wibox.widget {
  {
    forced_height = dpi(2),
    shape = gears.shape.line,
    widget = wibox.widget.separator
  },
  top = dpi(10),
  bottom = dpi(10),
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
          text = '',
          widget = wibox.widget.textbox,
        },
        sli.vol,
        spacing = dpi(10),
        layout = wibox.layout.fixed.horizontal
      },
      -- {
      --   {
      --     font = beautiful.icofont,
      --     text = '',
      --     widget = wibox.widget.textbox,
      --   },
      --   sli.fs,
      --   spacing = dpi(10),
      --   layout = wibox.layout.fixed.horizontal
      -- },
      {
        {
          font = beautiful.icofont,
          text = '',
          widget = wibox.widget.textbox,
        },
        sli.temp,
        spacing = dpi(10),
        layout = wibox.layout.fixed.horizontal
      },
      {
        {
          font = beautiful.icofont,
          text = '',
          widget = wibox.widget.textbox,
        },
        sli.mem,
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
    top = dpi(20),
    bottom = dpi(20),
    right = dpi(20),
    left = dpi(20),
    forced_width = dpi(270),
    widget = wibox.container.margin
  },
  shape = help.rrect(beautiful.br),
  visible = false,
  ontop = true,
  placement = function(c)
    (awful.placement.bottom_left)(c, { margins = { left = 60, bottom = 10 } })
  end,
}

dashboard.toggle = function()
  dashboard.visible = not dashboard.visible
end

return dashboard
