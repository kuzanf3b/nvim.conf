return {
  -- Formatter
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "isort", "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier", "stylelint" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        go = { "gofmt" },
        rust = { "rustfmt" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        cs = { "csharpier" },
      },
      format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = true,
      },
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" },
        },
      },
    },
    config = function(_, opts)
      local conform = require("conform")

      local exclude_dwm = { "config.def.h", "config.h", "dwm.c" }

      conform.setup(vim.tbl_extend("force", opts, {
        format_on_save = function(bufnr)
          local name = vim.api.nvim_buf_get_name(bufnr)
          for _, f in ipairs(exclude_dwm) do
            if name:match(f .. "$") then
              return nil
            end
          end
          return { timeout_ms = 3000, lsp_fallback = true }
        end,
      }))
    end,
  },

  -- Linter
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "flake8" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        css = { "stylelint" },
        json = { "jsonlint" },
        yaml = { "yamllint" },
        markdown = { "markdownlint" },
        lua = { "luacheck" },
        sh = { "shellcheck" },
        bash = { "shellcheck" },
        go = { "golangcilint" },
        rust = { "clippy" },
        c = { "clangtidy" },
      },
    },
  },
}
