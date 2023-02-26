-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- gitui
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys

  ---@cast keys LazyKeysHandler

  -- do not create the map if a lazy keys handler exists

  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}

    opts.silent = opts.silent ~= false

    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

map("n", "<leader>gg", function()
  Util.float_term({ "gitui" }, { cwd = Util.get_root() })
end, { desc = "gitui (root dir)" })

map("n", "<leader>gG", function()
  Util.float_term({ "gitui" })
end, { desc = "gitui (cwd)" })
