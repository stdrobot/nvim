local status, prettier = pcall(require, "prettier")
if (not status) then return end

prettier.setup({
    bin = "prettier",
    filetypes = {
        "html",
        "css",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "typescript.tsx",
        "javascript.jsx",
        "scss",
        "less",
        "markdown"
    },
    -- prettier formatting patterns
    cli_options = {
        config_precedence = "cli-override",
        trailing_comma = "es6",
        use_tab = false,
        tab_width = 4,
        use_tabs = false,
        single_attribute_per_line = true,
        print_width = 80,
    }
})
