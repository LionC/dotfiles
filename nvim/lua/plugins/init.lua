-- List of all plugins to load, set `config` to `true` to autoload the function provided in plugins/config/<pluginname>
-- according to `pluginIdentifierToFilename` below
local plugins = {
    -- dependencies
    { name = 'nvim-lua/popup.nvim', config = false },
    { name = 'kyazdani42/nvim-web-devicons', config = false },
    { name = 'nvim-lua/plenary.nvim', config = false },

    -- telescope
    { name = 'nvim-telescope/telescope.nvim', config = false },

    -- visuals
    { name = 'tanvirtin/monokai.nvim', config = false },
    { name = 'sunjon/shade.nvim', config = true },
    { name = 'famiu/feline.nvim', config = true },

    -- parsing
    { name = 'neovim/nvim-lspconfig', config = false },
    { name = 'onsails/lspkind-nvim', config = true },
    { name = 'nvim-treesitter/nvim-treesitter', config = true },
    { name = 'nvim-treesitter/nvim-treesitter-textobjects', config = false },
    { name = 'RRethy/nvim-treesitter-textsubjects', config = false },
    { name = 'hrsh7th/nvim-compe', config = true },

    { name = 'kyazdani42/nvim-tree.lua', config = true },

    -- snippets
    { name = 'hrsh7th/vim-vsnip', config = false },
    { name = 'hrsh7th/vim-vsnip-integ', config = false },

    { name = 'b3nj5m1n/kommentary', config = true },
    { name = 'gennaro-tedesco/nvim-jqx', config = false },
    { name = 'lewis6991/gitsigns.nvim', config = true },

    -- keybinds
    { name = "folke/which-key.nvim", config = true },
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

