return {
	{
		"smoka7/multicursors.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvimtools/hydra.nvim",
		},
		opts = {},
		cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
		keys = {
			{
				mode = { "v", "n" },
				"<leader>m",
				"<cmd>MCstart<cr>",
				desc = "Create multicursor selection (normal/visual)",
			},
		},
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash jump",
			},
		},
	},

	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	{
		-- TODO:
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			colors = {
				error = { "DiagnosticError", "ErrorMsg", "#f7768e" },
				warning = { "DiagnosticWarn", "WarningMsg", "#e0af68" },
				info = { "DiagnosticInfo", "#7aa2f7" },
				hint = { "DiagnosticHint", "#7dcfff" },
				default = { "Identifier", "#bb9af7" },
				test = { "Identifier", "#9ece6a" },
			},
		},
		config = function(_, opts)
			require("todo-comments").setup(opts)

			vim.keymap.set("n", "]t", function()
				require("todo-comments").jump_next()
			end, { desc = "Next todo comment" })

			vim.keymap.set("n", "[t", function()
				require("todo-comments").jump_prev()
			end, { desc = "Previous todo comment" })
		end,
	},
}
