local tasklist_buttons = gears.table.join(
  -- Left click
  awful.button({}, 1, function (c)
    if c == client.focus then
      c.minimized = true
    else
      c:emit_signal("request::activate", "tasklist", {raise = true})
    end
  end)
)

return function(s)
  local task = wibox.widget {
    widget = awful.widget.tasklist {
      screen   = s,
      filter   = awful.widget.tasklist.filter.currenttags,
      buttons  = tasklist_buttons,
      layout   = {
        layout  = wibox.layout.fixed.vertical
      },
      style = {
        shape = help.rrect(1),
      },
      widget_template = {
        {
          wibox.widget.base.make_widget(),
          forced_width = dpi(4),
          id = 'background_role',
          widget = wibox.container.background,
        },
        {
          {
            id = 'clienticon',
            widget = awful.widget.clienticon,
          },
          margins = dpi(7),
          widget = wibox.container.margin
        },
        nil,
        create_callback = function(self, c, _, _)
          self:get_children_by_id('clienticon')[1].client = c
                      self:connect_signal('mouse::enter', function()
                    awesome.emit_signal("bling::task_preview::visibility", s,
                                        true, c)
                end)
                self:connect_signal('mouse::leave', function()
                    awesome.emit_signal("bling::task_preview::visibility", s,
                                        false, c)
                end)
        end,
        layout = wibox.layout.align.horizontal,
      },
    }
  }
  return task
end
