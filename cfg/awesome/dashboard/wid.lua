local btn = require('wid.btn')

local M = {}

local c = function (a) return function() awful.spawn.with_shell(a) end end

M.vol, M.v_up = btn('', c'pulsemixer --unmute', '', c'pulsemixer --mute')
M.wifi, M.w_up = btn('', c'nmcli radio wifi on', '', c'nmcli radio wifi off')
M.blu, M.b_up = btn('', c'bluetoothctl power on', '', c'bluetoothctl power off')
M.nig, M.n_up = btn('', c'redshift -x && redshift -O 4000K', '', c'redshift -x')

awesome.connect_signal('vol::value', function(mut, _)
  M.v_up(mut == 0)
end)


awesome.connect_signal("net::value", function(_, stat)
  M.w_up(stat:match("up"))
end)

return M
