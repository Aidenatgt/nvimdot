local o = vim.opt

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
o.autochdir = false
o.ruler = true


vim.cmd [[
highlight Optimizable guifg=#34c0eb ctermfg=cyan
]]

vim.cmd [[
syntax match Optimizable /OPTIMIZE/ containedin=.*Comment.*
]]

vim.cmd [[
augroup optimizable_highlighting
  autocmd!
  autocmd FileType * syntax match Optimizable /OPTIMIZE/ containedin=.*Comment.*
augroup END
]]

-- Format on save
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp", { clear = true }),
  callback = function(args)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.format { async = false, id = args.data.client_id }
      end,
    })
  end
})

local logo = [[
=================     ===============     ===============   ========  ========
\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
||.=='    _-'                                                     `' |  /==.||
=='    _-'                        N E O V I M                         \/   `==
\   _-'                                                                `-_   /
 `''                                                                      ``'
 ]]

logo = string.rep("\n", 8) .. logo .. "\n\n"

require("dashboard").setup {
  shortcut_type = 'number',
  disable_move = true,
  theme = 'doom',
  config = {
    header = vim.split(logo, "\n"),
    center = {
      { action = "Telescope find_files", desc = " Find file", icon = " ", key = "f" },
      { action = "ene | startinsert", desc = " New file", icon = " ", key = "n" },
      { action = "Telescope oldfiles", desc = " Recent files", icon = " ", key = "r" },
      { action = "qa", desc = " Quit", icon = " ", key = "q" },
    },
    footer = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
    end,
  }
}

require "core.keymap"
require 'core.completion'
