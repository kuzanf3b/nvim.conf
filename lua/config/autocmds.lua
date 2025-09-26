local autocmd = vim.api.nvim_create_autocmd

-- Disable autoformat khusus file DWM
autocmd("BufWritePre", {
  pattern = { "*.c", "*.h" },
  callback = function(args)
    local fname = vim.api.nvim_buf_get_name(args.buf)
    if
      fname:match("dwm%-dotfiles/dwm/config%.h$")
      or fname:match("dwm%-dotfiles/dwm/config%.def%.h$")
      or fname:match("dwm%-dotfiles/dwm/dwm%.c$")
    then
      vim.b.autoformat = false -- ini yang dibaca oleh conform.nvim
      vim.notify("🚫 Autoformat disabled for " .. vim.fn.fnamemodify(fname, ":t"))
    end
  end,
})

-- Highlight text setelah yank
autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})
