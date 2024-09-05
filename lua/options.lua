local o = vim.opt
-- OPTIMIZE here please

o.backup = false
o.clipboard = "unnamedplus"
o.cmdheight = 2
o.fileencoding = "utf-8"
o.hlsearch = false
o.ignorecase = false
o.mouse = "a"
o.showtabline = 2
o.smartcase = false
o.smartindent = false
o.swapfile = false
o.termguicolors = true
o.undofile = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.cursorline = true
o.number = true
o.relativenumber = false
o.numberwidth = 4
o.signcolumn = "yes"
o.wrap = false
o.scrolloff = 8
o.sidescrolloff = 8
o.guifont = "monospace"
o.autochdir = true
o.ruler = true

require("bufferline").setup()

vim.cmd [[
highlight Optimizable guifg=#34c0eb ctermfg=cyan
]]

vim.cmd [[
syntax match Optimizable /OPTIMIZE/ containedin=.*Comment.*
]]

vim.cmd[[
augroup optimizable_highlighting
  autocmd!
  autocmd FileType * syntax match Optimizable /OPTIMIZE/ containedin=.*Comment.*
augroup END
]]
