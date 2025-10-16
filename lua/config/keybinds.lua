-- KEYBINDS
vim.g.mapleader = " "
local opts = { noremap = true, silent = true }
local map = vim.keymap
local tble = vim.tbl_extend

--  MOVE LINES
map.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected down" })
map.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected up" })

--  SMOOTHER NAVIGATION
map.set("n", "J", "mzJ`z", tble("force", opts, { desc = "Join lines" }))
map.set("n", "<C-d>", "<C-d>zz", tble("force", opts, { desc = "Scroll down" }))
map.set("n", "<C-u>", "<C-u>zz", tble("force", opts, { desc = "Scroll up" }))
map.set("n", "n", "nzzzv", tble("force", opts, { desc = "Next search result" }))
map.set("n", "N", "Nzzzv", tble("force", opts, { desc = "Prev search result" }))

--  PASTE & DELETE WITHOUT OVERWRITING CLIPBOARD
map.set("x", "<leader>p", [["_dP]], { desc = "Paste keep buf" })
map.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete keep buf" })

--  INSERT MODE
map.set("i", "<C-c>", "<Esc>", tble("force", opts, { desc = "Exit insert mode" }))

--  QUICKFIX NAVIGATION
map.set("n", "<C-j>", "<cmd>cnext<CR>zz", tble("force", opts, { desc = "Next quickfix" }))
map.set("n", "<C-k>", "<cmd>cprev<CR>zz", tble("force", opts, { desc = "Previous quickfix" }))

--  DISABLE EX MODE
map.set("n", "Q", "<nop>", tble("force", opts, { desc = "Disable Ex mode" }))

--  LOCATION LIST NAVIGATION
map.set("n", "<leader>k", "<cmd>lnext<CR>zz", tble("force", opts, { desc = "Next location list" }))
map.set("n", "<leader>j", "<cmd>lprev<CR>zz", tble("force", opts, { desc = "Previous location list" }))

--  DOGE DOCGEN
map.set("n", "<leader>dg", "<cmd>DogeGenerate<cr>", tble("force", opts, { desc = "Generate documentation" }))

--  PHP FIXER
map.set("n", "<leader>cc", "<cmd>!php-cs-fixer fix % --using-cache=no<cr>", { desc = "Run PHP-CS-Fixer" })

--  SUBSTITUTE UNDER CURSOR
map.set("n", "<leader>s", [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = "Replace word under cursor" })

--  PERMISSIONS
map.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Chmod +x" })

--  CLIPBOARD (OSC52)
map.set("n", "<leader>y", "<Plug>OSCYankOperator", { desc = "Yank to clipboard" })
map.set("v", "<leader>y", "<Plug>OSCYankVisual", { desc = "Yank selection to clipboard" })

--  RELOAD NVIM
map.set("n", "<leader>rl", "<cmd>source ~/.config/nvim/init.lua<cr>", { desc = "Reload Neovim config" })

--  UNDO TREE
map.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })

--  LAZY PLUGIN MANAGER
map.set("n", "<leader>l", vim.cmd.Lazy, { desc = "Lazy" })

--  INDENT BEHAVIOR
map.set("v", "<", "<gv", tble("force", opts, { desc = "Decrease indent and stay" }))
map.set("v", ">", ">gv", tble("force", opts, { desc = "Increase indent and stay" }))

--  QUICKFIX CONTROL
map.set("n", "<leader>cl", ":cclose<CR>", { silent = true, desc = "Close quickfix" })
map.set("n", "<leader>co", ":copen<CR>", { silent = true, desc = "Open quickfix" })
map.set("n", "<leader>cn", ":cnext<CR>zz", { desc = "Next quickfix" })
map.set("n", "<leader>cp", ":cprev<CR>zz", { desc = "Prev quickfix" })

--  LSP CHECK
map.set("n", "<leader>li", ":checkhealth vim.lsp<CR>", { desc = "LSP info" })
