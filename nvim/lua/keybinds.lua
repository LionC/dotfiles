local nest = require 'nest'
local undotree = require 'undotree'
local arena = require 'arena'
local todos = require 'todo-comments'
local quicker = require 'quicker'

local lsp = vim.lsp.buf

local function cmd(command)
    return '<Cmd>' .. command .. '<CR>'
end

nest.applyKeymaps {
    -- Pragmatic command mode
    { mode = 'vn', {
        { ';', ':',          options = { silent = false } },
        { ':', ';' },
        { 'H', '^' },
        { 'L', '$' },
        { '0', '^' },
        { '^', '0' },
        { 'S', 's<CR><Esc>^' },
        { '/', 'ms/' },
        { '?', 'ms?' },
    } },

    { '[', {
        { 'q', cmd 'cp' },
        { 'h', cmd 'Gitsigns prev_hunk' },
        { 't', todos.jump_next },
    } },
    { ']', {
        { 'q', cmd 'cn' },
        { 'h', cmd 'Gitsigns next_hunk' },
        { 't', todos.jump_prev },
    } },

    -- Buffer navigation
    { '<BS>',  '<C-^>' },
    { 'gb',    '<C-o>' },

    -- Searching
    { '<Esc>', cmd 'nohl' },

    -- Files float
    { '\\',    cmd 'Neotree toggle=true source=filesystem position=float reveal=true reveal_force_cwd=true' },

    -- Control mappings
    { '<C-', {
        -- Window navgiation
        { 'J>', '<C-W>j' },
        { 'K>', '<C-W>k' },
        { 'L>', '<C-W>l' },
        { 'H>', '<C-W>h' },
        -- Fast access Telescope
        { 'p>', cmd 'Telescope find_files' },
        { 'f>', cmd 'Telescope live_grep' },
        -- File Tree
        { 'n>', cmd 'Neotree toggle=true source=filesystem position=left reveal=true reveal_force_cwd=true' },
    } },

    { '<leader>', {
        -- Toggle Quickfix
        { 'q', quicker.toggle },
        -- Open Todos in Quickfix
        { 't', cmd 'TodoQuickFix' },
        -- Go to Dashboard
        { 'd', cmd 'Dashboard' },
        -- Open doit
        { 'k', require 'doit'.toggle },
        -- Arena Buffers
        { 'b', arena.toggle },
        -- LSP
        { 'l', {
            { 'd', vim.diagnostic.open_float },
            { 'c', lsp.code_action },
            { 'r', lsp.rename },
            { 's', lsp.signature_help },
            { 'h', lsp.hover },
        } },
        -- Telescope
        { 'f', {
            { 'r', cmd 'Telescope resume' },
            { 's', cmd 'Telescope lsp_document_symbols' },
            { 'o', cmd 'Telescope oldfiles' },
            { 'j', cmd 'Telescope jumplist' },
            { 'p', cmd 'Telescope builtin' },
            { 't', cmd 'TodoTelescope' },
        } },
        -- Neotree
        { 'n', {
            { 'f', cmd 'Neotree toggle=true source=filesystem position=float reveal=true reveal_force_cwd=true' },
            { 'g', cmd 'Neotree toggle=true source=git_status position=float reveal=true reveal_force_cwd=true' },
            { 'b', cmd 'Neotree toggle=true source=buffers position=float reveal=true reveal_force_cwd=true' },
            { 's', cmd 'Neotree toggle=true source=document_symbols position=left reveal=true' },
        } },
        -- Undotree
        { 'u', undotree.toggle },
    } },
}
