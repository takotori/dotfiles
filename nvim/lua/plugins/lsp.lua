return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, source = "if_many", prefix = "●" },
        severity_sort = true,
      },
      -- inlay_hints = {
      --   enabled = true,
      -- },
      capabilities = {},
      format_notify = false,
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      -- LSP Server Settings
      ---@type lspconfig.options
      servers = {
        cssls = {},
        html = {},
        bashls = {},
        ansiblels = {},
        asm_lsp = {},
        typst_lsp = {
          settings = {
            experimentalFormatterMode = "on",
            exportPdf = "onSave",
          },
        },
        ltex = {
          settings = {
            ltex = {
              checkFrequency = "save",
            },
          },
          filetypes = {
            "bib",
            "gitcommit",
            "markdown",
            "org",
            "plaintex",
            "rst",
            "rnoweb",
            "tex",
            "pandoc",
            "typst",
            "typ",
          },
        },
        sqlls = {},
        taplo = {},
        lemminx = {},
        opencl_ls = {},
        yamlls = {},
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      },
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      local my_keys = require("config.lsp-keymap").get()
      local count = 0
      for _ in pairs(my_keys) do
        keys[#keys + 1] = my_keys[count]
        count = count + 1
      end
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function()
      local opts = {
        formatters_by_ft = {
          lua = { "stylua" },
          fish = { "fish_indent" },
          sh = { "shfmt" },
          typst = { "typstfmt" },
        },
      }
      return opts
    end,
  },
}
