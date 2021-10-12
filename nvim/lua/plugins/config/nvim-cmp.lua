return function()
    require 'cmp'.setup {
        sources = {
            { name = 'nvim_lsp' },
            { name = 'buffer' },
            { name = 'calc' },
            { name = 'emoji' },
            { name = 'path' },
        },
    }
end
