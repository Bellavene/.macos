-- Config reload hotkey

hs.hotkey.bind({ "ctrl", "alt", "cmd", "shift" }, "'", function()
  hs.reload()
end)

-- Space hyper
modal = hs.hotkey.modal.new( {}, 'f20' );
-- modal:bind( '', 'w', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'w' ) end )
-- modal:bind( '', 's', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 's' ) end )
modal:bind( '', 'a', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'a' ) end )
modal:bind( '', 'd', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'd' ) end )
modal:bind( '', 'e', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'e' ) end )
modal:bind( '', 'q', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd" }, 'q' ) end )
modal:bind( '', 'x', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'x' ) end )
-- modal:bind( '', 'f', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'f' ) end )
-- modal:bind( '', 'g', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'g' ) end )
modal:bind( '', 'h', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'h' ) end )
modal:bind( '', 'c', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'c' ) end )
modal:bind( '', 'r', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd" }, 'r' ) end )
-- modal:bind( '', 'r', function() modal.triggered = true; os.execute("~/CLI/Reyabai >& /dev/null &") end)
-- modal:bind( '', 't', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 't' ) end )
-- modal:bind( '', 'y', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'y' ) end )
-- modal:bind( '', 'u', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'u' ) end )
modal:bind( '', 'v', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'v' ) end )
modal:bind( '', 'b', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'b' ) end )
modal:bind( '', 'p', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'p' ) end )
-- modal:bind( '', 'm', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'm' ) end )
-- modal:bind( '', 'n', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'n' ) end )
modal:bind( '', 'i', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'i' ) end )
modal:bind( '', 'j', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'j' ) end )
modal:bind( '', 'k', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'k' ) end )
modal:bind( '', 'l', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'l' ) end )
modal:bind( '', 'z', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'z' ) end )
modal:bind( '', 'TAB', function() modal.triggered = true; hs.eventtap.keyStroke( 'fn', 'a'  ) end )
-- modal:bind( '', 'ESCAPE', function() modal.triggered = true; launchOrFocusOrHide("Vivaldi") end)
modal:bind( '', '1', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'a' ) end )
modal:bind( '', '2', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'd' ) end )
-- modal:bind( '', '3', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, '3' ) end )
-- modal:bind( '', '4', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, '4' ) end )
-- modal:bind( '', '5', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, '5' ) end )
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
modal:bind( '', ',', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, ',' ) end )
modal:bind( '', '.', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, '.' ) end )
modal:bind( '', '`', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, '8' ) end )
modal:bind( '', '/', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, '/' ) end )
modal:bind( '', 'LEFT', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'a' ) end )
modal:bind( '', 'RIGHT', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'd' ) end )
modal:bind( '', 'UP', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'w' ) end )
modal:bind( '', 'DOWN', function() modal.triggered = true; hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 's' ) end )

-- Show/Hide Vivaldi
modal:bind( '', 'ESCAPE', function() modal.triggered = true; os.execute("osascript -e 'tell application \"BetterTouchTool\" to execute_assigned_actions_for_trigger \"43DB761D-6270-4008-8931-7EC493F7720C\"'"); hs.timer.doAfter(0.4, function () hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'r' ) end) end)

-- Amethyst - Gaps on
modal:bind( '', 'g', function() modal.triggered = true; os.execute("osascript -e 'tell application \"BetterTouchTool\" to execute_assigned_actions_for_trigger \"CE2395AF-1AA1-4632-8C3B-345D77904A7C\"'"); hs.timer.doAfter(0.4, function () hs.eventtap.keyStroke( { "ctrl", "alt", "cmd", "shift" }, 'r' ) end) end)

-- Maximize Window
modal:bind( '', 'f', function() modal.triggered = true; os.execute("osascript -e 'tell application \"BetterTouchTool\" to execute_assigned_actions_for_trigger \"213F0B4C-CE48-48E1-AC41-59E43A7DDC04\"'") end)

-- Select Monitor
modal:bind( '', '3', function() modal.triggered = true; os.execute("osascript -e 'tell application \"BetterTouchTool\" to execute_assigned_actions_for_trigger \"5FDFCE34-DC9F-44C6-97EF-98FBD9228981\"'") end)

modal:bind( '', '4', function() modal.triggered = true; os.execute("osascript -e 'tell application \"BetterTouchTool\" to execute_assigned_actions_for_trigger \"8FA2DE83-05C3-42E6-840E-E6CBA199932B\"'") end)

modal:bind( '', 's', function() modal.triggered = true; os.execute("osascript -e 'tell application \"BetterTouchTool\" to execute_assigned_actions_for_trigger \"85A10422-77DC-433A-A2C3-054D77B3F959\"'") end)

modal:bind( '', 'w', function() modal.triggered = true; os.execute("osascript -e 'tell application \"BetterTouchTool\" to execute_assigned_actions_for_trigger \"366B6710-4A91-424B-BB7B-E868BFD47C52\"'") end)

modal:bind( '', 't', function() modal.triggered = true; os.execute("osascript -e 'tell application \"BetterTouchTool\" to execute_assigned_actions_for_trigger \"886C3495-0D5B-4071-831A-EF02B644C35A\"'") end)

modal:bind( '', '5', function() modal.triggered = true; os.execute("osascript -e 'tell application \"BetterTouchTool\" to execute_assigned_actions_for_trigger \"EB78D603-8108-4048-976D-2D6B60443686\"'") end)

-- Search Google
modal:bind( 'SHIFT', 'g', function() modal.triggered = true; os.execute("osascript -e 'tell application \"BetterTouchTool\" to execute_assigned_actions_for_trigger \"57B6B6D8-F448-4A85-9043-715D2F71AA2A\"'") end)

-- Show system log (Space + Shift + L)
modal:bind( 'SHIFT', 'l', function() modal.triggered = true; os.execute("qlmanage -p /private/var/log/system.log >& /dev/null &") end)

-- Show Hammerspoon Console (Space + Shift + Escape)
modal:bind( 'SHIFT', 'ESCAPE', function() modal.triggered = true; hs.application.get("Hammerspoon"):selectMenuItem("Console...") hs.application.launchOrFocus("Hammerspoon") end)

-- Force Quit
modal:bind( 'SHIFT', 'q', function() modal.triggered = true; os.execute("osascript -e 'tell application \"System Events\" to keystroke (key code 53 using {command down, option down})'") end)

-- Close all windows
modal:bind( 'SHIFT', 'w', function() modal.triggered = true; os.execute("osascript -e 'tell application \"System Events\" to set frontApp to name of first application process whose frontmost is true' -e 'tell application frontApp to Close every window'") end)

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

-- Paste into file from clipboard data
modal:bind( 'SHIFT', 'v', function() modal.triggered = true; hs.applescript([[
  property allowedTypes : [¬
	JPEG picture, ¬
	«class PNGf», ¬
	TIFF picture, ¬
	«class utf8», ¬
	«class ut16», ¬
	string]
property name : [¬
	"Pasted on ", a reference to timestamp, ¬
	".", a reference to extension]

on run
	set extension to "txt"
	set timestamp to the current date

	tell intersection(clipboard info, allowedTypes) & null ¬
		to set [cbMainType, cbOtherTypes] to ¬
		[its first item, its rest]

	if the cbMainType = null then return beep

	if cbMainType is in [«class PNGf», TIFF picture] then
		set cbMainType to JPEG picture
		set extension to "jpg"
	end if

	set filename to {name:contents of name as text}

	tell application "Finder"
		set f to make new file ¬
			at insertion location as alias ¬
			with properties filename

		write (the clipboard as the cbMainType) ¬
			to (f as alias) as the cbMainType

		reveal f
	end tell
end run

on current date
	tell (continue current date) as «class isot» as string to ¬
		set [d, t] to its [text 1 thru 10, text 12 thru -1]
	contents of {d, " at ", [t's word 1, "h", t's word 2, "m"]} as text
end current date


on clipboard info
	tell (continue clipboard info)
		repeat with x in (a reference to it)
			tell x to set its contents ¬
				to its first item
		end repeat

		it
	end tell
end clipboard info


on __(function)
	if the function's class = script ¬
		then return the function

	script
		property fn : function
	end script
end __


to filterItems from L as list into R as list : null given handler:function
	local L, R

	if R = null then set R to {}

	script
		property list : L
		property result : R
	end script

	tell the result to repeat with x in its list
		if __(function)'s fn(x, its list, its result) ¬
			then set end of its result to x's contents
	end repeat

	R
end filterItems


on intersection(A as list, B as list)
	local A, B

	script
		on member(M)
			script
				on fn(x)
					x is in M
				end fn
			end script
		end member
	end script

	filterItems from A given handler:result's member(B)
end intersection
]]) end)


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

-- Create empty file
modal:bind( 'SHIFT', 'f', function() modal.triggered = true;
  hs.applescript([[
    try
    tell application "Finder"
        activate
        set targetFolder to the target of the front window as alias
        set newFileName to my getAvailableFilename(targetFolder)
        set newFile to make new file at targetFolder with properties {name: newFileName}
        select newFile
    end tell

    delay 0.4

    tell application "System Events"
        tell process "Finder"
            keystroke return
        end tell
    end tell

on error theError number errorNumber
    if errorNumber is 1002 then
        displayAccessibilityPromptDialog()
    else
        display dialog "Error: " & (errorNumber as text) & return & return & theError ¬
            buttons {"OK"} ¬
            default button 1 ¬
            with icon stop ¬
            with title "New File Applet"
    end if
end try

on getAvailableFilename(folderAlias)
    set found to false
    set fileCount to 1
    set appendix to ""

    repeat while found is false
        tell application "Finder"
            if exists file (folderAlias as text & "untitled file" & appendix) then
                set fileCount to (fileCount + 1)
                set appendix to (" " & fileCount as string)
            else
                return "untitled file" & appendix
            end if
        end tell
    end repeat

end getAvailableFilename

on displayAccessibilityPromptDialog()

    set theResponse to display dialog "Please allow the New File app in:" & return & return & "System Preferences ▶ Security & Privacy ▶ Privacy ▶ Accessibility" ¬
        buttons {"Open Privacy Settings", "OK"} ¬
        default button 1 ¬
        with icon caution ¬
        with title "New File Applet"

    if (button returned of theResponse is "Open Privacy Settings") then
        tell application "System Preferences"
            activate
            set the current pane to pane id "com.apple.preference.security"
            get the name of every anchor of pane id "com.apple.preference.security"
            reveal anchor "Privacy_Accessibility" of pane id "com.apple.preference.security"
        end tell
    end if

end getAvailableFilename
]]) end)

-- -- Download torrent
-- modal:bind( '', 'T', function() modal.triggered = true;
  -- hs.applescript([[
  -- Tell application "iTerm2"
    -- create window with profile "Download Torrent"
  -- end tell
  -- ]]) end)

-- Download front YouTube video
modal:bind( '', 'Y', function() modal.triggered = true; os.execute("osascript -e 'tell application \"Vivaldi\" to set urlList to (URL of active tab of front window) as text' -e 'set the clipboard to urlList' -e 'tell application \"iTerm2\" to create window with profile \"Download YouTube\"'") end)

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

-- Upload a file
modal:bind( '', 'U', function() modal.triggered = true; os.execute("osascript -e 'tell application \"System Events\" to keystroke \"c\" using {option down, command down}' -e 'tell application \"iTerm2\"' -e 'create window with profile \"Upload transfersh file\"' -e 'end tell'") end)


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


-- Bind hide all other apps
hs.hotkey.bind({ "ctrl", "alt", "cmd", "shift" }, "H", function ()
  hs.eventtap.keyStroke({ "cmd", "alt" }, "H")
end)

-- Bind lights ON/OFF
hs.hotkey.bind({ "ctrl", "alt", "cmd", "shift" }, "0", function ()
  os.execute("sh /Users/Klutchevski/.config/HueToggle.sh")
end)

-- Copy Vivaldi active URL
hs.hotkey.bind({ "cmd", "shift" }, "C", function () os.execute("osascript -e 'tell application \"Vivaldi\" to set urlList to (URL of active tab of front window) as text' -e 'set the clipboard to urlList'") end)



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


-- Draw with mouse
local hhann = require('hhann')
local module = {}

local hotkey = hs.hotkey.modal.new( { "ctrl", "alt", "cmd", "shift" }, 'm')

function hotkey:entered()
  hhann.start()
  hhann.startAnnotating()
end

function hotkey:exited()
  hhann.stopAnnotating()
  hhann.hide()
end

hotkey:bind( { "ctrl", "alt", "cmd", "shift" }, 'm', function() hotkey:exit()            end)
hotkey:bind( { "ctrl", "alt", "cmd", "shift" }, 'n', function() hhann.clear()            end)


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

Install:andUse('PasswordGenerator', {
  hotkeys = {
    paste = { {"ctrl", "alt", "cmd"}, 'p' }
  },
  config = {
    password_length = 10,
  },
})

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

function applicationWatcher(appName, eventType, appObject)
  if (eventType == hs.application.watcher.launched or eventType == hs.application.watcher.terminated) then

      if (appName == 'Adobe Media Encoder 2022') or (appName == 'Adobe Photoshop 2022') or (appName == 'Adobe Premiere Pro 2022') or (appName == 'Adobe After Effects 2022') or (appName == 'Adobe Bridge 2022') then
          hs.timer.doAfter(3, function()
            os.execute("pkill -9 -fi \'core sync\'; pkill -9 -fi \'creative cloud\'; pkill -9 -fi \'adobe desktop service\'; pkill -9 -fi \'adobeipcbroker\'; pkill -9 -fi \'logtransport\'; exit")
      end)
      end
  end
end

AdobeWatcher = hs.application.watcher.new(applicationWatcher)
AdobeWatcher:start()


-- -- Focus terminal on mpv launch
-- function application2Watcher(appName, eventType, appObject)
  -- if (eventType == hs.application.watcher.launching or hs.application.watcher.terminated) then
    -- if (appName == "mpv") then
      -- hs.application.launchOrFocus("iTerm")
      -- hs.timer.doAfter(0.1, function() hs.eventtap.keyStroke({ "cmd", "ctrl", "alt", "shift" }, "R") end)
    -- end
  -- end
-- end
--
-- app2Watcher = hs.application.watcher.new(application2Watcher)
-- app2Watcher:start()



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

-- Misc
hs.allowAppleScript(true)

-- Send apps to monitors
-- require('window_arranger')

hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()

-- -- -- Show language input source
Install:andUse("MenubarFlag",
               {
                 config = {
                   colors = {
                     ["U.S."] = {},
                     Russian = {hs.drawing.color.x11.blue},
                   }
                 },
                 start = true
               }
)

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

-- --------------------------
-- -- Time Machine backup watcher
-- --------------------------
-- -- When plugging in a time machine harddrive
-- -- It displays the percentage of the backup progress in the menu bar
-- Install:andUse("TimeMachineProgress",
    -- {
        -- start = true
    -- }
-- )

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



-- Focus last app window when closing or minimize last Finder window

-- wf = hs.window.filter
-- allwindows = wf.new(nil)
-- windows = hs.window.filter.new(hs.window.filter.sortByFocusedLast)
-- -- allwindows:subscribe(wf.windowDestroyed, function (window, appName, reason)
    -- -- app = hs.application.frontmostApplication()
    -- -- count = 1
    -- -- for k,v in pairs(app:visibleWindows()) do
    -- -- if count < 1 then
            -- -- windows[#windows]:focus()
        -- -- end
    -- -- end
-- -- end)

wf = hs.window.filter
allwindows = wf.new(nil)
-- allwindows:rejectApp('Hammerspoon'):rejectApp('Vivaldi')
allwindows:subscribe({wf.windowDestroyed, wf.windowMinimized, wf.windowHidden}, function(window, appName, reason)
    -- local app2 = window:application()
    local app2 = hs.application.frontmostApplication()
    local bundle = app2:bundleID()
    local count = 0

    for k, v in pairs(app2:visibleWindows()) do
            count = count + 1
    end

    if app2:bundleID() == "com.apple.finder" then
        if count < 2 then
            app2:activate(true)
            app2:hide()
            return
        end
    elseif app2:bundleID() == "com.googlecode.iterm2" then
        if count < 1 then
            app2:activate(true)
            app2:hide()
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

-- -- =====================
-- -- Window Highlighting
-- -- =====================
-- hs.window.highlight.ui.overlay = true
-- hs.window.highlight.ui.frameWidth = 0
-- hs.window.highlight.ui.frameColor = {1, 0.176, 0.522, 1}
-- hs.window.highlight.ui.flashDuration=0.3
-- hs.window.highlight.start()

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
