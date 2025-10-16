return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	branch = "master",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				prompt_prefix = "  ",
				selection_caret = " ",
				path_display = { "truncate" },
				layout_strategy = "flex",
				layout_config = {
					prompt_position = "top",
					horizontal = { preview_width = 0.55 },
					vertical = { mirror = false },
				},
				sorting_strategy = "ascending",
				file_ignore_patterns = { "node_modules", "%.git/", "venv/", "build/" },
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-q>"] = function(...)
							actions.send_selected_to_qflist(...)
							actions.open_qflist(...)
						end,
						["<Esc>"] = actions.close,
					},
				},
			},

			pickers = {
				find_files = {
					hidden = true,
					previewer = true,
				},
				live_grep = {
					additional_args = function(_)
						return { "--hidden" }
					end,
				},
			},

			extensions = {
				["ui-select"] = require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = true,
					layout_config = { width = 0.4, height = 0.3 },
				}),
			},
		})

		-- 🔌 Load extensions safely
		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "ui-select")

		-- 🔑 Keymaps
		local map = vim.keymap.set
		map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		map("n", "<leader>fo", builtin.oldfiles, { desc = "Recent files" })
		map("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
		map("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
		map("n", "<leader>fq", builtin.quickfix, { desc = "Quickfix list" })
		map("n", "<leader>fg", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "Live grep (manual input)" })

		map("n", "<leader>fc", function()
			local filename = vim.fn.expand("%:t:r")
			builtin.grep_string({ search = filename })
		end, { desc = "Find current file name across project" })

		map("n", "<leader>fs", builtin.grep_string, { desc = "Find current word" })
		map("n", "<leader>fi", function()
			builtin.find_files({ cwd = vim.fn.expand("~/.config/nvim/") })
		end, { desc = "Find in Neovim config" })

		map("n", "<leader>fd", function()
			local ok = pcall(builtin.diagnostics)
			if not ok then
				vim.notify("Telescope: failed to open diagnostics (invalid buffer id)", vim.log.levels.WARN)
			end
		end, { desc = "Diagnostics (safe)" })

		map("n", "<leader>f/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "Search in current buffer" })
	end,
}
