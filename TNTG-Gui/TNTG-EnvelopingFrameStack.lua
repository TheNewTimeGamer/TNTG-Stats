if TNTG == nil then
    TNTG = {} 
end
TNTG.EnvelopingFrameStack = {}
TNTG.EnvelopingFrameStack.__index = TNTG.EnvelopingFrameStack

function TNTG.EnvelopingFrameStack:Create(FrameName, FrameParent, ...)
    local self = setmetatable({}, TNTG.EnvelopingFrameStack)
    self.Frame = CreateFrame("Frame", FrameName, FrameParent or UIParent)
    for i,v in ipairs(arg) do
        v:SetParent(FrameStack)
    end
end