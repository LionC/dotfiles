return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    opts = {
        popup_border_style = 'rounded',
        window = {
            position = 'float',
            mappings = {
                ['<space>'] = { 'toggle_node', nowait = true },
            },
        },
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
                hide_by_name = { '.git' },
            },
            use_libuv_file_watcher = true,
            group_empty_dirs = true,
        },
        sources = { 'filesystem', 'git_status', 'document_symbols' },
        default_component_configs = {
            indent = {
                indent_size = 3,
                with_markers = false,
            },
            file_size = {
                enabled = false,
            },
            type = {
                enabled = false,
            },
            last_modified = {
                enabled = false,
            },
            created = {
                enabled = false,
            },
        },
    },
}
