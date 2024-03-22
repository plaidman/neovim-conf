-- set leader key to comma
vim.g.mapleader = ","
vim.g.maplocalleader = ","

require("options")
require("keymaps")
require("autocmd")

--[[ TODO: plugin list

https://github.com/dam9000/kickstart-modular.nvim/tree/master
https://www.trackawesomelist.com/rockerBOO/awesome-neovim/readme/
https://www.lazyvim.org/



UTILS
  echasnovski/mini.clue or
    folke/which-key.nvim
  ojroques/nvim-osc52

UI
  ThePrimeagen/harpoon (use harpoon2 branch)
  folke/noice.nvim
    and telescope plugin?
  find and replace
  goolord/alpha-nvim or
    nvimdev/dashboard-nvim or
	echasnovski/mini.starter

CODING
  folke/trouble.nvim
  stevearc/conform.nvim
  mfussenegger/nvim-lint

--]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	print(vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	}))
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	install = { colorscheme = { "sonokai" } },
	change_detection = { notify = false },
})
