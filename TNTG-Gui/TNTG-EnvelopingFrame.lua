if TNTG == nil then
   TNTG = {} 
end
TNTG.EnvelopingFrame = {}
TNTG.EnvelopingFrame.__index = TNTG.EnvelopingFrame

-- Create a frame with a name and a parent. If no parent is supplied UIParent is used.
function TNTG.EnvelopingFrame.Create(FrameName, FrameParent)
    local self = setmetatable({}, TNTG.EnvelopingFrame)
    self.Frame = CreateFrame("Frame", FrameName, FrameParent or UIParent)
    return self
end

function TNTG.EnvelopingFrame:SetSize(width, height)
    self.Frame:SetWidth(width)
    self.Frame:SetHeight(height)
end

function TNTG.EnvelopingFrame:SetVisible(visible)
    self.Frame:SetShown(visible)
end

function TNTG.EnvelopingFrame:IsVisible()
    return self.Frame:IsVisible()
end

function TNTG.EnvelopingFrame:SetBackdrop(backdrop)
    self.Frame:SetBackdrop(backdrop)
end

function TNTG.EnvelopingFrame:GetBackdropColor()
    return self.Frame:GetBackdropColor()
end

function TNTG.EnvelopingFrame:SetBackdropColor(r,g,b,a)
    self.Frame:SetBackdropColor(r,g,b,a)
end

function TNTG.EnvelopingFrame:GetBackdropBorderColor()
    return self.Frame:GetBackdropBorderColor()
end

function TNTG.EnvelopingFrame:SetBackdropBorderColor(r,g,b,a)
    self.Frame:SetBackdropBorderColor(r,g,b,a)
end

function TNTG.EnvelopingFrame:SetPoint(point, relativeTo, relativePoint, x, y)
    self.Frame:SetPoint(point, relativeTo, relativePoint, x, y)
end

function TNTG.EnvelopingFrame:GetPoint()
    return self.Frame:GetPoint()
end

function TNTG.EnvelopingFrame:SetTexture(TexturePath)
    local texture = self.Frame:CreateTexture(nil, "BACKGROUND")
    texture:SetTexture(TexturePath)
    texture:SetAllPoints(self.Frame)
    self.Frame.texture = texture
end

function TNTG.EnvelopingFrame:GetVertexColor()
    return self.Frame.texture:GetVertexColor()
end

function TNTG.EnvelopingFrame:SetVertexColor(r,g,b,a)
    self.Frame.texture:SetVertexColor(r,g,b,a)
end

function TNTG.EnvelopingFrame:SetColor(r,g,b,a)
    local texture = self.Frame:CreateTexture(nil, "BACKGROUND")
    texture:SetColorTexture(r,g,b,a)
    texture:SetAllPoints(self.Frame)
    self.Frame.texture = texture
end

function TNTG.EnvelopingFrame:SetText(text,r,g,b,a)
    local FontString = self.Frame.text or self.Frame:CreateFontString(self.Frame, "OVERLAY", "GameFontNormal")
    FontString:SetText(text)
    FontString:SetPoint("CENTER", self.Frame, "CENTER", 0, 0)
    FontString:SetTextColor(r,g,b,a)
    self.Frame.text = FontString
end