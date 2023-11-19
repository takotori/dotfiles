local M = {}

---@type PluginLspKeys
M._keys = nil

---@return (LazyKeys|{has?:string})[]
function M.get()
  local format = function()
    require("lazyvim.util").format({ force = true })
  end
  if not M._keys then
    ---@class PluginLspKeys
    M._keys = {
      { "<leader>cld", vim.diagnostic.open_float, desc = "Line Diagnostics" },
      { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
      { "<leader>ca", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition", has = "definition" },
      { "<leader>cs", "<cmd>Telescope lsp_references<cr>", desc = "References" },
      { "<leader>cA", vim.lsp.buf.declaration, desc = "Goto Declaration" },
      { "<leader>cf", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto Implementation" },
      { "<leader>cd", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto Type Definition" },
      { "<leader>ce", vim.lsp.buf.hover, desc = "Hover" },
      { "<leader>cw", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
      { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" },
      { "]d", M.diagnostic_goto(true), desc = "Next Diagnostic" },
      { "[d", M.diagnostic_goto(false), desc = "Prev Diagnostic" },
      { "]e", M.diagnostic_goto(true, "ERROR"), desc = "Next Error" },
      { "[e", M.diagnostic_goto(false, "ERROR"), desc = "Prev Error" },
      { "]w", M.diagnostic_goto(true, "WARN"), desc = "Next Warning" },
      { "[w", M.diagnostic_goto(false, "WARN"), desc = "Prev Warning" },
      { "<F4>", format, desc = "Format Range", mode = "v", has = "documentRangeFormatting" },
      { "<leader>cr", ":IncRename ", desc = "Rename", has = "rename" },
      {
        "<leader>cq",
        function()
          vim.lsp.buf.code_action({
            context = {
              only = {
                "quickfix",
                "quickfix.ltex",
                "source",
                "source.fixAll",
                "source.organizeImports",
                "",
              },
            },
          })
        end,
        desc = "Fix",
        mode = { "n", "v" },
        has = "codeAction",
      },
      {
        "<leader>cQ",
        function()
          vim.lsp.buf.code_action({
            context = {
              only = {
                "refactor",
                "refactor.inline",
                "refactor.extract",
                "refactor.rewrite",
              },
            },
          })
        end,
        desc = "Refactor",
        mode = { "n", "v" },
        has = "codeAction",
      },
    }
  end
  return M._keys
end

---@param method string
function M.has(buffer, method)
  method = method:find("/") and method or "textDocument/" .. method
  local clients = require("lazyvim.util").lsp.get_clients({ bufnr = buffer })
  for _, client in ipairs(clients) do
    if client.supports_method(method) then
      return true
    end
  end
  return false
end

---@return (LazyKeys|{has?:string})[]
function M.resolve(buffer)
  local Keys = require("lazy.core.handler.keys")
  if not Keys.resolve then
    return {}
  end
  local spec = M.get()
  local opts = require("lazyvim.util").opts("nvim-lspconfig")
  local clients = require("lazyvim.util").lsp.get_clients({ bufnr = buffer })
  for _, client in ipairs(clients) do
    local maps = opts.servers[client.name] and opts.servers[client.name].keys or {}
    vim.list_extend(spec, maps)
  end
  return Keys.resolve(spec)
end

function M.on_attach(_, buffer)
  local Keys = require("lazy.core.handler.keys")
  local keymaps = M.resolve(buffer)

  for _, keys in pairs(keymaps) do
    if not keys.has or M.has(buffer, keys.has) then
      local opts = Keys.opts(keys)
      opts.has = nil
      opts.silent = opts.silent ~= false
      opts.buffer = buffer
      vim.keymap.set(keys.mode or "n", keys.lhs, keys.rhs, opts)
    end
  end
end

function M.diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

return M
