vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.lua",
  callback = function(args)
    local file = args.file
    local config_path = vim.fn.stdpath("config")
    local rel_path = file:sub(#config_path + 2) -- e.g., "lua/core/keymaps.lua"

    -- Only reload if inside lua/
    if rel_path:sub(1, 4) == "lua/" then
      local mod = rel_path:sub(5):gsub("%.lua$", ""):gsub("/", ".") -- e.g., "core.keymaps"
      package.loaded[mod] = nil
      local ok, err = pcall(require, mod)
      if ok then
        vim.notify("Reloaded module: " .. mod, vim.log.levels.INFO)
      else
        vim.notify("Error reloading " .. mod .. ":\n" .. err, vim.log.levels.ERROR)
      end
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  callback = function()
    vim.keymap.set("n", "<Esc>", "<cmd>bd<CR>", { buffer = true, silent = true })
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
