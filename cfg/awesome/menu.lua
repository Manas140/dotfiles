local menu = {
  { "Refresh", awesome.restart },
  { "Logout", function() awesome.quit() end },
}

local main = awful.menu {
  items = {
    {
      "Awesome",
      menu,
    },
    { "Terminal", "kitty" },
    { "Browser", "firefox" },
    { "Files", "kitty lf" },
    { "Editor", "kitty nvim" },
  }
}

main.wibox.shape = help.rrect(2)

root.buttons(gears.table.join(
  awful.button({ }, 3, function () main:toggle() end)
))
