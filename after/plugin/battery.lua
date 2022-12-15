local status, battery = pcall(require, "battery")
if not status then
    return
end

battery.setup({
    udpate_rate_seconds = 30,
    show_status_when_no_battery = true,
    show_plugged_icon = true,
    show_unplugged_icon = true,
    vertical_icons = true,
    multiple_battery_selection = 1,
})
