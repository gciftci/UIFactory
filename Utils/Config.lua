--[[-----------------------------------------------------------------------------
Module "Config"
- Handle interaction with Database (SavedVariable)
-------------------------------------------------------------------------------]]

---@type table Local reference to Addon-Namespace
local UIFactory = select(2, ...)

---Sequencing
local sfile = "[Config.lua]"
UIFactory.sequence.add("> start", sfile)    -- sequence

---@class Config
local Config = UIFactory.Object.Register("Config")

---@type table Database
---* Database Object declared in UIFactory.toc
---* SavedVariables: `UIFactory_DB`
UIFactory_DB = UIFactory_DB or {}

---@enum defaults Default configuration
Config.defaults = {
  -- main frame position
  frameRef = "CENTER",
  frameX = 0,
  frameY = 0,
  hide = false,

  debug = true,
  debugType = 0,
  sequencing = false,

  -- sizing

  frameW = 200,
  frameH = 200,
  UIScale = 1,
}
---Initialize config (either from SavedVariable UIFactory_DB or defaults)
function Config.init()
  UIFactory.sequence.add("function Object.Register(name, base)", sfile)    -- sequence
  for k, v in pairs(Config.defaults) do
    if (not UIFactory_DB[k]) then
      UIFactory_DB[k] = v
      UIFactory.sequence.add("adding " .. tostring(k) .. " =  " .. tostring(v) .. "  to UIFactory_DB" , sfile)    -- sequence
    end
  end
end

UIFactory.sequence.add("> end", sfile)    -- sequence