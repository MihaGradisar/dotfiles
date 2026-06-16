return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				-- lua
				lua = { "stylua" },

				cs = { "csharpier" },

				-- java
				java = { "google-java-format" },

				-- go
				go = { "gofmt" },

				-- c
				c = { "clang-format" },

				-- rust
				rust = { "rustfmt" },

				-- Web technologies
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },

				-- php
				php = { "pint" },

				-- shell
				sh = { "shfmt" },
				bash = { "shfmt" },
			},
			formatters = {
				["google-java-format"] = {
					args = { "--aosp", "-" },
				},
			},
			-- format_on_save = {
			--     lsp_fallback = true,
			--     async = false,
			-- },
		})
		vim.keymap.set("n", "<leader>cf", function()
			require("conform").format()
		end, { noremap = true, silent = true })
	end,
}
