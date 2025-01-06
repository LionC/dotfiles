return { 'stevearc/quicker.nvim', opts = {
    keys = {
        { ">", "<cmd>lua require('quicker').toggle_expand()<CR>", desc = "Expand quickfix content" },
    },
    edit = {
        -- Enable editing the quickfix like a normal buffer
        enabled = false,
        -- Set to true to write buffers after applying edits.
        -- Set to "unmodified" to only write unmodified buffers.
        -- autosave = "unmodified",
    },
}}
