return function()
    require 'telescope'.setup {
        pickers = {
            find_files = {
                theme = "dropdown",
            }
        },
    }
end
