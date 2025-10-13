return {
	{
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			require("neoscroll").setup({
				easing_function = "quadratic",
				duration_multiplier = 1.5,
				hide_cursor = true,
			})
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
