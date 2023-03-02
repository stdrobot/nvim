local config = function()
    require("neo-tree").setup({
        enable_git_status = true,
        popup_border_style = "rounded",
        mappings = {
            ["<C-n>"] = "open",
        },
    })
end

return config
