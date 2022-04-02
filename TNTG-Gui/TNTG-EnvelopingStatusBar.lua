if TNTG == nil then
    TNTG = {} 
end
TNTG.EnvelopingStatusBar = {}
TNTG.EnvelopingStatusBar.__index = TNTG.EnvelopingStatusBar
setmetatable(TNTG.EnvelopingStatusBar, TNTG.EnvelopingFrame)

function TNTG.EnvelopingStatusBar.Create(FrameName, FrameParent)
    local self = setmetatable({}, TNTG.EnvelopingStatusBar)
    self.Frame = CreateFrame("StatusBar", FrameName, FrameParent or UIParent)
    self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
    self:SetMinMaxValues(0, 100)
    self:SetValue(0)
    return self
end

function TNTG.EnvelopingStatusBar:GetMinMaxValues()
    return self.Frame:GetMinMaxValues()
end

function TNTG.EnvelopingStatusBar:SetMinMaxValues(min, max)
    self.Frame:SetMinMaxValues(min, max)
end

function TNTG.EnvelopingStatusBar:GetValue(AsFraction)
    if AsFraction then
        local min, max = self:GetMinMaxValues()
        return self.Frame:GetValue() / max
    end
    return self.Frame:GetValue()
end

function TNTG.EnvelopingStatusBar:SetValue(value, AsFraction)
    if AsFraction then
        local min, max = self:GetMinMaxValues()
        self.Frame:SetValue((value / 100) * (max - min))
    else
        self.Frame:SetValue(value)
    end
end

function TNTG.EnvelopingStatusBar:SetStatusBarTexture(TexturePath)
    self.Frame:SetStatusBarTexture(TexturePath)
end

function TNTG.EnvelopingStatusBar:SetStatusBarColor(r,g,b,a)
    self.Frame:SetStatusBarColor(r,g,b,a)
end

function TNTG.EnvelopingStatusBar:SetOrientation(orientation)
    self.Frame:SetOrientation(orientation)
end

function TNTG.EnvelopingStatusBar:SetHorizontal()
    self.Frame:SetOrientation("HORIZONTAL")
end

function TNTG.EnvelopingStatusBar:IsHorizontal()
    return self.Frame:GetOrientation() == "HORIZONTAL"
end

function TNTG.EnvelopingStatusBar:SetVertical()
    self.Frame:SetOrientation("VERTICAL")
end

function TNTG.EnvelopingStatusBar:IsVertical()
    return self.Frame:GetOrientation() == "VERTICAL"
end

function TNTG.EnvelopingStatusBar:IsReversed()
    return self.Frame:GetReverseFill()
end

function TNTG.EnvelopingStatusBar:SetReversed(reversed)
    self.Frame:SetReverseFill(reversed)
end

function TNTG.EnvelopingStatusBar:SetText(text,r,g,b,a,AlignWithStatusBar)
    local FontString = self.Frame.text or self.Frame:CreateFontString(self.Frame, "OVERLAY", "GameFontNormal")
    FontString:SetText(text)
    if AlignWithStatusBar then
        if self:IsHorizontal() then
            if self:IsReversed() then
                FontString:SetPoint("RIGHT", self.Frame, "RIGHT", self:GetValue(true)*self.Frame:GetWidth(), 0)
            else
                FontString:SetPoint("LEFT", self.Frame, "LEFT", self:GetValue(true)*self.Frame:GetWidth(), 0)
            end
        else
            if self:IsReversed() then
                FontString:SetPoint("TOP", self.Frame, "TOP", 0, self:GetValue(true)*self.Frame:GetHeight())
            else
                FontString:SetPoint("BOTTOM", self.Frame, "BOTTOM", 0, self:GetValue(true)*self.Frame:GetHeight())
            end
        end
    else
        FontString:SetPoint("CENTER", self.Frame, "CENTER", 0, 0)
    end
    FontString:SetTextColor(r,g,b,a)
    self.Frame.text = FontString
end