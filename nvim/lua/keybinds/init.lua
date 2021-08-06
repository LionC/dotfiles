vim.g.mapleader = ' '

local defaultConfig = {
    mode = "n",
    options = {
        noremap = true,
        silent = true,
    },
}

local function applyKeybinds (config, prefix)
    local first = config[1]

    if(type(first) == "table") then
        for _, it in ipairs(config) do
            applyKeybinds(it)
        end

        return
    end

    local second = config[2]

    if(type(second) == "table") then
        applyKeybinds(second, (prefix or "") .. first)

        return
    end

    local mode = config.mode or defaultConfig.mode
    local options = config.options or defaultConfig.options

    vim.api.nvim_set_keymap(mode, first, second, options)
end

applyKeybinds {
    { ";", ":", options = { noremap = true } },
    { ":", ";" },
    { "<BS>", "<C-^>" },
    { "gb", "<C-o>" },
}

-- " Finding things
-- nnoremap <C-p> <cmd>Telescope find_files<cr>
-- nnoremap <C-f> <cmd>Telescope live_grep<cr>
-- noremap <C-J> <C-W>j
-- nnoremap <C-K> <C-W>k
-- nnoremap <C-L> <C-W>l
-- nnoremap <C-H> <C-W>h
-- vnoremap <leader>c "+y
-- vnoremap <leader>y "+y
-- nnoremap <leader>yy "+yy
-- nnoremap <leader>p "+p
-- vnoremap <leader>p "+p
-- vnoremap <leader>x "+d
-- nnoremap <silent> <Esc> :nohl<CR>
-- " Completion
-- inoremap <silent><expr> <C-Space> compe#complete()
-- inoremap <silent><expr> <CR>      compe#confirm('<CR>')
-- inoremap <silent><expr> <C-e>     compe#close('<C-e>')
-- inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
-- inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

