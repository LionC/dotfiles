return function()
    require 'neo-tree'.setup {
        window = {
            mappings = {
                ["<space>"] = { "toggle_node", nowait = true },
            },
        },
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
            },
            use_libuv_file_watcher = true,
        },
    }
end
