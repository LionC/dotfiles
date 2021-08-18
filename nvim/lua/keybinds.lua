local nest = require('nest')

vim.g.mapleader = ' '

nest.applyKeymaps {
    -- Pragmatic command mode
    { ";",      ":", options = { silent = false } },
    { ":",      ";" },
    { "H",      "^" },
    { "L",      "$" },
    { "0",      "^" },
    { "^",      "0" },

    -- Buffer navigation
    { "<BS>",   "<C-^>" },
    { "gb",     "<C-o>" },

    -- Searching
    { "<Esc>",  "<Cmd>nohl<CR>" },
    { "/",      "ms/" },
    { "?",      "ms?" },

    -- Control mappings
    { "<C-", {
        -- Window navgiation
        { "J>", "<C-W>j" },
        { "K>", "<C-W>k" },
        { "L>", "<C-W>l" },
        { "H>", "<C-W>h" },

        -- Fast access Telescope
        { "p>", "<Cmd>Telescope find_files<CR>" },
        { "f>", "<Cmd>Telescope live_grep<CR>" },

        -- File Tree
        { "n>", "<Cmd>NvimTreeToggle<CR>" },
    }},

    { "<leader>", {
        -- LSP
        { "l", {
            { "c", "<Cmd>lua vim.lsp.buf.code_action()<CR>" },
            { "r", "<Cmd>lua vim.lsp.buf.rename()<CR>" },
            { "f", "<Cmd>lua vim.lsp.buf.formatting_sync()<CR>" },
            { "s", "<Cmd>lua vim.lsp.buf.signature_help()<CR>" },
            { "h", "<Cmd>lua vim.lsp.buf.hover()<CR>" },
        }}
    }},

    { mode = "i", options = { expr = true },
        { "<CR>",       "compe#confirm('<CR>')" },
        { "<C-Space>",  "compe#complete()" },
    },
}




