vim.diagnostic.config({
    virtual_text = true
})

vim.lsp.config['luals'] = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" }
}
vim.lsp.enable('luals')



vim.lsp.config['jsonls'] = {
    cmd = { "vscode-json-language-server", "--stdio" },
    filetypes = { "json", "jsonc" },
    init_options = {
        provideFormatter = true
    },
    root_markers = { ".git" },
}
vim.lsp.enable('jsonls')



vim.lsp.config['htmx-lsp'] = {
    cmd = { 'htmx-lsp' },
    filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango", "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "gohtmltmpl", "haml", "handlebars", "hbs", "html", "htmlangular", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte", "templ" },
    root_markers = { ".git" },
}
vim.lsp.enable('htmx-lsp')


vim.lsp.config['gopls'] = {

    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
}
vim.lsp.enable('gopls')

-- json
--
--
-- html
--
-- css
-- java
-- python
-- c#
