local opts = { noremap = true, silent = true }

vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Directory Stuff
vim.keymap.set("n", "<Tab>", ":bn<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bp<CR>", opts)
vim.keymap.set("n", "<leader>x", ":bd<CR>", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)

-- Indenetation
vim.keymap.set("n", "<", "<S-v><", opts)
vim.keymap.set("n", ">", "<S-v>>", opts)
vim.keymap.set("v", "<", "<<S-v>", opts)
vim.keymap.set("v", ">", "><S-v>", opts)
