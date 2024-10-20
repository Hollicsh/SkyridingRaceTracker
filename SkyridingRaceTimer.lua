local _, SRT = ...

local L = SRT.localization

local raceStartTime = nil
local isRaceActive = false
local timerFrame = nil

local raceTimer
local raceSpellId = 369968

local function ShowRaceTime()
    timerFrame = CreateFrame("Frame", nil, UIParent)
    timerFrame:SetSize(200, 50)
    timerFrame:SetPoint("CENTER", 0, 200)

    local timerText = timerFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    timerText:SetPoint("CENTER", 0, 0)
    timerFrame.timerText = timerText

    raceTimer = C_Timer.NewTicker(0.05, function()
        local elapsedTime = GetTime() - raceStartTime
        timerFrame.timerText:SetText(string.format(L["time"] .. ": %.1f " .. L["seconds"], elapsedTime))
 
        timerFrame:Show()
    end)
end

local function HideRaceTime()
    if timerFrame then
        raceTimer:Cancel()

        C_Timer.After(3, function() timerFrame:Hide() end)
    end
end

local function CheckRaceAura()
	for i = 1, 40 do
        local aura = C_UnitAuras.GetAuraDataByIndex("player", i)
        if aura == nil then
            break
        end

        if aura.spellId == raceSpellId then
            return true
        end
    end

    return false
end

local function OnEvent(self, event, unit)
    if unit == "player" then
        if CheckRaceAura() then
            if not isRaceActive then
                raceStartTime = GetTime()
                isRaceActive = true
                ShowRaceTime()
            end
        else
            if isRaceActive then
                isRaceActive = false
                HideRaceTime()
            end
        end
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("UNIT_AURA")
frame:SetScript("OnEvent", OnEvent)
