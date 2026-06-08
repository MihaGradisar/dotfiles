return {
    {
        "Mofiqul/vscode.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("vscode").setup({
                transparent = true,
                group_overrides = {
                    NvimTreeNormal = { bg = "NONE" },
                },
            })
            vim.cmd.colorscheme("vscode")
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        config = function()
            require("rose-pine").setup({
                variant = "main",
                styles = {
                    transparency = true,
                },
            })
            -- vim.cmd.colorscheme("rose-pine")
        end,
    },
    {
        "sainnhe/gruvbox-material",
        enabled = true,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_transparent_background = 1
            vim.g.gruvbox_material_foreground = "mix"
            vim.g.gruvbox_material_background = "hard"
            vim.g.gruvbox_material_ui_contrast = "high"
            vim.g.gruvbox_material_float_style = "bright"
            vim.g.gruvbox_material_statusline_style = "material"
            vim.g.gruvbox_material_cursor = "auto"
            -- vim.cmd.colorscheme("gruvbox-material")
        end,
    },
}
