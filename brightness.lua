-- required libs
local awful = require("awful")
local naughty = require("naughty")

-- locals
local brightness = {
    last_notification = nil
}
local notification_preset = { fg = "#202020", bg = "#CDCDCD" }
local get_brightness = [[xbacklight]]

local function round(what, precision)
   return math.floor(what*math.pow(10,precision)+0.5) / math.pow(10,precision)
end

local function brightness_notification()
    if brightness.last_notification ~= nil then
        naughty.destroy(brightness.last_notification)
    end

    awful.spawn.easy_async(get_brightness, function(stdout, stderr, reason, exit_code)
        brightness.last_notification = naughty.notify({ title = "Brightness", text = tostring(round(tonumber(stdout), 0)), preset = notification_preset })
    end)
end

function brightness.inc()
    awful.util.spawn ("xbacklight -inc 10 -time 0 -steps 1")
    brightness_notification()  
end

function brightness.dec()
    awful.util.spawn ("xbacklight -dec 10 -time 0 -steps 1")
    brightness_notification()  
end

return brightness
