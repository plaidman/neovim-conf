return {
	"catppuccin/nvim",
	"EdenEast/nightfox.nvim",
	"folke/tokyonight.nvim",
	"olimorris/onedarkpro.nvim",
	"marko-cerovac/material.nvim",
	"Mofiqul/vscode.nvim",
	"navarasu/onedark.nvim",
	"projekt0n/github-nvim-theme",
	"rebelot/kanagawa.nvim",
	"ribru17/bamboo.nvim",
	"rose-pine/neovim",
	"sainnhe/edge",
	-- "neanias/everforest-nvim",
	"sainnhe/everforest",
	"sainnhe/gruvbox-material",
	"sainnhe/sonokai",
	-- {
	-- 	"catppuccin/nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd("colorscheme catppuccin-mocha")
	-- 	end,
	-- },
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd("colorscheme kanagawa-dragon")
	-- 	end,
	-- },
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- NOTE run :NightfoxCompile first run

			require("nightfox").setup({
				options = {
					styles = { comments = "italic" },
				},
			})
			vim.cmd("colorscheme dayfox")
			-- vim.cmd("colorscheme nordfox")
			-- vim.cmd("colorscheme terafox")
			-- vim.cmd("colorscheme carbonfox")
		end,
	},
	-- {
	-- 	"sainnhe/everforest",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd("colorscheme everforest")
	-- 	end,
	-- },
}

