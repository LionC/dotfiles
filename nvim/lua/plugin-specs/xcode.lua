local progress_handle = nil

return {
    'wojciech-kulik/xcodebuild.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim',
        'MunifTanjim/nui.nvim',
        'nvim-neo-tree/neo-tree.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    event = 'VeryLazy',
    opts = {
        show_build_progress_bar = false,
        logs = {
            notify = function(message, severity)
                local fidget = require('fidget')
                if progress_handle then
                    progress_handle.message = message
                    if not message:find('Loading') then
                        progress_handle:finish()
                        progress_handle = nil
                        if vim.trim(message) ~= '' then
                            fidget.notify(message, severity)
                        end
                    end
                else
                    fidget.notify(message, severity)
                end
            end,
            notify_progress = function(message)
                local progress = require('fidget.progress')

                if progress_handle then
                    progress_handle.title = ''
                    progress_handle.message = message
                else
                    progress_handle = progress.handle.create({
                        message = message,
                        lsp_client = { name = 'xcodebuild.nvim' },
                    })
                end
            end,
        },
        integrations = {
            oil_nvim = {
                enabled = false,
            },
            quick = {
                enabled = false,
            },
        },
    },
}
