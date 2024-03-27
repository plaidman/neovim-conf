local augroup = vim.api.nvim_create_augroup("plaidman", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- highlight when yanking text
autocmd("TextYankPost", {
	desc = "After yanking, highlight yanked range.",
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- clear trailing white space
autocmd("BufWritePre", {
	desc = "Before save, clear trailing whitespace.",
	group = augroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

