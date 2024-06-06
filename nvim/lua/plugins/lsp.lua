return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- inlay_hints = {
      --   enabled = true,
      -- },
      format_notify = false,
      -- LSP Server Settings
      ---@type lspconfig.options
      servers = {
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
            "org",
            "plaintex",
            "rst",
            "rnoweb",
            "tex",
            "pandoc",
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
    opts = {
      keys = {
        {
          -- Customize or remove this keymap to your liking
          "<leader>cF",
          function()
            require("conform").format({ async = true, lsp_fallback = true })
          end,
          mode = "",
          desc = "Format buffer",
        },
      },
      formatters_by_ft = {
        typst = { "typstfmt" },
      },
    },
  },
}
