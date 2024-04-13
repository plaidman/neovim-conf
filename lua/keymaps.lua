local map = vim.keymap.set

-- optionally enforce hjkl instead of udlr?
-- map("n", "<left>", "<cmd>echo "Use h to move!!"<CR>")
-- map("n", "<right>", "<cmd>echo "Use l to move!!"<CR>")
-- map("n", "<up>", "<cmd>echo "Use k to move!!"<CR>")
-- map("n", "<down>", "<cmd>echo "Use j to move!!"<CR>")

-- terminal normal mode with double <esc>.
map("t", "<esc><esc>", [[<c-\><c-n>]], { desc = "terminal normal mode" })

-- window navigation
map("n", "<leader>wq", "<c-w><c-q>", { desc = "[W]indow Close [Q]uit" })
map("n", "<leader>wv", "<c-w><c-v>", { desc = "[W]indow [V]ert Split" })
map("n", "<leader>ws", "<c-w><c-s>", { desc = "[W]indow [S]plit" })
map("n", "<leader>ww", "<c-w><c-w>", { desc = "Next [W]indow" })

-- tab navigation
map("n", "<leader>tq", "<cmd>tabclose<cr>", { desc = "[T]ab [Q]uit" })
map("n", "<leader>tt", "<cmd>tabnew<cr>", { desc = "New [T]ab" })
map("n", "<leader>tn", "<cmd>tabnext<cr>", { desc = "[T]ab [N]ext" })
map("n", "<leader>tp", "<cmd>tabprev<cr>", { desc = "[T]ab [P]rev" })
map("n", "]t", "<cmd>tabnext<cr>", { desc = "Next [T]ab" })
map("n", "[t", "<cmd>tabprev<cr>", { desc = "Prev [T]ab" })

-- previous or next quickfix list
map("n", "[q", "<cmd>cprevious<cr>", { desc = "Prev [Q]uickfix" })
map("n", "]q", "<cmd>cnext<cr>", { desc = "Next [Q]uickfix" })

-- clear highlight when pressing esc in normal mode
map("n", "<esc>", "<cmd>nohlsearch<cr>", { desc = "clear search highlight" })

-- don't jump around when holding shift
map({ "x", "i", "n" }, "<s-up>", "<up>", { desc = "prevent jumping around" })
map({ "x", "i", "n" }, "<s-down>", "<down>", { desc = "prevent jumping around" })
map({ "x", "i", "n" }, "<s-left>", "<left>", { desc = "prevent jumping around" })
map({ "x", "i", "n" }, "<s-right>", "<right>", { desc = "prevent jumping around" })

-- copy and paste to system keyboard
-- maybe use osc52 clipboard plugin
map("n", "<leader>y", '"+y', { desc = "[Y]ank (motion) to clipboard" })
map("x", "<leader>y", '"+y', { desc = "[Y]ank (selection) to clipboard" })
map("n", "<leader>Y", '"+yg_', { desc = "[Y]ank (to eol) to clipboard" })
map("n", "<leader>yy", '"+yy', { desc = "[Y]ank (whole line) to clipboard" })
map({ "n", "x" }, "<leader>p", '"+p', { desc = "[P]aste from clipboard (below)" })
map({ "n", "x" }, "<leader>P", '"+P', { desc = "[P]aste from clipboard (above)" })

-- tab to indent, reselect if there was a selection
map("n", "<tab>", "V>", { desc = "indent" })
map("n", "<s-tab>", "V<", { desc = "outdent" })
map("x", "<tab>", ">gv", { desc = "indent" })
map("x", "<s-tab>", "<gv", { desc = "outdent" })
map("i", "<s-tab>", "<esc>V<A", { desc = "outdent" })

-- select all text
map("n", "<leader>a", "ggVG", { desc = "Select [A]ll" })
map("x", "<leader>a", "<esc>ggVG", { desc = "Select [A]ll" })

-- cmd left and right act like home and end
-- NOTE: this doesn't work in TUI
map({ "n", "i" }, "<d-right>", "<end>", { desc = "end" })
map({ "n", "i" }, "<d-left>", "<home>", { desc = "home" })

-- make x,X,<del> avoid overwriting registers
map({ "n", "x" }, "x", '"_x', { desc = "prevent overwriting register" })
map({ "n", "x" }, "X", '"_X', { desc = "prevent overwriting register" })
map({ "n", "x" }, "<del>", '"_x', { desc = "prevent overwriting register" })
