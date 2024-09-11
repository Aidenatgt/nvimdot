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

-- Move selections
keymap('n', '<S-j>', ':MoveLine(1)<CR>')
keymap('n', '<S-k>', ':MoveLine(-1)<CR>')
keymap('n', '<S-h>', ':MoveHChar(-1)<CR>')
keymap('n', '<S-l>', ':MoveHChar(1)<CR>')
keymap('v', '<S-j>', ':MoveBlock(1)<CR>')
keymap('v', '<S-k>', ':MoveBlock(-1)<CR>')
keymap('v', '<S-h>', ':MoveHBlock(-1)<CR>')
keymap('v', '<S-l>', ':MoveHBlock(1)<CR>')

-- Comments
require("Comment").setup({
  toggler = {
    line = "<leader>/",
    block = "<leader>.",
  },
  opleader = {
    line = "<leader>/",
    block = "<leader>.",
  }
})
