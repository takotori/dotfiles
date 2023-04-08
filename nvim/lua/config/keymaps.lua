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

-- general
map("n", "q", ":q <CR>", opts)
map("n", "w", ":w <CR>", opts)
map("n", "r", "<C-r>", opts)

-- code
map("n", "<leader>d", ":Telescope lsp_definitions<CR>", { desc = "Jump to definition" })
map("n", "<leader>u", ":Telescope lsp_references<CR>", { desc = "Jump to usage" })
map("n", "<leader>r", ":lua vim.lsp.buf.rename()<CR>", { desc = "Rename all" })

-- file tree
map("n", "t", ":lua require('nvim-tree.api').tree.toggle()<CR>", term_opts)

-- search
map("n", "f", "/", term_opts)
map("n", "m", "N", opts)
map("n", "fp", ":lua require('telescope').extensions.file_browser.file_browser{}<CR>", opts)
map("n", "fa", ":lua require('telescope.builtin').find_files()<CR>", opts)
map("n", "fg", ":lua require('telescope.builtin').live_grep()<CR>", {})

-- tab switching
map("n", "<A-Left>", ":BufferLineCyclePrev<CR>", opts)
map("n", "<A-Right>", ":BufferLineCycleNext<CR>", opts)
map("n", "<A-q>", "<cmd>tabclose<CR>", opts) -- no worki

map("n", "<leader>gg", function()
  Util.float_term({ "gitui" }, { cwd = Util.get_root() })
end, { desc = "gitui (root dir)" })

map("n", "<leader>gG", function()
  Util.float_term({ "gitui" })
end, { desc = "gitui (cwd)" })
