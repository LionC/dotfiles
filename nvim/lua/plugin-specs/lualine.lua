return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'maxmx03/fluoromachine.nvim',
    },
    opts = {
        theme = 'fluoromachine',
        sections = {
            lualine_x = { "filetype" },
        },
    },
}
