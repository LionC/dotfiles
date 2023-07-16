local M = {}

M.node_crumbs = function (node, crumbs)
    local parent = node:parent()

    if parent == nil then
        return crumbs
    end

    local nodeType = node:type()

    if crumbs == nil then
        return M.node_crumbs(parent, nodeType)
    end

    local newCrumbs =  nodeType .. " > " .. crumbs

    return M.node_crumbs(parent, newCrumbs)
end

M.print_node_crumbs = function ()
    vim.print(
        M.node_crumbs(vim.treesitter.get_node(), nil)
    )
end

return M
