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
                { icon = ' ', '@variable', desc = 'Files', group = 'Warning', action = 'Telescope find_files', key = 'f', },
                --{ desc = '󰊳 Update', group = 'Warning', action = 'Lazy update', key = 'u' },
            },
            packages = { enable = true },
            project = { enable = false },
            footer = {
                '',
                'NVIM v' .. vim.version().major .. '.' .. vim.version().minor .. '.' .. vim.version().patch
            }
        }
    }
end
