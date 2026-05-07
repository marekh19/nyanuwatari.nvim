-- nyanuwatari — entry point.
-- Loads palette + Lush spec and applies highlights.

local M = {}

function M.load()
  if vim.g.colors_name then
    vim.cmd("highlight clear")
  end
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.g.colors_name = "nyanuwatari"

  local palette = require("nyanuwatari.palette").dark
  local spec = require("nyanuwatari.specs.dark")(palette)

  require("lush")(spec)
  require("nyanuwatari.term").apply(palette)
end

return M
