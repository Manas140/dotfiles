return function(s)
  local tag = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.selected,
    widget_template = {
      {
        id = 'text_role',
        align = 'center',
        widget = wibox.widget.textbox,
      },
      top = dpi(10),
      bottom = dpi(10),
      left = dpi(15),
      right = dpi(15),
      widget = wibox.container.margin
    },
    id = 'background_role',
    widget = wibox.container.background,

    create_callback = function(self, _, index, _)
      self:get_children_by_id('text_role').markup = index
    end,
    update_callback = function(self, _, index, _)
      self:get_children_by_id('text_role').markup = index
    end
  }
  return tag
end
