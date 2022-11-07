local status, trouble = pcall(require, "trouble")
if not status then
    return
end

trouble.setup({
    signs = {
        -- icons / text used for a diagnostic
        error = "error",
        warning = "warn",
        hint = "hint",
        information = "info",
    },
    icons = false,
})
