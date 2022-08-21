local core = require "core"
local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"

------------------------------ Themes ----------------------------------------

core.reload_module("colors.paradise-dark")
-- core.reload_module("colors.paradise-light")

--------------------------- Key bindings -------------------------------------

keymap.add { ["ctrl+q"] = "core:quit" }
keymap.add { ["tab"] = { "command:complete", "doc:indent" } }

------------------------------- Fonts ----------------------------------------

style.font = renderer.font.load(DATADIR .. "/fonts/JetBrainsMono-Regular.ttf", 10 * SCALE)
style.code_font = renderer.font.load(DATADIR .. "/fonts/JetBrainsMono-Regular.ttf", 12 * SCALE)
style.big_font = renderer.font.load(DATADIR .. "/fonts/JetBrainsMono-Regular.ttf", 12 * SCALE)

-------------------------------- Plugins ----------------------------------------

config.plugins.toolbarview = false
config.plugins.contextmenu = false
