return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c_sharp",
				"python",
				"terraform",
				"dockerfile",
				"git_rebase",
				"gitignore",
				"gitcommit",
				"css",
				"scss",
				"typescript",
				"json",
				"c",
				"go",
				"templ",
				"rust",
				"make",
				"yaml",
				"regex",
				"lua",
				"luadoc",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
	-- TODO: Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
}
