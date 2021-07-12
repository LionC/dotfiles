return function ()
    vim.g.nvim_tree_ignore = { '.git', }
    vim.g.nvim_tree_gitignore = 1
    vim.g.nvim_tree_quit_on_open = 1
    vim.g.nvim_tree_add_trailing = 1
    vim.g.nvim_tree_lsp_diagnostics = 1
    vim.g.nvim_tree_update_cwd = 1
    vim.g.nvim_tree_show_icons = {
        git = 1,
        folders = 1,
        files = 1,
        folder_arrows = 1,
    }
    vim.g.nvim_tree_icons = {
        default = '',
        symlink = '',
        git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌"
        },
        folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
        },
        lsp = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    }
end

