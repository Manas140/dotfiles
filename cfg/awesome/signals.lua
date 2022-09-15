local M = {}

local vol = [[ str=$( pulsemixer --get-volume ); printf "$(pulsemixer --get-mute) ${str% *}\n" ]]
local bri = [[ read -r current < /sys/class/backlight/intel_backlight/brightness
  read -r max < /sys/class/backlight/intel_backlight/max_brightness
  printf "$(( $current * 100 / $max ))\n" ]]
local net = [[ read -r STATUS < $(ls -d /sys/class/net/w*)/operstate; printf "$STATUS\n" ]]
local bat = [[ cat /sys/class/power_supply/BAT*/status; cat /sys/class/power_supply/BAT*/capacity ]]
local song = [[ printf "$(playerctl metadata xesam:title)" ]]
local artist = [[ printf "$(playerctl metadata xesam:artist)" ]]
local stat = [[ printf "$(playerctl status)" ]]

M.play = function()
  awful.spawn.easy_async_with_shell(stat, function(status)
    awful.spawn.easy_async_with_shell(song, function(title)
      awful.spawn.easy_async_with_shell(artist, function(who)
        awesome.emit_signal('play::value', status, title, who)
      end)
    end)
  end)
end

M.vol = function()
  awful.spawn.easy_async_with_shell(vol, function(out)
    local val = gears.string.split(out, " ")
    awesome.emit_signal('vol::value', tonumber(val[1]), tonumber(val[2]))
  end)
end

M.bri = function()
  awful.spawn.easy_async_with_shell(bri, function(out)
    awesome.emit_signal('bri::value', tonumber(out))
  end)
end

M.net = function()
  awful.spawn.easy_async_with_shell(net, function(out)
    awesome.emit_signal('net::value', out)
  end)
end

M.bat = function()
  awful.spawn.easy_async_with_shell(bat, function(out)
    local val = {}
    for i in string.gmatch(out, "%S+") do table.insert(val, i) end
    awesome.emit_signal('bat::value', val[1], tonumber(val[2]))
  end)
end

local function call()
  gears.timer {
    timeout = 5,
    call_now = true,
    autostart = true,
    callback = function()
      M.vol()
      M.net()
      M.bri()
      M.bat()
      M.play()
    end
  }
end

call()

M.set_vol = function(val)
  awful.spawn.with_shell('killall pulsemixer; pulsemixer --set-volume ' .. tonumber(val))
end

M.set_bri = function(val)
  awful.spawn.with_shell('killall xbacklight; xbacklight -set ' .. tonumber(val))
end

M.toggle_mute = function()
  awful.spawn.with_shell('pulsemixer --toggle-mute ')
  M.vol()
end

return M
