local _, SRT = ...

local L = SRT.localization

local raceTracker

local count
local finalTicker = nil

--------------
--- Frames ---
--------------

local raceTrackerFrame = CreateFrame("Frame", "RaceTracker", UIParent)
raceTrackerFrame:SetSize(256, 64)

raceTrackerFrame.background = raceTrackerFrame:CreateTexture(nil, "BACKGROUND")
raceTrackerFrame.background:ClearAllPoints()
raceTrackerFrame.background:SetAllPoints(raceTrackerFrame)
raceTrackerFrame.background:SetTexture(SRT.MEDIA_PATH .. "raceTrackerBackground-01.blp")

raceTrackerFrame.timer = raceTrackerFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
raceTrackerFrame.timer:ClearAllPoints()
raceTrackerFrame.timer:SetPoint("CENTER", 0, 10)

raceTrackerFrame.info = raceTrackerFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
raceTrackerFrame.info:ClearAllPoints()
raceTrackerFrame.info:SetPoint("CENTER", 0, -10)

raceTrackerFrame:Hide()

----------------------
--- Local funtions ---
----------------------

local function StopFinalTicker()
    local status, err = pcall(function ()
        if finalTicker and not finalTicker:IsCancelled() then
            finalTicker:Cancel()
            finalTicker = nil
        end
    end)

    if not status then
        SRT:PrintDebug("Method StopFinalTicker() aborted with exception: " .. err)
    end
end

local function LoadRaceTrackerFrame(self)
    raceTrackerFrame:SetPoint("CENTER", self.options["race-tracker-horizontal-shift"], self.options["race-tracker-vertical-shift"])
    raceTrackerFrame:SetSize(256, 64)

    if self.options["race-tracker-background"] then
        if self.options["race-tracker-background-type"] == 0 then
            raceTrackerFrame.background:SetTexture(SRT.MEDIA_PATH .. "raceTrackerBackground-01.blp")
        elseif self.options["race-tracker-background-type"] == 1 then
            raceTrackerFrame.background:SetTexture(SRT.MEDIA_PATH .. "raceTrackerBackground-02.blp")
        end

        raceTrackerFrame.background:Show()
    else
        raceTrackerFrame.background:Hide()
    end

    StopFinalTicker()
end

local function ShowRaceTracker(self, raceQuestID, raceGoldTime, racePersonalTime)
    LoadRaceTrackerFrame(self)

    raceTrackerFrame.timer:SetText(C_QuestLog.GetTitleForQuestID(raceQuestID))

    if self.options["race-tracker-background-type"] == 1 then
        local width = raceTrackerFrame.timer:GetWidth()

        if width > 240 then
            raceTrackerFrame:SetSize(width + 26, 64)
        end
    end

    if self.options["race-tracker-mode"] == 0 then
        raceTrackerFrame.info:SetText(L["gold-time"]:format(raceGoldTime))
    elseif self.options["race-tracker-mode"] == 1 then
        raceTrackerFrame.info:SetText(L["gold-time"]:format(raceGoldTime))
    elseif self.options["race-tracker-mode"] == 2 then
        if racePersonalTime == -1 then
            raceTrackerFrame.info:SetText(L["personal-best-time-not-available"])
        elseif racePersonalTime == 0 then
            raceTrackerFrame.info:SetText(L["personal-best-time-no-race"])
        else
            raceTrackerFrame.info:SetText(L["personal-best-time"]:format(racePersonalTime))
        end
    end

    C_Timer.After(5, function()
        if self.options["race-tracker-mode"] == 0 or (self.options["race-tracker-mode"] == 2 and racePersonalTime <= 0) then
            raceTrackerFrame.timer:SetText(string.format(L["time"], 0))
        elseif self.options["race-tracker-mode"] == 1 then
            raceTrackerFrame.timer:SetText(L["time"]:format(-raceGoldTime))
        elseif self.options["race-tracker-mode"] == 2 then
            raceTrackerFrame.timer:SetText(L["time"]:format(-racePersonalTime))
        end

        raceTrackerFrame:SetSize(256, 64)
    end)

    raceTrackerFrame:Show()
end

---------------------
--- Main funtions ---
---------------------

function SRT:StartRaceTracker(raceQuestID, raceSpellID, raceGoldTime, raceSilverTime, racePersonalTime)
    local isFirstTry = true
    local isInit = false
    local raceStartTime = -1

    local isCountdown = false
    local isRace = false

    ShowRaceTracker(self, raceQuestID, raceGoldTime, racePersonalTime)

    local function foo(_, _, _, _, _, _, _, _, _, spellId, ...)
        if spellId == 369968 then
            isRace = true
        elseif spellId == raceSpellID then
            isCountdown = true
        end
    end

    raceTracker = C_Timer.NewTicker(0.05, function()
        isCountdown = false
        isRace = false

        AuraUtil.ForEachAura("player", "HELPFUL", nil, foo)

        if isCountdown and not isFirstTry and not isInit then
            isInit = true
            raceStartTime = -1

            if self.options["race-tracker-mode"] == 0 or (self.options["race-tracker-mode"] == 2 and racePersonalTime <= 0) then
                raceTrackerFrame.timer:SetText(string.format(L["time"], 0))
            elseif self.options["race-tracker-mode"] == 1 then
                raceTrackerFrame.timer:SetText(L["time"]:format(-raceGoldTime))
            elseif self.options["race-tracker-mode"] == 2 then
                raceTrackerFrame.timer:SetText(L["time"]:format(-racePersonalTime))
            end

            SRT:PrintDebug("The race was interrupted.")
        elseif isRace and not isCountdown then
            if raceStartTime == -1 then
                isInit = false
                raceStartTime = GetTime()

                if isFirstTry then
                    isFirstTry = false
                else
                    SRT:PrintDebug("The race was restarted.")
                end
            end

            local elapsedTime = GetTime() - raceStartTime

            if self.options["race-tracker-mode"] == 0 then
                raceTrackerFrame.timer:SetText(L["time"]:format(elapsedTime))

                if elapsedTime <= raceGoldTime then
                    raceTrackerFrame.info:SetText(L["gold-time"]:format(raceGoldTime))
                elseif elapsedTime <= raceSilverTime then
                    raceTrackerFrame.info:SetText(L["silver-time"]:format(raceSilverTime))
                else
                    raceTrackerFrame.info:SetText(L["bronze-time"])
                end
            elseif self.options["race-tracker-mode"] == 1 then
                if elapsedTime <= raceGoldTime then
                    local remainingTime = -(raceGoldTime - elapsedTime)
                    raceTrackerFrame.timer:SetText(L["time"]:format(remainingTime))
                    raceTrackerFrame.info:SetText(L["gold-time"]:format(raceGoldTime))
                elseif elapsedTime <= raceSilverTime then
                    local remainingTime = -(raceSilverTime - elapsedTime)
                    raceTrackerFrame.timer:SetText(L["time"]:format(remainingTime))
                    raceTrackerFrame.info:SetText(L["silver-time"]:format(raceSilverTime))
                else
                    raceTrackerFrame.timer:SetText(L["time"]:format(0))
                    raceTrackerFrame.info:SetText(L["bronze-time"])
                end
            elseif self.options["race-tracker-mode"] == 2 then
                if racePersonalTime == -1 then
                    raceTrackerFrame.timer:SetText(L["time"]:format(elapsedTime))
                    raceTrackerFrame.info:SetText(L["personal-best-time-not-available"])
                elseif racePersonalTime == 0 then
                    raceTrackerFrame.timer:SetText(L["time"]:format(elapsedTime))
                    raceTrackerFrame.info:SetText(L["personal-best-time-no-race"])
                else
                    if elapsedTime <= racePersonalTime then
                        local remainingTime = -(racePersonalTime - elapsedTime)
                        raceTrackerFrame.timer:SetText(L["time"]:format(remainingTime))
                        raceTrackerFrame.info:SetText(L["personal-best-time"]:format(racePersonalTime))
                    else
                        raceTrackerFrame.timer:SetText(L["time"]:format(0))
                        raceTrackerFrame.info:SetText(L["personal-best-time-faild"])
                    end
                end
            end
        end
    end)
end

function SRT:StopRaceTracker()
    count = 1
    raceTracker:Cancel()

    finalTicker = C_Timer.NewTicker(1, function()
        if count >= self.options["race-tracker-fadeout-delay"] then
            raceTrackerFrame:Hide()
            StopFinalTicker()
        else
            count = count + 1
        end
    end)
end