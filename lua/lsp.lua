local lspconfig = require("lspconfig")

-- Add your servers here
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
  rust_analyzer = {},
  clangd = {},
  basedpyright = {},
  html = {},
  cssls = {},
  ts_ls = {},
  eslint = {},
  dartls = {},
  asm_lsp = {},
  ruby_lsp = {
    filetypes = {
      "ruby",
    }
  },
  texlab = {},
  zls = {},
}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = vim.tbl_keys(servers),
  automatic_installation = true,
  handlers = {},
})


local on_attach = function(_, bufnr)
  local buf_map = function(mode, lhs, rhs)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
  end

  buf_map("n", "gd", vim.lsp.buf.definition())
  buf_map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  buf_map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  buf_map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  buf_map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
end
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_nvim_lsp_ok then
  capabilities = cmp_nvim_lsp.default_capabilities()
end

for server, config in pairs(servers) do
  config.on_attach = on_attach
  config.capabilities = capabilities
  lspconfig[server].setup(config)
end
