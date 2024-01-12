local help = {}

help.rrect = function(rad)
  return function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, rad)
  end
end

help.fg = function (text, color)
  return "<span foreground='"..color.."'>"..text.."</span>"
end

help.log = function(str)
  naughty.notify({ title = str })
end

return help
