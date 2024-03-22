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
  mini.clue or which-key
  osc52 clipboard

UI
  harpoon
  nice/noice with telescope plugin
  find and replace
  alpha.lua or dashboard-nvim or mini.startup

CODING
  luagen for annotations?
  trouble
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
