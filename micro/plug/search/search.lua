local micro = import("micro")
local config = import("micro/config")
local buffer = import("micro/buffer")
local util = import("micro/util")
local regexp = import("regexp")

function searchWord(bp)
    if bp.Cursor:HasSelection() then
        local search = bp.Cursor:GetSelection()
        bp:Search(search, false, true)

        micro.InfoBar():AddToHistory("Find", regexp.QuoteMeta(search))  -- TODO non-regex case
    else
        if not util.IsWordChar(util.RuneAt(bp.Buf:LineBytes(bp.Cursor.Y), bp.Cursor.X)) then
            return false
        end
        bp.Cursor:SelectWord()
        local search = "\\b" .. util.String(bp.Cursor:GetSelection()) .. "\\b"
        bp:Search(search, true, true)

        micro.InfoBar():AddToHistory("Find", search)  -- TODO non-regex case
    end
    return true
end

function searchClick(bp, e)
    local mx, my = e:Position()
    if my >= bp:BufView().Y + bp:BufView().Height then
        return false
    end
    local loc = bp:LocFromVisual(buffer.Loc(mx, my))

    if util.IsWordChar(util.RuneAt(bp.Buf:LineBytes(loc.Y), loc.X)) then
        bp:Deselect()
        bp.Cursor.Loc = loc
        searchWord(bp)
    else
        bp:UnhighlightSearch()
        bp:Deselect()
    end
    return true
end

function init()
    config.TryBindKey("Alt-f", "lua:search.searchWord", false)
    config.TryBindKey("MouseRight", "lua:search.searchClick", false)

    config.AddRuntimeFile("search", config.RTHelp, "help/search.md")
end
