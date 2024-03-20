return {
	{ "williamboman/mason.nvim", build = ":MasonUpdate", opts = {} },
	{ "folke/neodev.nvim", opts = {} },
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = { ensure_installed = {
			"lua_ls", "tsserver", "gopls"
		} }
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.gopls.setup({})

			-- TODO: keymaps on LSP attach event
			-- hover to show underline
			-- hover to show definition?
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end
	}
	-- TODO: echasnovski/mini.notify or j-hui/fidget.nvim notifications probably go in their own file
	--
}
