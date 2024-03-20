return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup()

		-- hide mode line when lualine is loaded
		vim.opt.showmode = false
	end,
}
