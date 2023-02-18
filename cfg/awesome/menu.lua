local menu = {
  { "Refresh", awesome.restart },
  { "Logout", function() awesome.quit() end },
  { "Restart", function() awful.spawn.with_shell('loginctl reboot') end },
  { "Shutdown", function() awful.spawn.with_shell('loginctl poweroff') end },
}

local main = awful.menu {
  items = {
    {
      "Awesome",
      menu,
    },
    { "Terminal", "alacritty" },
    { "Browser", "firefox" },
    { "Editor", "alacritty -e nvim" },
    { "Music", "alacritty -e ncmpcpp" },
    { "Files", "alacritty -e lf" },
  }
}

main.wibox.shape = help.rrect(beautiful.br)

root.buttons(gears.table.join(
  awful.button({ }, 3, function () main:toggle() end),
  awful.button({ }, 1, function () main:hide() end)
))
