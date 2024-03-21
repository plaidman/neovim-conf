return {
	-- keybinds for
	--   enter folder
	--   back folder
	--   back previous to CWD
	--   cd
	--   hide and show dot files
	--   preview files
	--   open explorer in current file's directory
	--   open explorer in CWD

	{
		'stevearc/oil.nvim',
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"echasnovski/mini.files",
		version = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },

		config = function()
			require("mini.files").setup()
			vim.keymap.set("n", "<leader>fe", MiniFiles.open)
		end,
	},
}
