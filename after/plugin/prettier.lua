local status, prettier = pcall(require, "prettier")
if not status then
    return
end

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
        "tsx",
        "jsx",
        "scss",
        "less",
    },
})
