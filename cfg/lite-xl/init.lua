local core = require "core"
local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"

------------------------------ Themes ----------------------------------------

core.reload_module("colors.paradise")

--------------------------- Key bindings -------------------------------------

keymap.add { ["ctrl+q"] = "core:quit" }
keymap.add { ["tab"] = { "command:complete", "doc:indent" } }

------------------------------- Fonts ----------------------------------------

style.font = renderer.font.load(DATADIR .. "/fonts/JetBrainsMono-Regular.ttf", 14 * SCALE)
style.code_font = renderer.font.load(DATADIR .. "/fonts/JetBrainsMono-Regular.ttf", 14 * SCALE)
style.big_font = renderer.font.load(DATADIR .. "/fonts/JetBrainsMono-Regular.ttf", 14 * SCALE)

-------------------------------- Plugins ----------------------------------------

config.plugins.toolbarview = false
config.plugins.contextmenu = false
