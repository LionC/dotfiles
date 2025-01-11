return { 'nvim-neo-tree/neo-tree.nvim',
    dev = true,
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    config = function()
        require 'neo-tree'.setup {
            popup_border_style = 'rounded',
            window = {
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
            },
            sources = { 'filesystem', 'git_status', 'document_symbols' },
        }
    end,
}
