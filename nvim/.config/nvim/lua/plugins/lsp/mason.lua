return {
    "mason-org/mason.nvim",
    lazy = false,
    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })
        require("mason-tool-installer").setup({
            ensure_installed = {
                -- Language servers
                "lua-language-server",
                "gopls",
                "omnisharp",
                "pyright",
                "intelephense",
                "typescript-language-server",
                "css-lsp",
                "tailwindcss-language-server",
                "vue-language-server",
                -- Formatters
                "stylua",
                "shfmt",
                "prettier",
                "pint",
            },
        })
    end,
}
