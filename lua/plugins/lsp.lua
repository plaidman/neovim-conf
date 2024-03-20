return {
	{ "williamboman/mason.nvim", build = ":MasonUpdate", opts = {} },
	{
		"folke/neodev.nvim",
		opts = {},
		config = function()
			require("neodev").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"lua_ls",
				"tsserver",
				"gopls",
				"eslint",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",
		},
		config = function()
			print("lspconfig")
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.gopls.setup({})
			lspconfig.eslint.setup({})

			-- TODO: keymaps on LSP attach event
			-- hover to show underline
			-- hover to show definition?
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.hover, {})
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
	-- TODO: echasnovski/mini.notify or j-hui/fidget.nvim notifications probably go in their own file
	--
}
