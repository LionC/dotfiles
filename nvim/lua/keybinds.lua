local nest = require 'nest'
local playground = require 'playground'

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

    { ']q', ':<Cmd>cn<CR>' },
    { '[q', ':<Cmd>cp<CR>' },

    -- Buffer navigation
    { '<BS>',   '<C-^>' },
    { 'gb',     '<C-o>' },

    -- Searching
    { '<Esc>',  '<Cmd>nohl<CR>' },

    -- Files float
    { '\\', '<Cmd>:Neotree toggle=true source=filesystem position=float reveal=true reveal_force_cwd=true<CR>' },

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
        { 'n>', '<Cmd>:Neotree toggle=true source=filesystem position=left reveal=true reveal_force_cwd=true<CR>' },
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
        -- Telescope
        { 'f', {
            { 'r', '<Cmd>Telescope resume<CR>' },
            { 's', '<Cmd>Telescope lsp_document_symbols<CR>' },
            { 'o', '<Cmd>Telescope oldfiles<CR>' },
            { 'j', '<Cmd>Telescope jumplist<CR>' },
            { 'p', '<Cmd>Telescope builtin<CR>' },
        }},
        -- Neotree
        { 'n', {
            { 'f', '<Cmd>:Neotree toggle=true source=filesystem position=float reveal=true reveal_force_cwd=true<CR>' },
            { 'g', '<Cmd>:Neotree toggle=true source=git_status position=float reveal=true reveal_force_cwd=true<CR>' },
            { 'b', '<Cmd>:Neotree toggle=true source=buffers position=float reveal=true reveal_force_cwd=true<CR>' },
        }},
        -- Playground
        { 'p', playground.print_node_crumbs },
    }},
}

