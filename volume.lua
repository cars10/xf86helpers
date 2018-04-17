-- required libs
local awful = require("awful")
local naughty = require("naughty")
local helpers = require("xf86helpers.helpers")

-- locals
local volume = {}
local notification_identifier = "volume"
local notification_preset = { fg = "#202020", bg = "#CDCDCD" }
local get_volume = [[bash -c "amixer sget Master | tail -n 1 | awk '{print $4}' | tr -d '[]' | sed 's/%//'"]]
local get_status = [[bash -c "amixer sget Master | tail -n 1 | awk '{print $6}' | tr -d '[]'"]]

local function volume_notification()
    awful.spawn.easy_async(get_volume, function(stdout, stderr, reason, exit_code)
        helpers.notify_unstacked({ title = "Volume", text = helpers.trim(stdout) .. '%' }, notification_identifier)
    end)
end

function volume.inc()
    awful.util.spawn ("amixer set Master 5+")
    volume_notification()
end

function volume.dec()
    awful.util.spawn ("amixer set Master 5-")
    volume_notification()
end

function volume.mute()
    awful.util.spawn ("amixer sset Master toggle")
    awful.spawn.easy_async(get_status, function(stdout, stderr, reason, exit_code)
        helpers.notify_unstacked({ title = "Volume", text = helpers.trim(stdout) }, notification_identifier)
    end)
end

return volume
