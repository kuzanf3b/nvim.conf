return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "jay-babu/mason-nvim-dap.nvim",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("nvim-dap-virtual-text").setup()
      dapui.setup()

      -- Mason DAP
      require("mason-nvim-dap").setup({
        ensure_installed = {
          "python",
          "node2", -- Debugger untuk Node.js / JS / TS
          "codelldb", -- Debugger untuk C/C++
          "netcoredbg", -- Debugger untuk C#
          "java-debug-adapter",
        },
        automatic_installation = true,
      })

      -- Auto open dap-ui
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Keymaps dasar
      vim.keymap.set("n", "<F5>", dap.continue)
      vim.keymap.set("n", "<F10>", dap.step_over)
      vim.keymap.set("n", "<F11>", dap.step_into)
      vim.keymap.set("n", "<F12>", dap.step_out)
      vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<Leader>B", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end)
      vim.keymap.set("n", "<Leader>dr", dap.repl.open)
      vim.keymap.set("n", "<Leader>dl", dap.run_last)
    end,
  },

  -- Python
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local mason_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(mason_path)
    end,
  },

  -- Java
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
    config = function()
      local jdtls = require("jdtls")
      local mason_path = vim.fn.stdpath("data") .. "/mason"
      local jdtls_path = mason_path .. "/packages/jdtls"
      local config_dir = jdtls_path .. "/config_linux"
      local plugins_dir = jdtls_path .. "/plugins/"
      local launcher = vim.fn.glob(plugins_dir .. "org.eclipse.equinox.launcher_*.jar")

      local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
      local root_dir = require("jdtls.setup").find_root(root_markers)
      local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
      local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

      local config = {
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-Xms1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          "-jar",
          launcher,
          "-configuration",
          config_dir,
          "-data",
          workspace_dir,
        },
        root_dir = root_dir,
        settings = { java = {} },
        init_options = {
          bundles = {
            vim.fn.glob(
              mason_path .. "/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
            ),
          },
        },
      }

      jdtls.start_or_attach(config)
    end,
  },
}
