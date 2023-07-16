require('packer').startup(function(use)
    -- packer itself
    use 'wbthomason/packer.nvim'
    -- dependencies
    use 'nvim-lua/popup.nvim'
    -- fuzzy finding
    use { 'nvim-telescope/telescope.nvim', config = require 'plugins.config.telescope', requires = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
        'nvim-treesitter/nvim-treesitter',
    }}
    -- visuals
    use { 'LionC/monokai.nvim', config = require 'plugins.config.monokai'  }
    use { 'feline-nvim/feline.nvim', config = require 'plugins.config.feline', requires = {
        'kyazdani42/nvim-web-devicons',
        'lewis6991/gitsigns.nvim'
    }}
    use { 'rcarriga/nvim-notify', config = require 'plugins.config.notify'  }
    use { 'glepnir/dashboard-nvim', config = require 'plugins.config.dashboard', requires = {
        'kyazdani42/nvim-web-devicons'
    }}
    -- parsing & lsp
    use 'neovim/nvim-lspconfig'
    use 'jose-elias-alvarez/null-ls.nvim'
    use { 'nvim-treesitter/nvim-treesitter', config = require 'plugins.config.treesitter' }
    use { 'nvim-treesitter/nvim-treesitter-textobjects', requires = {
        'nvim-treesitter/nvim-treesitter',
    }}
    use { 'jose-elias-alvarez/typescript.nvim', requires = {
        'neovim/nvim-lspconfig',
    }}
    use 'gennaro-tedesco/nvim-jqx'
    use { 'lewis6991/gitsigns.nvim', config = require 'plugins.config.gitsigns'  }
    -- editing
    use { 'RRethy/nvim-treesitter-textsubjects', after = 'nvim-treesitter' }
    use { 'hrsh7th/nvim-cmp', config = require 'plugins.config.cmp', requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-emoji',
        'hrsh7th/cmp-vsnip',
        { 'hrsh7th/vim-vsnip-integ', requires = {
            'hrsh7th/vim-vsnip',
            'neovim/nvim-lspconfig',
        }},
    }}
    use { 'kylechui/nvim-surround', config = require 'plugins.config.surround', requires = {
        'RRethy/nvim-treesitter-textsubjects',
        'nvim-treesitter/nvim-treesitter',
    }}
    -- files
    use { 'nvim-neo-tree/neo-tree.nvim', branch = 'v3.x', config = require 'plugins.config.neo-tree', requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    }}
    -- config utils
    use 'LionC/nest.nvim'
end)

