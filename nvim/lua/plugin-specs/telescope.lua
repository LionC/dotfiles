return {
    { 'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            "nvim-tree/nvim-web-devicons",
            'nvim-treesitter/nvim-treesitter',
        },
        event = 'BufEnter',
        config = function()
            local telescope = require 'telescope'
            local themes    = require 'telescope.themes'

            telescope.setup {
                defaults = {
                    file_ignore_patterns = { '.git/' },
                },
                pickers = {
                    find_files = themes.get_dropdown {
                        prompt_prefix = '   ',
                        find_command = { 'rg', '--files', '--hidden', '--color', 'never' },
                        previewer = false,
                        prompt_title = false,
                        layout_config = {
                            width = function(_, max_columns, _)
                                return math.min(max_columns, 120)
                            end,
                            height = function(_, _, max_lines)
                                return math.min(max_lines, 40)
                            end,
                        },
                    },
                    live_grep = {
                        prompt_prefix = '   ',
                        additional_args = { '--hidden' },
                    }
                },
            }
        end
    },
}
