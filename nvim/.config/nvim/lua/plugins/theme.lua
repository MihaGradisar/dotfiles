return {
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
}
