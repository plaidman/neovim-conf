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
			local servers = { "lua_ls", "tsserver", "gopls", "eslint", "pyright", "rust_analyzer" }

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

			vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover)
			vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
		end,
	},

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		keys = { "<leader>=" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
				},
			})

			vim.keymap.set("n", "<leader>=", function()
				require("conform").format({ async = true, lsp_fallback = true })
			end)
		end,
	},
	-- { "mfussenegger/nvim-lint" }
}
