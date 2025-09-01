return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        direction = "float",
      })

      -- Run file dengan <leader>r
      vim.keymap.set("n", "<leader>r", function()
        local ft = vim.bo.filetype
        local cmd = ""

        if ft == "python" then
          cmd = "python3 " .. vim.fn.expand("%")
        elseif ft == "javascript" then
          cmd = "node " .. vim.fn.expand("%")
        elseif ft == "cpp" then
          cmd = "g++ -std=c++17 " .. vim.fn.expand("%") .. " -o /tmp/a.out && /tmp/a.out"
        elseif ft == "c" then
          cmd = "gcc " .. vim.fn.expand("%") .. " -o /tmp/a.out && /tmp/a.out"
        elseif ft == "cs" then
          cmd = "dotnet run"
        elseif ft == "java" then
          cmd = "javac " .. vim.fn.expand("%") .. " && java " .. vim.fn.expand("%:r")
        elseif ft == "html" or ft == "css" then
          cmd = "live-server ."
        end

        require("toggleterm.terminal").Terminal
          :new({ cmd = cmd, hidden = false, direction = "float", close_on_exit = false })
          :toggle()
      end, { desc = "Run current file" })
    end,
  },
}
