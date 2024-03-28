return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"c_sharp",
				"css",
				"dockerfile",
				"git_rebase",
				"gitcommit",
				"gitignore",
				"go",
				"json",
				"lua",
				"luadoc",
				"make",
				"python",
				"regex",
				"rust",
				"scss",
				"templ",
				"terraform",
				"typescript",
				"yaml",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
