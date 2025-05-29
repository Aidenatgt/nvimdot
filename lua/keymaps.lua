vim.g.mapleader = " "

function bind(mode, key, value, description)
	vim.keymap.set(mode, key, value, { desc = description })
end

bind("n", "<leader>x", "<CMD>q<CR>", "Close the current buffer")

-- Open Oil
bind("n", "-", "<CMD>Oil<CR>", "Open parent directory with Oil")

-- Telescope
bind("n", "<leader>ff", "<CMD>Telescope find_files<CR>", "Find files with Telescope")
bind("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", "Live grep with Telescope")
bind("n", "<leader>fb", "<CMD>Telescope buffers<CR>", "Search buffers with Telescope")
bind("n", "<leader>fh", "<CMD>Telescope help_tags<CR>", "Telescope help")

bind("n", "<leader>h", ":nohlsearch<CR>", "Clear highlighted phrases")
