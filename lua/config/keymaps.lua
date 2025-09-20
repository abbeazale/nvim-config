-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Diagnostic navigation
vim.keymap.set("n", "]e", vim.diagnostic.goto_next, { desc = "go to the next diagnostic message" })
vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, { desc = "go to the previous diagnostic message" })

-- Clear search highlights on Escape (useful feature from kickstart)
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Open diagnostic quickfix list
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Better terminal mode escape
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
