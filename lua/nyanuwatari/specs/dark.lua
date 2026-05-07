-- nyanuwatari — dark Lush spec.

local lush = require("lush")

---@param p table palette (lua/nyanuwatari/palette.lua dark)
return function(p)
  ---@diagnostic disable: undefined-global
  -- stylua: ignore start
  return lush(function(injected_functions)
    local sym = injected_functions.sym
    return {
      -- ============================================================
      -- Editor UI
      -- ============================================================
      Normal       { fg = p.fg,       bg = p.bg_0 },
      NormalFloat  { fg = p.fg,       bg = p.bg_1 },
      NormalNC     { Normal },
      FloatBorder  { fg = p.bg_4,     bg = p.bg_1 },
      FloatTitle   { fg = p.pink,     bg = p.bg_1, gui = "bold" },

      Cursor       { fg = p.bg_0,     bg = p.pink },
      lCursor      { Cursor },
      TermCursor   { Cursor },
      TermCursorNC { fg = p.bg_0,     bg = p.fg_faint },

      CursorLine   { bg = p.bg_2 },
      CursorColumn { CursorLine },
      ColorColumn  { bg = p.bg_1 },

      LineNr       { fg = p.fg_faint },
      CursorLineNr { fg = p.fg,       gui = "bold" },
      SignColumn   { fg = p.fg_faint, bg = p.bg_0 },
      FoldColumn   { LineNr },
      Folded       { fg = p.fg_mute,  bg = p.bg_1 },

      Visual       { bg = p.bg_3 },
      VisualNOS    { Visual },
      Search       { fg = p.bg_0,     bg = p.yellow },
      IncSearch    { fg = p.bg_0,     bg = p.peach },
      CurSearch    { IncSearch },
      Substitute   { Search },
      MatchParen   { fg = p.lavender, bg = p.bg_3, gui = "bold" },

      StatusLine   { fg = p.fg,       bg = p.bg_1 },
      StatusLineNC { fg = p.fg_faint, bg = p.bg_1 },
      WinSeparator { fg = p.bg_3 },
      VertSplit    { WinSeparator },
      TabLine      { fg = p.fg_faint, bg = p.bg_deep },
      TabLineFill  { bg = p.bg_deep },
      TabLineSel   { fg = p.fg,       bg = p.bg_0, gui = "bold" },

      Pmenu        { fg = p.fg,       bg = p.bg_1 },
      PmenuSel     { fg = p.fg,       bg = p.bg_3, gui = "bold" },
      PmenuSbar    { bg = p.bg_2 },
      PmenuThumb   { bg = p.bg_4 },
      WildMenu     { PmenuSel },

      ModeMsg      { fg = p.fg,       gui = "bold" },
      MoreMsg      { fg = p.cyan },
      Question     { fg = p.cyan },
      ErrorMsg     { fg = p.red,      gui = "bold" },
      WarningMsg   { fg = p.yellow },
      MsgArea      { Normal },
      MsgSeparator { fg = p.bg_3,     bg = p.bg_0 },

      NonText      { fg = p.bg_4 },
      SpecialKey   { fg = p.bg_4 },
      Whitespace   { fg = p.bg_3 },
      EndOfBuffer  { fg = p.bg_0 },

      Conceal      { fg = p.fg_mute },
      Directory    { fg = p.cyan },
      Title        { fg = p.pink,     gui = "bold" },

      QuickFixLine { bg = p.bg_2 },

      -- Spell
      SpellBad     { sp = p.red,      gui = "undercurl" },
      SpellCap     { sp = p.peach,    gui = "undercurl" },
      SpellLocal   { sp = p.cyan,     gui = "undercurl" },
      SpellRare    { sp = p.lavender, gui = "undercurl" },

      -- ============================================================
      -- Diff
      -- ============================================================
      DiffAdd      { fg = p.green,    bg = p.bg_1 },
      DiffChange   { fg = p.yellow,   bg = p.bg_1 },
      DiffDelete   { fg = p.red,      bg = p.bg_1 },
      DiffText     { fg = p.fg,       bg = p.bg_3, gui = "bold" },

      Added        { fg = p.green },
      Changed      { fg = p.yellow },
      Removed      { fg = p.red },

      -- ============================================================
      -- Diagnostics (LSP)
      -- ============================================================
      DiagnosticError              { fg = p.red },
      DiagnosticWarn               { fg = p.yellow },
      DiagnosticInfo               { fg = p.cyan },
      DiagnosticHint               { fg = p.lavender },
      DiagnosticOk                 { fg = p.green },

      DiagnosticVirtualTextError   { DiagnosticError, bg = p.bg_1 },
      DiagnosticVirtualTextWarn    { DiagnosticWarn,  bg = p.bg_1 },
      DiagnosticVirtualTextInfo    { DiagnosticInfo,  bg = p.bg_1 },
      DiagnosticVirtualTextHint    { DiagnosticHint,  bg = p.bg_1 },
      DiagnosticVirtualTextOk      { DiagnosticOk,    bg = p.bg_1 },

      DiagnosticUnderlineError     { sp = p.red,      gui = "undercurl" },
      DiagnosticUnderlineWarn      { sp = p.yellow,   gui = "undercurl" },
      DiagnosticUnderlineInfo      { sp = p.cyan,     gui = "undercurl" },
      DiagnosticUnderlineHint      { sp = p.lavender, gui = "undercurl" },
      DiagnosticUnderlineOk        { sp = p.green,    gui = "undercurl" },

      DiagnosticSignError          { DiagnosticError },
      DiagnosticSignWarn           { DiagnosticWarn },
      DiagnosticSignInfo           { DiagnosticInfo },
      DiagnosticSignHint           { DiagnosticHint },
      DiagnosticSignOk             { DiagnosticOk },

      DiagnosticFloatingError      { DiagnosticError },
      DiagnosticFloatingWarn       { DiagnosticWarn },
      DiagnosticFloatingInfo       { DiagnosticInfo },
      DiagnosticFloatingHint       { DiagnosticHint },
      DiagnosticFloatingOk         { DiagnosticOk },

      DiagnosticDeprecated         { fg = p.fg_mute, gui = "strikethrough" },
      DiagnosticUnnecessary        { fg = p.fg_faint },

      LspReferenceText             { bg = p.bg_3 },
      LspReferenceRead             { LspReferenceText },
      LspReferenceWrite            { LspReferenceText },
      LspSignatureActiveParameter  { fg = p.lavender_br, gui = "italic,bold" },
      LspInlayHint                 { fg = p.fg_faint, bg = p.bg_1, gui = "italic" },

      -- ============================================================
      -- Classic syntax (vim builtin)
      -- ============================================================
      Comment      { fg = p.fg_mute,    gui = "italic" },

      Constant     { fg = p.peach },
      String       { fg = p.yellow },
      Character    { fg = p.yellow },
      Number       { fg = p.peach },
      Boolean      { fg = p.peach },
      Float        { fg = p.peach },

      Identifier   { fg = p.fg },
      Function     { fg = p.pink },

      Statement    { fg = p.cyan },
      Conditional  { fg = p.cyan },
      Repeat       { fg = p.cyan },
      Label        { fg = p.cyan },
      Operator     { fg = p.fg_faint },
      Keyword      { fg = p.cyan },
      Exception    { fg = p.cyan },

      PreProc      { fg = p.cyan },
      Include      { fg = p.cyan },
      Define       { fg = p.cyan },
      Macro        { fg = p.peach },
      PreCondit    { fg = p.cyan },

      Type         { fg = p.lavender },
      StorageClass { fg = p.cyan },
      Structure    { fg = p.lavender },
      Typedef      { fg = p.lavender },

      Special      { fg = p.peach },
      SpecialChar  { fg = p.green },
      Tag          { fg = p.cyan },
      Delimiter    { fg = p.fg_faint },
      SpecialComment { fg = p.fg_mute, gui = "italic,bold" },
      Debug        { fg = p.peach },

      Underlined   { gui = "underline" },
      Bold         { gui = "bold" },
      Italic       { gui = "italic" },

      Ignore       { fg = p.fg_faint },
      Error        { fg = p.red,      gui = "underline" },
      Todo         { fg = p.peach,    bg = p.bg_2, gui = "italic,bold" },

      -- ============================================================
      -- Treesitter (modern @-prefixed groups)
      -- ============================================================
      sym("@comment")              { Comment },
      sym("@comment.documentation"){ fg = p.fg_mute, gui = "italic" },
      sym("@comment.error")        { fg = p.red,    gui = "italic,bold" },
      sym("@comment.warning")      { fg = p.yellow, gui = "italic,bold" },
      sym("@comment.todo")         { Todo },
      sym("@comment.note")         { fg = p.cyan,   gui = "italic,bold" },

      sym("@punctuation")            { fg = p.fg_faint },
      sym("@punctuation.delimiter")  { fg = p.fg_faint },
      sym("@punctuation.bracket")    { fg = p.fg_faint },
      sym("@punctuation.special")    { fg = p.peach },

      sym("@constant")              { fg = p.peach },
      sym("@constant.builtin")      { fg = p.peach },
      sym("@constant.macro")        { fg = p.peach },

      sym("@string")                { String },
      sym("@string.documentation")  { fg = p.fg_mute, gui = "italic" },
      sym("@string.regexp")         { fg = p.yellow },
      sym("@string.escape")         { fg = p.green },
      sym("@string.special")        { fg = p.green },
      sym("@string.special.symbol") { fg = p.peach },
      sym("@string.special.url")    { fg = p.cyan,    gui = "underline" },

      sym("@character")             { Character },
      sym("@character.special")     { fg = p.green },

      sym("@number")                { Number },
      sym("@number.float")          { Number },
      sym("@boolean")               { Boolean },
      sym("@float")                 { Float },

      sym("@function")              { fg = p.pink },
      sym("@function.builtin")      { fg = p.pink },
      sym("@function.call")         { fg = p.pink },
      sym("@function.macro")        { fg = p.pink },
      sym("@function.method")       { fg = p.pink },
      sym("@function.method.call")  { fg = p.pink },

      sym("@constructor")           { fg = p.lavender },

      sym("@operator")              { fg = p.fg_faint },

      sym("@keyword")               { fg = p.cyan },
      sym("@keyword.coroutine")     { fg = p.cyan },
      sym("@keyword.function")      { fg = p.cyan },
      sym("@keyword.operator")      { fg = p.cyan },
      sym("@keyword.import")        { fg = p.cyan },
      sym("@keyword.type")          { fg = p.cyan },
      sym("@keyword.modifier")      { fg = p.cyan },
      sym("@keyword.repeat")        { fg = p.cyan },
      sym("@keyword.return")        { fg = p.cyan },
      sym("@keyword.debug")         { fg = p.cyan },
      sym("@keyword.exception")     { fg = p.cyan },
      sym("@keyword.conditional")   { fg = p.cyan },
      sym("@keyword.conditional.ternary") { fg = p.cyan },
      sym("@keyword.directive")     { fg = p.cyan },
      sym("@keyword.directive.define") { fg = p.cyan },
      sym("@keyword.export")        { fg = p.cyan },

      sym("@type")                  { fg = p.lavender },
      sym("@type.builtin")          { fg = p.lavender },
      sym("@type.definition")       { fg = p.lavender },
      sym("@type.qualifier")        { fg = p.cyan },

      sym("@attribute")             { fg = p.peach_br, gui = "italic" },
      sym("@attribute.builtin")     { fg = p.peach_br, gui = "italic" },

      sym("@property")              { fg = p.fg },
      sym("@field")                 { fg = p.fg },

      sym("@variable")              { fg = p.fg },
      sym("@variable.builtin")      { fg = p.cyan, gui = "italic" },
      sym("@variable.parameter")    { fg = p.fg, gui = "italic" },
      sym("@variable.parameter.builtin") { fg = p.fg, gui = "italic" },
      sym("@variable.member")       { fg = p.fg },

      sym("@module")                { fg = p.lavender },
      sym("@module.builtin")        { fg = p.lavender },
      sym("@namespace")             { fg = p.lavender },
      sym("@label")                 { fg = p.cyan },

      sym("@tag")                   { fg = p.cyan },
      sym("@tag.builtin")           { fg = p.cyan },
      sym("@tag.attribute")         { fg = p.fg, gui = "italic" },
      sym("@tag.delimiter")         { fg = p.fg_faint },

      -- Markup (markdown, comments, docstrings)
      sym("@markup")                { fg = p.fg },
      sym("@markup.strong")         { fg = p.peach,  gui = "bold" },
      sym("@markup.italic")         { fg = p.yellow, gui = "italic" },
      sym("@markup.strikethrough")  { fg = p.fg_mute, gui = "strikethrough" },
      sym("@markup.underline")      { gui = "underline" },
      sym("@markup.heading")        { fg = p.pink,   gui = "bold" },
      sym("@markup.heading.1")      { fg = p.pink,   gui = "bold" },
      sym("@markup.heading.2")      { fg = p.pink,   gui = "bold" },
      sym("@markup.heading.3")      { fg = p.peach,  gui = "bold" },
      sym("@markup.heading.4")      { fg = p.peach,  gui = "bold" },
      sym("@markup.heading.5")      { fg = p.yellow, gui = "bold" },
      sym("@markup.heading.6")      { fg = p.yellow, gui = "bold" },
      sym("@markup.quote")          { fg = p.fg_mute, gui = "italic" },
      sym("@markup.math")           { fg = p.peach },
      sym("@markup.link")           { fg = p.cyan },
      sym("@markup.link.label")     { fg = p.lavender },
      sym("@markup.link.url")       { fg = p.cyan,   gui = "underline" },
      sym("@markup.raw")            { fg = p.lavender },
      sym("@markup.raw.block")      { fg = p.lavender, bg = p.bg_1 },
      sym("@markup.list")           { fg = p.cyan },
      sym("@markup.list.checked")   { fg = p.green },
      sym("@markup.list.unchecked") { fg = p.fg_faint },

      sym("@diff.plus")             { fg = p.green },
      sym("@diff.minus")            { fg = p.red },
      sym("@diff.delta")            { fg = p.yellow },

      -- ============================================================
      -- LSP semantic tokens (Neovim 0.9+)
      -- ============================================================
      sym("@lsp.type.class")          { sym("@type") },
      sym("@lsp.type.comment")        { Comment },
      sym("@lsp.type.decorator")      { sym("@attribute") },
      sym("@lsp.type.enum")           { sym("@type") },
      sym("@lsp.type.enumMember")     { fg = p.peach },
      sym("@lsp.type.function")       { sym("@function") },
      sym("@lsp.type.interface")      { sym("@type") },
      sym("@lsp.type.macro")          { sym("@function.macro") },
      sym("@lsp.type.method")         { sym("@function.method") },
      sym("@lsp.type.namespace")      { sym("@module") },
      sym("@lsp.type.parameter")      { sym("@variable.parameter") },
      sym("@lsp.type.property")       { sym("@property") },
      sym("@lsp.type.struct")         { sym("@type") },
      sym("@lsp.type.type")           { sym("@type") },
      sym("@lsp.type.typeParameter")  { sym("@type.definition") },
      sym("@lsp.type.variable")       { sym("@variable") },
      sym("@lsp.type.keyword")        { sym("@keyword") },
      sym("@lsp.type.string")         { String },
      sym("@lsp.type.number")         { Number },
      sym("@lsp.type.regexp")         { sym("@string.regexp") },
      sym("@lsp.type.operator")       { sym("@operator") },

      sym("@lsp.mod.readonly")        { fg = p.peach },
      sym("@lsp.mod.deprecated")      { fg = p.fg_mute, gui = "strikethrough" },
      sym("@lsp.mod.defaultLibrary")  { gui = "italic" },

      sym("@lsp.typemod.variable.readonly")        { fg = p.peach },
      sym("@lsp.typemod.parameter.readonly")       { fg = p.fg, gui = "italic" },
      sym("@lsp.typemod.function.defaultLibrary")  { fg = p.pink, gui = "italic" },
      sym("@lsp.typemod.method.defaultLibrary")    { fg = p.pink, gui = "italic" },
      sym("@lsp.typemod.variable.defaultLibrary")  { fg = p.cyan },

      -- ============================================================
      -- GitSigns (free-by-link for users with gitsigns.nvim)
      -- ============================================================
      GitSignsAdd                  { fg = p.green },
      GitSignsChange               { fg = p.yellow },
      GitSignsDelete               { fg = p.red },
      GitSignsAddNr                { GitSignsAdd },
      GitSignsChangeNr             { GitSignsChange },
      GitSignsDeleteNr             { GitSignsDelete },

      -- ============================================================
      -- File icons — mini.icons (9-category palette)
      -- Defined explicitly so icons don't accidentally link to syntax
      -- groups (e.g. Function/Type) and pick up our pink/lavender by
      -- mistake. Mapping: each named "color" → closest palette accent.
      -- ============================================================
      MiniIconsAzure  { fg = p.cyan },
      MiniIconsBlue   { fg = p.cyan },
      MiniIconsCyan   { fg = p.cyan },
      MiniIconsGreen  { fg = p.green },
      MiniIconsGrey   { fg = p.fg_mute },
      MiniIconsOrange { fg = p.peach },
      MiniIconsPurple { fg = p.lavender },
      MiniIconsRed    { fg = p.red },
      MiniIconsYellow { fg = p.yellow },

      -- ============================================================
      -- File icons — nvim-web-devicons (most-likely-pink offenders)
      -- Override the language icons that some configs link to Function.
      -- Anything not listed retains its hardcoded brand color from the
      -- plugin (e.g. JS=yellow, package.json=green stay as-is).
      -- ============================================================
      DevIconDefault         { fg = p.fg_mute },
      DevIconTs              { fg = p.cyan },
      DevIconTsx             { fg = p.cyan },
      DevIconGo              { fg = p.cyan },
      DevIconGoMod           { fg = p.cyan },
      DevIconGoSum           { fg = p.cyan },
      DevIconRust            { fg = p.peach },
      DevIconLua             { fg = p.cyan },
      DevIconC               { fg = p.cyan },
      DevIconCpp             { fg = p.cyan },

      -- Terminal (used by :terminal — these set the 16-slot ANSI when
      -- vim.g.terminal_color_N isn't enough; harmless if unused)
    }
  end)
  -- stylua: ignore end
  ---@diagnostic enable: undefined-global
end
