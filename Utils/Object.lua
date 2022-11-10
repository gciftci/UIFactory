--[[-----------------------------------------------------------------------------
Module "Object"
- Register a table as Module
-------------------------------------------------------------------------------]]

---@type table Local reference to Addon-Namespace
local UIFactory = select(2, ...)

---@class Object
local Object = {}
UIFactory.Object = Object

---Register table `name` as Module of `base`
---@param name string Name of the Module
---@param base table Parent of Module
---@return table Object
function Object.Register(name, base)
  if (not base) then
      base = UIFactory
  end
  local b = {}
  b.__index = b;
  b.New = function(self, o)
    local c = o or {}
    setmetatable(c, self)
    self.__index = self
    return c
  end
  base[name] = b
  return b
end