local status, nvimlsp = pcall(require, "lspconfig")
if not status then
    return
end
local name = vim.loop.os_uname().sysname
local util = nvimlsp.util

local bufnr = vim.api.nvim_get_current_buf()
local bufname = vim.api.nvim_buf_get_name(bufnr)

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
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "cpp",
        callback = function()
            if vim.loop.os_uname().sysname == "Darwin" then
                fallback_flags = { "-target=arm64-apple-darwin", "-std=c++2a", "-Wall" }
            else
                fallback_flags = { "-std=c++20", "-Wall" }
            end
        end,
    })
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "c",
        callback = function()
            if vim.loop.os_uname().sysname == "Darwin" then
                fallback_flags = { "-target=arm64-apple-darwin", "-std=gnu2x", "-Wall" }
            else
                fallback_flags = { "-std=gnu2x", "-Wall" }
            end
        end,
    })
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
    root_dir = util.root_pattern(
        "clangd",
        ".clang-format",
        ".clang-tidy",
        "compile_commands.json",
        "compile_flags.txt",
        ".git"
    ),
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
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
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

nvimlsp["dockerls"].setup({
    cmd = { "docker-langserver", "--stdio" },
    filetypes = { "dockerfile" },
    root_dir = util.root_pattern("Dockerfile"),
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

local vscode = "vscode-html-language-server"
local ts = "typescript-language-server"
if name == "Darwin" then
    ts = ts
    vscode = vscode
elseif name == "Windows_NT" then
    ts = ts .. ".cmd"
    vscode = vscode .. ".cmd"
end

nvimlsp["html"].setup({
    capabilities = cmp_capabilities,
    cmd = { vscode, "--stdio" },
    filetypes = { "html" },
    init_options = {
        provideFormatter = false,
    },
})

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

nvimlsp["astro"].setup({
    on_attach = on_attach,
    capabilities = cmp_capabilities,
    cmd = { "astro-ls", "--stdio" },
    filetypes = { "astro" },
    init_options = {
        configuration = {},
        typescript = {
            serverPath = "C:/Users/jonah/AppData/Local/pnpm/global/5/node_modules/typescript/lib/tsserverlibrary.js",
        },
    },
    root_dir = nvimlsp.util.root_pattern("astro.config.mjs", "package.json", "tsconfig.json", ".git", ".npmrc"),
})
