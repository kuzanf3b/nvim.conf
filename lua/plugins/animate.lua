return {
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
                cursor_color = "#c0caf5",
                smear_color  = "#7aa2f7",
			})
		end,
	},
}
