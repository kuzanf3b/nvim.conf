return {
	{
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			local neoscroll = require("neoscroll")

			neoscroll.setup({
				easing = "quadratic",
				hide_cursor = true,
				performance_mode = false,
			})

			local keymap = vim.keymap.set
			local scroll = require("neoscroll").scroll

			keymap({ "n", "v" }, "<C-d>", function() scroll(vim.wo.scroll, true, 100) end, { desc = "Scroll down" })
			keymap({ "n", "v" }, "<C-u>", function() scroll(-vim.wo.scroll, true, 100) end, { desc = "Scroll up" })
			keymap({ "n", "v" }, "<C-f>", function() scroll(vim.api.nvim_win_get_height(0), true, 150) end, { desc = "Page down" })
			keymap({ "n", "v" }, "<C-b>", function() scroll(-vim.api.nvim_win_get_height(0), true, 150) end, { desc = "Page up" })
			keymap({ "n", "v" }, "<A-j>", function() scroll(5, true, 80) end, { desc = "Smooth scroll down" })
			keymap({ "n", "v" }, "<A-k>", function() scroll(-5, true, 80) end, { desc = "Smooth scroll up" })
		end,
	},
	{
		"sphamba/smear-cursor.nvim",
		event = "VeryLazy",
		opts = {
			stiffness = 0.5,
			trailing_stiffness = 0.5,
			matrix_pixel_threshold = 0.5,
		},
		config = function()
			require("smear_cursor").setup({
                smear_length = 12,
				smear_fade = 35,
				cursor_color = "#ea9a97",
				smear_color = "#9ccfd8",
			})
		end,
	},
}
