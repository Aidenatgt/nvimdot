-- If the name for the mason package and lspconfig is the same, a single string will do.
local lang = function(lspconfig_str, mason_str)
  return { mason = mason_str or lspconfig_str, lspconfig = lspconfig_str }
end

return {
  lang('lua_ls'),
  lang('pyright'),
  lang('asm_lsp'),
  lang('zls'),
  lang('clangd'),
}
