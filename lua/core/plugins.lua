local plugins = {
  -- Colors
  { "rktjmp/lush.nvim" },
  { "Aidenatgt/au_theme.nvim" },

  -- Language
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lsp_config = require 'lspconfig'
      local langs = require 'core.langs'

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      for _, v in ipairs(langs) do
        lsp_config[v.lspconfig].setup { capabilities = capabilities, settings = v.settings }
      end
    end,
  },
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({
        build = ":MasonUpdate",
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      local map = function(tbl, f)
        local t = {}
        for k, v in pairs(tbl) do
          t[k] = f(v)
        end
        return t
      end

      require('mason-lspconfig').setup({
        ensure_installed = map(require('core.langs'), function(lang)
          return lang.mason
        end)
      })
    end
  },
  { 'neoclide/coc.nvim',           branch = 'release' },
  {
    'simrat39/rust-tools.nvim',
    config = function()
      require('rust-tools').setup()
    end
  },
  { 'mfussenegger/nvim-jdtls' },
  { 'nvim-lua/plenary.nvim' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/nvim-cmp' },
  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" },
  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim'
    },
    config = true,
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require("dap")
    end
  },
  {
    "jbyuki/one-small-step-for-vimkind",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      local dap = require("dap")
      dap.configurations.lua = {
        {
          type = "nlua",
          request = "attach",
          name = "Attach to Neovim",
          host = function()
            return "127.0.0.1"
          end,
          port = 54231,
        },
      }

      dap.adapters.nlua = function(callback, config)
        callback({
          type = "server",
          host = config.host or "127.0.0.1",
          port = config.port or 54231,
        })
      end
    end,
  },
  -- Editor
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
  },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope.nvim' },
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
          natural_order = true,
          is_always_hidden = function(name, _)
            return name == ".." or name == ".git"
          end,
        },
        float = {
          padding = 2,
          max_width = 90,
          max_height = 0,
        },
        win_options = {
          wrap = true,
          winblend = 0,
        },
        keymaps = {
          ["<C-c>"] = false,
          ["<Esc>"] = "actions.close",
        },
      })
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  { 'nvim-lua/popup.nvim' },
  {
    'sudormrfbin/cheatsheet.nvim',
    config = function()
      require('cheatsheet').setup({
        bundled_cheatsheets = {
          enabled = { "default" }
        }
      })
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = { "Neotree" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        filesystem = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
          },
        },
      })
    end,
  },
  { 'nvim-treesitter/nvim-treesitter', opts = { run = ':TSUpdate' } },
  { 'akinsho/bufferline.nvim' },
  {
    'fedepujol/move.nvim',
    config = function()
      require 'move'.setup {
        char = {
          enable = true
        }
      }
    end
  },
  { 'numToStr/Comment.nvim' },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require('toggleterm').setup()
    end
  },
  {
    "andrewferrier/wrapping.nvim",
    config = function()
      require("wrapping").setup()
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require("lualine").setup()
    end
  },
}

return plugins
