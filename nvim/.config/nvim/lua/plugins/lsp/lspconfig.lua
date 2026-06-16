return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"saghen/blink.cmp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- Define sign icons for each severity
		local signs = {
			[vim.diagnostic.severity.ERROR] = "E",
			[vim.diagnostic.severity.WARN] = "W",
			[vim.diagnostic.severity.HINT] = "H",
			[vim.diagnostic.severity.INFO] = "I",
		}

		-- Set diagnostic config
		vim.diagnostic.config({
			signs = {
				text = signs,
			},
			virtual_text = true,
			underline = true,
			update_in_insert = false,
		})

		-- Setup capabilities
		-- requires saghen/blink.cmp
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		vim.lsp.config("*", { capabilities = capabilities })

		-- lua
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
					workspace = {
						checkThirdParty = false,
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
							-- ["${3rd}/love2d/library"] = true,
						},
					},
				},
			},
		})
		vim.lsp.enable("lua_ls")

		-- ts
		vim.lsp.config("ts_ls", {
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
			},
			single_file_support = true,
			init_options = {
				preferences = {
					includeCompletionsForModuleExports = true,
					includeCompletionsForImportStatements = true,
				},
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = vim.fn.stdpath("data")
							.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
						languages = { "vue" },
					},
				},
			},
		})
		vim.lsp.enable("ts_ls")

		-- tailwindcss
		vim.lsp.config("tailwindcss", {
			settings = {},
		})
		vim.lsp.enable("tailwindcss")

		-- css
		vim.lsp.config("cssls", {
			settings = {
				css = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
				scss = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
				less = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
			},
		})
		vim.lsp.enable("cssls")

		-- php
		vim.lsp.config("intelephense", {
			settings = {
				intelephense = {
					telemetry = {
						enabled = false,
					},
				},
			},
			init_options = {
				globalStoragePath = os.getenv("HOME") .. "/.local/share/intelephense",
			},
		})
		vim.lsp.enable("intelephense")

		-- go
		vim.lsp.config("gopls", {
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
					gofumpt = true,
				},
			},
		})
		vim.lsp.enable("gopls")

		-- java
		vim.lsp.config("jdtls", {})
		vim.lsp.enable("jdtls")

		-- rust
		vim.lsp.config("rust_analyzer", {})
		vim.lsp.enable("rust_analyzer")

		-- vue
		vim.lsp.config("vue_ls", {})
		vim.lsp.enable("vue_ls")

		-- c#
		vim.lsp.config("roslyn_ls", {
			settings = {
				["csharp|background_analysis"] = {
					dotnet_analyzer_diagnostics_scope = "openFiles",
					dotnet_compiler_diagnostics_scope = "openFiles",
				},
			},
		})
		vim.lsp.enable("roslyn_ls")

		-- c
		vim.lsp.config("clangd", {})
		vim.lsp.enable("clangd")

		-- python
		vim.lsp.config("pyright", {})
		vim.lsp.enable("pyright")
	end,
}
