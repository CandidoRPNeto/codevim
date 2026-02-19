return {
  {
    "mfussenegger/nvim-dap",
    dependencies = { "nvim-neotest/nvim-nio" },
    config = function()
      local path = vim.fn.stdpath("data") .. "/mason/packages/"

      local function get_rust_debug_adapter()
        if vim.fn.executable("lldb-vscode") == 1 then
          return "lldb-vscode"
        end
        for _, adapter in ipairs(vim.fn.glob(path .. "codelldb/*/adapter/codelldb", true, true)) do
          if vim.fn.executable(adapter) == 1 then
            return adapter
          end
        end
        return nil
      end

      local dap = require("dap")

      dap.adapters.node2 = {
        type = "executable",
        command = "node",
        args = { path .. "node-debug2-adapter/out/src/nodeDebug2Adapter.js" },
      }

      dap.configurations.javascript = {
        {
          type = "node2",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "node2",
          request = "attach",
          name = "Attach",
          port = 9229,
          restart = true,
          skipFiles = { "<node_internals>/**" },
        },
      }

      dap.configurations.typescript = {
        {
          type = "node2",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
          runtimeExecutable = "ts-node",
        },
      }

      local rust_adapter = get_rust_debug_adapter()
      if rust_adapter then
        dap.adapters.lldb = {
          type = "executable",
          command = rust_adapter,
          name = "lldb",
        }

        dap.configurations.rust = {
          {
            name = "Launch",
            type = "lldb",
            request = "launch",
            program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            runInTerminal = true,
          },
        }
      end

      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { path .. "php-debug-adapter/extension/out/phpDebug.js" },
      }

      dap.configurations.php = {
        {
          name = "Launch PHP",
          type = "php",
          request = "launch",
          program = "${file}",
          cwd = "${fileDirname}",
          port = 9003,
        },
        {
          name = "Listen for Xdebug",
          type = "php",
          request = "launch",
          port = 9003,
          pathMappings = {
            ["/var/www/html"] = "${workspaceFolder}",
            ["/app"] = "${workspaceFolder}",
            ["/home/candido/projects"] = "${workspaceFolder}",
          },
        },
      }
    end,
  },
}
