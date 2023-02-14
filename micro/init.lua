local micro = import("micro")
local config = import("micro/config")
local shell = import("micro/shell")
local buffer = import("micro/buffer")

function searchWord(bp)
    if not bp.Cursor:HasSelection() then
        bp.Cursor:SelectWord()
        local sel = bp.Cursor:GetSelection()
        bp.Cursor.Loc = -bp.Cursor.OrigSelection[1]
        bp:Search(sel, false, true)
    else
        bp:FindNext()
    end
end

function onBufferOpen(buf)
    if buf.Settings["filetype"] == "unknown" then
        buf:SetOption("filetype", "zsh")
    end
end

-- function diff_view(bp)
--     -- Open same file Vsplit (on the very right)
--     -- true means right=true
--     -- bp.Buf.Type.Readonly = true
--     micro.CurPane():VSplitIndex(bp.Buf, true)
--     micro.InfoBar():Message("New View same file")
-- end

function diff_view(bp)
	local buf = bp.Buf
	shell.RunInteractiveShell("open -a Micro " .. bp.Buf.Path, false, false)
end
