return {
	{ "folke/tokyonight.nvim", lazy = true },
	{ "marko-cerovac/material.nvim", lazy = true },
	{ "Mofiqul/vscode.nvim", lazy = true },
	{ "projekt0n/github-nvim-theme", lazy = true },
	{ "rebelot/kanagawa.nvim", lazy = true },
	{ "ribru17/bamboo.nvim", lazy = true },
	{ "sainnhe/gruvbox-material", lazy = true },

	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- NOTE: run :NightfoxCompile first run

			require("nightfox").setup({
				options = {
					styles = { comments = "italic" },
				},
			})

			vim.cmd.colorscheme("dayfox")
		end,
	},

	{
		"sainnhe/sonokai",
		lazy = true,
		config = function()
			vim.g.sonokai_style = "default"
			vim.g.sonokai_diagnostic_text_highlight = 1
			vim.g.sonokai_diagnostic_virtual_text = "colored"
			vim.g.sonokai_better_performance = 1

			-- vim.cmd("colorscheme sonokai")
		end,
	},

	{
		"navarasu/onedark.nvim",
		lazy = true,
		config = function()
			require("onedark").setup({
				style = "light",
			})

			-- vim.cmd("colorscheme onedark")
		end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		config = function()
			-- vim.cmd("colorscheme rose-pine-dawn")
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		config = function()
			-- vim.cmd("colorscheme catppuccin-latte")
		end,
	},

	{
		"sainnhe/edge",
		lazy = true,
		config = function()
			vim.g.edge_style = "default"
			vim.g.edge_diagnostic_text_highlight = 1
			vim.g.edge_diagnostic_virtual_text = "colored"
			vim.g.edge_better_performance = 1

			-- vim.cmd("colorscheme edge")
		end,
	},

	{
		"sainnhe/everforest",
		lazy = true,
		config = function()
			vim.g.everforest_background = "hard"
			vim.g.everforest_diagnostic_text_highlight = 1
			vim.g.everforest_diagnostic_virtual_text = "colored"
			vim.g.everforest_better_performance = 1

			-- vim.cmd("colorscheme everforest")
		end,
	},
}
