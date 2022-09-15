local styles = {}

styles.month = {
  padding= dpi(5),
  fg_color = beautiful.pri,
  bg_color = beautiful.bg_normal,
}

styles.normal= {
  bg_color = beautiful.bg_normal,
  fg_color = beautiful.fg_normal,
}

styles.weekday = {
  fg_color = beautiful.pri,
  bg_color = beautiful.bg_normal,
  markup = function(t) return '<b>' .. t .. '</b>' end,
}

styles.focus = {
  bg_color = beautiful.bg_normal,
  fg_color = beautiful.pri,
  markup = function(t) return '<b>' .. t .. '</b>' end,
}

styles.header= {
  bg_color = beautiful.bg_normal,
  fg_color = beautiful.pri,
  markup = function(t) return '<b>' .. t .. '</b>' end,
}

local function decorate_cell(widget, flag, date)
  if flag=='monthheader' and not styles.monthheader then
    flag = 'header'
  end
  local props = styles[flag] or {}
  if props.markup and widget.get_text and widget.set_markup then
    widget:set_markup(props.markup(widget:get_text()))
  end
  -- Change bg color for weekends
  local d = {year=date.year, month=(date.month or 1), day=(date.day or 1)}
  local weekday = tonumber(os.date('%w', os.time(d)))
  local default_bg = (weekday==0 or weekday==6) and '#121212' or '#121212'
  local ret = wibox.widget {
    {
      widget,
      margins = (props.padding or dpi(5)) + (props.border_width or 0),
      widget= wibox.container.margin
    },
    shape= props.shape,
    shape_border_width = props.border_width or 0,
    fg = props.fg_color or '#424242',
    bg = props.bg_color or default_bg,
    widget = wibox.container.background
  }
  return ret
end

local cal = wibox.widget {
  date = os.date('*t'),
  fn_embed = decorate_cell,
  widget = wibox.widget.calendar.month
}

return cal
