--[[-----------------------------------------------------------------------------
Module "Events"
- Event-Handler
-------------------------------------------------------------------------------]]

---@type table Local reference to Addon-Namespace
local UIFactory = select(2, ...)

---Sequencing
local sfile = "[Events.lua]"
UIFactory.sequence.add("> start", sfile) -- sequence

---@class Events
local Events = UIFactory.Object.Register("Events")

local Config = UIFactory.Config
local Debug = UIFactory.Debug

function Events:RegisterCallback(event, callback, ...)
  UIFactory.sequence.add("RegisterCallback(event, callback, ...)", sfile) -- sequence
  if not self.eventFrame then
    self.eventFrame = CreateFrame("Frame", "TEstingADD")
    function self.eventFrame:OnEvent(event, ...)
      for callback, args in next, self.callbacks[event] do
        callback(args, ...)
      end
    end
    self.eventFrame:SetScript("OnEvent", self.eventFrame.OnEvent)
  end
  if not self.eventFrame.callbacks then self.eventFrame.callbacks = {} end
  if not self.eventFrame.callbacks[event] then self.eventFrame.callbacks[event] = {} end
  self.eventFrame.callbacks[event][callback] = {...}
  self.eventFrame:RegisterEvent(event)
end
UIFactory.sequence.add("> end", sfile) -- sequence
