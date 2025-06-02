local colorscheme = "au_theme"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

vim.cmd [[
  highlight! link @tag Keyword
  highlight! link @tag.attribute Identifier
  highlight! link @string String
  highlight! link @comment Comment
  highlight! link @text Normal
  highlight! link @property Identifier
]]
