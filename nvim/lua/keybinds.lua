local nest = require 'nest'
local undotree = require 'undotree'
local arena = require 'arena'
local todos = require 'todo-comments'
local quicker = require 'quicker'

local lsp = vim.lsp.buf

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

    { '[', {
        { 'q', '<Cmd>cp<CR>' },
        { 'h', '<Cmd>Gitsigns prev_hunk<CR>' },
        { 't', todos.jump_next },
    }},
    { ']', {
        { 'q', '<Cmd>cn<CR>' },
        { 'h', '<Cmd>Gitsigns next_hunk<CR>' },
        { 't', todos.jump_prev },
    }},

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
        -- Toggle Quickfix
        { 'q', quicker.toggle },
        -- Open Todos in Quickfix
        { 't', '<Cmd>TodoQuickFix<CR>'},
        -- Arena Buffers
        { 'b', arena.toggle },
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
            { 't', '<Cmd>TodoTelescope<CR>'},
        }},
        -- Neotree
        { 'n', {
            { 'f', '<Cmd>:Neotree toggle=true source=filesystem position=float reveal=true reveal_force_cwd=true<CR>' },
            { 'g', '<Cmd>:Neotree toggle=true source=git_status position=float reveal=true reveal_force_cwd=true<CR>' },
            { 'b', '<Cmd>:Neotree toggle=true source=buffers position=float reveal=true reveal_force_cwd=true<CR>' },
        }},
        -- Undotree
        { 'u', undotree.toggle },
    }},
}

