return {
  -- Add C# to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "c_sharp" } },
  },

  -- Configure LSP for C#
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = {
          -- Enable organizing imports on format
          organize_imports_on_format = true,
          -- Enable import completion
          enable_import_completion = true,
          -- Roslyn extensions options
          enable_roslyn_analyzers = true,
          enable_editorconfig_support = true,
        },
      },
    },
  },

  -- DAP configuration for C# debugging
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = { ensure_installed = { "netcoredbg" } },
      },
    },
    opts = function()
      local dap = require("dap")
      if not dap.adapters.coreclr then
        dap.adapters.coreclr = {
          type = "executable",
          command = "netcoredbg",
          args = { "--interpreter=vscode" },
        }
      end

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = function()
            return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
          end,
        },
      }
    end,
  },

  -- Additional tools
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "csharpier" } },
  },
}
