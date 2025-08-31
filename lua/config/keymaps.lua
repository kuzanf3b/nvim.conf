-- KEYBINDS

vim.g.mapleader = " "

-- paste and don't replace clipboard over deleted text
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- add binds for Control J/K to scroll thru quickfix list
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")

-- list
vim.keymap.set("n", "<leader>cc", "<cmd>!php-cs-fixer fix % --using-cache=no<cr>")

-- yank into clipboard even if on ssh
vim.keymap.set("n", "<leader>y", "<Plug>OSCYankOperator")
vim.keymap.set("v", "<leader>y", "<Plug>OSCYankVisual")
