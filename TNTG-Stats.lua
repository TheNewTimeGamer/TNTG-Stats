function CreateStatFrame(prev, r, g, b, a, iconPath)
    local frame = TNTG.EnvelopingStatusBar.Create("testFrame", UIParent)
    frame:SetSize(14,200)
    frame:SetVertical()
    if prev then
        frame:SetPoint("LEFT", prev, "RIGHT", 10, 0)
    else
        frame:SetPoint("LEFT", UIParent, "LEFT", 5, -150)
    end
    frame:SetColor(0,0,0,0.3)
    frame:SetStatusBarColor(r,g,b,a)
    frame:SetVisible(true)

    local icon = TNTG.EnvelopingFrame.Create("testFrame", UIParent)
    icon:SetSize(14,14)
    icon:SetPoint("TOP", frame.Frame, "BOTTOM", 0, 0)
    icon:SetTexture(iconPath or "Interface\\Icons\\Inv_gizmo_goblingtonkcontroller")
    icon:SetVisible(true)

    return frame
end

local physical = CreateStatFrame(nil, 0, 0, 1, 1, "Interface\\Icons\\Ability_warrior_defensivestance")
local Dodge = CreateStatFrame(physical.Frame, 0.3, 0.3, 1, 1, "Interface\\Icons\\Ability_vehicle_launchplayer")
local Haste = CreateStatFrame(Dodge.Frame, 0, 1, 0, 1, "Interface\\Icons\\Ability_Druid_Dash")
local Crit = CreateStatFrame(Haste.Frame, 1, 0, 0, 1, "Interface\\Icons\\Ability_warlock_baneofhavoc")
local Mastery = CreateStatFrame(Crit.Frame, 1, 0.84, 0, 1, "Interface\\Icons\\Ability_Druid_MasterShapeshifter")
local Vers = CreateStatFrame(Mastery.Frame, 1, 1, 0.4, 1, "Interface\\Icons\\Ability_vehicle_shellshieldgenerator")
local Leech = CreateStatFrame(Vers.Frame, 1, 0, 1, 1, "Interface\\Icons\\Ability_creature_disease_05")

physical.Frame:SetScript("OnUpdate", function(self)
    local armor = math.floor(PaperDollFrame_GetArmorReduction(select(2, UnitArmor('player')), UnitEffectiveLevel('player')))
    physical:SetValue(armor)
    physical:SetText(armor .. "%", 1, 1, 1, 1, true)

    local dodge = math.floor(GetDodgeChance())
    Dodge:SetValue(dodge)
    Dodge:SetText(dodge .. "%", 1, 1, 1, 1, true)

    local haste = math.floor(GetHaste())
    Haste:SetValue(haste)
    Haste:SetText(haste .. "%", 1, 1, 1, 1, true)

    local crit = math.floor(GetCritChance())
    Crit:SetValue(crit)
    Crit:SetText(crit .. "%", 1, 1, 1, 1, true)

    local mastery = math.floor(GetMastery())
    Mastery:SetValue(mastery)
    Mastery:SetText(mastery .. "%", 1, 1, 1, 1, true)

    local versatility = math.floor(GetCombatRatingBonus(CR_VERSATILITY_DAMAGE_DONE))
    Vers:SetValue(versatility)
    Vers:SetText(versatility .. "%", 1, 1, 1, 1, true)

    local leech = math.floor(GetLifesteal())
    Leech:SetValue(leech)
    Leech:SetText(leech .. "%", 1, 1, 1, 1, true)
end)