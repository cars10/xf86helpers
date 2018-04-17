-- required libs
local awful = require("awful")
local naughty = require("naughty")
local gtable = require("gears.table")

-- locals
local helpers = {
    last_notification = {}
}
local notification_preset = { fg = "#202020", bg = "#CDCDCD" }

-- public functions
function helpers.notify_unstacked(notify_args, identifier)
    naughty.destroy(helpers.last_notification[identifier], naughty.notificationClosedReason.dismissedByCommand)

    local notification_content = gtable.join(notification_preset, notify_args)
    helpers.last_notification[identifier] = naughty.notify({ preset = notification_content })
end

function helpers.trim(string)
    return string:gsub("%s+", "")
end

return helpers
