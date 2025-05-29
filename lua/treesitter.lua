require'nvim-treesitter.configs'.setup {
  ignore_install = { "systemverilog", },
  auto_install = false, -- don’t auto-install missing ones
  sync_install = false, -- don’t sync/update anything automatically
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
}
