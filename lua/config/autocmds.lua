local autocmd = vim.api.nvim_create_autocmd

-- Disable autoformat untuk file penting dwm
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.c", "*.h" },
  callback = function(args)
    local fname = vim.api.nvim_buf_get_name(args.buf)
    if
      fname:match("/home/kuzan/dwm%-dotfiles/dwm/config%.h$")
      or fname:match("/home/kuzan/dwm%-dotfiles/dwm/config%.def%.h$")
      or fname:match("/home/kuzan/dwm%-dotfiles/dwm/dwm%.c$")
    then
      -- Disable conform.nvim autoformat
      vim.b[args.buf].disable_autoformat = true
      vim.notify("Autoformat disabled for " .. vim.fn.fnamemodify(fname, ":t"))
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
