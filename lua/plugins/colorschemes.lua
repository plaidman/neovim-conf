return {
	-- "catppuccin/nvim",
	-- "EdenEast/nightfox.nvim",
	"folke/tokyonight.nvim",
	"marko-cerovac/material.nvim",
	"Mofiqul/vscode.nvim",
	-- "navarasu/onedark.nvim",
	"projekt0n/github-nvim-theme",
	"rebelot/kanagawa.nvim",
	"ribru17/bamboo.nvim",
	-- "rose-pine/neovim",
	-- "sainnhe/edge",
	-- "sainnhe/everforest",
	"sainnhe/gruvbox-material",
	-- "sainnhe/sonokai",

	{
		"sainnhe/sonokai", -- best dark mode
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.sonokai_style = "default"
			vim.g.sonokai_diagnostic_text_highlight = 1
			vim.g.sonokai_diagnostic_virtual_text = "colored"
			vim.g.sonokai_better_performance = 1

			-- vim.cmd("colorscheme sonokai")
		end,
	},

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

			vim.cmd("colorscheme dayfox")
		end,
	},

	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
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
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "dawn",
			})

			-- vim.cmd("colorscheme rose-pine")
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "latte",
			})

			-- vim.cmd("colorscheme catppuccin")
		end,
	},

	{
		"sainnhe/edge",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.edge_style = "default"
			vim.g.edge_diagnostic_text_highlight = 1
			vim.g.edge_diagnostic_virtual_text = "colored"
			vim.g.edge_better_performance = 1

			-- vim.cmd("colorscheme edge")
		end,
	},

	-- TODO: quick switch between dark and light mode
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_background = "hard"
			vim.g.everforest_diagnostic_text_highlight = 1
			vim.g.everforest_diagnostic_virtual_text = "colored"
			vim.g.everforest_better_performance = 1

			-- vim.cmd("colorscheme everforest")
		end,
	},
}
