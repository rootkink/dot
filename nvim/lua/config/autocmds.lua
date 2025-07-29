
-- Highlight on yank
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.cmd("wincmd L")
    vim.cmd("vertical resize 80")
  end,
})
