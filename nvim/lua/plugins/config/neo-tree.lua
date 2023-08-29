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
                hide_by_name = { ".git" },
            },
            use_libuv_file_watcher = true,
        },
    }
end
