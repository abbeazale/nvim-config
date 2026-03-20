return {
  "folke/noice.nvim",
  opts = function(_, opts)
    opts = opts or {}
    opts.cmdline = opts.cmdline or {}
    opts.cmdline.format = opts.cmdline.format or {}
    opts.cmdline.format.cmdline = opts.cmdline.format.cmdline or {}

    -- Neovim 0.11.4 + the current vim Treesitter query/parser combination can
    -- crash when Noice highlights `:` commands as Vimscript.
    opts.cmdline.format.cmdline.lang = false
  end,
}
