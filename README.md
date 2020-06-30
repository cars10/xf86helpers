# xf86helpers

This is a plugin for [awesomewm](https://github.com/awesomeWM/awesome) that provides some helpers for XF86 key functionality 
and is used by me in my [dotfiles](https://github.com/cars10/dotfiles).

It includes helpers to manage brightness and volume of your machine and displays a notification for each change.

Available helpers:

| function       | description               | example                       |
|----------------|---------------------------|-------------------------------|
| brightness.inc | increase brightness by 10 | `xf86helpers.brightness.inc()` |
| brightness.dec | decrease brightness by 10 | `xf86helpers.brightness.dec()` |
| volume.inc | increase master volume by 5 | `xf86helpers.volume.inc()` |
| volume.dec | master volume by 5 | `xf86helpers.volume.dec()` |
| volume.mute | mute master volume | `xf86helpers.volume.mute()` |


## Usage

### Dependencies

* `awesomewm`
* `naughty` is needed for the notifications
* `brightness.*` needs `xbacklight`
* `volume.*` needs `amixer`


### Setup

1. Clone the repository next to your `rc.lua`: `git clone https://github.com/cars10/xf86helpers`
2. Import the plugin and its dependencies in your `rc.lua`

```lua
-- .....
local naughty = require("naughty")
local xf86helpers = require("xf86helpers")
-- .....
```

3. Setup key listeners and call the plugin, for example

```lua
-- {{{ Key bindings
globalkeys = button_table.join(
    awful.key({ modkey }, "s",      hotkeys_popup.show_help,   {description="show help", group="awesome"}),
    -- .....
    awful.key({}, "XF86MonBrightnessUp", xf86helpers.brightness.inc),
    awful.key({}, "XF86MonBrightnessDown", xf86helpers.brightness.dec),
    awful.key({}, "XF86AudioRaiseVolume", xf86helpers.volume.inc),
    awful.key({}, "XF86AudioLowerVolume", xf86helpers.volume.dec),
    awful.key({}, "XF86AudioMute", xf86helpers.volume.mute),
    -- .....
```


### Customisation

Right now the helpers are hardcoded to suit my needs. If you want to change the brightness/volume steps or the audio device you can easily edit the code and use that.


## License

MIT
