local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ╭──────────────────────────────────────────────╮
-- │ Insert Mode                                  │
-- ╰──────────────────────────────────────────────╯
keymap("i", "<C-o>", "<C-r>0", vim.tbl_extend("force", opts, { desc = "Paste last yanked text" }))
keymap("i", "<C-y>", '<C-o>"+yy', vim.tbl_extend("force", opts, { desc = "Yank current line to clipboard" }))
keymap("i", "<C-ff>", '<C-r>=expand("%:p")<CR>', vim.tbl_extend("force", opts, { desc = "Insert full file path" }))
keymap("i", "<C-d>", '<C-r>=strftime("%Y-%m-%d")<CR>', vim.tbl_extend("force", opts, { desc = "Insert current date" }))
keymap("i", "<C-f>", "<C-o>gUiw", vim.tbl_extend("force", opts, { desc = "Capitalize word" }))
-- ╭──────────────────────────────────────────────╮
-- │ Clipboard, Yank, Delete, Paste               │
-- ╰──────────────────────────────────────────────╯
keymap("n", "<leader>ay", 'ggVG"+y', vim.tbl_extend("force", opts, { desc = "Yank entire buffer to system clipboard" }))
keymap("n", "<leader>a", "ggVG", vim.tbl_extend("force", opts, { desc = "Select all" }))
keymap("v", "<leader>y", '"+y', vim.tbl_extend("force", opts, { desc = "Yank selection to system clipboard" }))

keymap("n", "<leader>d", '"_d', vim.tbl_extend("force", opts, { desc = "Delete without copying" }))
keymap("v", "<leader>d", '"_d', vim.tbl_extend("force", opts, { desc = "Delete selection without copying" }))
keymap("n", "db", '"vb_d', vim.tbl_extend("force", opts, { desc = "Delete delete a word backward" }))

keymap("v", "p", '"_dP', vim.tbl_extend("force", opts, { desc = "Paste without yanking" }))



-- ╭──────────────────────────────────────────────╮
-- │ Navigation & Scrolling                       │
-- ╰──────────────────────────────────────────────╯

keymap("n", "<C-d>", "<C-d>zz", vim.tbl_extend("force", opts, { desc = "Scroll down and center" }))
keymap("n", "<C-u>", "<C-u>zz", vim.tbl_extend("force", opts, { desc = "scroll up and center" }))
keymap("n", "wn", "<C-W>w", vim.tbl_extend("force", opts, { desc = "scroll up and center" }))

-- ╭──────────────────────────────────────────────╮
-- │ Splits,tab and Windows                       │
-- ╰──────────────────────────────────────────────╯
keymap("n", "ss", ":vsplit<CR>", vim.tbl_extend("force", opts, { desc = "Vertical split" }))
keymap("n", "vs", ":split<CR>", vim.tbl_extend("force", opts, { desc = "Horizontal split" }))

keymap("n", "<C-h>", "<C-w><C-h>", vim.tbl_extend("force", opts, { desc = "Move focus to left window" }))
keymap("n", "<C-l>", "<C-w><C-l>", vim.tbl_extend("force", opts, { desc = "Move focus to right window" }))
keymap("n", "<C-j>", "<C-w><C-j>", vim.tbl_extend("force", opts, { desc = "Move focus to lower window" }))
keymap("n", "<C-k>", "<C-w><C-k>", vim.tbl_extend("force", opts, { desc = "Move focus to upper window" }))

keymap("n", "<C-Up>", ":resize -2<CR>", vim.tbl_extend("force", opts, { desc = "Decrease height" }))
keymap("n", "<C-Down>", ":resize +2<CR>", vim.tbl_extend("force", opts, { desc = "Increase height" }))
keymap("n", "<C-Left>", ":vertical resize -4<CR>", vim.tbl_extend("force", opts, { desc = "Decrease width" }))
keymap("n", "<C-Right>", ":vertical resize +4<CR>", vim.tbl_extend("force", opts, { desc = "Increase width" }))

keymap("n", "wh", "<C-W>H", vim.tbl_extend("force", opts, { desc = "Move to window left " }))
keymap("n", "wl", "<C-w>L", vim.tbl_extend("force", opts, { desc = "Move to window right " }))
keymap("n", "wj", "<C-w>J", vim.tbl_extend("force", opts, { desc = "Move to window below " }))
keymap("n", "wk", "<C-w>K", vim.tbl_extend("force", opts, { desc = "Move to window above" }))

keymap("n", "wr", "<C-w>w", vim.tbl_extend("force", opts, { desc = "Rotate windows downwards/rightwards" }))

-- tab switching
keymap("n", "te", "tabedit", vim.tbl_extend("force", opts, { desc = "new tab" }))
keymap("n", "<tab>", ":tabnext<CR>", vim.tbl_extend("force", opts, { desc = "Previous tab" }))
keymap("n", "<s-tab>", ":tabprev<CR>", vim.tbl_extend("force", opts, { desc = "Next tab" }))
-- ╭──────────────────────────────────────────────╮
-- │ Motion                                       │
-- ╰──────────────────────────────────────────────╯
keymap("v", "J", ":m '>+1<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selection down" }))
keymap("v", "K", ":m '<-2<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selection up" }))
keymap("n", "<A-j>", ":m .+1<CR>==", vim.tbl_extend("force", opts, { desc = "Move line down" }))
keymap("n", "<A-k>", ":m .-2<CR>==", vim.tbl_extend("force", opts, { desc = "Move line up" }))

keymap("n", "n", "nzzzv", vim.tbl_extend("force", opts, { desc = "Next search result centered and unfolded" }))
keymap("n", "N", "Nzzzv", vim.tbl_extend("force", opts, { desc = "Previous search result centered and unfolded" }))

keymap("n", "}", "}zz", vim.tbl_extend("force", opts, { desc = "Next paragraph and center" }))
keymap("n", "{", "{zz", vim.tbl_extend("force", opts, { desc = "Previous paragraph and center" }))

keymap("n", "<C-d>", "<C-d>zz", vim.tbl_extend("force", opts, { desc = "Scroll half-page down and center" }))
keymap("n", "<C-u>", "<C-u>zz", vim.tbl_extend("force", opts, { desc = "Scroll half-page up and center" }))

-- ╭──────────────────────────────────────────────╮
-- │ Terminal & Diagnostics                       │
-- ╰──────────────────────────────────────────────╯
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", vim.tbl_extend("force", opts, { desc = "Exit terminal mode" }))
keymap("n", "<leader>q", vim.diagnostic.setloclist, vim.tbl_extend("force", opts, { desc = "Open diagnostic list" }))

-- ╭──────────────────────────────────────────────╮
-- │ File & Buffer Management                     │
-- ╰──────────────────────────────────────────────╯
keymap("n", "<leader>e", ":Ex<CR>", vim.tbl_extend("force", opts, { desc = "Open file explorer" }))
keymap("n", "<leader>w", ":w<CR>", vim.tbl_extend("force", opts, { desc = "Save file" }))
keymap("n", "bq", ":bd<CR>", vim.tbl_extend("force", opts, { desc = "Close buffer" }))
keymap("n", "qa", ":qa<CR>", vim.tbl_extend("force", opts, { desc = "Close all buffers" }))
keymap("n", "bp", ":bprevious<CR>", vim.tbl_extend("force", opts, { desc = "Previous buffer" }))
keymap("n", "bn", ":bnext<CR>", vim.tbl_extend("force", opts, { desc = "Next buffer" }))
-- ╭──────────────────────────────────────────────╮
-- │ Toggles                                      │
-- ╰──────────────────────────────────────────────╯
keymap("n", "<leader>rn", function()
  vim.o.relativenumber = not vim.o.relativenumber
end, vim.tbl_extend("force", opts, { desc = "Toggle relative number" }))

-- ╭──────────────────────────────────────────────╮
-- │ Search                                       │
-- ╰──────────────────────────────────────────────╯
keymap("n", "<Esc>", ":nohlsearch<CR>", vim.tbl_extend("force", opts, { desc = "Clear search highlights" }))
