local plugins = {
  -- Colors
  { "rktjmp/lush.nvim" },
  { "Aidenatgt/au_theme.nvim" },

  -- Language
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'simrat39/rust-tools.nvim' },
  { 'nvim-lua/plenary.nvim' },
  { 'mfussenegger/nvim-dap' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/nvim-cmp' },
  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" },

  -- Editor
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope.nvim' },
  { 'nvim-lua/popup.nvim' },
  { 'sudormrfbin/cheatsheet.nvim' },
  { 'nvim-tree/nvim-tree.lua' },
  { 'nvim-treesitter/nvim-treesitter',  opts = { run = ':TSUpdate' } },
  { 'akinsho/bufferline.nvim' },
  { 'fedepujol/move.nvim' },
  { 'numToStr/Comment.nvim' },
  { 'akinsho/toggleterm.nvim',          version = "*",               config = true }
}

return plugins
