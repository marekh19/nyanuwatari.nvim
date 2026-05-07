-- Tmux runner — shipwright's contrib/tmux is a stub (empty file), so we
-- template our own. Inspired by zenbones-theme/zenbones.nvim's tmux runner.

local helpers = require("shipwright.transform.helpers")

local template = [[
# Drop in your tmux.conf:  source-file ~/path/to/nyanuwatari.tmux

set -g status-style "fg=$fg,bg=$bg"

set -g status-left ' #[fg=$magenta,bold]#S #[fg=$cyan]'
set -g status-right '#[fg=$cyan]%d/%m #[fg=$magenta,bold]%H:%M '

set -g window-status-current-style "fg=$bg,bg=$magenta,bold"
set -g window-status-style "fg=$white"

set -g pane-border-style "fg=$bright_black"
set -g pane-active-border-style "fg=$magenta"

set -g message-style "fg=$bg,bg=$yellow"
set -g message-command-style "fg=$bg,bg=$cyan"

set -g mode-style "fg=$bg,bg=$selection_bg"

set -g display-panes-colour "$bright_black"
set -g display-panes-active-colour "$magenta"

set -g clock-mode-colour "$cyan"

set -g copy-mode-match-style "fg=$bg,bg=$yellow"
set -g copy-mode-current-match-style "fg=$bg,bg=$bright_yellow"
]]

---@param colors table
---@return string[] lines
local function transform(colors)
  return helpers.split_newlines(helpers.apply_template(template, colors))
end

return transform
