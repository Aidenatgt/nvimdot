vim.g.mapleader = " "

-- Directory Stuff
vim.keymap.set("n", "<leader>d", vim.cmd.Ex)
vim.keymap.set("n", "<Tab>", ":bn<CR>")
vim.keymap.set("n", "<S-Tab>", ":bp<CR>")
vim.keymap.set("n", "<leader>x", ":bd<CR>")
