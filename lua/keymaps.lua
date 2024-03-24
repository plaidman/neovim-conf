local map = vim.keymap.set

-- optionally enforce hjkl instead of udlr?
-- vim.keymap.set("n", "<left>", "<cmd>echo "Use h to move!!"<CR>")
-- vim.keymap.set("n", "<right>", "<cmd>echo "Use l to move!!"<CR>")
-- vim.keymap.set("n", "<up>", "<cmd>echo "Use k to move!!"<CR>")
-- vim.keymap.set("n", "<down>", "<cmd>echo "Use j to move!!"<CR>")

-- TODO: organize leader combos
-- TODO: add descriptions for use with which-key

-- exit terminal mode with double <esc>.
map("t", "<esc><esc>", [[<c-\><c-n>]])

-- window split navigation
map("n", "<leader>wq", "<c-w><c-q>")
map("n", "<leader>wv", "<c-w><c-v>")
map("n", "<leader>ws", "<c-w><c-s>")
map("n", "<leader>ww", "<c-w><c-w>")

-- clear highlight when pressing esc in normal mode
map("n", "<esc>", "<cmd>nohlsearch<cr>")

-- don't jump around when holding shift
map({ "x", "i", "n" }, "<s-up>", "<up>")
map({ "x", "i", "n" }, "<s-down>", "<down>")
map({ "x", "i", "n" }, "<s-left>", "<left>")
map({ "x", "i", "n" }, "<s-right>", "<right>")

-- copy and paste to system keyboard
-- TODO: osc52 clipboard plugin
map({ "n", "x" }, "<leader>y", '"+y')
map("n", "<leader>Y", '"+yg_')
map("n", "<leader>yy", '"+yy')
map({ "n", "x" }, "<leader>p", '"+p')
map({ "n", "x" }, "<leader>P", '"+P')

-- tab to indent, reselect if there was a selection
map("n", "<tab>", "V>")
map("n", "<s-tab>", "V<")
map("x", "<tab>", ">gv")
map("x", "<s-tab>", "<gv")
map("i", "<s-tab>", "<esc>V<A")

-- select all text, like ctrl-a
map("n", "<leader>a", "ggVG")
map("x", "<leader>a", "<esc>ggVG")

-- cmd left and right act like home and end
-- NOTE: this doesn't work in TUI
map({ "n", "i" }, "<d-right>", "<end>")
map({ "n", "i" }, "<d-left>", "<home>")

-- make x,X,<del> avoid overwriting registers
map({ "n", "x" }, "x", '"_x')
map({ "n", "x" }, "X", '"_X')
map({ "n", "x" }, "<del>", '"_x')

-- j/k should go up/down through VISIBLE lines, even if real lines wrap.
map({ "n", "x" }, "j", "gj")
map({ "n", "x" }, "<down>", "gj")
map({ "n", "x" }, "k", "gk")
map({ "n", "x" }, "<up>", "gk")
