return {
	{
		"Wansmer/treesj",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("treesj").setup({
				use_default_keymaps = false,
				vim.keymap.set('n', '<leader>m', require('treesj').toggle)
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		config = function()
			local autopairs = require("nvim-autopairs") -- import nvim-autopairs

			autopairs.setup({
				check_ts = true, -- treesitter enabled
				ts_config = {
					lua = { "string" }, -- dont add pairs in lua string treesitter nodes
					javascript = { "template_string" }, -- dont add pairs in javscript template_string treesitter nodes
					java = false, -- dont check treesitter on java
				},
			})
		end,
	},
	{
		"echasnovski/mini.surround",
		opts = {
			custom_surroundings = nil,
			highlight_duration = 500,
			mappings = {
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "sd", -- Delete surrounding
				find = "sf", -- Find surrounding (to the right)
				find_left = "sF", -- Find surrounding (to the left)
				highlight = "sh", -- Highlight surrounding
				replace = "sr", -- Replace surrounding
				update_n_lines = "sn", -- Update `n_lines`
			},
		},
	},
}
