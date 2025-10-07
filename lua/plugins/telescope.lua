return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
        local actions = require('telescope.actions')
        local telescope = require('telescope')

        telescope.setup({
            defaults = {
                hidden = true,
                mappings = {
                    i = {
                        ["<C-u>"] = actions.move_selection_previous,
                        ["<C-d>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    }
                }
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                        winblend = 10,
                        previewer = false,
                        layout_config = { width = 0.4, height = 0.3 },
                    }),
                },
            },
        })

        telescope.load_extension("ui-select")

        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
        vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })

        -- Rip grep + Fzf
        vim.keymap.set('n', '<leader>fg', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)

        -- Find instance of current view being included
        vim.keymap.set('n', '<leader>fc', function()
            local filename_without_extension = vim.fn.expand('%:t:r')
            builtin.grep_string({ search = filename_without_extension })
        end, { desc = "Find current file: " })

        -- Grep current string (for when gd doesn't work)
        vim.keymap.set('n', '<leader>fs', function()
            builtin.grep_string({})
        end, { desc = "Find current string: " })

        -- Find files in vim config
        vim.keymap.set('n', '<leader>fi', function()
            builtin.find_files({ cwd = "~/.config/nvim/" })
        end)
    end,
}
