local Util = require("lazyvim.util")

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
map("n", "q", ":qa <CR>", opts)
map("n", "w", ":wa <CR>", opts)
map("n", "r", "<C-r>", opts)

-- debug
map("n", "<leader>db", ':lua require("dap").toggle_breakpoint()<CR>', { desc = "Toggle breakpoint" })
map("n", "<leader>do", ':lua require("dap").step_over()<CR>', { desc = "Step over" })
map("n", "<leader>di", ':lua require("dap").step_into()<CR>', { desc = "Step into" })
map("n", "<leader>dc", ':lua require("dap").continue()<CR>', { desc = "Continue" })
map("n", "<leader>dt", ':lua require("dapui").toggle()<CR> :lua require("dap").continue()<CR> ', { desc = "Open DAP" })
map("n", "<leader>dq", ':lua require("dap").close()<CR> :lua require("dapui").toggle()<CR>', { desc = "Close DAP" })

-- semicolon
map("n","<C-S-CR>" ,"$a;<CR>", {desc = "add semi and newline"})
map("i","<C-S-CR>" ,"<C-o>A;<CR>", {desc = "add semi and newline"})

-- cursor movement
map("n","<C-Left>" ,"<S-Left>", {desc = "Move cursor a block left"})
map("n","<C-Right>" ,"<S-Right>", {desc = "Move cursor a block right"})

-- file tree
map("n", "<A-f>", function()
  require("nvim-tree.api").tree.toggle()
end, opts)

-- toggle terminal
map("n", "<C-t>", ":lua require('toggleterm').toggle(1)<CR>", { desc = "Toggle Terminal" })
map("n", "<CS-t>", ":lua require('toggleterm').toggle(2)<CR>", { desc = "Toggle Terminal" })

-- tab switching
map("n", "<A-Left>", ":BufferLineCyclePrev<CR>", opts)
map("n", "<A-Right>", ":BufferLineCycleNext<CR>", opts)

-- git
map("n", "<leader>gq", function()
  require("telescope.builtin").git_commits()
end, { desc = "Commits" })
map("n", "<leader>gw", function()
  require("telescope.builtin").git_bcommits()
end, { desc = "Commits in branch" })
map("n", "<leader>gb", function()
  require("telescope.builtin").git_branches()
end, { desc = "Branches" })
map("n", "<leader>gs", function()
  require("telescope.builtin").git_status()
end, { desc = "Git status" })
map("n", "<leader>gt", function()
  require("telescope.builtin").git_stash()
end, { desc = "Git stash" })
map("n", "<leader>gg", function()
  Util.float_term({ "gitui" }, { cwd = Util.get_root() })
end, { desc = "gitui (root dir)" })
map("n", "<leader>gG", function()
  Util.float_term({ "gitui" })
end, { desc = "gitui (cwd)" })

-- window switching
function _G.set_terminal_maps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<A-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<A-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("n", "<C-t>", function()
    require("toggleterm").toggle(1)
  end, opts)
  vim.keymap.set("i", "<C-t>", function()
    require("toggleterm").toggle(1)
  end, opts)
  vim.keymap.set("i", "<CS-t>", function()
    require("toggleterm").toggle(2)
  end, opts)
  vim.keymap.set("t", "<C-t>", function()
    require("toggleterm").toggle(1)
  end, opts)
  vim.keymap.set("t", "<CS-t>", function()
    require("toggleterm").toggle(2)
  end, opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_maps()")
map("n", "<A-j>", ":wincmd h<CR>", opts)
map("n", "<A-k>", ":wincmd j<CR>", opts)
map("n", "<A-l>", ":wincmd k<CR>", opts)
map("n", "<A-;>", ":wincmd l<CR>", opts)

-- harpoon man
map("n", "<leader>h1", function()
  require("harpoon.ui").nav_file(1)
end, { desc = "First Harpoon File" })
map("n", "<leader>h2", function()
  require("harpoon.ui").nav_file(2)
end, { desc = "Second Harpoon File" })
map("n", "<leader>h3", function()
  require("harpoon.ui").nav_file(3)
end, { desc = "First Harpoon File" })
map("n", "<leader>ha", function()
  require("harpoon.mark").add_file()
end, { desc = "First Harpoon File" })
map("n", "<leader>hd", function()
  require("harpoon.mark").remove_file()
end, { desc = "First Harpoon File" })
map("n", "<leader>hm", ":Telescope harpoon marks<CR>", { noremap = true, silent = true, desc = "Show harpoon marks" })

-- telescope
map("n", "<leader>fb", function()
  require("telescope").extensions.file_browser.file_browser({})
end, { desc = "File Browser" })
map("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end, { desc = "Find Files" })
map("n", "<leader>fg", function()
  Live_grep_from_project_git_root()
end, { desc = "Live Grep (root)" })
map("n", "<leader>fG", function()
  require("telescope.builtin").live_grep()
end, { desc = "Live Grep (cwd)" })
map("n", "<leader>fh", function()
  require("telescope.builtin").help_tags()
end, { desc = "Help" })
map("n", "<leader>fp", function()
  require("telescope").extensions.project.project({})
end, { noremap = true, silent = true, desc = "Projects" })
map("n", "<leader>z", function()
  require("telescope").extensions.zoxide.list({})
end, { desc = "Zoxide" })

-- trouble
map("n", "<leader>t", "<cmd>TroubleToggle<CR>", term_opts)

-- better yank
function Better_yank(opts)
  local current_line = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_command(current_line .. "," .. (opts.count - (current_line - 1)) .. "y")
end

vim.api.nvim_create_user_command("BetterYank", Better_yank, { count = 1 })
map("n", "by", ":BetterYank<CR>", term_opts)

-- better delete
function Better_delete(opts)
  local current_line = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_command(current_line .. "," .. (opts.count - (current_line - 1)) .. "d")
end

vim.api.nvim_create_user_command("BetterDelete", Better_delete, { count = 1 })
map("n", "bd", ":BetterDelete<CR>", term_opts)

-- neovide zoom
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set("n", "<C-+>", function()
  change_scale_factor(1.25)
end)
vim.keymap.set("n", "<C-->", function()
  change_scale_factor(1 / 1.25)
end)

-- neovide paste
vim.g.neovide_input_use_logo = 1
vim.api.nvim_set_keymap("i", "<C-S-V>", "<ESC>p<CR>I", { noremap = true, silent = true })

function Get_git_root()
  local opts = {}
  local function is_git_repo()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
  end

  if is_git_repo() then
    local dot_git_path = vim.fn.finddir(".git", ".;")
    local root = vim.fn.fnamemodify(dot_git_path, ":h")

    opts = {
      cwd = root,
    }
  end

  return opts
end
function Live_grep_from_project_git_root()
  local opts = Get_git_root()

  require("telescope.builtin").live_grep(opts)
end
