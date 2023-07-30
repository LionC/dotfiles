return function()
    local telescope = require 'telescope'
    local themes = require 'telescope'
    telescope.setup {
        defaults = {
            file_ignore_patterns = { '.git/' }
        },
        pickers = {
            find_files = {
                theme = 'dropdown',
                find_command = { 'rg', '--files', '--hidden', '--color', 'never' }
            },
            live_grep = {
                additional_args = { '-u' },
            }
        },
    }
end
