return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    config = function()
      local dap = require("dap")

      dap.configurations.typescript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Debug with bun",
          program = "${file}",
          cwd = "${workspaceFolder}",
          runtimeExecutable = "bun",
          sourceMaps = true,
          protocol = "inspector",
          skipFiles = { "<node_internals>/**", "node_modules/**" },
          console = "internalConsole",
        },
      }

      dap.configurations.javascript = dap.configurations.typescript
    end,
  },
}
