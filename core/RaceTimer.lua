local _, SRT = ...

local L = SRT.localization

local function LoadTimerFrame(self)
    local timerFrame = CreateFrame("Frame", nil, UIParent)
    timerFrame:SetSize(256, 64)
    timerFrame:SetPoint("CENTER", 0, 200)

    timerFrame:Hide()

    if self.options["display-background"] then
        timerFrame.background = timerFrame:CreateTexture(nil, "BACKGROUND")
        timerFrame.background:ClearAllPoints()
        timerFrame.background:SetAllPoints(timerFrame)
        timerFrame.background:SetTexture(SRT.MEDIA_PATH .. "raceTimerBackground.blp")
    end

    timerFrame.timerText = timerFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    timerFrame.timerText:ClearAllPoints()
    timerFrame.timerText:SetPoint("CENTER", 0, 10)

    timerFrame.targetText = timerFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    timerFrame.targetText:ClearAllPoints()
    timerFrame.targetText:SetPoint("CENTER", 0, -10)

    return timerFrame
end

function SRT:ShowRaceTimer(raceQuestID, raceGoldTime, racePersonalTime)
    local size = 0
    for _ in pairs(self.timerFrame) do size = size + 1 end

    if size > 0 then
        self.timerFrame:Hide()
    end

    self.timerFrame = LoadTimerFrame(self)
    local timerFrame = self.timerFrame
    timerFrame.timerText:SetText(C_QuestLog.GetTitleForQuestID(raceQuestID))

    if self.options["display-mode"] == 0 then
        timerFrame.targetText:SetText(L["gold-time"]:format(raceGoldTime))
    elseif self.options["display-mode"] == 1 then
        timerFrame.targetText:SetText(L["gold-time"]:format(raceGoldTime))
    elseif self.options["display-mode"] == 2 then
        if racePersonalTime == -1 then
            timerFrame.targetText:SetText(L["personal-best-time-not-available"])
        elseif racePersonalTime == 0 then
            timerFrame.targetText:SetText(L["personal-best-time-no-race"])
        else
            timerFrame.targetText:SetText(L["personal-best-time"]:format(racePersonalTime))
        end
    end

    C_Timer.After(5, function()
        if (self.options["display-mode"] == 0 and racePersonalTime == -1) or (self.options["display-mode"] == 2 and racePersonalTime <= 0) then
            timerFrame.timerText:SetText(string.format(L["time"], 0))
        elseif self.options["display-mode"] == 1 then
            timerFrame.timerText:SetText(L["time"]:format(-raceGoldTime))
        elseif self.options["display-mode"] == 2 then
            timerFrame.timerText:SetText(L["time"]:format(-racePersonalTime))
        end
    end)

    timerFrame:Show()
end

function SRT:StartRaceTimer(raceQuestID, raceStartTime, raceGoldTime, raceSilverTime, racePersonalTime)
    if raceQuestID == -1 then
        self.timerFrame = LoadTimerFrame(self)
    end

    local timerFrame = self.timerFrame

    if raceQuestID == -1 then
        SRT.raceTimer = C_Timer.NewTicker(0.05, function()
            local elapsedTime = GetTime() - raceStartTime
            timerFrame.timerText:SetText(L["time"]:format(elapsedTime))
            timerFrame.targetText:SetText(L["no-time"])
        end)
    elseif self.options["display-mode"] == 0 then
        SRT.raceTimer = C_Timer.NewTicker(0.05, function()
            local elapsedTime = GetTime() - raceStartTime
            timerFrame.timerText:SetText(L["time"]:format(elapsedTime))

            if elapsedTime <= raceGoldTime then
                timerFrame.targetText:SetText(L["gold-time"]:format(raceGoldTime))
            elseif elapsedTime <= raceSilverTime then
                timerFrame.targetText:SetText(L["silver-time"]:format(raceSilverTime))
            else
                timerFrame.targetText:SetText(L["bronze-time"])
            end
        end)
    elseif self.options["display-mode"] == 1 then
        SRT.raceTimer = C_Timer.NewTicker(0.05, function()
            local elapsedTime = GetTime() - raceStartTime

            if elapsedTime <= raceGoldTime then
                local remainingTime = -(raceGoldTime - elapsedTime)
                timerFrame.timerText:SetText(L["time"]:format(remainingTime))
                timerFrame.targetText:SetText(L["gold-time"]:format(raceGoldTime))
            elseif elapsedTime <= raceSilverTime then
                local remainingTime = -(raceSilverTime - elapsedTime)
                timerFrame.timerText:SetText(L["time"]:format(remainingTime))
                timerFrame.targetText:SetText(L["silver-time"]:format(raceSilverTime))
            else
                timerFrame.timerText:SetText(L["time"]:format(0))
                timerFrame.targetText:SetText(L["bronze-time"])
            end
        end)
    elseif self.options["display-mode"] == 2 then
        if racePersonalTime == -1 then
            SRT.raceTimer = C_Timer.NewTicker(0.05, function()
                local elapsedTime = GetTime() - raceStartTime
                timerFrame.timerText:SetText(L["time"]:format(elapsedTime))
                timerFrame.targetText:SetText(L["personal-best-time-not-available"])
            end)
        elseif racePersonalTime == 0 then
            SRT.raceTimer = C_Timer.NewTicker(0.05, function()
                local elapsedTime = GetTime() - raceStartTime
                timerFrame.timerText:SetText(L["time"]:format(elapsedTime))
                timerFrame.targetText:SetText(L["personal-best-time-no-race"])
            end)
        else
            SRT.raceTimer = C_Timer.NewTicker(0.05, function()
                local elapsedTime = GetTime() - raceStartTime

                if elapsedTime <= racePersonalTime then
                    local remainingTime = -(racePersonalTime - elapsedTime)
                    timerFrame.timerText:SetText(L["time"]:format(remainingTime))
                    timerFrame.targetText:SetText(L["personal-best-time"]:format(racePersonalTime))
                else
                    timerFrame.timerText:SetText(L["time"]:format(0))
                    timerFrame.targetText:SetText(L["personal-best-time-faild"])
                end
            end)
        end
    end

    timerFrame:Show()
end

function SRT:HideRaceTimer()
    local timerFrame = self.timerFrame

    SRT.raceTimer:Cancel()
    C_Timer.After(self.options["fadeout-delay"], function() timerFrame:Hide() end)
end