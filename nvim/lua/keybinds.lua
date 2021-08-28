local nest = require('nest')

vim.g.mapleader = ' '

nest.applyKeymaps {
    -- Pragmatic command mode
    { mode = 'vn', {
        { ';',      ':', options = { silent = false } },
        { ':',      ';' },
        { 'H',      '^' },
        { 'L',      '$' },
        { '0',      '^' },
        { '^',      '0' },
        { 'S',      's<CR><Esc>^' },
        { '/',      'ms/' },
        { '?',      'ms?' },
    }},

    -- Buffer navigation
    { '<BS>',   '<C-^>' },
    { 'gb',     '<C-o>' },

    -- Searching
    { '<Esc>',  '<Cmd>nohl<CR>' },

    -- Control mappings
    { '<C-', {
        -- Window navgiation
        { 'J>', '<C-W>j' },
        { 'K>', '<C-W>k' },
        { 'L>', '<C-W>l' },
        { 'H>', '<C-W>h' },

        -- Fast access Telescope
        { 'p>', '<Cmd>Telescope find_files<CR>' },
        { 'f>', '<Cmd>Telescope live_grep<CR>' },

        -- File Tree
        { 'n>', '<Cmd>NvimTreeToggle<CR>' },
    }},

    { '<leader>', {
        -- LSP
        { 'l', {
            { 'c', vim.lsp.buf.code_action },
            { 'd', vim.lsp.diagnostic.show_line_diagnostics },
            { 'r', vim.lsp.buf.rename },
            { 'f', vim.lsp.buf.formatting_sync },
            { 's', vim.lsp.buf.signature_help },
            { 'h', vim.lsp.buf.hover },
        }}
    }},

    { mode = 'i', options = { expr = true },
        { '<CR>',       'compe#confirm("<CR>")' },
        { '<C-Space>',  'compe#complete()' },
    },
}




