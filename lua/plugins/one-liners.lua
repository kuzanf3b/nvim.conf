return {
  { -- PHP/HTML indentation support
    "captbaritone/better-indent-support-for-php-with-html",
  },

  { -- Clipboard integration (OS copy)
    "ojroques/vim-oscyank",
    ft = { "php", "javascript", "html" }, -- hanya aktif di file tertentu
  },

  { -- Generate docblocks
    "kkoomen/vim-doge",
    build = ":call doge#install()",
  },

  { -- Git integration
    "tpope/vim-fugitive",
    cmd = { "Git", "G" }, -- lazy load saat menjalankan perintah Git
  },

  { -- Undo history
    "mbbill/undotree",
    cmd = "UndotreeToggle", -- lazy load saat toggle undotree
  },

  { -- Show CSS colors inline
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup({})
    end,
  },
}
