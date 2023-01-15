local status, null_ls = pcall(require, "null-ls")
local formatting = null_ls.builtins.formatting
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
if not status then
    return
end

local config = {

    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
    sources = {
        formatting.prettierd.with({ filetypes = { "css", "html", "javascript", "json", "yaml" } }),
        formatting.stylua.with({ filetypes = { "lua" } }),
        --        formatting.autoflake,
    },
}

null_ls.setup(config)
