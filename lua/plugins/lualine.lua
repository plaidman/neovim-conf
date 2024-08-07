return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"abeldekat/harpoonline",
		"ThePrimeagen/harpoon",
	},
	config = function()
		local harpoonline = require("harpoonline")
		harpoonline.setup({
			on_update = function()
				require("lualine").refresh()
			end,
		})

		-- TODO: hide git branch if small width

		local lualine_c = { harpoonline.format, "filename" }
		require("lualine").setup({ sections = { lualine_c = lualine_c } })

		-- hide mode line when lualine is loaded
		vim.opt.showmode = false
	end,
}
