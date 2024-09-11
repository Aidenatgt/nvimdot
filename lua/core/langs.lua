local lang = function(mason_str, lspconfig_str)
  return { mason = mason_str, lspconfig = lspconfig_str }
end
return {
  lang('lua_ls', 'lua_ls'),
  lang('pyright', 'pyright'),
  lang('asm_lsp', 'asm_lsp'),
  --  lang('java_language_server', 'java_language_server'),
  lang('zls', 'zls'),
  lang('clangd', 'clangd'),
}
