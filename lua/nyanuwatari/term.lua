-- nyanuwatari — terminal palette.
-- Maps the palette into the canonical 16-slot ANSI table that:
--   1. Neovim's :terminal reads via vim.g.terminal_color_0..15
--   2. Shipwright contrib transforms (kitty/alacritty/wezterm/tmux) consume,
--      plus our custom ghostty runner.

local M = {}

---Build a "colors" table in the shape every shipwright contrib transform expects.
---@param p table palette (lua/nyanuwatari/palette.lua dark)
---@return table
function M.colors_map(p)
  -- stylua: ignore
  return {
    fg            = p.fg,
    bg            = p.bg_0,

    cursor_fg     = p.bg_0,
    cursor_bg     = p.pink,
    cursor_border = p.pink,

    selection_fg  = p.fg,
    selection_bg  = p.bg_3,

    -- 0 / 8 — black
    black         = p.bg_0,
    bright_black  = p.bg_3,
    -- 1 / 9 — red
    red           = p.red,
    bright_red    = p.pink,
    -- 2 / 10 — green
    green         = p.green,
    bright_green  = p.green,
    -- 3 / 11 — yellow
    yellow        = p.yellow,
    bright_yellow = p.peach,
    -- 4 / 12 — blue (we use cyan; no dedicated blue in 5-hue palette)
    blue          = p.cyan,
    bright_blue   = p.cyan_br,
    -- 5 / 13 — magenta
    magenta       = p.lavender,
    bright_magenta = p.lavender_br,
    -- 6 / 14 — cyan
    cyan          = p.cyan,
    bright_cyan   = p.cyan_br,
    -- 7 / 15 — white
    white         = p.fg_mute,
    bright_white  = p.fg,
  }
end

---Apply 16 ANSI slots to vim.g.terminal_color_* for :terminal.
---@param p table palette
function M.apply(p)
  local c = M.colors_map(p)
  -- stylua: ignore start
  vim.g.terminal_color_0  = c.black
  vim.g.terminal_color_1  = c.red
  vim.g.terminal_color_2  = c.green
  vim.g.terminal_color_3  = c.yellow
  vim.g.terminal_color_4  = c.blue
  vim.g.terminal_color_5  = c.magenta
  vim.g.terminal_color_6  = c.cyan
  vim.g.terminal_color_7  = c.white
  vim.g.terminal_color_8  = c.bright_black
  vim.g.terminal_color_9  = c.bright_red
  vim.g.terminal_color_10 = c.bright_green
  vim.g.terminal_color_11 = c.bright_yellow
  vim.g.terminal_color_12 = c.bright_blue
  vim.g.terminal_color_13 = c.bright_magenta
  vim.g.terminal_color_14 = c.bright_cyan
  vim.g.terminal_color_15 = c.bright_white
  -- stylua: ignore end
end

return M
