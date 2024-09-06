local lspconfig = require'lspconfig'

lspconfig.pyright.setup{}
lspconfig.asm_lsp.setup{}
lspconfig.clangd.setup{}
lspconfig.css_variables.setup{}
lspconfig.cssls.setup{}
lspconfig.html.setup{}
lspconfig.java_language_server.setup{}
lspconfig.htmx.setup{}
lspconfig.jsonls.setup{}
lspconfig.ltex.setup{
  {
    settings = {
      ltex = {
        language = "en-US",
      },
    },
  }
}
lspconfig.lua_ls.setup{}
lspconfig.r_language_server.setup{}
lspconfig.ts_ls.setup{}
lspconfig.yamlls.setup{}
lspconfig.zls.setup{}
