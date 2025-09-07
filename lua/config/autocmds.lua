local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
  pattern = "config.h",
  callback = function()
    vim.b.autoformat = false
  end,
})

autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})
