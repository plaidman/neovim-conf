return {
	"catppuccin/nvim",
	"cryptomilk/nightcity.nvim",
	"deparr/tairiki.nvim",
	"EdenEast/nightfox.nvim",
	"folke/tokyonight.nvim",
	"marko-cerovac/material.nvim",
	"Mofiqul/vscode.nvim",
	"navarasu/onedark.nvim",
	"neanias/everforest-nvim",
	"olimorris/onedarkpro.nvim",
	"olivercederborg/poimandres.nvim",
	"projekt0n/github-nvim-theme",
	"rebelot/kanagawa.nvim",
	"ribru17/bamboo.nvim",
	"sainnhe/edge",
	"sainnhe/sonokai",
	"shaunsingh/nord.nvim",
	{ url = "https://codeberg.org/jthvai/lavender.nvim" },
	{
		"sainnhe/sonokai",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme sonokai")
		end,
	},
}
