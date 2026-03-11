return {
	"oskarnurm/koda.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("koda").setup({
			transparent = true,
			colors = {
				keyword = "#cc8bc9",
				type = "#cecece",
				char = "#95cb82",
			},
		})
		vim.cmd("colorscheme koda-moss")
		vim.api.nvim_set_hl(0, "Delimiter", { fg = "#708b8d" })
		vim.api.nvim_set_hl(0, "@tag", { fg = "#cecece" })
		vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = "#708b8d" })
	end,
}

