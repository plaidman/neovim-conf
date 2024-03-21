return {
	{ "williamboman/mason.nvim", build = ":MasonUpdate", opts = {} },

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
	},

	{
		"neovim/nvim-lspconfig",

		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},

		config = function()
			local servers = { "lua_ls", "tsserver", "gopls", "eslint", "pyright" }

			require("mason-lspconfig").setup({ ensure_installed = servers })
			require("neodev").setup()

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			for _, server in pairs(servers) do
				lspconfig[server].setup({
					capabilities = capabilities,
				})
			end

			-- TODO: keymaps on LSP attach event
			-- hover to show underline
			-- hover to show definition?
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},

	{
		"nvimtools/none-ls.nvim",
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

			-- TODO: auto format on save
			vim.keymap.set("n", "<leader>=", vim.lsp.buf.format, {})
		end,
	},

	{
		"jay-babu/mason-null-ls.nvim",
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
