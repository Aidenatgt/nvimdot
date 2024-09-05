return {
  "wbthomason/packer.nvim",
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",

  -- Colorschemes
  "lunarvim/colorschemes",
  "navarasu/onedark.nvim",
  "scottmckendry/cyberdream.nvim",
  "shaunsingh/nord.nvim",
  "folke/tokyonight.nvim",
  "nyoom-engineering/oxocarbon.nvim",
  "rktjmp/lush.nvim",
  "Aidenatgt/au_theme.nvim",

  -- Completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "saadparwaiz1/cmp_luasnip",

  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",

  -- LSP
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  'jose-elias-alvarez/null-ls.nvim',
  "mrcjkb/rustaceanvim",

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  },
  "p00f/nvim-ts-rainbow",
  "nvim-treesitter/playground",

  'simrat39/rust-tools.nvim',
  'lewis6991/gitsigns.nvim',

  'preservim/nerdcommenter',
  "Pocco81/auto-save.nvim",
  {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'},
}
