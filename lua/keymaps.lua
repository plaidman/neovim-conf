local map = vim.keymap.set

-- optionally enforce hjkl instead of udlr?
-- vim.keymap.set("n", "<left>", "<cmd>echo "Use h to move!!"<CR>")
-- vim.keymap.set("n", "<right>", "<cmd>echo "Use l to move!!"<CR>")
-- vim.keymap.set("n", "<up>", "<cmd>echo "Use k to move!!"<CR>")
-- vim.keymap.set("n", "<down>", "<cmd>echo "Use j to move!!"<CR>")

-- TODO: organize leader combos
-- TODO: add descriptions for use with which-key

-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- exit terminal mode with double <esc>.
map("t", "<esc><esc>", [[<c-\><c-n>]], { desc = "Exit terminal mode" })

-- window split navigation
map("n", "<leader>wq", "<c-w><c-q>")
map("n", "<leader>wv", "<c-w><c-v>")
map("n", "<leader>ws", "<c-w><c-s>")
map("n", "<leader>ww", "<c-w><c-w>")

-- clear highlight when pressing esc in normal mode
map("n", "<esc>", "<cmd>nohlsearch<cr>")

-- TODO: change this to some other key? f2 on mac magic bar is dumb
map("n", "<f2>", "@@")

-- TODO: keybinding or plugin to open terminal in lower split

-- don't jump around when holding shift
map({"v","i","n"}, "<s-up>", "<up>")
map({"v","i","n"}, "<s-down>", "<down>")
map({"v","i","n"}, "<s-left>", "<left>")
map({"v","i","n"}, "<s-right>", "<right>")

-- TODO: commenter plugin
-- vnoremap <leader>/ :TComment<cr>gv
-- nnoremap <leader>/ :TComment<cr>

-- TODO: harpoon plugin
-- nnoremap <F12> :bn<cr>
-- nnoremap <s-F12> :bp<cr>
-- nnoremap <leader>1 :1b<cr>
-- nnoremap <leader>2 :2b<cr>
-- nnoremap <leader>3 :3b<cr>
-- nnoremap <leader>4 :4b<cr>
-- nnoremap <leader>q :bd<cr>

-- TODO: undo tree plugin
-- nnoremap <leader>u :GundoToggle<cr>

-- copy and paste to system keyboard
-- TODO: osc52 clipboard plugin
map({"n", "v"}, "<leader>y", '"+y')
map("n", "<leader>Y", '"+yg_')
map("n", "<leader>yy", '"+yy')
map({"n","v"}, "<leader>p", '"+p')
map({"n","v"}, "<leader>P", '"+P')

-- tab to indent, reselect if there was a selection
map("n", "<tab>", "V>")
map("n", "<s-tab>", "V<")
map("v", "<tab>", ">gv")
map("v", "<s-tab>", "<gv")
map("i", "<s-tab>", "<esc>V<A")

-- move text up and down
map("n", "<c-up>", ":m-2<cr>")
map("n", "<c-down>", ":m+<cr>")
map("v", "<c-up>", ":m-2<cr>gv")
map("v", "<c-down>", ":m'>+<cr>gv")

-- select all text, like ctrl-a
map("n", "<leader>a", "ggVG")
map("v", "<leader>a", "<esc>ggVG")

-- cmd left and right act like home and end
-- NOTE: this doesn't work in TUI
map("n", "<d-right>", "<end>")
map("n", "<d-left>", "<home>")

-- make x,X,<del> avoid overwriting registers
map({"n", "v"}, "x", '"_x')
map({"n", "v"}, "X", '"_X')
map({"n", "v"}, "<del>", '"_x')

-- j/k should go up/down through VISIBLE lines, even if real lines wrap.
map({"n", "v"}, "j", "gj")
map({"n", "v"}, "<down>", "gj")
map({"n", "v"}, "k", "gk")
map({"n", "v"}, "<up>", "gk")
map("i", "<down>", "<c-o>gj")
map("i", "<up>", "<c-o>gk")

