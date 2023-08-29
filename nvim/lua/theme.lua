vim.cmd 'colorscheme monokai_pro'

vim.api.nvim_set_hl(0, "CmpItemKindVariable", { link = "Identifier" })
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { link = "Function" })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "Function" })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "Type" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { link = "Keyword" })
vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "String" })

--vim.cmd [[
    --highlight link NeoTreeTitleBar NormalFloat
--]]
