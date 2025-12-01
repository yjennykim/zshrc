vim.opt.termguicolors = true
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
-- Use system clipboard
vim.opt.clipboard:append("unnamedplus")
-- Horizontal split
vim.api.nvim_set_keymap("n", "<C-w>-", "<C-w>s", { noremap = true, silent = true })
-- Vertical split
vim.api.nvim_set_keymap("n", "<C-w>|", "<C-w>v", { noremap = true, silent = true })
-- :terminal in horizontal split
vim.keymap.set("n", "<C-w>t", ":botright horizontal terminal<CR>")
