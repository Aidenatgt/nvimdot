-- If the name for the mason package and lspconfig is the same, a single string will do.
local lang = function(lspconfig_str, mason_str, settings)
  return { mason = mason_str or lspconfig_str, lspconfig = lspconfig_str, settings = settings }
end

return {
  lang('lua_ls', 'lua-language-server', {
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
  lang('dartls'), -- Dart Language Server
  lang('java_language_server', nil, {
    cmd = {"/home/aiden/.local/share/nvim/mason/packages/java-language-server/dist/lang_server_linux.sh"},
  }),
}
