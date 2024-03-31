-- set leader key to comma
vim.g.mapleader = ","
vim.g.maplocalleader = ","

require("options")
require("keymaps")
require("autocmd")

--[[ TODO: checkout new plugins

https://www.trackawesomelist.com/rockerBOO/awesome-neovim/readme/
https://www.lazyvim.org/

scratch file/todo list
	LintaoAmons/scratch.nvim
	Selyss/mind.nvim
	rguruprakash/simple-note.nvim
	swaits/scratch.nvim
	2KAbhishek/tdo.nvim

git manager
	NeogitOrg/neogit
	kdheepak/lazygit.nvim

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
	install = { colorscheme = { "everforest" } },
	change_detection = { notify = false },
})
