local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ╭──────────────────────────────────────────────╮
-- │ Insert Mode                                  │
-- ╰──────────────────────────────────────────────╯
keymap("i", "<C-o>", "<C-r>0", vim.tbl_extend("force", opts, { desc = "Paste last yanked text" }))
keymap("i", "<C-y>", '<C-o>"+yy', vim.tbl_extend("force", opts, { desc = "Yank current line to clipboard" }))
keymap("i", "<C-ff>", '<C-r>=expand("%:p")<CR>', vim.tbl_extend("force", opts, { desc = "Insert full file path" }))
keymap("i", "<C-d>", '<C-r>=strftime("%Y-%m-%d")<CR>', vim.tbl_extend("force", opts, { desc = "Insert current date" }))

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

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- ╭──────────────────────────────────────────────╮
-- │ Navigation & Scrolling                       │
-- ╰──────────────────────────────────────────────╯

keymap("n", "<C-d>", "<C-d>zz", vim.tbl_extend("force", opts, { desc = "Scroll down and center" }))
keymap("n", "<C-u>", "<C-u>zz", vim.tbl_extend("force", opts, { desc = "Scroll up and center" }))

-- ╭──────────────────────────────────────────────╮
-- │ Splits,tab and Windows                       │
-- ╰──────────────────────────────────────────────╯
keymap("n", "ss", ":vsplit<CR>", vim.tbl_extend("force", opts, { desc = "Vertical split" }))
keymap("n", "vs", ":split<CR>", vim.tbl_extend("force", opts, { desc = "Horizontal split" }))

keymap("n", "<C-h>", "<C-w><C-h>", vim.tbl_extend("force", opts, { desc = "Move to left window" }))
keymap("n", "<C-l>", "<C-w><C-l>", vim.tbl_extend("force", opts, { desc = "Move to right window" }))
keymap("n", "<C-j>", "<C-w><C-j>", vim.tbl_extend("force", opts, { desc = "Move to lower window" }))
keymap("n", "<C-k>", "<C-w><C-k>", vim.tbl_extend("force", opts, { desc = "Move to upper window" }))

keymap("n", "<C-Up>", ":resize -2<CR>", vim.tbl_extend("force", opts, { desc = "Decrease height" }))
keymap("n", "<C-Down>", ":resize +2<CR>", vim.tbl_extend("force", opts, { desc = "Increase height" }))
keymap("n", "<C-Left>", ":vertical resize -4<CR>", vim.tbl_extend("force", opts, { desc = "Decrease width" }))
keymap("n", "<C-Right>", ":vertical resize +4<CR>", vim.tbl_extend("force", opts, { desc = "Increase width" }))

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
keymap("n", "<leader>bq", ":bd<CR>", vim.tbl_extend("force", opts, { desc = "Close buffer" }))

-- Buffer switching
keymap("n", "<S-l>", ":bnext<CR>", vim.tbl_extend("force", opts, { desc = "Next buffer" }))
keymap("n", "<S-h>", ":bprevious<CR>", vim.tbl_extend("force", opts, { desc = "Previous buffer" }))

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
