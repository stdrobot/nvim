local status, prettier = pcall(require, "prettier")
if (not status) then return end

prettier.setup({
    cli_options = {
        config_precedence = "cli-override",
        use_tabs = false,
        single_attribute_per_line = false,
        tab_width = 4,
        -- `print_width = 80,
    },
    bin = 'prettierd',
    filetypes = {
        "html",
        "css",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "scss",
        "less",
        "markdown"
    },
})
