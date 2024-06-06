-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local options = {
  fileencoding = "utf-8",
  number = true,
  showmode = true,
  termguicolors = true,
  spelllang = "en_us",
  shell = "/usr/bin/fish",
  relativenumber = false,
  scrolloff = 5,
  scrolljump = 5,
  wrap = false,
}
vim.o.guifont = "JetBrainsMono Nerd Font:h14"
vim.g.neovide_refresh_rate_idle = 180
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_hide_mouse_when_typing = true
vim.g.mkdp_browser = "/usr/bin/firefox"
vim.g.mkdp_auto_start = 1
vim.g.autoformat = false
for k, v in pairs(options) do
  vim.opt[k] = v
end
