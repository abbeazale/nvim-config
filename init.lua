-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy").setup()
--require("catppuccin").setup()
--
vim.keymap.set("n", "]e", vim.diagnostic.goto_next, { desc = "go to the next diagnostic message" })

vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, { desc = "go to the previous diagnostic message" })
