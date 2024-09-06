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
o.autochdir = false
o.ruler = true


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

-- 1
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp", { clear = true }),
  callback = function(args)
    -- 2
    vim.api.nvim_create_autocmd("BufWritePre", {
      -- 3
      buffer = args.buf,
      callback = function()
        -- 4 + 5
        vim.lsp.buf.format {async = false, id = args.data.client_id }
      end,
    })
  end
})
