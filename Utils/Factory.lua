--[[-----------------------------------------------------------------------------
Module "Factory"
- # FrameFactory
- Creating Frames or reusing from pool
-------------------------------------------------------------------------------]]

---@type table Local reference to Addon-Namespace
local UIFactory = select(2, ...)

---Sequencing
local sfile = "[Factory.lua]"
UIFactory.sequence.add("> start", sfile)    -- sequence

UIFactory.sequence.add("> end", sfile)    -- sequence