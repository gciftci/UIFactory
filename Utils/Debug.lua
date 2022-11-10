--[[-----------------------------------------------------------------------------
Module "Debug"
- Debugging
-------------------------------------------------------------------------------]]

---@type table Local reference to Addon-Namespace
local UIFactory = select(2, ...)

---@Mod Debug
local Debug = UIFactory.Object.Register("Debug")

---@class Config
local Config = UIFactory.Config

---@alias debugMessages
---| 0 # ALL
---| 1 # ERROR
---| 2 # SUCCESS
---| 3 # NOTE
local debugMessages = {
  [0] = "|cffff2020" .. "ALL" .. "|r", -- ALL
  [1] = "|cffff2020" .. "ERR" .. "|r", -- ERROR
  [2] = "|cff00ff00" .. "SUC" .. "|r", -- SUCCESS
  [3] = "|cFFFFD200" .. "NOT" .. "|r", -- NOTE
}

---Prints `str` with `type`
---@param str string|nil
---@param type? debugMessages
function Debug:print(str, type)
  if Config.debug then -- if turned on
    if Config.debugType == 0 then -- if ALL messages active
      print(string.format("[%s] %s", debugMessages[(type and type or 3)], (str and str or "?")))
    else -- if certain Type of messages are activated
      print(string.format("[%s] %s", "msg", (str and str or "?")))
    end
  end
end
