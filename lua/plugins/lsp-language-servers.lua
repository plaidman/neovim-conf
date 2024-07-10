return {
	{ "williamboman/mason.nvim", build = ":MasonUpdate" },

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		cmd = { "Mason", "MasonUpdate" },

		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"Hoffs/omnisharp-extended-lsp.nvim",
		},

		config = function()
			local servers = {
				"lua_ls",
				"tsserver",
				"gopls",
				"eslint",
				"pyright",
				"rust_analyzer",
				"zls",
				-- "csharp_ls",
				"omnisharp",
			}

			require("mason").setup()
			require("mason-lspconfig").setup({ ensure_installed = servers })
			require("neodev").setup()

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			for _, server in pairs(servers) do
				if server == "omnisharp" then
					goto continue
				end

				lspconfig[server].setup({
					capabilities = capabilities,
				})

				::continue::
			end

			lspconfig.omnisharp.setup({
				capabilities = capabilities,
				cmd = { "/Users/JTomsic/.local/share/nvim/mason/bin/omnisharp" },
				handlers = {
					["textDocument/definition"] = require('omnisharp_extended').definition_handler,
					["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
					["textDocument/references"] = require('omnisharp_extended').references_handler,
					["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
				},
				settings = {
					RoslynExtensionsOptions = {
						enableDecompilationSupport = true,
					},
				},
			})

			vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Code Hover" })
			vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, { desc = "[C]ode re[N]ame" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
		end,
	},

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		keys = {
			{ "<leader>=", desc = "Format Code" },
			{ "<leader>cf", desc = "[C]ode [F]ormat" },
		},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
				},
			})

			local format_code = function()
				require("conform").format({ async = true, lsp_fallback = true })
			end

			vim.keymap.set("n", "<leader>cf", format_code, { desc = "[C]ode [F]ormat" })
			vim.keymap.set("n", "<leader>=", format_code, { desc = "Format Code" })
		end,
	},
	-- { "mfussenegger/nvim-lint" }
}
