local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require 'lazy'.setup {
    -- Lazy itself
    'LazyVim/LazyVim',
    -- dependencies
    'nvim-lua/popup.nvim',
    -- fuzzy finding
    { 'nvim-telescope/telescope.nvim', config = require 'plugins.config.telescope', dependencies = {
        'nvim-lua/plenary.nvim',
        "nvim-tree/nvim-web-devicons",
        'nvim-treesitter/nvim-treesitter',
    } },
    { 'nvim-telescope/telescope-ui-select.nvim', config = function() require 'telescope'.load_extension 'ui-select' end, dependencies = {
        'nvim-telescope/telescope.nvim'
    } },
    -- visuals
    { 'maxmx03/fluoromachine.nvim',      config = require 'plugins.config.fluoromachine' },
    { 'feline-nvim/feline.nvim', config = require 'plugins.config.feline', dependencies = {
        "nvim-tree/nvim-web-devicons",
        'lewis6991/gitsigns.nvim'
    } },
    { 'j-hui/fidget.nvim', opts = {
        progress = {
            display = {
                done_ttl = 1.2,
                progress_style = "Comment",
                group_style = "Comment",
                icon_style = "Comment",
                done_style = "Comment",
            },
        },
        notification = {
            window = {
                winblend = 0,
            },
        },
    } },
    { 'glepnir/dashboard-nvim', config = require 'plugins.config.dashboard', dependencies = {
        "nvim-tree/nvim-web-devicons",
        'lewis6991/gitsigns.nvim'
    } },
    -- parsing & lsp
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
    { 'nvim-treesitter/nvim-treesitter', config = require 'plugins.config.treesitter' },
    { 'nvim-treesitter/nvim-treesitter-textobjects', dependencies = {
        'nvim-treesitter/nvim-treesitter',
    } },
    'gennaro-tedesco/nvim-jqx',
    { 'lewis6991/gitsigns.nvim', config = require 'plugins.config.gitsigns' },
    { 'williamboman/mason.nvim', config = require 'plugins.config.mason' },
    -- editing
    { 'jiaoshijie/undotree', dependencies = 'nvim-lua/plenary.nvim', opts = {
        window = {
            winblend = 0,
        },
    } },
    { 'RRethy/nvim-treesitter-textsubjects', after = 'nvim-treesitter' },
    { 'saghen/blink.cmp',                    config = require 'plugins.config.blink' },
    { 'onsails/lspkind.nvim' },
    { 'kylechui/nvim-surround', config = require 'plugins.config.surround', dependencies = {
        'RRethy/nvim-treesitter-textsubjects',
        'nvim-treesitter/nvim-treesitter',
    } },
    -- files
    { 'nvim-neo-tree/neo-tree.nvim', branch = 'v3.x', config = require 'plugins.config.neo-tree', dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    } },
    -- config utils
    'LionC/nest.nvim',
}
