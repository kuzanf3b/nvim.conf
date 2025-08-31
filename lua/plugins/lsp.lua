return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {},
        cssls = {},
        tailwindcss = {},
        emmet_ls = {},
        pyright = {},
        tsserver = {},
        clangd = {},
        omnisharp = {
          cmd = { "omnisharp" },
        },
      },
    },
  },
}
