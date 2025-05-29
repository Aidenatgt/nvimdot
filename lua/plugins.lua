require("lazy").setup({
  -- TODO rgew
  -- FIX ger

  -- UI
  {
    "nvim-lua/plenary.nvim"
  },
{
  "rcarriga/nvim-notify",
},
{
  "folke/noice.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
  config = function ()
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})
end,
},
{
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    require("ibl").setup()
  end,
},
{
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup()
  end
},

 	 "Aidenatgt/au_theme.nvim",

  -- NAV
  {
  	'stevearc/oil.nvim',
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
  config = function ()
    require("oil").setup()
  end
},

  "nvim-telescope/telescope.nvim",
  { "nvim-treesitter/nvim-treesitter", build = nil },
  "BurntSushi/ripgrep",
  "sharkdp/fd",

  -- LSP
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",

  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  "neovim/nvim-lspconfig",

  -- EDITOR
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
},
{
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = true,
},
{
  "echasnovski/mini.surround",
  version = false,
  config = function() require("mini.surround").setup() end,
},

  -- GIT
  {
    "lewis6991/gitsigns.nvim",
    config = function ()
      require("gitsigns").setup()
    end
  }
})
