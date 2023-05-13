return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = function() return {} end,
    config = function(opts)
      require("telescope").setup(opts)
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    opts = {
      autochdir = true,
    },
  },
  {
    "brenoprata10/nvim-highlight-colors",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function(_, _)
      require("nvim-highlight-colors").setup({
        enable_tailwind = true,
      })
      vim.cmd(":hi clear CursorLine")
      vim.cmd(":hi clear CursorLineFold")
      vim.cmd(":hi clear CursorLineSign")
    end,
  },
  {
    "gpanders/editorconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    lazy = true,
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    event = { "BufReadPre", "BufNewFile" },
    lazy = true,
  },
  {
    "ThePrimeagen/harpoon",
    lazy = true,
    config = function()
      require("telescope").load_extension("harpoon")
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    event = "FileType markdown",
    build = "cd app && yarn install",
  },
  {
    "nvim-telescope/telescope-project.nvim",
    lazy = true,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = true,
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },
  {
    "jvgrootveld/telescope-zoxide",
    lazy = true,
    config = function()
      local z_utils = require("telescope._extensions.zoxide.utils")
      local t = require("telescope")
      -- Configure the extension
      t.setup({
        extensions = {
          zoxide = {
            prompt_title = "[ Queries ]",
            mappings = {
              default = {
                after_action = function(selection)
                  print("Update to (" .. selection.z_score .. ") " .. selection.path)
                end,
              },
              ["<C-s>"] = {
                before_action = function(selection)
                  print("before C-s")
                end,
                action = function(selection)
                  vim.cmd("edit " .. selection.path)
                end,
              },
              ["<C-q>"] = { action = z_utils.create_basic_command("split") },
            },
          },
        },
      })

      -- Load the extension
      t.load_extension("zoxide")
    end,
  },
  {
    "lervag/vimtex",
    config = function()
      -- require("vimtex").setup()
      vim.cmd("let g:vimtex_quickfix_mode=0")
      vim.cmd("let g:vimtex_view_general_viewer = 'evince'")
      vim.cmd("let g:vimtex_compiler_method = 'latexmk'")
      vim.cmd(
        "let g:vimtex_compiler_latexmk = {'options': ['-pdf', '-shell-escape', '-file-line-error', '--extra-mem-bot=10000000', '-synctex=1', '-interaction=nonstopmode',],}"
      )
    end,
  },
  {
    "echasnovski/mini.ai",
    diabled = true,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      top_down = false,
    },
  },
  {
    "jbyuki/instant.nvim",
    config = function()
      vim.cmd("let g:instant_username = 'dashie'")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },
    },
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
      local t = {}
      t["<A-l>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
      t["<A-k>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
      t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450" } }
      t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450" } }
      t["<C-y>"] = { "scroll", { "-0.10", "false", "100" } }
      t["<C-e>"] = { "scroll", { "0.10", "false", "100" } }
      t["zt"] = { "zt", { "250" } }
      t["zz"] = { "zz", { "250" } }
      t["zb"] = { "zb", { "250" } }

      require("neoscroll.config").set_mappings(t)
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    lazy = true,
    event = "FileType rust",
    dependencies = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
    opts = function()
      local extension_path = vim.env.HOME .. "/.local/share/nvim/mason/packages/codelldb/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
      return {
        dap = { adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path) },
      }
    end,
  },
  {
    "kaarmu/typst.vim",
    lazy = true,
    event = "FileType typst",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["gz"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>w"] = { name = "+windows" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
        ["<leader>h"] = { name = "+harpoon" },
        ["<leader>d"] = { name = "+DAP" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },
}
