local conf = require("telescope.config").values
local themes = require("telescope.themes")

local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	local opts = themes.get_ivy({
		prompt_title = "Harpoon Files",
	})

	require("telescope.pickers")
		.new(opts, {
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer(opts),
			sorter = conf.generic_sorter(opts),
		})
		:find()
end

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/which-key.nvim",
	},
	config = function()
		local harpoon = require("harpoon")

		local wk = require("which-key")
		wk.add({
			{ "<leader>h", group = "Harpoon" },
			{
				"<leader>ha",
				function()
					harpoon:list():add()
				end,
				desc = "Add file",
			},
			{
				"<leader>hl",
				function()
					toggle_telescope(harpoon:list())
				end,
				desc = "List files (Telescope)",
			},
			{
				"<leader>hm",
				function()
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "Menu UI",
			},
			{
				"<leader>hp",
				function()
					harpoon:list():prev()
				end,
				desc = "Prev file",
			},
			{
				"<leader>hn",
				function()
					harpoon:list():next()
				end,
				desc = "Next file",
			},
			{
				"<leader>hr",
				function()
					harpoon:list():remove()
				end,
				desc = "Remove current file",
			},
			{
				"<leader>hc",
				function()
					harpoon:list():clear()
					vim.notify("Harpoon list cleared!", vim.log.levels.INFO)
				end,
				desc = "Clear list",
			},
		})

		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon quick menu" })
	end,
}
