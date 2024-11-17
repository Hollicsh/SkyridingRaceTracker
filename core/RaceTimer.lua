local _, SRT = ...

local L = SRT.localization

local function LoadRaceDisplayFrame(self)
    local frame = CreateFrame("Frame", "RaceDisplay", UIParent)
    frame:SetSize(256, 64)
    frame:SetPoint("CENTER", self.options["display-horizontal-shift"], self.options["display-vertical-shift"])

    frame:Hide()

    if self.options["display-background"] then
        frame.background = frame:CreateTexture(nil, "BACKGROUND")
        frame.background:ClearAllPoints()
        frame.background:SetAllPoints(frame)
        frame.background:SetTexture(SRT.MEDIA_PATH .. "raceTrackerBackground.blp")
    end

    frame.timerText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    frame.timerText:ClearAllPoints()
    frame.timerText:SetPoint("CENTER", 0, 10)

    frame.targetText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.targetText:ClearAllPoints()
    frame.targetText:SetPoint("CENTER", 0, -10)

    return frame
end

function SRT:ShowRaceTimer(raceQuestID, raceGoldTime, racePersonalTime)
    local size = 0
    for _ in pairs(self.raceDisplayFrame) do size = size + 1 end

    if size > 0 then
        self.raceDisplayFrame:Hide()
    end

    self.raceDisplayFrame = LoadRaceDisplayFrame(self)
    local frame = self.raceDisplayFrame
    frame.timerText:SetText(C_QuestLog.GetTitleForQuestID(raceQuestID))

    if self.options["display-mode"] == 0 then
        frame.targetText:SetText(L["gold-time"]:format(raceGoldTime))
    elseif self.options["display-mode"] == 1 then
        frame.targetText:SetText(L["gold-time"]:format(raceGoldTime))
    elseif self.options["display-mode"] == 2 then
        if racePersonalTime == -1 then
            frame.targetText:SetText(L["personal-best-time-not-available"])
        elseif racePersonalTime == 0 then
            frame.targetText:SetText(L["personal-best-time-no-race"])
        else
            frame.targetText:SetText(L["personal-best-time"]:format(racePersonalTime))
        end
    end

    C_Timer.After(5, function()
        if (self.options["display-mode"] == 0 and racePersonalTime == -1) or (self.options["display-mode"] == 2 and racePersonalTime <= 0) then
            frame.timerText:SetText(string.format(L["time"], 0))
        elseif self.options["display-mode"] == 1 then
            frame.timerText:SetText(L["time"]:format(-raceGoldTime))
        elseif self.options["display-mode"] == 2 then
            frame.timerText:SetText(L["time"]:format(-racePersonalTime))
        end
    end)

    frame:Show()
end

function SRT:StartRaceTimer(raceQuestID, raceStartTime, raceGoldTime, raceSilverTime, racePersonalTime)
    if raceQuestID == -1 then
        self.raceDisplayFrame = LoadRaceDisplayFrame(self)
    end

    local frame = self.raceDisplayFrame

    if raceQuestID == -1 then
        SRT.raceTimer = C_Timer.NewTicker(0.05, function()
            local elapsedTime = GetTime() - raceStartTime
            frame.timerText:SetText(L["time"]:format(elapsedTime))
            frame.targetText:SetText(L["no-time"])
        end)
    elseif self.options["display-mode"] == 0 then
        SRT.raceTimer = C_Timer.NewTicker(0.05, function()
            local elapsedTime = GetTime() - raceStartTime
            frame.timerText:SetText(L["time"]:format(elapsedTime))

            if elapsedTime <= raceGoldTime then
                frame.targetText:SetText(L["gold-time"]:format(raceGoldTime))
            elseif elapsedTime <= raceSilverTime then
                frame.targetText:SetText(L["silver-time"]:format(raceSilverTime))
            else
                frame.targetText:SetText(L["bronze-time"])
            end
        end)
    elseif self.options["display-mode"] == 1 then
        SRT.raceTimer = C_Timer.NewTicker(0.05, function()
            local elapsedTime = GetTime() - raceStartTime

            if elapsedTime <= raceGoldTime then
                local remainingTime = -(raceGoldTime - elapsedTime)
                frame.timerText:SetText(L["time"]:format(remainingTime))
                frame.targetText:SetText(L["gold-time"]:format(raceGoldTime))
            elseif elapsedTime <= raceSilverTime then
                local remainingTime = -(raceSilverTime - elapsedTime)
                frame.timerText:SetText(L["time"]:format(remainingTime))
                frame.targetText:SetText(L["silver-time"]:format(raceSilverTime))
            else
                frame.timerText:SetText(L["time"]:format(0))
                frame.targetText:SetText(L["bronze-time"])
            end
        end)
    elseif self.options["display-mode"] == 2 then
        if racePersonalTime == -1 then
            SRT.raceTimer = C_Timer.NewTicker(0.05, function()
                local elapsedTime = GetTime() - raceStartTime
                frame.timerText:SetText(L["time"]:format(elapsedTime))
                frame.targetText:SetText(L["personal-best-time-not-available"])
            end)
        elseif racePersonalTime == 0 then
            SRT.raceTimer = C_Timer.NewTicker(0.05, function()
                local elapsedTime = GetTime() - raceStartTime
                frame.timerText:SetText(L["time"]:format(elapsedTime))
                frame.targetText:SetText(L["personal-best-time-no-race"])
            end)
        else
            SRT.raceTimer = C_Timer.NewTicker(0.05, function()
                local elapsedTime = GetTime() - raceStartTime

                if elapsedTime <= racePersonalTime then
                    local remainingTime = -(racePersonalTime - elapsedTime)
                    frame.timerText:SetText(L["time"]:format(remainingTime))
                    frame.targetText:SetText(L["personal-best-time"]:format(racePersonalTime))
                else
                    frame.timerText:SetText(L["time"]:format(0))
                    frame.targetText:SetText(L["personal-best-time-faild"])
                end
            end)
        end
    end

    frame:Show()
end

function SRT:HideRaceTimer()
    local frame = self.raceDisplayFrame

    self.raceTimer:Cancel()
    C_Timer.After(self.options["fadeout-delay"], function() frame:Hide() end)
end