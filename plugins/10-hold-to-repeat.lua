-- SPDX-License-Identifier: MIT
--
-- This is an example libinput plugin
--
-- This plugin converts a held button to a repeating button sequence
-- Useful for volume keys for example

-- UNCOMMENT THIS LINE TO ACTIVATE THE PLUGIN
-- libinput:register({1})

-- Replace this key with the key you want to convert
KEY = evdev.KEY_VOLUMEUP

is_down = false

function frame(device, frame, _)
    for _, v in ipairs(frame) do
        if v.usage == KEY then
            if v.value == 2 then
                device:prepend_frame( {{ usage = KEY, value = is_down and 1 or 0 }} )
                is_down = not is_down
            elseif v.value == 0 then
                is_down = false
            end
        end
    end
end

function device_new(device)
    local usages = device:usages()
    if usages[KEY] then
        device:connect("evdev-frame", frame)
    end
end

libinput:connect("new-evdev-device", device_new)
