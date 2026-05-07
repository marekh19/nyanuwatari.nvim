-- Ghostty runner — adapted from zenbones-theme/zenbones.nvim
-- (lua/zenbones/shipwright/runners/ghostty.lua, MIT-licensed).
-- Shipwright lacks a built-in ghostty contrib transform, so we template inline.

local helpers = require("shipwright.transform.helpers")

local template = [[
# See: https://ghostty.org/docs/config/reference

# Basic colors
foreground = $fg
background = $bg

# Selection colors
selection-foreground = $selection_fg
selection-background = $selection_bg

# Cursor colors
cursor-color = $cursor_bg
cursor-text = $cursor_fg

# The basic 16 colors
# black
palette = 0=$black
palette = 8=$bright_black

# red
palette = 1=$red
palette = 9=$bright_red

# green
palette = 2=$green
palette = 10=$bright_green

# yellow
palette = 3=$yellow
palette = 11=$bright_yellow

# blue
palette = 4=$blue
palette = 12=$bright_blue

# magenta
palette = 5=$magenta
palette = 13=$bright_magenta

# cyan
palette = 6=$cyan
palette = 14=$bright_cyan

# white
palette = 7=$white
palette = 15=$bright_white]]

---@param colors table see lua/nyanuwatari/term.lua M.colors_map
---@return string[] lines
local function transform(colors)
  return helpers.split_newlines(helpers.apply_template(template, colors))
end

return transform
