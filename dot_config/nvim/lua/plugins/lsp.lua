return {
    "neovim/nvim-lspconfig",
    config = function()
        -- Enable LSP servers (must be installed and in PATH)
        vim.lsp.enable("clangd")
        vim.lsp.enable("rust_analyzer")
        vim.lsp.enable("pyright")
        vim.lsp.enable("gopls")
    end,
}
