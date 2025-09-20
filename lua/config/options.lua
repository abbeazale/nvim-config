-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Line numbers: absolute only (disable relative)
vim.opt.number = true
vim.opt.relativenumber = false

-- Ask to save instead of failing on :q with unsaved changes
vim.o.confirm = true

-- Keep more lines above/below cursor for better context
vim.o.scrolloff = 10

-- Better whitespace visualization
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Enable Nerd Font support (set based on your terminal font)
vim.g.have_nerd_font = true
