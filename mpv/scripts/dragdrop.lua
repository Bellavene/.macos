-- Drag and drop the currently opened file from the mpv window
local utils = require 'mp.utils'

local function on_drop(files)
    -- Check if a file was dropped
    if #files > 0 then
        -- Get the path of the currently opened file
        local current_file = mp.get_property("path")

        -- Check if the dropped file is the currently opened file
        if files[1] == current_file then
            -- Trigger the "drop-file" event to allow other applications to receive the file
            mp.commandv("drop-file", current_file)
        end
    end
end

mp.register_event("file-loaded", function()
    mp.set_property_native("input-context", "drag-drop", on_drop)
end)

mp.register_event("file-closed", function()
    mp.set_property_native("input-context", "drag-drop", nil)
end)
