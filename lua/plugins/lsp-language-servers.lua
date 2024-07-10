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
				"csharp_ls",
			}

			require("mason").setup()
			require("mason-lspconfig").setup({ ensure_installed = servers })
			require("neodev").setup()

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			for _, server in pairs(servers) do
				lspconfig[server].setup({
					capabilities = capabilities,
				})
			end

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
