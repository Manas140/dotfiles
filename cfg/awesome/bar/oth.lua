local M = {}

-- Separator
M.sep = wibox.widget {
  {
    forced_height = dpi(2),
    shape = gears.shape.line,
    widget = wibox.widget.separator
  },
  top = dpi(20),
  left = dpi(5),
  right = dpi(5),
  bottom = dpi(20),
  widget = wibox.container.margin
}

return M
