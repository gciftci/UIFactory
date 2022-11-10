--[[-----------------------------------------------------------------------------
Module "Object"
- Register a table as Module
-------------------------------------------------------------------------------]]

---@type table Local reference to Addon-Namespace
local UIFactory = select(2, ...)

---Sequencing
local sfile = "[Object.lua]"
UIFactory.sequence = {}
function UIFactory.sequence.add(seq, sfile)
  tinsert(UIFactory.sequence, sfile .. " " .. seq)
end
UIFactory.sequence.add("> start", sfile)    -- sequence

---@class Object
local Object = {}
UIFactory.Object = Object

---Register table `name` as Module of `base`
---@param name string Name of the Module
---@param base table Parent of Module
---@return table Object
function Object.Register(name, base)
  UIFactory.sequence.add("function Object.Register(name, base)", sfile)    -- sequence
  if (not base) then
      base = UIFactory
  end
  local b = {}
  b.__index = b;
  b.New = function(self, o)
    UIFactory.sequence.add("b.New = function(self, o)", sfile)    -- sequence
    local c = o or {}
    setmetatable(c, self)
    self.__index = self
    return c
  end
  base[name] = b
  return b
end

UIFactory.sequence.add("> end", sfile)   -- sequence