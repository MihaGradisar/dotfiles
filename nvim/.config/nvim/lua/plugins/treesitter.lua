return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local ts = require("nvim-treesitter")
		local parsers = {
			"bash",
			"html",
			"css",
			"javascript",
			"typescript",
			"json",
			"lua",
			"luadoc",
			"luap",
			"query",
			"regex",
			"vim",
			"vimdoc",
			"yaml",
			"go",
			"gomod",
			"gowork",
			"gosum",
			"tsx",
			"php",
			"python",
			"c_sharp",
			"xml",
			"http",
		}
		for _, parser in ipairs(parsers) do
			ts.install(parser)
		end

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(ev)
				pcall(vim.treesitter.start, ev.buf)
			end,
		})
	end,
}
