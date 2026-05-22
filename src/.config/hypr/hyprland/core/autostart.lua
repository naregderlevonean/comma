hl.on("hyprland.start", function()
    local daemons = require("hyprland.core.autostart.daemons")
    local environment = require("hyprland.core.autostart.environment")
    local user = require("hyprland.core.autostart.user")

    for _, cmd in ipairs(daemons) do
        hl.exec_cmd(cmd)
    end

    for _, cmd in ipairs(environment) do
        hl.exec_cmd(cmd)
    end

    for _, app in ipairs(user) do
        hl.exec_cmd(app[1], app.options)
    end
end)

