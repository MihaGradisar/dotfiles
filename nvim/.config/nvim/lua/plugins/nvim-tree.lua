return {
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				actions = {
					open_file = {
						quit_on_open = true,
					},
				},
				sort = {
					sorter = "case_sensitive",
				},
				view = {
					width = 30,
					relativenumber = true,
				},
				renderer = {
					group_empty = true,
					icons = {
						git_placement = "before",
						glyphs = {
							git = {
								unstaged = "~",
								staged = "+",
								unmerged = "~",
								renamed = "~",
								untracked = "?",
								deleted = "-",
								ignored = "!",
							},
						},
					},
				},
				filters = {
					dotfiles = false,
					git_ignored = false,
					custom = {},
				},
				log = {
					enable = true,
					truncate = true,
					types = {
						diagnostics = true,
						git = true,
						profile = true,
						watcher = true,
					},
				},
			})
		end,
	},
}
