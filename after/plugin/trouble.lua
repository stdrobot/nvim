local status, trouble = pcall(require, "trouble")
if not status then
            return
end

trouble.setup({
            position = "bottom",
            height = 10,
            width = 50,
            mode = "document_diagnostics",
            signs = {
                        --     icons / text used for a diagnostic
                        error = "error",
                        warning = "warn",
                        hint = "hint",
                        information = "info",
            },
            icons = true,
            use_diagnostic_signs = true,
})
