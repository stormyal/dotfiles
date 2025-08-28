vim.diagnostic.config({
    virtual_text = false,

})

lsp_list = {
    "lua_ls",
    "bashls",
    "jsonls",
    "yamlls",
    "marksman",

    "gopls",
    "pyright",
    "ts_ls",
    "clangd",
    "jqls"
}

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = lsp_list
})
vim.lsp.enable(lsp_list)
