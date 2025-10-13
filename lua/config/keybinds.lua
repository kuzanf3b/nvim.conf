-- KEYBINDS
vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

local opts = { noremap = true, silent = true }

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- paste and don't replace clipboard over deleted text
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- sometimes in insert mode, control-c doesn't exactly work like escape
vim.keymap.set("i", "<C-c>", "<Esc>", opts)

-- scroll thru quickfix list
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz", opts)
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz", opts)

-- What the heck is Ex mode?
vim.keymap.set("n", "Q", "<nop>", opts)

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", opts)

-- getting Alex off my back :)
vim.keymap.set("n", "<leader>dg", "<cmd>DogeGenerate<cr>", opts)

-- lint / format php files for LC
vim.keymap.set("n", "<leader>cc", "<cmd>!php-cs-fixer fix % --using-cache=no<cr>")

-- Replace whatever is under cursor (on line)
vim.keymap.set("n", "<leader>s", [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

-- make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- yank into clipboard even if on ssh
vim.keymap.set('n', '<leader>y', '<Plug>OSCYankOperator', opts)
vim.keymap.set('v', '<leader>y', '<Plug>OSCYankVisual', opts)

-- reload without exiting vim
vim.keymap.set("n", "<leader>rl", "<cmd>source ~/.config/nvim/init.lua<cr>")

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Open Lazy
vim.keymap.set("n", "<leader>l", vim.cmd.Lazy)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Quickfix list stuff
vim.keymap.set("n", "<leader>cl", ":cclose<CR>", { silent = true })
vim.keymap.set("n", "<leader>co", ":copen<CR>", { silent = true })
vim.keymap.set("n", "<leader>cn", ":cnext<CR>zz")
vim.keymap.set("n", "<leader>cp", ":cprev<CR>zz")
vim.keymap.set("n", "<leader>li", ":checkhealth vim.lsp<CR>", { desc = "LSP Info" })

-- source file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
