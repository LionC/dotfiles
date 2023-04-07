local nest = require('nest')

local lsp = vim.lsp.buf

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
            { 'd', vim.diagnostic.open_float },
            { 'c', lsp.code_action },
            { 'r', lsp.rename },
            { 's', lsp.signature_help },
            { 'h', lsp.hover },
        }},
        { 'f', {
            { 'r', '<Cmd>Telescope resume<CR>' },
            { 's', '<Cmd>Telescope lsp_document_symbols<CR>' },
            { 'o', '<Cmd>Telescope oldfiles<CR>' },
            { 'j', '<Cmd>Telescope jumplist<CR>' },
            { 'p', '<Cmd>Telescope builtin<CR>' },
        }},
    }},

    { mode = 'i', options = { expr = true },
        { '<CR>',       'compe#confirm("<CR>")' },
        { '<C-Space>',  'compe#complete()' },
    },
}

