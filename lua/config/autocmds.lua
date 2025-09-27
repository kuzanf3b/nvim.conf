local autocmd = vim.api.nvim_create_autocmd

-- Disable autoformat khusus file DWM, dmenu, slock, dwmblocks
autocmd("BufWritePre", {
  pattern = { "*.c", "*.h" },
  callback = function(args)
    local fname = vim.api.nvim_buf_get_name(args.buf)

    -- Daftar regex untuk menonaktifkan autoformat
    local disabled_files = {
      "dwm%-dotfiles/dwm/config%.h$",
      "dwm%-dotfiles/dwm/config%.def%.h$",
      "dwm%-dotfiles/dwm/dwm%.c$",
      "dwm%-dotfiles/dmenu/config%.h$",
      "dwm%-dotfiles/dmenu/config%.def%.h$",
      "dwm%-dotfiles/dmenu/dmenu%.c$",
      "dwm%-dotfiles/slock/config%.h$",
      "dwm%-dotfiles/slock/config%.def%.h$",
      "dwm%-dotfiles/slock/slock%.c$",
      "dwm%-dotfiles/dwmblocks/blocks%.h$",
      "dwm%-dotfiles/dwmblocks/blocks%.def%.h$",
      "dwm%-dotfiles/dwmblocks/dwmblocks%.c$",
    }

    for _, pattern in ipairs(disabled_files) do
      if fname:match(pattern) then
        vim.b.autoformat = false
        vim.notify("🚫 Autoformat disabled for " .. vim.fn.fnamemodify(fname, ":t"))
        break
      end
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
