return {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
        suggestion = {
            enabled = true,
            auto_trigger = true,
            hide_during_completion = false,
            debounce = 75,
            keymap = {
                accept = '<Right>',
                -- accept_word = false,
                -- accept_line = false,
                -- next = "<M-]>",
                -- prev = "<M-[>",
                -- dismiss = "<C-]>",
            },
        },
    },
}
