local M = {}

function M.setup()
  -- Path to Lazy.nvim
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

  -- Clone Lazy.nvim if it is not already installed
  if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
        { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
    end
  end

  -- Add Lazy.nvim to runtime path
  vim.opt.rtp:prepend(lazypath)

  -- Configure Lazy.nvim
  require("lazy").setup({
    spec = {
      -- Add LazyVim and import its plugins
      { "LazyVim/LazyVim", import = "lazyvim.plugins" },
      { import = "lazyvim.plugins.extras.lang.typescript" },
      { import = "lazyvim.plugins.extras.lang.clangd" },
      { import = "lazyvim.plugins.extras.lang.json" },
      { import = "lazyvim.plugins.extras.lang.java" },
      { import = "lazyvim.plugins.extras.lang.python" },
      { import = "lazyvim.plugins.extras.lang.tailwind" },
      { import = "lazyvim.plugins.extras.ai.copilot" },
      { import = "lazyvim.plugins.extras.linting.eslint" },
      { import = "lazyvim.plugins.extras.ui.mini-animate" },
      -- Import/override with your custom plugins
      { import = "plugins" },
    },
    defaults = {
      -- By default, only LazyVim plugins will be lazy-loaded.
      -- Your custom plugins will load during startup.
      -- Set this to `true` to have all custom plugins lazy-loaded by default.
      lazy = true,
      -- Always use the latest git commit for plugins
      -- Set `version = "*"` to use the latest stable release for plugins supporting semver.
      version = false,
    },
    install = {
      -- Set the default colorscheme for installation
      colorscheme = { "catppuccin" },
    },
    checker = {
      -- Automatically check for plugin updates periodically
      enabled = true,
      notify = false, -- Do not notify on update
    },
    performance = {
      rtp = {
        -- Disable some default runtime plugins to improve performance
        disabled_plugins = {
          "gzip",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        },
      },
    },
  })
end

return M
