return {
    'rcarriga/nvim-notify',
    config = function()
        local notify = require 'notify'

        vim.notify = notify

        notify.setup {
            render = 'simple',
            fps = 60,
            timeout = 3000,
            stages = 'slide',
            on_open = function(win)
                vim.api.nvim_win_set_config(win, { zindex = 100 })
            end,
        }
    end,
}
