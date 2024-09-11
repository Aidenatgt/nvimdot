local opts = { noremap = true, silent = true }

local keymap = function(mode, key, bind)
  vim.keymap.set(mode, key, bind, opts)
end

keymap("n", "<Tab>", ":bn<CR>")     -- Next buffer
keymap("n", "<S-Tab>", ":bp<CR>")   -- Previous buffer
keymap("n", "<leader>x", ":bd<CR>") -- Close buffer

local builtin = require 'telescope.builtin'
keymap("n", "<leader>f", builtin.find_files)                         -- Fuzzy find file
keymap("n", "<leader><Tab>", builtin.buffers)                        -- Fuzzy find buffer

keymap("n", "<leader>d", ":NvimTreeToggle<CR>")                      -- Toggle file tree

keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>") -- List issues
keymap("n", "<leader>a", "<cmd> lua vim.lsp.buf.code_action()<CR>")  -- List available code actions

-- Indenetation
keymap("n", "<", "<S-v><")
keymap("n", ">", "<S-v>>")
keymap("v", "<", "<<S-v>")
keymap("v", ">", "><S-v>")

-- Pane navigation
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-h>", "<C-w>h")
