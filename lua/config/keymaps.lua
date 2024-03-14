-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
--#region
--
--
--
-- Disable continuations
local keymap = vim.keymap

keymap.set("n", "<Leader>o", "o<Esc>^Da")
keymap.set("n", "<Leader>O", "O<Esc>^Da")

vim.keymap.set("n", "<leader>w", ":w <CR>")
vim.keymap.set("n", "<leader>q", ":q <CR>")

-- Split window
keymap.set("n", "ss", ":split<Return>")
keymap.set("n", "sv", ":vsplit<Return>")
