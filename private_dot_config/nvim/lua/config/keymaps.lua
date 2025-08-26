-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.g.mapleader = " "

-- vim.keymap.set("n", "<C-t>", "")
vim.keymap.set("n", "<C-1>", ":cd ~/.config <CR>")
vim.keymap.set("n", "<C-2>", ":cd ~/projects/ <CR>")
vim.keymap.set("n", "<leader-p>", ":+p")
vim.keymap.set("v", "<leader-y>", ":+y")
-- vim.keymap.set("v", "<leader-w>", ":w")
