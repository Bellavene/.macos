VERSION = "0.1.0"

local micro = import("micro")
local config = import("micro/config")
local buffer = import("micro/buffer")
local shell = import("micro/shell")

local fzfarg =  config.GetGlobalOption("fzfarg")

function fzfinder(bp)
  --
  bp:AddTab()
  local buf,err  = buffer.NewBuffer("ABC", "")
  --
  if fzfarg == nil then
    fzfarg = "";
  end

  local output, err = shell.RunInteractiveShell("fzf "..fzfarg, false, true)
  if err ~= nil then
    micro.InfoBar():Error(err)
  else
    fzfOutput(output, {bp})
  end

end

function fzfOutput(output, args)
  local bp = args[1]
  local strings = import("strings")
  output = strings.TrimSpace(output)
  if output ~= "" then
    local buf, err = buffer.NewBufferFromFile(output)
    if err == nil then
      -- bp:OpenBuffer(buf)
      micro.CurPane():OpenBuffer(buf)
    end
  end
end


function init()
  config.MakeCommand("fzfinder", fzfinder, config.NoComplete)
end

