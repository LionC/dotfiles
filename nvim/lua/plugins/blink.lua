return {
    'saghen/blink.cmp',
    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        completion = {
            list = {
                selection = function(ctx)
                    return ctx.mode == "cmdline" and "auto_insert" or "preselect"
                end,
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 250,
                window = {
                    border = 'rounded',
                    winhighlight = "Normal:Normal,FloatBorder:None,CursorLine:BlinkCmpDocCursorLine,Search:None",
                },
            },

            ghost_text = { enabled = true },

            menu = {
                auto_show = function(ctx)
                    if ctx.mode ~= 'cmdline' then
                        return true
                    end

                    return false
                end,
                border = 'rounded',
                winhighlight = "Normal:Normal,FloatBorder:None,CursorLine:BlinkCmpDocCursorLine,Search:None",
                scrollbar = false,
                draw = {
                    columns = {
                        { "kind_icon", "label", gap = 1 },
                        { "kind" },
                    },
                },
            },
        },

        keymap = {
            ['<CR>'] = { 'select_and_accept', 'fallback' },
            ['<Tab>'] = { 'select_next', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'fallback' },
            ['<Up>'] = { 'select_prev', 'fallback' },
            -- ['<Esc>'] = { 'cancel', 'fallback' },

            cmdline = {
                ['<Tab>'] = { 'show', 'select_next', 'fallback' },
                ['<CR>'] = { 'accept', 'fallback' },
                ['<Down>'] = { 'select_next', 'fallback' },
                ['<S-Tab>'] = { 'select_prev', 'fallback' },
                ['<Up>'] = { 'select_prev', 'fallback' },
            }
        },

        signature = { enabled = true }
    }
}
