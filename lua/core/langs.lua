-- If the name for the mason package and lspconfig is the same, a single string will do.
local lang = function(lspconfig_str, mason_str, settings)
  return { mason = mason_str or lspconfig_str, lspconfig = lspconfig_str, settings = settings }
end

return {
  lang('lua_ls', nil, {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }),                   -- Lua Language Server

  lang('basedpyright'), -- Python Language Server
  lang('asm_lsp'),      -- Assembly Language Server
  lang('zls'),          -- Zig Language Server
  lang('clangd'),       -- C/C++ Language Server
  lang('texlab'),       -- LaTeX Language Server
  lang('ruby_lsp', nil, {
    filetypes = { 'ruby' }
  }),             -- Ruby Language Server
  lang('html'),
  lang('cssls'),
  lang('ts_ls'),
  lang('eslint'),
  lang('dartls'), -- Dart Language Server
}
