-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "harpoon",
  callback = function()
    vim.opt.cursorline = true
    vim.opt.winblend = 100
  end,
})

vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#82aaff", bg = "NONE" })
