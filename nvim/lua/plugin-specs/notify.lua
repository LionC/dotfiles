return { 'rcarriga/nvim-notify',
    config = function()
        local notify = require 'notify'

        vim.notify = notify

        notify.setup {
            render = 'simple',
            fps = 60,
            timeout = 3000,
            stages = 'slide',
        }
    end,
}
