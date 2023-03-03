local status, nvimlsp = pcall(require, "lspconfig")
if not status then
    return
end
local name = vim.loop.os_uname().sysname
local util = nvimlsp.util

-- Setup nvim-cmp.

local opts = { noremap = true, silent = true }
-- Setup nvim-cmp.
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local protocol = require("vim.lsp.protocol")
-- BEGIN ATTACH
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
    --  local opts = { noremap=true, silent=true }
end

-- END ATTACH
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities(protocol.make_client_capabilities())

local fold_capabilities = vim.lsp.protocol.make_client_capabilities()
fold_capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

-- BEGINS FLAGS
local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

local set_fallback_flags = function()
    local fallback_flags = {}
    if name == "Darwin" then
        fallback_flags = { "--target=arm64-apple-darwin", "-std=c++2a", "-Wall" }
    elseif name == "Windows_NT" then
        fallback_flags = { "-Wall", "-std=c++20" }
    end
    return fallback_flags
end

-- END FLAGS

nvimlsp["clangd"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = cmp_capabilities,
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
    },
    single_file_support = true,
    init_options = {
        fallbackFlags = set_fallback_flags(),
    },
    root_dir = util.root_pattern("clangd", ".clang-tidy", "compile_commands.json", "compile_flags.txt", ".git"),
    util.path.dirname,
})

nvimlsp["pyright"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = cmp_capabilities,
    -- cmd = { "pyright-langserver.exe", "--stdio" },
    root_dir = function()
        return vim.fn.getcwd()
    end,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
            },
        },
    },
})

local vscode = "vscode-html-language-server"
local ts = "typescript-language-server"
if name == "Darwin" then
    ts = ts
    vscode = vscode
elseif name == "Windows_NT" then
    ts = ts .. ".cmd"
    vscode = vscode .. ".cmd"
end

nvimlsp["tsserver"].setup({
    on_attach = on_attach,
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
    cmd = { ts, "--stdio" },
    root_dir = function()
        return vim.fn.getcwd()
    end,
    capabilities = cmp_capabilities,
    flag = lsp_flags,
})

nvimlsp["rust_analyzer"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = cmp_capabilities,
})

nvimlsp["jdtls"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = cmp_capabilities,
    root_dir = function()
        return vim.fn.getcwd()
    end,
})

nvimlsp["lua_ls"].setup({
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
    capabilities = cmp_capabilities,
    single_file_support = true,
    root_dir = util.root_pattern(".stylua.toml", "stylua.toml"),
})

nvimlsp["gopls"].setup({
    on_attach = on_attach,
    capabilities = cmp_capabilities,
})

cmp_capabilities.textDocument.completion.snippetSupport = true

nvimlsp["html"].setup({
    capabilities = cmp_capabilities,
    cmd = { vscode, "--stdio" },
    filetypes = { "html" },
    init_options = {
        provideFormatter = false,
    },
})

nvimlsp["bashls"].setup({
    on_attach = on_attach,
    capabilities = cmp_capabilities,
    cmd = { "bash-language-server.cmd", "start" },
    cmd_env = { GLOB_PATTERN = "*@(.sh|.zshrc)" },
    root_dir = function()
        return vim.fn.getcwd()
    end,
    single_file_support = true,
})

nvimlsp["cmake"].setup({
    capabilities = cmp_capabilities,
    on_attach = on_attach,
    cmd = { "cmake-language-server" },
    filetypes = { "cmake" },
    single_file_support = true,
    root_dir = util.root_pattern("CMakePresets.json", "CTestConfig.cmake", ".git", "build", "cmake"),
    init_options = {
        buildDirectory = "build",
    },
})
