local opt = vim.api.nvim_set_option
local homeFolder = vim.env.HOME

vim.cmd [[
    if exists('$TMUX')
        " Colors in tmux
        let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
    endif

    set termguicolors
    set background=dark
]]

local settings = {
    -- termguicolors = true,
    tabstop = 4,
    shiftwidth = 4,
    autoread = true,
    mouse = 'a',
    showmode = false,
    undofile = true,
    undodir = homeFolder .. '/.vim/undofiles5',
    expandtab = true,
    number = true,
    relativenumber = true,
    scrolloff = 15,
    cursorline = true,
    ignorecase = true,
    smartcase = true,
    autoread = true,
    ttimeoutlen = 80,
    hidden = true,
    backup = false,
    writebackup = false,
    cmdheight = 1,
    updatetime = 300,
    timeoutlen = 600,
    signcolumn = 'yes',
    completeopt = 'menuone,noselect',
}

for name, value in pairs(settings) do
    vim.api.nvim_set_option(name, value)
end

vim.opt.shortmess:append({ c = true })

