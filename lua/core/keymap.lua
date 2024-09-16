local opts = { noremap = true, silent = true }

local keymap = function(mode, key, bind, desc)
  local opts_inst = opts
  opts_inst.desc = desc
  vim.keymap.set(mode, key, bind, opts_inst)
end

keymap("n", "<Tab>", ":bn<CR>", "Go to next buffer")        -- Next buffer
keymap("n", "<S-Tab>", ":bp<CR>", "Go to previous buffer")  -- Previous buffer
keymap("n", "<leader>x", ":bd<CR>", "Close current buffer") -- Close buffer

local builtin = require 'telescope.builtin'
keymap("n", "<leader>f", builtin.find_files, "Find and open a file")     -- Fuzzy find file
keymap("n", "<leader><Tab>", builtin.buffers, "Find and go to a buffer") -- Fuzzy find buffer
keymap("n", "<leader>g", builtin.live_grep, "Find a pattern in a file (live grep)")

keymap("n", "<leader>s", "<CMD>NoiceDismiss<CR>", "Dismiss a Noice message")
keymap("n", "<leader>d", "<CMD>Neotree<CR>", "Toggle file tree.") -- Toggle file tree
keymap("n", "-", "<CMD>Oil<CR>", "Open parent directory in oil")

keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", "List issues in the current buffer") -- List issues
keymap("n", "<leader>a", "<cmd> lua vim.lsp.buf.code_action()<CR>", "List available code actions")        -- List available code actions

-- Indenetation
keymap("n", "<", "<S-v><", "Decrement the indentation of a line")
keymap("n", ">", "<S-v>>", "Increment the indentation of a line")
keymap("v", "<", "<gv", "Decrement the indentation of a selection")
keymap("v", ">", ">gv", "Increment the indentation of a selection")

-- Pane navigation
keymap("n", "<C-l>", "<C-w>l", "Walk to the left pane")
keymap("n", "<C-k>", "<C-w>k", "Walk to the upper pane")
keymap("n", "<C-j>", "<C-w>j", "Walk to the lower pane")
keymap("n", "<C-h>", "<C-w>h", "Walk to the right pane")

-- Move selections
keymap('n', '<S-j>', ':MoveLine(1)<CR>', "Move the current line down")
keymap('n', '<S-k>', ':MoveLine(-1)<CR>', "Move the current line up")
keymap('n', '<S-h>', ':MoveHChar(-1)<CR>', "Move the character under the cursor right")
keymap('n', '<S-l>', ':MoveHChar(1)<CR>', "Move the character under the cursor left")
keymap('v', '<S-j>', ':MoveBlock(1)<CR>', "Move the current selection down")
keymap('v', '<S-k>', ':MoveBlock(-1)<CR>', "Move the current selection up")
keymap('v', '<S-h>', ':MoveHBlock(-1)<CR>', "Move the current selection right")
keymap('v', '<S-l>', ':MoveHBlock(1)<CR>', "Move the current selection left")

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

-- Terminal
keymap('n', '<leader>t', ':ToggleTerm direction=horizontal<CR>', "Open a horizontal terminal")
keymap('t', '<esc>', [[<C-\><C-n>]], "Enter visual mode within a terminal")
keymap('t', '<C-h>', [[<Cmd>wincmd h<CR>]], "Navigate right from within a terminal")
keymap('t', '<C-j>', [[<Cmd>wincmd j<CR>]], "Navigate down from within a terminal")
keymap('t', '<C-k>', [[<Cmd>wincmd k<CR>]], "Navigate up from within a terminal")
keymap('t', '<C-l>', [[<Cmd>wincmd l<CR>]], "Navigate left from within a terminal")
keymap('t', '<C-w>', [[<C-\><C-n><C-w>]], "Walk to a different pane from within a terminal")
