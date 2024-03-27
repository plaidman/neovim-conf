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

set lazy load configs for go over things that don't need to be loaded immediately (e.g. LSP stuff)

	keymap reminder popup
		echasnovski/mini.clue
		folke/which-key.nvim

	startup screen
		goolord/alpha-nvim
		nvimdev/dashboard-nvim
		echasnovski/mini.starter

	session manager plugin
		echasnovski/mini.sessions
		rmagatti/auto-session
		folke/persistence.nvim
		gennaro-tedesco/nvim-possession
		Shatur/neovim-session-manager

	git manager
		fugitive
		neogit

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
