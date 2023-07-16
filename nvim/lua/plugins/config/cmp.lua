return function ()
    local lspkind = require 'lspkind'
    local cmp = require 'cmp'
    local bordered = cmp.config.window.bordered()

    cmp.setup {
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        window = {
            completion = bordered,
            documentation = bordered,
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ['<Tab>'] = cmp.mapping.select_next_item(),
            ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        }),
        performance = {
            debounce = 30,
            throttle = 15,
            max_view_entries = 20,
        },
        sources = cmp.config.sources(
            {
                { name = 'nvim_lsp', max_item_count = 10 },
                { name = 'nvim_lsp_signature_help' },
            },
            {
                { name = 'path', priority = 2 },
                { name = 'emoji', priority = 1 },
                { name = 'buffer', priority = 0 },
            }
        ),
        formatting = {
            format = lspkind.cmp_format {
                mode = 'symbol_text',
                maxwidth = 50,
                ellipsis_char = '...',
            }
        },
        experimental = { ghost_text = true },
    }
end
