return function ()
    vim.g.kommentary_create_default_mappings = false
    -- vim.api.nvim_set_keymap("n", "<leader>cc", "<Plug>kommentary_line_default", {})
    -- vim.api.nvim_set_keymap("n", "<C-/>", "<Plug>kommentary_motion_default", {})
    vim.api.nvim_set_keymap("v", "<C-/>", "<Plug>kommentary_visual_default", {})
end

