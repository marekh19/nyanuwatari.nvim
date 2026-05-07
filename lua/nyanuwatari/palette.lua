-- nyanuwatari — palette.
-- Neutrals: H=30°, S=4–6%. Accents (base): L=78%, S=58%. Bright: L=85%, S=55%.
-- Pink at H=328°, S=62 (rotated from 340° to read pinker, less salmon).

local M = {}

-- stylua: ignore
M.dark = {
  -- Neutrals
  bg_deep  = "#100f0f",
  bg_0     = "#151414", -- editor background
  bg_1     = "#1d1c1b", -- panel
  bg_2     = "#282625", -- active line
  bg_3     = "#353331", -- selection
  bg_4     = "#454240", -- border

  fg       = "#e2e0df", -- text
  fg_mute  = "#b1ada9", -- comments
  fg_faint = "#85807a", -- gutter, punctuation, operators

  -- Accents (base)
  cyan     = "#a6dde7", -- 190° — keywords, imports, tags
  lavender = "#cca6e7", -- 275° — types, classes
  pink     = "#eaa4c9", -- 328° — functions, methods, headings
  peach    = "#e7bca6", --  20° — numbers, booleans
  yellow   = "#e7dda6", --  50° — strings

  -- Accents (bright) — params, decorators, constants
  cyan_br     = "#c4e7ee",
  lavender_br = "#dcc4ee",
  pink_br     = "#eec4da",
  peach_br    = "#eed2c4",
  yellow_br   = "#eee7c4",

  -- Reserved — edge cases only
  green = "#98cdaa", -- escapes, diff +, success
  red   = "#e99696", -- errors, diff −
}

return M
