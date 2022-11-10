--[[--------------
  @TODO
  - Initialize
    [x] set database
    [ ] unregister events
      * ADDON_LOADED
      * PLAYER_ENTERING_WORLD
    [ ] createFrame
------------------]]
local addonName, ns = ...
UIFactory = ns

local Object = UIFactory.Object
local Config = UIFactory.Config
local Debug = UIFactory.Debug
local Events = UIFactory.Events

---Sequencing
local sfile = "[core.lua]"
UIFactory.sequence.add("> start", sfile) -- sequence

function UIFactory.OnLogin(...)
  UIFactory.sequence.add("EVENT UIFactory.OnLogin()", sfile) -- sequence
  local tbl = { n = select("#", ...), ... }
  UIFactory.sequence.add(("OnLogin: " .. (tostring(unpack(tbl, 1, tbl.n)))), sfile) -- sequence
  Config.init()
end

function UIFactory.OnLoad(...)
  UIFactory.sequence.add("EVENT UIFactory.OnLoad()", sfile) -- sequence
  local tbl = { n = select("#", ...), ... }
  UIFactory.sequence.add(("OnLoad: " .. (tostring(unpack(tbl, 1, tbl.n)))), sfile) -- sequence
  if UIFactory_DB.sequencing then
    for k, v in ipairs(UIFactory.sequence) do
      print(v)
    end
  end
end



Events:RegisterCallback("PLAYER_LOGIN", UIFactory.OnLogin, ...)
Events:RegisterCallback("ADDON_LOADED", UIFactory.OnLoad, ...)

UIFactory.sequence.add("> end", sfile) -- sequence
