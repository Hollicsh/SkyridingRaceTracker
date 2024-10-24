local _, SRT = ...

local L = SRT.localization
local options = SRT_Database_Options

function SRT:LoadTimerFrame()
    local timerFrame = CreateFrame("Frame", nil, UIParent)
    timerFrame:SetSize(200, 50)
    timerFrame:SetPoint("CENTER", 0, 200)

    local timerText = timerFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    timerText:SetPoint("CENTER", 0, 10)
    timerFrame.timerText = timerText

    local targetText = timerFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    targetText:SetPoint("CENTER", 0, -10)
    timerFrame.targetText = targetText

    self.timerFrame = timerFrame
end

function SRT:ShowRaceTimer(raceQuestId, raceGoldTime)
    local timerFrame = self.timerFrame

    if self.options["display-mode"] == 0 or raceQuestId == 0 then
        timerFrame.timerText:SetText(L["time"] .. ": 0.0 " .. L["seconds"])
    else
        timerFrame.timerText:SetText(string.format(L["time"] .. ": -%.1f " .. L["seconds"], raceGoldTime))
    end

    if raceQuestId ~= 0 then
        timerFrame.targetText:SetText(C_QuestLog.GetTitleForQuestID(raceQuestId))
    end

    timerFrame:Show()
end

function SRT:StartRaceTimer(raceQuestId, raceStartTime, raceGoldTime, raceSilverTime)
    local timerFrame = self.timerFrame

    if raceQuestId == 0 then
        SRT.raceTimer = C_Timer.NewTicker(0.05, function()
            local elapsedTime = GetTime() - raceStartTime
            timerFrame.timerText:SetText(string.format(L["time"] .. ": %.1f " .. L["seconds"], elapsedTime))
            timerFrame.targetText:SetText(L["no-time"])
        end)
    elseif self.options["display-mode"] == 0 then
        SRT.raceTimer = C_Timer.NewTicker(0.05, function()
            local elapsedTime = GetTime() - raceStartTime
            timerFrame.timerText:SetText(string.format(L["time"] .. ": %.1f " .. L["seconds"], elapsedTime))

            if elapsedTime <= raceGoldTime then
                timerFrame.targetText:SetText(L["gold-time"]:format(raceGoldTime))
            elseif elapsedTime <= raceSilverTime then
                timerFrame.targetText:SetText(L["silver-time"]:format(raceSilverTime))
            else
                timerFrame.targetText:SetText(L["bronze-time"])
            end
        end)
    else
        SRT.raceTimer = C_Timer.NewTicker(0.05, function()
            local elapsedTime = GetTime() - raceStartTime

            if elapsedTime <= raceGoldTime then
                local remainingTime = -(raceGoldTime - elapsedTime)
                timerFrame.timerText:SetText(string.format(L["time"] .. ": %.1f " .. L["seconds"], remainingTime))
                timerFrame.targetText:SetText(L["gold-time"]:format(raceGoldTime))
            elseif elapsedTime <= raceSilverTime then
                local remainingTime = -(raceSilverTime - elapsedTime)
                timerFrame.timerText:SetText(string.format(L["time"] .. ": %.1f " .. L["seconds"], remainingTime))
                timerFrame.targetText:SetText(L["silver-time"]:format(raceSilverTime))
            else
                timerFrame.timerText:SetText(L["time"] .. ": 0.0 " .. L["seconds"])
                timerFrame.targetText:SetText(L["bronze-time"])
            end
        end)
    end
end

function SRT:HideRaceTimer()
    local timerFrame = self.timerFrame

    SRT.raceTimer:Cancel()
    C_Timer.After(self.options["fadeout-delay"], function() timerFrame:Hide() end)
end