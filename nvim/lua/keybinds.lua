vim.g.mapleader = ' '

local defaultConfig = {
    mode = "n",
    options = {
        noremap = true,
        silent = true,
    },
    prefix = "",
}

local function copy(table)
    local ret = {}

    for key, value in pairs(table) do
        ret[key] = value
    end

    return ret
end

local function mergeTables(left, right)
    local ret = copy(left)

    for key, value in pairs(right) do
        ret[key] = value
    end

    return ret
end

local function mergeOptions(left, right)
    local ret = copy(left)

    if (right == nil) then
        return ret
    end

    if (right.mode ~= nil) then
        ret.mode = right.mode
    end

    if (right.prefix ~= nil) then
        ret.prefix = ret.prefix .. right.prefix
    end

    if (right.options ~= nil) then
        ret.options = mergeTables(ret.options, right.options)
    end

    return ret
end

local function applyKeybinds (config, presets)
    local presets = presets or defaultConfig
    local mergedPresets = mergeOptions(presets, config)

    local first = config[1]

    if(type(first) == "table") then
        for _, it in ipairs(config) do
            applyKeybinds(it, mergedPresets)
        end

        return
    end

    local second = config[2]

    mergedPresets.prefix = mergedPresets.prefix .. first

    if(type(second) == "table") then
        applyKeybinds(second, mergedPresets)

        return
    end

    vim.api.nvim_set_keymap(
        mergedPresets.mode,
        mergedPresets.prefix,
        second,
        mergedPresets.options
    )
end

applyKeybinds {
    -- Pragmatic command mode
    { ";",      ":", options = { silent = false } },
    { ":",      ";" },

    -- Buffer navigation
    { "<BS>",   "<C-^>" },
    { "gb",     "<C-o>" },

    -- Searching
    { "<Esc>",  ":nohl<CR>" },
    { "/",      "ms/" },
    { "?",      "ms?" },

    { "H",      "^" },
    { "L",      "$" },
    { "0",      "^" },
    { "^",      "0" },

    -- Control mappings
    { "<C-", {
        -- Window navgiation
        { "J>", "<C-W>j" },
        { "K>", "<C-W>k" },
        { "L>", "<C-W>l" },
        { "H>", "<C-W>h" },

        -- Fast access Telescope
        { "p>", ":Telescope find_files<CR>" },
        { "f>", ":Telescope live_grep<CR>" },

        -- File Tree
        { "n>", ":NvimTreeToggle<CR>" },
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
        { "<CR>",       "compe#confirm('<CR'>)" },
        { "<C-Space>",  "compe#complete()" },
    },
}

