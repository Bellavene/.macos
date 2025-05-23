--[[
https://github.com/9beach/mpv-config/blob/master/scripts/finder-integration.lua

This script provides the script messages below:

- `reveal-in-finder` runs `explorer.exe`/`Finder.app`/`Nautilus` with
  currently playing file selected. (`Ctrl+f, Alt+f, Meta+f`)
- `touch-file` updates the modification time of currently playing file. If you
  want to mark it to delete later or do something else with, it will help you.
  (`Ctrl+x, Alt+x, Meta+x`)
]]

local mp = require 'mp'
local msg = require 'mp.msg'
local options = require 'mp.options'
local utils = require 'mp.utils'

local o = {
    mac_finder = '["open", "-R"]',
    windows_finder = '["explorer.exe", "/select,"]',
    linux_finder = '["nautilus"]', -- Not tested yet
    -- touch_file_keybind='Ctrl+x Alt+x Meta+x',
    reveal_in_finder_keybind='Meta+/',
}

if os.getenv('windir') ~= nil then
    o.platform = 'windows'
elseif os.execute '[ $(uname) = "Darwin" ]' == 0 then
    o.platform = 'darwin'
else
    o.platform = 'linux'
end

options.read_options(o, "finder-integration")

if o.platform == 'windows' then
    o.finder = utils.parse_json(o.windows_finder)
elseif o.platform == 'darwin' then
    o.finder = utils.parse_json(o.mac_finder)
else
    o.finder = utils.parse_json(o.linux_finder)
end

function bind_keys(keys, name, func, opts)
    if not keys or keys == '' then
        mp.add_key_binding(nil, name, func, opts)
        return
    end

    local i = 0
    for key in string.gmatch(keys, "[^%s]+") do
        i = i + 1
        if i == 1 then
            mp.add_key_binding(key, name, func, opts)
        else
            mp.add_key_binding(key, name..i, func, opts)
        end
    end
end

function is_local_file(path)
    return path ~= nil and string.find(path, '://') == nil
end

function table.shallow_copy(t)
    local t2 = {}
    for k,v in pairs(t) do t2[k] = v end
    return t2
end

function reveal_in_finder()
    local path = mp.get_property_native('path')

    if not is_local_file(path) then return end
    if o.platform == 'windows' then path = string.gsub(path, '/', '\\') end

    local my_finder = table.shallow_copy(o.finder)
    my_finder[#my_finder+1] = path

    mp.command_native( {name='subprocess', args=my_finder} )
end

bind_keys(o.reveal_in_finder_keybind, 'reveal-in-finder', reveal_in_finder)

function ps_quote_string(str)
    return "'"..str:gsub('`', '``'):gsub('"', '``"'):gsub('%$', '``$')
                   :gsub('%[', '``['):gsub('%]', '``]'):gsub("'", "''").."'"
end

function touch(path)
    local cmd = nil

    if o.platform == 'windows' then
        -- Bill, WTF!
        cmd = {
            'powershell',
            '-command',
            "(Get-Item "..ps_quote_string(path)..").LastWriteTime=(Get-Date)"
        }
    else
        cmd = {'touch', path}
    end

    return mp.command_native( {name='subprocess', args=cmd} )
end

function touch_file()
    local path = mp.get_property_native('path')

    if not is_local_file(path) then return end
    if o.platform == 'windows' then path = string.gsub(path, '/', '\\') end

    local r = touch(path)
    if r.status == 0 then
        mp.osd_message('Touched "'..path..'"')
    else
        mp.osd_message('Failed to touch "'..path..'"')
    end
end

bind_keys(o.touch_file_keybind, 'touch-file', touch_file)
