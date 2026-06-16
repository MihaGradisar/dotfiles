return {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    keys = {
        { "<leader>rs", "<cmd>lua require('kulala').run()<cr>",        desc = "Send request" },
        { "<leader>ra", "<cmd>lua require('kulala').run_all()<cr>",    desc = "Send all requests" },
        -- { "<leader>rb", "<cmd>lua require('kulala').scratchpad()<cr>", desc = "Open scratchpad" },
        -- { "<leader>rc", "<cmd>lua require('kulala').copy()<cr>",       desc = "Copy as cURL" },
        -- { "<leader>rn", "<cmd>lua require('kulala').jump_next()<cr>",  desc = "Jump to next request" },
        -- { "<leader>rp", "<cmd>lua require('kulala').jump_prev()<cr>",  desc = "Jump to prev request" },
    },
    opts = {},
}
