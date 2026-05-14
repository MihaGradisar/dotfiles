return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("nvim-treesitter-textobjects").setup({
            select = {
                lookahead = true,
                include_surrounding_whitespace = false,
                selection_modes = {
                    ["@parameter.outer"]   = "v",
                    ["@parameter.inner"]   = "v",
                    ["@function.outer"]    = "v",
                    ["@conditional.outer"] = "V",
                    ["@loop.outer"]        = "V",
                    ["@class.outer"]       = "<c-v>",
                },
            },
            move = {
                set_jumps = true,
            },
        })

        local select = require("nvim-treesitter-textobjects.select")
        local move   = require("nvim-treesitter-textobjects.move")

        -- Select
        vim.keymap.set({ "x", "o" }, "af", function() select.select_textobject("@function.outer", "textobjects") end,
            { desc = "around a function" })
        vim.keymap.set({ "x", "o" }, "if", function() select.select_textobject("@function.inner", "textobjects") end,
            { desc = "inner part of a function" })
        vim.keymap.set({ "x", "o" }, "ac", function() select.select_textobject("@class.outer", "textobjects") end,
            { desc = "around a class" })
        vim.keymap.set({ "x", "o" }, "ic", function() select.select_textobject("@class.inner", "textobjects") end,
            { desc = "inner part of a class" })
        vim.keymap.set({ "x", "o" }, "ai", function() select.select_textobject("@conditional.outer", "textobjects") end,
            { desc = "around an if statement" })
        vim.keymap.set({ "x", "o" }, "ii", function() select.select_textobject("@conditional.inner", "textobjects") end,
            { desc = "inner part of an if statement" })
        vim.keymap.set({ "x", "o" }, "al", function() select.select_textobject("@loop.outer", "textobjects") end,
            { desc = "around a loop" })
        vim.keymap.set({ "x", "o" }, "il", function() select.select_textobject("@loop.inner", "textobjects") end,
            { desc = "inner part of a loop" })
        vim.keymap.set({ "x", "o" }, "ap", function() select.select_textobject("@parameter.outer", "textobjects") end,
            { desc = "around parameter" })
        vim.keymap.set({ "x", "o" }, "ip", function() select.select_textobject("@parameter.inner", "textobjects") end,
            { desc = "inside a parameter" })

        -- Move
        vim.keymap.set({ "n", "x", "o" }, "]f", function() move.goto_next_start("@function.outer", "textobjects") end,
            { desc = "Next function" })
        vim.keymap.set({ "n", "x", "o" }, "]c", function() move.goto_next_start("@class.outer", "textobjects") end,
            { desc = "Next class" })
        vim.keymap.set({ "n", "x", "o" }, "]p", function() move.goto_next_start("@parameter.inner", "textobjects") end,
            { desc = "Next parameter" })
        vim.keymap.set({ "n", "x", "o" }, "[f",
            function() move.goto_previous_start("@function.outer", "textobjects") end, { desc = "Previous function" })
        vim.keymap.set({ "n", "x", "o" }, "[c",
            function() move.goto_previous_start("@class.outer", "textobjects") end, { desc = "Previous class" })
        vim.keymap.set({ "n", "x", "o" }, "[p",
            function() move.goto_previous_start("@parameter.inner", "textobjects") end, { desc = "Previous parameter" })
    end,
}
