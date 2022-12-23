local styles = {}

styles.month = {
  fg_color = beautiful.pri,
  bg_color = beautiful.bg_minimize,
}

styles.normal= {
  bg_color = beautiful.bg_minimize,
  fg_color = beautiful.fg_normal,
}

styles.weekday = {
  fg_color = beautiful.pri,
  bg_color = beautiful.bg_minimize,
  markup = function(t) return '<b>' .. t .. '</b>' end,
}

styles.focus = {
  bg_color = beautiful.bg_minimize,
  fg_color = beautiful.pri,
  markup = function(t) return '<b>' .. t .. '</b>' end,
}

styles.header= {
  bg_color = beautiful.bg_minimize,
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
  local default_bg = (weekday==0 or weekday==6) and '#424242' or '#424242'
  local ret = wibox.widget {
    {
      widget,
      margins = dpi(7),
      widget= wibox.container.margin
    },
    shape= help.rrect(beautiful.br),
    shape_border_width = 0,
    fg = props.fg_color or '#424242',
    bg = props.bg_color or default_bg,
    widget = wibox.container.background
  }
  return ret
end

local d = os.date('*t')

local cal = wibox.widget {
  date = d,
  spacing = 0,
  fn_embed = decorate_cell,
  start_sunday = true,
  widget = wibox.widget.calendar.month
}

return cal
