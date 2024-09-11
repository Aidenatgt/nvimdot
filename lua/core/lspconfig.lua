local lsp_config = require 'lspconfig'
local langs = require 'core.langs'

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, v in ipairs(langs) do
  lsp_config[v.lspconfig].setup { capabilities = capabilities }
end
