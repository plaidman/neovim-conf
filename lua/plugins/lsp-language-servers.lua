return {
	{ "williamboman/mason.nvim", build = ":MasonUpdate", opts = {} },

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },

		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},

		config = function()
			local servers = { "lua_ls", "tsserver", "gopls", "eslint", "pyright", "rust_analyzer" }

			require("mason-lspconfig").setup({ ensure_installed = servers })
			require("neodev").setup()

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			for _, server in pairs(servers) do
				lspconfig[server].setup({
					capabilities = capabilities,
				})
			end

			-- TODO: better keymap for hover popup
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},

	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		dependencies = {
			"jay-babu/mason-null-ls.nvim",
		},

		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
				},
			})

			vim.keymap.set("n", "<leader>=", vim.lsp.buf.format, {})
		end,
	},

	{
		"jay-babu/mason-null-ls.nvim",
		lazy = true,
		dependencies = {
			"williamboman/mason.nvim",
		},

		config = function()
			require("mason-null-ls").setup({
				automatic_installation = true,
				ensure_installed = { "stylua", "prettier" },
			})
		end,
	},
}
