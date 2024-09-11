require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

function map(tbl, f)
    local t = {}
    for k,v in pairs(tbl) do
        t[k] = f(v)
    end
    return t
end

require('mason-lspconfig').setup({
  ensure_installed = map(require('core.langs'), function(lang)
    return lang.mason
  end)
})
