return function ()
    vim.g.nvim_tree_add_trailing = 1
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

    require 'nvim-tree'.setup {
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
        filters = {
            custom = { '.git', },
        },
        -- hijack the cursor in the tree to put it at the start of the filename
        hijack_cursor = true,
        -- show lsp diagnostics in the signcolumn
        diagnostics = {
            enable = false,
        },
        -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
        update_focused_file = {
          -- enables the feature
          enable = true,
        },

        git = {
            ignore = true,
        },
    }
end

