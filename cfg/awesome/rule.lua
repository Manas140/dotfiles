awful.rules.rules = {
  {
    rule = { },
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_color,
      focus = awful.client.focus.filter,
      raise = true,
      maximized = false,
      keys = keys.clientkeys,
      buttons = keys.clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap+awful.placement.no_offscreen,
    }
  },

  -- Add titlebars to normal clients 
  {
    rule_any = {
      type = { "normal" }
    },
    properties = { titlebars_enabled = true }
  },

  -- Floating, Titlebar exceptions
  {
    rule_any = {
      class = {'gnome', 'gtk', 'Lxappearance', 'qt5ct', 'feh'},
      name = {'Event Tester', 'Komikku', 'marker'},
      role = {'pop-up', 'GtkFileChooserDialog'},
      type = {'dialog'}
    },
    properties = { floating = true, titlebars_enabled = false }
  },
}
