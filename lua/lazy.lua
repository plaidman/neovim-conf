-- TODO plugin list
-- https://github.com/ThePrimeagen/neovimrc/tree/master
-- https://github.com/dam9000/kickstart-modular.nvim/tree/master
-- https://www.trackawesomelist.com/rockerBOO/awesome-neovim/readme/
-- lazy plugin manager
-- commenter
-- file tree
-- undo tree
-- telescope
-- code completion
-- lsp
-- mason
-- treesitter
-- powerline
-- telescope
-- osc52 clipboard
-- harpoon
-- surround
-- which key or mini.clue
-- fugitive
-- color theme
-- snippets?
-- luagen for annotations?
-- trouble
--

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

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

print('loading lazy')
print('----------------')
print(lazypath)
print(dump(vim.opt.rtp))


require("lazy").setup({
  {
    'folke/tokyonight.nvim',
    priority = 1000,
  }
})

