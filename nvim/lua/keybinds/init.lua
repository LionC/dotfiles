vim.g.mapleader = ' '

local defaultConfig = {
    mode = "n",
    options = {
        noremap = true,
        silent = true,
    },
}

local function merge(leftTable, rightTable)
    local ret = {}

    for key, value in pairs(leftTable) do
        ret[key] = value
    end

    for key, value in pairs(rightTable) do
        ret[key] = value
    end

    return ret
end

local function applyKeybinds (config, prefix)
    local first = config[1]

    if(type(first) == "table") then
        for _, it in ipairs(config) do
            applyKeybinds(it, prefix)
        end

        return
    end

    local second = config[2]
    local concatenatedPrefix = (prefix or "") .. first

    if(type(second) == "table") then
        applyKeybinds(second, concatenatedPrefix)

        return
    end

    local mode = config.mode or defaultConfig.mode
    local options = config.options and merge(defaultConfig.options, config.options) or defaultConfig.options

    vim.api.nvim_set_keymap(mode, concatenatedPrefix, second, options)
end

applyKeybinds {
    { ";",      ":", options = { silent = false } },
    { ":",      ";" },
    { "<BS>",   "<C-^>" },
    { "gb",     "<C-o>" },
    { "<Esc>",     ":nohl<CR>" },
    { "<C-", {
        { "J>", "<C-W>j" },
        { "K>", "<C-W>k" },
        { "L>", "<C-W>l" },
        { "H>", "<C-W>h" },
        { "p>", ":Telescope find_files<CR>" },
        { "f>", ":Telescope live_grep<CR>" },
        { "n>", ":NvimTreeToggle<CR>" },
        { "s>", ":w<CR>", options = { silent = false } },
    }},
    { "<leader>", {
        { "l", {
            { "c", ":lua vim.lsp.buf.code_action()<CR>" },
            { "r", ":lua vim.lsp.buf.rename()<CR>" },
            { "f", ":lua vim.lsp.buf.formatting_sync()<CR>" },
            { "s", ":lua vim.lsp.buf.signature_help()<CR>" },
        }}
    }},
}

-- " Finding things
-- nnoremap <C-p> <cmd>Telescope find_files<cr>
-- nnoremap <C-f> <cmd>Telescope live_grep<cr>
-- noremap <C-J> <C-W>j
-- nnoremap <C-K> <C-W>k
-- nnoremap <C-L> <C-W>l
-- nnoremap <C-H> <C-W>h
-- " Completion
-- inoremap <silent><expr> <C-Space> compe#complete()
-- inoremap <silent><expr> <CR>      compe#confirm('<CR>')
-- inoremap <silent><expr> <C-e>     compe#close('<C-e>')
-- inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
-- inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

