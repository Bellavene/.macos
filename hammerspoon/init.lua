local SKIP_APPS={
		['com.bjango.istatmenus.status']=true,
		['com.blackmagic-design.DaVinciResolve']=true,
		['com.apple.BluetoothSettings']=true,
		['com.apple.WalletSettingsExtension']=true,
		['com.apple.inputmethod.EmojiFunctionRowItem']=true,
		['com.apple.security.Keychain-Circle-Notification']=true,
		['com.apple.PressAndHold']=true,
		['com.apple.inputmethod.EmojiFunctionRowItem']=true,
		['com.apple.quicklook.QuickLookUIService']=true,
		['com.apple.WebKit.WebContent']=true}

-- put in console repeatedly hs.window._timed_allWindows() to get apps and services that slows hammerpsoon down

-- Config reload hotkey

hs.hotkey.bind({ "ctrl", "alt", "cmd", "shift" }, "'", function()
  hs.reload()
end)

-- Misc
hs.allowAppleScript(true)

-- Enter Hyper Mode when Spacebar is pressed
pressedSpace = function()
  modal.triggered = false
  modal:enter()
end

releasedSpace = function()
  modal:exit()
  if not modal.triggered then
  	space:disable()
    hs.eventtap.keyStroke( {}, 'space' )
    space:enable()
  end
end

space = hs.hotkey.bind( {}, 'space', pressedSpace, releasedSpace )

-- Space hyper
modal = hs.hotkey.modal.new( {}, 'f20' );
modal:bind( '', 'a', function() modal.triggered = true; os.execute("~/CLI/yabai-cycle-float-windows") end )
modal:bind( '', 'b', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m space --balance x-axis") end )
modal:bind( 'SHIFT', 'b', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m space --balance") end )
modal:bind( '', 'c', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --warp prev || /opt/homebrew/bin/yabai -m window --warp last") end )
modal:bind( '', 'd', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m display --focus next || /opt/homebrew/bin/yabai -m display --focus first") end )
modal:bind( '', 'e', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --resize right:100:0 || /opt/homebrew/bin/yabai -m window --resize left:100:0") end )
modal:bind( '', 'f', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --grid 1:1:0:0:1:1 || /opt/homebrew/bin/yabai -m window --toggle zoom-fullscreen") end )
modal:bind( '', '`', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --swap largest || /opt/homebrew/bin/yabai -m window --swap recent --focus largest") end )
modal:bind( '', 'g', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m space --toggle padding; /opt/homebrew/bin/yabai -m space --toggle gap") end )
modal:bind( '', 'h', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'h' ) end )
modal:bind( '', 'i', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --insert north") end )
modal:bind( '', 'j', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --insert west") end )
modal:bind( '', 'k', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --insert south") end )
modal:bind( '', 'l', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --insert east") end )
modal:bind( '', 'm', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'm' ) end )
modal:bind( '', 'n', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'n' ) end )
modal:bind( '', 'o', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'o' ) end )
modal:bind( '', 'p', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --toggle sticky --toggle topmost --toggle pip") end )
modal:bind( '', 'Q', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --resize right:-100:0 || /opt/homebrew/bin/yabai -m window --resize left:-100:0") end )
modal:bind( '', 'r', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m space --rotate 270") end )
-- modal:bind( '', 'r', function() modal.triggered = true; os.execute("~/CLI/yabai-rotate") end )
-- modal:bind( '', 's', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --stack recent") end )
modal:bind( '', 's', function() modal.triggered = true; os.execute("/Users/User/CLI/yabai-stack north") end )
modal:bind( '', 't', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --toggle split") end )
modal:bind( '', 'u', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'u' ) end )
modal:bind( '', 'v', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --warp next || /opt/homebrew/bin/yabai -m window --warp first") end )
modal:bind( '', 'w', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --display recent; /opt/homebrew/bin/yabai -m display --focus recent; /opt/homebrew/bin/yabai -m space --balance x-axis") end )
modal:bind( '', 'x', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --toggle float; /opt/homebrew/bin/yabai -m window --grid 4:4:1:1:2:2") end )
-- modal:bind( '', 'y', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'y' ) end )
modal:bind( '', 'z', function() modal.triggered = true; os.execute("/Users/User/CLI/yabai-restart") end )
modal:bind( '', 'TAB', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'TAB'  ) end )
-- modal:bind( '', '1', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --focus prev || /opt/homebrew/bin/yabai -m space --focus prev || /opt/homebrew/bin/yabai -m space --focus last || /opt/homebrew/bin/yabai -m window --focus last") end )
-- modal:bind( '', '2', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --focus next || /opt/homebrew/bin/yabai -m space --focus next || /opt/homebrew/bin/yabai -m space --focus first || /opt/homebrew/bin/yabai -m window --focus first") end )

modal:bind( '', '1', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --focus prev || /opt/homebrew/bin/yabai -m space --focus prev || /opt/homebrew/bin/yabai -m space --focus last || /opt/homebrew/bin/yabai -m window --focus last") end )
modal:bind( '', '2', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --focus next || /opt/homebrew/bin/yabai -m space --focus next || /opt/homebrew/bin/yabai -m space --focus first || /opt/homebrew/bin/yabai -m window --focus first") end )

modal:bind( '', '3', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --swap prev || /opt/homebrew/bin/yabai -m window --swap last") end )
modal:bind( '', '4', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --swap next || /opt/homebrew/bin/yabai -m window --swap first") end )
modal:bind( '', '5', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, '5' ) end )
modal:bind( '', '6', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, '6' ) end )
modal:bind( '', '7', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, '7' ) end )
modal:bind( '', '8', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, '8' ) end )
modal:bind( '', '9', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, '9' ) end )
modal:bind( '', "0", function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, '0' ) end )
modal:bind( '', '-', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, '-' ) end )
modal:bind( '', '=', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, '=' ) end )
modal:bind( '', ']', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, ']' ) end )
modal:bind( '', '[', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, '[' ) end )
modal:bind( '', ';', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, ';' ) end )
modal:bind( '', ',', function() modal.triggered = true; os.execute("/Users/User/CLI/yabai-prev-stack") end )
modal:bind( '', '.', function() modal.triggered = true; os.execute("/Users/User/CLI/yabai-next-stack") end )
modal:bind( '', '/', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, '/' ) end )
modal:bind( '', '\\', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, '\\' ) end )
modal:bind( '', 'LEFT', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --resize right:-100:0 || /opt/homebrew/bin/yabai -m window --resize left:-100:0") end )
modal:bind( '', 'RIGHT', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --resize right:100:0 || /opt/homebrew/bin/yabai -m window --resize left:100:0") end )
modal:bind( '', 'DOWN', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --resize bottom:0:100 || /opt/homebrew/bin/yabai -m window --resize top:0:100") end )
modal:bind( '', 'UP', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --resize bottom:0:-100 || /opt/homebrew/bin/yabai -m window --resize top:0:-100") end )
-- modal:bind( 'alt', 'LEFT', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --swap west || /opt/homebrew/bin/yabai -m display --focus west; opt/homebrew/bin/yabai -m window --swap recent") end )
-- modal:bind( 'alt', 'RIGHT', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --swap east || /opt/homebrew/bin/yabai -m display --focus east; opt/homebrew/bin/yabai -m window --swap recent") end )
-- modal:bind( 'alt', 'DOWN', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --swap south || /opt/homebrew/bin/yabai -m display --focus south; opt/homebrew/bin/yabai -m window --swap recent") end )
-- modal:bind( 'alt', 'UP', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --swap north || /opt/homebrew/bin/yabai -m display --focus north; opt/homebrew/bin/yabai -m window --swap recent") end )
modal:bind( 'SHIFT', 'LEFT', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --warp west") end )
modal:bind( 'SHIFT', 'RIGHT', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --warp east") end )
modal:bind( 'SHIFT', 'DOWN', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --warp south") end )
modal:bind( 'SHIFT', 'UP', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --warp north") end )
-- modal:bind( '', 'LEFT', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --focus west  || /opt/homebrew/bin/yabai -m display --focus west") end )
-- modal:bind( '', 'RIGHT', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --focus east  || /opt/homebrew/bin/yabai -m display --focus east") end )
-- modal:bind( '', 'DOWN', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --focus south  || /opt/homebrew/bin/yabai -m display --focus south") end )
-- modal:bind( '', 'UP', function() modal.triggered = true; os.execute("/opt/homebrew/bin/yabai -m window --focus north  || /opt/homebrew/bin/yabai -m display --focus north") end )

-- Cycle yabai stacks
hs.hotkey.bind({ "cmd" }, "`", function ()
  os.execute("/opt/homebrew/bin/yabai -m window --focus stack.next || /opt/homebrew/bin/yabai -m window --focus stack.first
")
end)

-- Bind hide all other apps
hs.hotkey.bind({ "ctrl", "alt", "cmd", "shift" }, "H", function ()
  hs.eventtap.keyStroke({ "cmd", "alt" }, "H")
end)

-- Hue lights ON/OFF
hs.hotkey.bind({ "ctrl", "alt", "cmd", "shift" }, "0", function ()
  os.execute("/Users/User/CLI/Lights")
end)

-- Hue lights up/down
hs.hotkey.bind({ "ctrl", "alt", "cmd", "shift" }, "-", function ()
  os.execute("/Users/User/CLI/Lights dec")
end)
hs.hotkey.bind({ "ctrl", "alt", "cmd", "shift" }, "=", function ()
  os.execute("/Users/User/CLI/Lights inc")
end)

-- Copy active URL or file path of opened document
hs.hotkey.bind({ "cmd", "shift" }, "C", function () os.execute("osascript ~/CLI/copy-url-path.scpt") end)

-- hs.hotkey.bind({ "cmd", "shift" }, "C", function () os.execute("osascript -e 'tell application \"Vivaldi\" to set urlList to (URL of active tab of front window) as text' -e 'set the clipboard to urlList'") end)

-- Show/Hide Vivaldi
modal:bind( '', 'ESCAPE', function() modal.triggered = true; os.execute("osascript -e 'tell application \"BetterTouchTool\" to execute_assigned_actions_for_trigger \"43DB761D-6270-4008-8931-7EC493F7720C\"'") end)

-- Download front YouTube video
modal:bind( '', 'Y', function() modal.triggered = true; os.execute("osascript -e 'tell application \"Vivaldi\" to set urlList to (URL of active tab of front window) as text' -e 'set the clipboard to urlList' -e 'tell application \"iTerm2\" to create window with profile \"Download YouTube\"'") end)

-- -- Upload a file
-- modal:bind( '', 'U', function() modal.triggered = true; os.execute("osascript -e 'tell application \"System Events\" to keystroke \"c\" using {option down, command down}' -e 'tell application \"iTerm2\"' -e 'create window with profile \"Upload transfersh file\"' -e 'end tell'") end)

-- -- iStat
-- modal:bind( 'SHIFT', 'UP', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, '7' ) end)
-- modal:bind( 'SHIFT', 'Down', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, '6' ) end)
-- modal:bind( 'SHIFT', 'LEFT', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, '5' ) end)
-- modal:bind( 'SHIFT', 'RIGHT', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, '8' ) end)

-- Mute
modal:bind( 'SHIFT', 'm', function() modal.triggered = true; os.execute("osascript -e 'tell application \"BetterTouchTool\" to execute_assigned_actions_for_trigger \"708C7596-8ED6-4632-86B1-5B9BB7732A01\"'") end)

-- Search Google
modal:bind( 'SHIFT', 'g', function() modal.triggered = true; os.execute("osascript -e 'tell application \"BetterTouchTool\" to execute_assigned_actions_for_trigger \"57B6B6D8-F448-4A85-9043-715D2F71AA2A\"'") end)

-- Show system log (Space + Shift + L)
modal:bind( 'SHIFT', 'l', function() modal.triggered = true; os.execute("qlmanage -p /private/var/log/system.log >& /dev/null &") end)

-- Show Hammerspoon Console (Space + Shift + Escape)
modal:bind( 'SHIFT', 'ESCAPE', function() modal.triggered = true; hs.application.get("Hammerspoon"):selectMenuItem("Console...") hs.application.launchOrFocus("Hammerspoon") end)

-- Force Quit
modal:bind( 'SHIFT', 'q', function() modal.triggered = true; os.execute("osascript -e 'tell application \"System Events\" to keystroke (key code 53 using {command down, option down})'") end)

-- Close all windows
-- modal:bind( 'SHIFT', 'w', function() modal.triggered = true; os.execute("osascript -e 'tell application \"System Events\" to set frontApp to name of first application process whose frontmost is true' -e 'tell application frontApp to Close every window'") end)

-- Copy URL list from Vivaldi (Space + Shift + C)
modal:bind( 'SHIFT', 'c', function() modal.triggered = true; hs.applescript([[
    tell application "Vivaldi"
      tell front window
        set AppleScript's text item delimiters to linefeed
        set urlList to URL of its tabs
        set the clipboard to (urlList as text)
      end tell
    end tell
]]) end)

-- Eject all disks
modal:bind( 'SHIFT', 'e', function() modal.triggered = true; os.execute("~/CLI/eject-all") end)

-- Relaunch application
modal:bind( 'SHIFT', 'r', function() modal.triggered = true; os.execute("osascript -e 'tell application \"System Events\" to set theApp to the name of the first process whose frontmost is true' -e 'tell application theApp' -e 'quit' -e 'set isRunning to true' -e 'repeat while (isRunning)' -e 'delay 1' -e 'tell application \"System Events\"' -e 'set isRunning to ((name of processes) contains theApp)' -e 'end tell' -e 'end repeat' -e 'do shell script \"open -a \" & quoted form of theApp' -e 'end tell'") end)

-- Open in Safari
modal:bind( 'SHIFT', 's', function() modal.triggered = true; hs.applescript([[
try
using terms from application "Vivaldi"
tell application "Vivaldi" to set _url to URL of active tab of front window
end using terms from
tell application "Safari"
activate
open location _url
end tell
on error error_message number error_number
display alert "Error" message error_message as warning buttons {"OK"} default button 1
end try
]]) end)

-- -- Paste into file from clipboard data
-- modal:bind( 'SHIFT', 'v', function() modal.triggered = true; hs.applescript([[
  -- property allowedTypes : [¬
	-- JPEG picture, ¬
	-- «class PNGf», ¬
	-- TIFF picture, ¬
	-- «class utf8», ¬
	-- «class ut16», ¬
	-- string]
-- property name : [¬
	-- "Pasted on ", a reference to timestamp, ¬
	-- ".", a reference to extension]
-- 
-- on run
	-- set extension to "txt"
	-- set timestamp to the current date
-- 
	-- tell intersection(clipboard info, allowedTypes) & null ¬
		-- to set [cbMainType, cbOtherTypes] to ¬
		-- [its first item, its rest]
-- 
	-- if the cbMainType = null then return beep
-- 
	-- if cbMainType is in [«class PNGf», TIFF picture] then
		-- set cbMainType to JPEG picture
		-- set extension to "jpg"
	-- end if
-- 
	-- set filename to {name:contents of name as text}
-- 
	-- tell application "Finder"
		-- set f to make new file ¬
			-- at insertion location as alias ¬
			-- with properties filename
-- 
		-- write (the clipboard as the cbMainType) ¬
			-- to (f as alias) as the cbMainType
-- 
		-- reveal f
	-- end tell
-- end run
-- 
-- on current date
	-- tell (continue current date) as «class isot» as string to ¬
		-- set [d, t] to its [text 1 thru 10, text 12 thru -1]
	-- contents of {d, " at ", [t's word 1, "h", t's word 2, "m"]} as text
-- end current date
-- 
-- 
-- on clipboard info
	-- tell (continue clipboard info)
		-- repeat with x in (a reference to it)
			-- tell x to set its contents ¬
				-- to its first item
		-- end repeat
-- 
		-- it
	-- end tell
-- end clipboard info
-- 
-- 
-- on __(function)
	-- if the function's class = script ¬
		-- then return the function
-- 
	-- script
		-- property fn : function
	-- end script
-- end __
-- 
-- 
-- to filterItems from L as list into R as list : null given handler:function
	-- local L, R
-- 
	-- if R = null then set R to {}
-- 
	-- script
		-- property list : L
		-- property result : R
	-- end script
-- 
	-- tell the result to repeat with x in its list
		-- if __(function)'s fn(x, its list, its result) ¬
			-- then set end of its result to x's contents
	-- end repeat
-- 
	-- R
-- end filterItems
-- 
-- 
-- on intersection(A as list, B as list)
	-- local A, B
-- 
	-- script
		-- on member(M)
			-- script
				-- on fn(x)
					-- x is in M
				-- end fn
			-- end script
		-- end member
	-- end script
-- 
	-- filterItems from A given handler:result's member(B)
-- end intersection
-- ]]) end)


-- -- Create empty file
-- modal:bind( 'SHIFT', 'f', function() modal.triggered = true;
  -- hs.applescript([[
    -- try
    -- tell application "Finder"
        -- activate
        -- set targetFolder to the target of the front window as alias
        -- set newFileName to my getAvailableFilename(targetFolder)
        -- set newFile to make new file at targetFolder with properties {name: newFileName}
        -- select newFile
    -- end tell
-- 
    -- delay 0.4
-- 
    -- tell application "System Events"
        -- tell process "Finder"
            -- keystroke return
        -- end tell
    -- end tell
-- 
-- on error theError number errorNumber
    -- if errorNumber is 1002 then
        -- displayAccessibilityPromptDialog()
    -- else
        -- display dialog "Error: " & (errorNumber as text) & return & return & theError ¬
            -- buttons {"OK"} ¬
            -- default button 1 ¬
            -- with icon stop ¬
            -- with title "New File Applet"
    -- end if
-- end try
-- 
-- on getAvailableFilename(folderAlias)
    -- set found to false
    -- set fileCount to 1
    -- set appendix to ""
-- 
    -- repeat while found is false
        -- tell application "Finder"
            -- if exists file (folderAlias as text & "untitled file" & appendix) then
                -- set fileCount to (fileCount + 1)
                -- set appendix to (" " & fileCount as string)
            -- else
                -- return "untitled file" & appendix
            -- end if
        -- end tell
    -- end repeat
-- 
-- end getAvailableFilename
-- 
-- on displayAccessibilityPromptDialog()
-- 
    -- set theResponse to display dialog "Please allow the New File app in:" & return & return & "System Preferences ▶ Security & Privacy ▶ Privacy ▶ Accessibility" ¬
        -- buttons {"Open Privacy Settings", "OK"} ¬
        -- default button 1 ¬
        -- with icon caution ¬
        -- with title "New File Applet"
-- 
    -- if (button returned of theResponse is "Open Privacy Settings") then
        -- tell application "System Preferences"
            -- activate
            -- set the current pane to pane id "com.apple.preference.security"
            -- get the name of every anchor of pane id "com.apple.preference.security"
            -- reveal anchor "Privacy_Accessibility" of pane id "com.apple.preference.security"
        -- end tell
    -- end if
-- 
-- end getAvailableFilename
-- ]]) end)

-- -- Download torrent
-- modal:bind( '', 'T', function() modal.triggered = true;
  -- hs.applescript([[
  -- Tell application "iTerm2"
    -- create window with profile "Download Torrent"
  -- end tell
  -- ]]) end)

-- -- Upload file to google drive
-- modal:bind( 'SHIFT', 'U', function() modal.triggered = true;
  -- hs.applescript([[
  -- tell application "System Events"
    -- keystroke "c" using {option down, command down}
  -- end tell
  -- Tell application "iTerm2"
    -- create window with profile "Upload google file"
  -- end tell
  -- ]]) end)


-- -- -- Auto Toggle Audio
-- require("toggle-audio")
-- modal:bind( '', '\\', toggle_audio_output())
--
-- -- -- Toggle Audio Output
-- -- modal:bind( '', '\\', function() modal.triggered = true; hs.applescript([[
-- hs.hotkey.bind({ "ctrl", "alt", "cmd", "shift" }, "\\", function () hs.applescript([[
  -- tell application "System Preferences"
  -- reveal anchor "output" of pane id "com.apple.preference.sound"
-- end tell
--
-- tell application "System Events" to tell process "System Preferences"
  -- tell table 1 of scroll area 1 of tab group 1 of window 1
      -- select (row 1 where value of text field 1 is "Airport Express")
  -- end tell
-- end tell
--
-- quit application "System Preferences"
  -- ]]) end)


-- -- Draw with mouse
-- local hhann = require('hhann')
-- local module = {}
-- 
-- local hotkey = hs.hotkey.modal.new( { "ctrl", "alt", "cmd", "shift" }, 'm')
-- 
-- function hotkey:entered()
  -- hhann.start()
  -- hhann.startAnnotating()
-- end
-- 
-- function hotkey:exited()
  -- hhann.stopAnnotating()
  -- hhann.hide()
-- end
-- 
-- hotkey:bind( { "ctrl", "alt", "cmd", "shift" }, 'm', function() hotkey:exit()            end)
-- hotkey:bind( { "ctrl", "alt", "cmd", "shift" }, 'n', function() hhann.clear()            end)
-- 


-- hyper = {"cmd","alt","ctrl","shift"}

-- -- define custom keybindings for specific apps
-- local app_keybind = function(from_modifiers, from_key, to_modifiers, to_key, app_name)
--   local app_keybind = hs.hotkey.new(from_modifiers, from_key, nil, function()
--     hs.eventtap.keyStroke(to_modifiers, to_key)
--   end)
--   local app_filter = hs.window.filter.new(false):setAppFilter(app_name)

--   app_filter:subscribe {
--     windowFocused = function()
--       app_keybind:enable()
--     end,
--     windowUnfocused = function()
--       app_keybind:disable()
--     end,
--   }
-- end


-- hs.hotkey.bind({ "ctrl", "alt", "cmd", "shift" }, 'l', hs.window.frontmostWindow().focusWindowEast)
-- hs.hotkey.bind({ "ctrl", "alt", "cmd", "shift" }, 'j', hs.window.frontmostWindow().focusWindowWest)
-- hs.hotkey.bind({ "ctrl", "alt", "cmd", "shift" }, 'i', hs.window.frontmostWindow().focusWindowNorth)
-- hs.hotkey.bind({ "ctrl", "alt", "cmd", "shift" }, 'k', hs.window.frontmostWindow().focusWindowSouth)


-- -- In Davinci Resolve, remap [cmd + scroll] -> [alt + scroll].
-- davinciResolveScrollWatcher = hs.eventtap.new({hs.eventtap.event.types.scrollWheel}, function(event)
  -- if event:getFlags():containExactly({'cmd'}) then
    -- event:setFlags({alt = true})
    -- event:setProperty(hs.eventtap.event.properties.eventSourceUserData, 1)
  -- end
-- end)
--
-- davinciResolveWindowFilter = hs.window.filter.new(function(win)
  -- -- Here we use a custom function because the DaVinci Resolve window is
  -- -- not detected for some reason when it is in full screen mode if we
  -- -- try to use: hs.window.filter.new('DaVinci Resolve')
  -- return win:application():name() == 'DaVinci Resolve'
-- end)
--
-- davinciResolveWindowFilter:subscribe(hs.window.filter.windowFocused, function()
  -- davinciResolveScrollWatcher:start()
-- end)
--
-- davinciResolveWindowFilter:subscribe(hs.window.filter.windowUnfocused, function()
  -- davinciResolveScrollWatcher:stop()
-- end)


-- SpoonInstall
hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install=spoon.SpoonInstall

Install:andUse("RoundedCorners",
               {
                 start = true
               }
)

-- Install:andUse("HeadphoneAutoPause",
               -- {
                 -- start = true
               -- }
-- )

-- Install:andUse("MouseFollowsFocus",
--                {
--                  start = true
--                }
-- )

-- Install:andUse("KSheet",
               -- {
                 -- hotkeys = {
                   -- toggle = { {"ctrl", "alt", "cmd", "shift"}, "/" }
-- }})

-- Install:andUse('PasswordGenerator', {
  -- hotkeys = {
    -- paste = { {"ctrl", "alt", "cmd"}, 'p' }
  -- },
  -- config = {
    -- password_length = 10,
  -- },
-- })

-- show front activated app infos
-- hs.hotkey.bind(
--     hyper, ";",
--     function()
--         hs.alert.show(string.format("App path:        %s\nApp name:      %s\nIM source id:  %s",
--                                     hs.window.focusedWindow():application():path(),
--                                     hs.window.focusedWindow():application():name(),
--                                     hs.keycodes.currentSourceID()))
--     end)

-- hs.window.highlight.ui.overlay=true
-- hs.window.highlight.ui.overlayColor = {0,0,0,0.3}
-- hs.window.highlight.start()

-- Kill Adobe Processes
-- 
-- function applicationWatcher(appName, eventType, appObject)
  -- if (eventType == hs.application.watcher.launched or eventType == hs.application.watcher.terminated) then
      -- if (appName == 'Adobe Media Encoder 2022') or (appName == 'Adobe Photoshop 2022') or (appName == 'Adobe Premiere Pro 2022') or (appName == 'Adobe After Effects 2022') or (appName == 'Adobe Bridge 2022') then
          -- hs.timer.doAfter(3, function()
            -- os.execute("pkill -9 -fi \'core sync\'; pkill -9 -fi \'creative cloud\'; pkill -9 -fi \'adobe desktop service\'; pkill -9 -fi \'adobeipcbroker\'; pkill -9 -fi \'logtransport\'; exit")
      -- end)
      -- end
  -- end
-- end
-- AdobeWatcher = hs.application.watcher.new(applicationWatcher)
-- AdobeWatcher:start()


-- -- AC/Battery watcher - Bluetooth auto connect
-- require('ac-or-battery')


-- -- USB Watcher
-- usbWatcher = nil
--
-- function usbDeviceCallback(data)
    -- if (data["productName"] == "Arturia BeatStep") then
        -- if (data["eventType"] == "added") then
            -- hs.application.launchOrFocus("Keyboard Maestro Engine")
            -- os.execute("defaults write com.apple.dock autohide -bool false; killall Dock")
            -- -- hs.execute('/opt/homebrew/opt/blueutil/bin/blueutil --power 1', true)
--
        -- elseif (data["eventType"] == "removed") then
            -- app1 = hs.appfinder.appFromName("Keyboard Maestro Engine")
            -- app1:kill()
            -- app2 = hs.appfinder.appFromName("MidiPipe")
            -- app2:kill()
            -- os.execute("defaults write com.apple.dock autohide -bool true; killall Dock")
            -- -- hs.execute('/opt/homebrew/opt/blueutil/bin/blueutil --power 0', true)
        -- end
    -- end
-- end
--
-- usbWatcher = hs.usb.watcher.new(usbDeviceCallback)
-- usbWatcher:start()

-- -- -- Show language input source
-- Install:andUse("MenubarFlag",
               -- {
                 -- config = {
                   -- colors = {
                     -- ["U.S."] = {},
                     -- Russian = {hs.drawing.color.x11.blue},
                   -- }
                 -- },
                 -- start = true
               -- }
-- )


-- -- Example
-- -- Bind variable / try os.execute or if hidden_status == "YES\n" then
-- hs.hotkey.bind(cmd_ctrl, "h", function()
--   hidden_status = hs.execute("defaults read com.apple.finder AppleShowAllFiles")
--   if hidden_status == "YES"  then
--       hs.execute("defaults write com.apple.finder AppleShowAllFiles NO; killall Finder")
--   else
--       hs.execute("defaults write com.apple.finder AppleShowAllFiles YES; killall Finder")
--   end
-- end)

-- -- -- Launch/hide app shortcuts
-- function launchOrFocusOrHide(appname)
    -- local app = hs.appfinder.appFromName(appname)
    -- local mainwin = app:mainWindow()
    -- if mainwin then
        -- if mainwin == hs.window.focusedWindow() then
            -- app:hide()
        -- else
            -- app:activate(true)
            -- app:unhide()
            -- app:mainWindow():focus()
        -- end
    -- else
        -- if appname == "Finder" then
            -- app:activate(true)
            -- app:unhide()
            -- app:selectMenuItem({'File', 'New Finder Window'})
            -- app:mainWindow():focus()
            -- return
        -- end
        -- if appname == "iTerm2" then
            -- app:activate(true)
            -- app:unhide()
            -- app:mainWindow():focus()
            -- return
        -- end
    -- end
-- end

-- hs.hotkey.bind({"alt"}, "ESCAPE", function() launchOrFocusOrHide("Finder") end)



-- Focus visible window when a last application window is closed or minimized

wf = hs.window.filter
allwindows = wf.new(nil)
-- allwindows:rejectApp('Hammerspoon'):rejectApp('Vivaldi')
allwindows:subscribe({wf.windowDestroyed, wf.windowMinimized, wf.windowHidden}, function(window, appName, reason)
    -- local app = window:application()
    local app = hs.application.frontmostApplication()
    local bundle = app:bundleID()
    local count = 0

    for k, v in pairs(app:visibleWindows()) do
            count = count + 1
    end

    if app:bundleID() == "com.apple.finder" then
        if count < 2 then
            app:activate(true)
            app:hide()
            return
        end
    elseif app:bundleID() == bundle then
        if count < 1 then
            app:activate(true)
            app:hide()
            return
        end
    end
end)

-- -- Unminimize
hs.hotkey.bind({ 'cmd', 'shift' }, 'm', function()
  for _, win in ipairs(hs.window.allWindows()) do
    if win:isMinimized() then
      -- app:activate(true)
      win:unminimize()
      win:focus()
      break
    end
  end
end)

--
-- hs.console.darkMode(true)
-- if hs.console.darkMode() then
    -- hs.console.outputBackgroundColor{ white = 0 }
    -- hs.console.consoleCommandColor{ white = 1 }
-- else
    -- hs.console.windowBackgroundColor({red=.6,blue=.7,green=.7})
    -- hs.console.outputBackgroundColor({red=.8,blue=.8,green=.8})
-- end

-- -- -- On second screen change audio output
-- hs.screen.watcher.new(function()
    -- if hs.screen.primaryScreen():name() == 'LG ULTRAWIDE' then
        -- hs.audiodevice.findOutputByName('Airport Express'):setDefaultOutputDevice()
    -- end
-- end):start()


-- Window Manager
--
-- PaperWM = hs.loadSpoon("PaperWM")
-- PaperWM.window_filter = PaperWM.window_filter:setAppFilter("DaVinci Resolve", false)
-- PaperWM.window_filter = PaperWM.window_filter:setAppFilter("iStat Menus Status", false)
-- PaperWM.window_filter = PaperWM.window_filter:setAppFilter("Vimac", false)
-- PaperWM.window_filter = PaperWM.window_filter:setAppFilter("BetterTouchTool", false)
-- PaperWM.window_filter = PaperWM.window_filter:setAppFilter("Hammerspoon", true)
-- PaperWM.window_filter = PaperWM.window_filter:setAppFilter("iTerm2", true)
-- PaperWM:bindHotkeys({
-- focus_left = { { "ctrl", "alt", "cmd", "shift" }, "a" },
-- focus_right = { { "ctrl", "alt", "cmd", "shift" }, "d" },
-- focus_up = { { "ctrl", "alt", "cmd", "shift" }, "w" },
-- focus_down = { { "ctrl", "alt", "cmd", "shift" }, "s" },
-- swap_left = {  { "ctrl", "alt", "cmd", "shift" }, "j" },
-- swap_right = { { "ctrl", "alt", "cmd", "shift" }, "l" },
-- swap_up = { { "ctrl", "alt", "cmd", "shift" }, "i" },
-- swap_down = { { "ctrl", "alt", "cmd", "shift" }, "k" },
-- center_window = { { "ctrl", "alt", "cmd", "shift" }, "x" },
-- full_width = { { "ctrl", "alt", "cmd", "shift" }, "f" },
-- cycle_width = { { "ctrl", "alt", "cmd", "shift" }, "v" },
-- cycle_height = { { "ctrl", "alt", "cmd", "shift" }, "c" },
-- slurp_in = { { "ctrl", "alt", "cmd", "shift" }, "e" },
-- barf_out = { { "ctrl", "alt", "cmd", "shift" }, "t" },
-- -- move_window_1 = { { "ctrl", "alt", "cmd", "shift" }, "1" },
-- -- move_window_2 = { { "ctrl", "alt", "cmd", "shift" }, "2" },
-- -- -- move_window_3 = { { "ctrl", "alt", "cmd", "shift" }, "3" },
-- -- -- move_window_4 = { { "ctrl", "alt", "cmd", "shift" }, "4" },
-- -- -- move_window_5 = { { "ctrl", "alt", "cmd", "shift" }, "5" },
-- -- -- move_window_6 = { { "ctrl", "alt", "cmd", "shift" }, "6" },
-- -- -- move_window_7 = { { "ctrl", "alt", "cmd", "shift" }, "7" },
-- -- -- move_window_8 = { { "ctrl", "alt", "cmd", "shift" }, "8" },
-- -- -- move_window_9 = { { "ctrl", "alt", "cmd", "shift" }, "9" },
-- -- -- switch_space_1 = { { "ctrl", "alt", "cmd", "shift" }, "1" },
-- -- -- switch_space_2 = { { "ctrl", "alt", "cmd", "shift" }, "2" },
-- -- -- switch_space_3 = { { "ctrl", "alt", "cmd", "shift" }, "3" },
-- })
-- PaperWM:start()

-- YabaiBar = require("yabai-bar"):new("/opt/homebrew/bin/yabai")
-- YabaiBar:update()

-- stackline = require "stackline"
-- stackline:init()

hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()
