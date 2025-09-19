return {
  {
    "barrett-ruth/live-server.nvim",
    build = "npm install -g live-server",
    config = function()
      require("live-server").setup({
        args = { "--browser=flatpak run app.zen_browser.zen" },
      })

      -- Keymaps
      vim.keymap.set("n", "<leader>ls", "<cmd>LiveServerStart<cr>", { desc = "Start Live Server" })
      vim.keymap.set("n", "<leader>lS", "<cmd>LiveServerStop<cr>", { desc = "Stop Live Server" })
    end,
  },
}
