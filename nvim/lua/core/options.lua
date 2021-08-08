local homeFolder = vim.env.HOME

local options = {
    termguicolors = true,
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
    wrap = false,
    lazyredraw = true,
    inccommand = "nosplit",
}

for name, value in pairs(options) do
    vim.api.nvim_set_option(name, value)
end

vim.opt.shortmess:append({ c = true })
vim.cmd('filetype on')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_zip = 1
