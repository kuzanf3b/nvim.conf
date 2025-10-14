return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			presets = {
				bottom_search = true,
				command_palette = true,
			},
		},
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
			notify = true,
			win = {
				border = "rounded",
				no_overlap = true,
				padding = { 1, 2 },
				zindex = 1000,
				wo = { winblend = 10 },
			},
			layout = {
				width = { min = 20, max = 50 },
				spacing = 4,
				align = "left",
			},
			plugins = {
				marks = true,
				registers = true,
				spelling = {
					enabled = true,
					suggestions = 20,
				},
				presets = {
					operators = true,
					motions = true,
					text_objects = true,
					windows = true,
					nav = true,
					z = true,
					g = true,
				},
			},
			icons = {
				breadcrumb = "»",
				separator = "➜",
				group = "+",
				ellipsis = "…",
				mappings = true,
				colors = true,
				keys = {
					Up = " ",
					Down = " ",
					Left = " ",
					Right = " ",
					C = "󰘴 ",
					M = "󰘵 ",
					D = "󰘳 ",
					S = "󰘶 ",
					CR = "󰌑 ",
					Esc = "󱊷 ",
					Space = "󱁐 ",
					Tab = "󰌒 ",
				},
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)

			wk.add({
				{ "<leader>f", group = "Find" },
				{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
				{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
				{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
				{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },

				{ "<leader>l", group = "LSP" },
				{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },

				{ "<leader>d", group = "Diagnostics" },
				{ "<leader>db", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
				{ "<leader>dc", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Current" },

				{ "<leader>r", group = "Recent" },
				{ "<leader>rr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },

				{ "<leader>c", group = "Config" },
				{ "<leader>cl", "<cmd>Lazy<cr>", desc = "Lazy" },
			})
		end,
	},
}
