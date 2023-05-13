local jdtls = require("jdtls")

jdtls.start_or_attach({
  cmd = { "jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "settings.gradle", ".git", "pom.xml" }, { upward = true })[1]),
  init_options = {
    bundles = vim.list_extend(
      {
					-- Mason: java-debug-adapter
					-- stylua: ignore
					vim.fn.glob( "~/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", 1),
      },
      -- Mason: java-test
      -- stylua: ignore
      vim.split(vim.fn.glob("~/.local/share/nvim/mason/packages/java-test/extension/server/*.jar", 1), "\n")
    ),
  },
  on_attach = function()
    jdtls.setup_dap() -- Create new dap adapter for java

    -- nvim-jdtls specific mappings
    vim.keymap.set("n", "<a-o>", jdtls.organize_imports, {})
    vim.keymap.set("n", "crv", jdtls.extract_variable, {})
    vim.keymap.set("v", "crv", jdtls.extract_variable, {})
    vim.keymap.set("n", "crc", jdtls.extract_constant, {})
    vim.keymap.set("v", "crc", jdtls.extract_constant, {})
    vim.keymap.set("v", "crm", jdtls.extract_method, {})

    vim.keymap.set("n", "<leader>df", jdtls.test_class, {})
    vim.keymap.set("n", "<leader>dn", jdtls.test_nearest_method, {})
  end,
})

local dap_status, dap = pcall(require, "dap")
if not dap_status then
  return
end

dap.configurations.java = {
  {
    name = "Launch current file",
    type = "java",
    request = "launch",
    program = "${file}",
  },
}
