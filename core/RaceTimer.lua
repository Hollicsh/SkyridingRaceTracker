local _, SRT = ...

local L = SRT.localization

local function LoadTimerFrame(self)
    local timerFrame = CreateFrame("Frame", nil, UIParent)
    timerFrame:SetSize(256, 64)
    timerFrame:SetPoint("CENTER", 0, 200)

    if self.options["display-background"] then
        timerFrame.background = timerFrame:CreateTexture(nil, "BACKGROUND")
        timerFrame.background:ClearAllPoints()
        timerFrame.background:SetAllPoints(timerFrame)
        timerFrame.background:SetTexture(SRT.MEDIA_PATH .. "raceTimerBackground_1.blp")
    end

    timerFrame.timerText = timerFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    timerFrame.timerText:ClearAllPoints()
    timerFrame.timerText:SetPoint("CENTER", 0, 10)

    timerFrame.targetText = timerFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    timerFrame.targetText:ClearAllPoints()
    timerFrame.targetText:SetPoint("CENTER", 0, -10)

    return timerFrame
end

function SRT:ShowRaceTimer(raceQuestId, raceGoldTime)
    local size = 0
    for _ in pairs(self.timerFrame) do size = size + 1 end

    if size > 0 then
        self.timerFrame:Hide()
    end

    self.timerFrame = LoadTimerFrame(self)
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