return function()
    local dashboard = require 'dashboard'

    dashboard.setup {
        config = {
            header ={
                '                                          /$$              ',
                '                                         |__/              ',
                ' /$$$$$$$   /$$$$$$   /$$$$$$  /$$    /$$ /$$ /$$$$$$/$$$$ ',
                '| $$__  $$ /$$__  $$ /$$__  $$|  $$  /$$/| $$| $$_  $$_  $$',
                '| $$  \\ $$| $$$$$$$$| $$  \\ $$ \\  $$/$$/ | $$| $$ \\ $$ \\ $$',
                '| $$  | $$| $$_____/| $$  | $$  \\  $$$/  | $$| $$ | $$ | $$',
                '| $$  | $$|  $$$$$$$|  $$$$$$/   \\  $/   | $$| $$ | $$ | $$',
                '|__/  |__/ \\_______/ \\______/     \\_/    |__/|__/ |__/ |__/',
                '',
                '',

            },
            shortcut = {
                {
                    desc = ' Files',
                    group = 'Label',
                    action = 'Telescope find_files',
                    key = 'f',
                },
            },
            packages = { enable = false },
            project = { enable = false },
            footer = {
                '',
                'NVIM v' .. vim.version().major .. '.' .. vim.version().minor .. '.' .. vim.version().patch
            }
        }
    }
end
