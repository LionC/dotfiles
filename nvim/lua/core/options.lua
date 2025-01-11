local homeFolder = vim.env.HOME

vim.g.mapleader = ' '

local options = {
    autoread = true,
    backup = false,
    cmdheight = 1,
    completeopt = { 'menuone', 'noselect' },
    cursorline = true,
    expandtab = true,
    hidden = true,
    ignorecase = true,
    inccommand = 'nosplit',
    lazyredraw = true,
    mouse = 'a',
    number = true,
    relativenumber = true,
    scrolloff = 15,
    shiftwidth = 4,
    showmode = false,
    signcolumn = 'yes',
    smartcase = true,
    tabstop = 4,
    termguicolors = true,
    timeoutlen = 600,
    ttimeoutlen = 80,
    undodir = homeFolder .. '/.vim/undofiles5',
    undofile = true,
    updatetime = 300,
    wrap = false,
    writebackup = false,
}

for name, value in pairs(options) do
    vim.opt[name] = value
end

vim.opt.shortmess:append { c = true }

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_zip = 1
