return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle NeoTree" },
		{ "<leader>ge", "<cmd>Neotree source=git_status toggle<CR>", desc = "Git Explorer" },
		{ "<leader>be", "<cmd>Neotree source=buffers toggle<CR>", desc = "Buffer Explorer" },
	},
	opts = {
		sources = { "filesystem", "buffers", "git_status" },
		close_if_last_window = true,
		popup_border_style = "rounded",
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = true,
			},
		},
		window = {
			position = "left",
			width = 35,
			mappings = {
				["l"] = "open",
				["h"] = "close_node",
				["Y"] = {
					function(state)
						local node = state.tree:get_node()
						vim.fn.setreg("+", node:get_id(), "c")
					end,
					desc = "Copy Path",
				},
				["O"] = {
					function(state)
						vim.fn.jobstart({ "xdg-open", state.tree:get_node().path }, { detach = true })
					end,
					desc = "Open in System",
				},
			},
		},
		default_component_configs = {
			indent = {
				with_expanders = true,
				expander_collapsed = "",
				expander_expanded = "",
			},
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "",
			},
			git_status = {
				symbols = {
					unstaged = "󰄱",
					staged = "󰱒",
					added = "✚",
					deleted = "",
				},
			},
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)
	end,
}
