-- List of all plugins to load, set `config` to `true` to autoload the function provided in plugins/config/<pluginname>
-- according to `pluginIdentifierToFilename` below
local plugins = {
    -- packer itself
    { name = 'wbthomason/packer.nvim', config = false },

    -- dependencies
    { name = 'nvim-lua/popup.nvim', config = false },
    { name = 'kyazdani42/nvim-web-devicons', config = false },
    { name = 'nvim-lua/plenary.nvim', config = false },

    -- fuzzy finding
    { name = 'nvim-telescope/telescope.nvim', config = false },

    -- visuals
    { name = 'famiu/feline.nvim', config = true },
    { name = 'LionC/monokai.nvim', config = true },

    -- parsing
    { name = 'neovim/nvim-lspconfig', config = false },
    { name = 'jose-elias-alvarez/null-ls.nvim', config = false },
    { name = 'nvim-treesitter/nvim-treesitter', config = true },
    { name = 'nvim-treesitter/nvim-treesitter-textobjects', config = false },

    -- editing
    { name = 'RRethy/nvim-treesitter-textsubjects', config = false },
    { name = 'hrsh7th/nvim-compe', config = true },
    { name = 'blackCauldron7/surround.nvim', config = true },

    -- file tree
    { name = 'kyazdani42/nvim-tree.lua', config = true },

    -- snippets
    { name = 'hrsh7th/vim-vsnip', config = false },
    { name = 'hrsh7th/vim-vsnip-integ', config = false },

    { name = 'gennaro-tedesco/nvim-jqx', config = false },
    { name = 'lewis6991/gitsigns.nvim', config = true },

    -- config utils
    { name = 'LionC/nest.nvim', branch = 'release-v1.1' },

    -- TsServer workaround
    { name = 'lbrayner/vim-rzip', config = false },
}

-- Generate short name for plugin to use as filename
local function pluginIdentifierToFilename (identifier)
    return string.match(identifier, '/([^%.]*)%.?.*$')
end

-- Build packer specs
local specs = {}
for i, plugin in ipairs(plugins) do
    specs[i] = { plugin.name }

    if plugin.config then
        local filename = pluginIdentifierToFilename(plugin.name)
        specs[i].config = require('plugins.config.' .. filename)
    end
end

-- Launch packer and call on all specs
require('packer').startup(function(use)
    for _, spec in ipairs(specs) do
        use(spec)
    end
end)

-- Provide specs for use in other files
return specs

