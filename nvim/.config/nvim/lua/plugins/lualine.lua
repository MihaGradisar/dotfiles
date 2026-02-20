return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local filename = {
            "filename",
            path = 1,
        }

        local file_info = {
            function()
                local encoding = vim.o.fileencoding
                if encoding == "" then
                    return vim.bo.fileformat .. " :: " .. vim.bo.filetype
                else
                    return encoding .. " :: " .. vim.bo.fileformat .. " :: " .. vim.bo.filetype
                end
            end,
        }

        require("lualine").setup({
            options = {
                icons_enabled = false,
                theme = "auto",
                component_separators = "",
                section_separators = "",
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { filename },
                lualine_x = { file_info },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end,
}
