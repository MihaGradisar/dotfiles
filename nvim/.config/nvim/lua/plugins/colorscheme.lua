return {
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	config = function()
		require("solarized-osaka").setup({
			style = "storm",
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		})
		vim.cmd("colorscheme solarized-osaka")
	end,
}
