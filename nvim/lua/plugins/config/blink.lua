return function()
    require 'blink.cmp'.setup {
        completion = {
            list = { selection = 'auto_insert' },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
                window = {
                    border = 'rounded',
                },
            },

            ghost_text = { enabled = true },

            menu = {
                border = 'rounded',
            },
        },

        keymap = {
            ['<CR>'] = { 'select_and_accept', 'fallback' },
            ['<Tab>'] = { 'select_next', 'fallback' },
            ['<Up>'] = { 'select_next', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_prev', 'fallback' },
            -- ['<Esc>'] = { 'cancel', 'fallback' },

            cmdline = {
                ['<CR>'] = { 'accept', 'fallback' },
            }
        },

        signature = { enabled = true }
    }
end
