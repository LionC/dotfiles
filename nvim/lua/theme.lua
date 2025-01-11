vim.cmd 'colorscheme fluoromachine'

-- dashboard
vim.api.nvim_set_hl(0, "DashboardHeader", { link = "Operator" })

-- Undotree
vim.api.nvim_set_hl(0, "UndoTreeDiffAdded", { link = "DiffAdd" })
vim.api.nvim_set_hl(0, "UndoTreeDiffRemoved", { link = "ErrorMsg" })

-- Transparent Floating Backgrounds
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal", bg = "NONE" })

-- Nvim Notify
vim.api.nvim_set_hl(0, "NotifyERRORBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "NotifyWARNBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "NotifyINFOBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { link = "FloatBorder" })

vim.api.nvim_set_hl(0, "NotifyERRORTitle", { link = "ErrorMsg" })
vim.api.nvim_set_hl(0, "NotifyWARNTitle", { link = "WarningMsg" })
vim.api.nvim_set_hl(0, "NotifyINFOTitle", { link = "FloatTitle" })
vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { link = "FloatTitle" })
vim.api.nvim_set_hl(0, "NotifyTRACETitle", { link = "FloatTitle" })

vim.api.nvim_set_hl(0, "NotifyERRORBody", { link = "FloatNormal" })
vim.api.nvim_set_hl(0, "NotifyWARNBody", { link = "FloatNormal" })
vim.api.nvim_set_hl(0, "NotifyINFOBody", { link = "FloatNormal" })
vim.api.nvim_set_hl(0, "NotifyDEBUGBody", { link = "FloatNormal" })
vim.api.nvim_set_hl(0, "NotifyTRACEBody", { link = "FloatNormal" })
