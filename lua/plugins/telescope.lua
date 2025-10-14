return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				hidden = true,
				mappings = {
					i = {
						["<C-u>"] = actions.move_selection_previous,
						["<C-d>"] = actions.move_selection_next,
						["<C-q>"] = function(...)
							actions.send_selected_to_qflist(...)
							actions.open_qflist(...)
						end,
					},
				},
			},
			extensions = {
				["ui-select"] = require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
					layout_config = { width = 0.4, height = 0.3 },
				}),
			},
		})

		telescope.load_extension("ui-select")

		-- 🔍 Keymaps
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Recent files" })
		vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Quickfix list" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })

		-- 🔎 Grep string manually
		vim.keymap.set("n", "<leader>fg", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "Live grep input" })

		-- 🔍 Cari instance nama file sekarang di seluruh proyek
		vim.keymap.set("n", "<leader>fc", function()
			local filename_without_extension = vim.fn.expand("%:t:r")
			builtin.grep_string({ search = filename_without_extension })
		end, { desc = "Find current file name" })

		-- 🔍 Grep kata di bawah kursor
		vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Find current string" })

		-- ⚙️ Cari file di config Neovim
		vim.keymap.set("n", "<leader>fi", function()
			builtin.find_files({ cwd = vim.fn.expand("~/.config/nvim/") })
		end, { desc = "Find in nvim config" })

		-- 🩹 Fix Telescope diagnostics error (Invalid buffer id)
		vim.keymap.set("n", "<leader>fd", function()
			local ok, _ = pcall(builtin.diagnostics, {})
			if not ok then
				vim.notify("Telescope: failed to open diagnostics (invalid buffer id)", vim.log.levels.WARN)
			end
		end, { desc = "Diagnostics (safe)" })
	end,
}
