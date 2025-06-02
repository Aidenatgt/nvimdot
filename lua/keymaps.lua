--
-- LSP KEYMAPS ARE IN `lsp.lua`
--

vim.g.mapleader = " "

function bind(mode, key, value, description, config)
  config = config or {}
  config.desc = description
  vim.keymap.set(mode, key, value, config)
end

bind("n", "<leader>x", "<CMD>q<CR>", "Close the current buffer")

-- Open Oil
bind("n", "-", "<CMD>Oil<CR>", "Open parent directory with Oil")

-- Telescope
bind("n", "<leader>ff", "<CMD>Telescope find_files<CR>", "Find files with Telescope")
bind("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", "Live grep with Telescope")
bind("n", "<leader>fb", "<CMD>Telescope buffers<CR>", "Search buffers with Telescope")
bind("n", "<leader>fh", "<CMD>Telescope help_tags<CR>", "Telescope help")

-- Change buffers
bind("n", "<Tab>", ":bn<CR>", "Move to the next buffer")
bind("n", "<S-Tab>", ":bp<CR>", "Move to the previous buffer")
bind("v", "<Tab>", ":bn<CR>", "Move to the next buffer")
bind("v", "<S-Tab>", ":bp<CR>", "Move to the previous buffer")

bind("n", "<leader>h", ":nohlsearch<CR>", "Clear highlighted phrases")

-- Indentation
bind("n", "<C-Tab>", ">>", "Indent the current line", { noremap = true, silent = true })
bind("v", "<C-Tab>", ">gv", "Indent the current selection", { noremap = true, silent = true })
bind("n", "<C-S-Tab>", "<<", "Dedent the current line", { noremap = true, silent = true })
bind("v", "<C-S-Tab>", "<gv", "Dedent the current selection", { noremap = true, silent = true })
