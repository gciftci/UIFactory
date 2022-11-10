--[[-----------------------------------------------------------------------------
Module "Config"
- Handle interaction with Database (SavedVariable)
-------------------------------------------------------------------------------]] 

---@type table Local reference to Addon-Namespace
local UIFactory = select(2, ...)

---@class Config
local Config = UIFactory.Object.Register("Config")

---@type table Database 
---* Database Object declared in UIFactory.toc
---* SavedVariables: `UIFactory_DB`
UIFactory_DB = UIFactory_DB or {}

---@type boolean Turn debugging on or off
Config.debug = true
---@type debugMessages
Config.debugType = 0