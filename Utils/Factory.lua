--[[-----------------------------------------------------------------------------
Module "Factory"
- # FrameFactory
- Creating Frames or reusing from pool
-------------------------------------------------------------------------------]]

---@type table Local reference to Addon-Namespace
local UIFactory = select(2, ...)

---@class Factory
local Factory = UIFactory.Object.Register("Factory")
---@class LayoutRegistry:Factory
local LayoutRegistry = UIFactory.Object.Register("LayoutRegistry", Factory)
---@subclass WidgetBase
local WidgetBase = UIFactory.Object.Register("WidgetBase", Factory)
---@subclass Widgets
local Widgets = UIFactory.Object.Register("Widgets", Factory)
---@subclass Pool
local Pool = UIFactory.Object.Register("Pool", Factory)

local Config = UIFactory.Config
local Debug = UIFactory.Debug

---@type function xpcall
local xpcall = xpcall

---errorhandler
---@param err any
---@return nil|any
local function errorhandler(err)
	Debug:print("function errorhandler called: " .. tostring((geterrorhandler()(err) and geterrorhandler()(err) or "?")), 1)
	return geterrorhandler()(err)
end

---safecall
---@param func function
---@param ... any
---@return any
local function safecall(func, ...)
	Debug:print("safecall: " .. tostring((func and func or "?")), 3)
	if func then
		return xpcall(func, errorhandler, ...)
	end
end
