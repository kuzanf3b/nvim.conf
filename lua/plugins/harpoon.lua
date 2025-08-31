return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2", -- pakai Harpoon v2
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup({})

      -- ============ Keymaps gaya Primeagen ============
      -- Tambah file ke list
      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
      end, { desc = "Harpoon add file" })

      -- Toggle quick menu
      vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Harpoon quick menu" })

      -- Lompat ke slot 1..4 (mirip <C-h/j/k/l>)
      vim.keymap.set("n", "<C-h>", function()
        harpoon:list():select(1)
      end, { desc = "Harpoon to 1" })
      vim.keymap.set("n", "<C-j>", function()
        harpoon:list():select(2)
      end, { desc = "Harpoon to 2" })
      vim.keymap.set("n", "<C-k>", function()
        harpoon:list():select(3)
      end, { desc = "Harpoon to 3" })
      vim.keymap.set("n", "<C-l>", function()
        harpoon:list():select(4)
      end, { desc = "Harpoon to 4" })

      -- Next / Prev file di list
      vim.keymap.set("n", "]h", function()
        harpoon:list():next()
      end, { desc = "Harpoon next" })
      vim.keymap.set("n", "[h", function()
        harpoon:list():prev()
      end, { desc = "Harpoon prev" })

      -- (Opsional) Telescope integration
      pcall(function()
        require("telescope").load_extension("harpoon")
        vim.keymap.set("n", "<leader>th", "<cmd>Telescope harpoon marks<CR>", { desc = "Telescope Harpoon" })
      end)
    end,
  },
}
