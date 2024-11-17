local _, SRT = ...

SRT.raceTimer = {}
SRT.raceDisplayFrame = {}

local L = SRT.localization
local raceDataTable = SRT.raceDataTable

local raceQuestID = -1
local raceGoldTime = -1
local raceSilverTime = -1
local racePersonalTime = -1

local isRaceActive = false

----------------------
--- Local funtions ---
----------------------

local function CheckRaceAura()
	for i = 1, 40 do
        local aura = C_UnitAuras.GetAuraDataByIndex("player", i)
        if aura == nil then
            break
        end

        if aura.spellId == 369968 then
            return true
        end
    end

    return false
end

local function CheckRaceNPC(npcID)
    local t = raceDataTable[npcID]

    if t == nil then
        return false
    else
        return true
    end
end

local function CheckRaceQuest(questID)
    for _, modes in pairs(raceDataTable) do
        for mode, data in pairs(modes) do
            if data[1] == questID then
                return true
            end
        end
    end

    return false
end

function GetRaceData(questID)
    for _, modes in pairs(raceDataTable) do
        for mode, data in pairs(modes) do
            if data[1] == questID then
                return {
                    mode = mode,
                    questID = data[1],
                    raceTime = data[2],
                    goldTime = data[3],
                    silverTime = data[4]
                }
            end
        end
    end

    return nil
end

--------------
--- Frames ---
--------------

local skyridingRaceTimerFrame = CreateFrame("Frame", "SkyridingRaceTimer")

local raceTimeOverviewFrame = CreateFrame("Frame", "TimeDisplay", GossipFrame, "BasicFrameTemplate")
raceTimeOverviewFrame:SetPoint("TOPLEFT", GossipFrame, "TOPRIGHT", 15, 0)

raceTimeOverviewFrame.title = raceTimeOverviewFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
raceTimeOverviewFrame.title:ClearAllPoints()
raceTimeOverviewFrame.title:SetPoint("TOP", 0, -5)
raceTimeOverviewFrame.title:SetText("Skyriding Race Timer")

raceTimeOverviewFrame.name = raceTimeOverviewFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
raceTimeOverviewFrame.name:ClearAllPoints()
raceTimeOverviewFrame.name:SetPoint("TOP", 0, -40)

raceTimeOverviewFrame.modeNormal = raceTimeOverviewFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
raceTimeOverviewFrame.modeNormal:ClearAllPoints()
raceTimeOverviewFrame.modeAdvanced = raceTimeOverviewFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
raceTimeOverviewFrame.modeAdvanced:ClearAllPoints()
raceTimeOverviewFrame.modeReverse = raceTimeOverviewFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
raceTimeOverviewFrame.modeReverse:ClearAllPoints()
raceTimeOverviewFrame.modeChallenge = raceTimeOverviewFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
raceTimeOverviewFrame.modeChallenge:ClearAllPoints()
raceTimeOverviewFrame.modeChallengeReverse = raceTimeOverviewFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
raceTimeOverviewFrame.modeChallengeReverse:ClearAllPoints()
raceTimeOverviewFrame.modeStormGryphon = raceTimeOverviewFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
raceTimeOverviewFrame.modeStormGryphon:ClearAllPoints()

raceTimeOverviewFrame.bestTimeNormal = raceTimeOverviewFrame:CreateFontString(nil, "ARTWORK", "GameFontWhite")
raceTimeOverviewFrame.bestTimeNormal:ClearAllPoints()
raceTimeOverviewFrame.bestTimeAdvanced = raceTimeOverviewFrame:CreateFontString(nil, "ARTWORK", "GameFontWhite")
raceTimeOverviewFrame.bestTimeAdvanced:ClearAllPoints()
raceTimeOverviewFrame.bestTimeReverse = raceTimeOverviewFrame:CreateFontString(nil, "ARTWORK", "GameFontWhite")
raceTimeOverviewFrame.bestTimeReverse:ClearAllPoints()
raceTimeOverviewFrame.bestTimeChallenge = raceTimeOverviewFrame:CreateFontString(nil, "ARTWORK", "GameFontWhite")
raceTimeOverviewFrame.bestTimeChallenge:ClearAllPoints()
raceTimeOverviewFrame.bestTimeChallengeReverse = raceTimeOverviewFrame:CreateFontString(nil, "ARTWORK", "GameFontWhite")
raceTimeOverviewFrame.bestTimeChallengeReverse:ClearAllPoints()
raceTimeOverviewFrame.bestTimeStormGryphon = raceTimeOverviewFrame:CreateFontString(nil, "ARTWORK", "GameFontWhite")
raceTimeOverviewFrame.bestTimeStormGryphon:ClearAllPoints()

raceTimeOverviewFrame.goldSilverTimeNormal = raceTimeOverviewFrame:CreateFontString(nil, "ARTWORK", "GameFontWhite")
raceTimeOverviewFrame.goldSilverTimeNormal:ClearAllPoints()
raceTimeOverviewFrame.goldSilverTimeAdvanced = raceTimeOverviewFrame:CreateFontString(nil, "ARTWORK", "GameFontWhite")
raceTimeOverviewFrame.goldSilverTimeAdvanced:ClearAllPoints()
raceTimeOverviewFrame.goldSilverTimeReverse = raceTimeOverviewFrame:CreateFontString(nil, "ARTWORK", "GameFontWhite")
raceTimeOverviewFrame.goldSilverTimeReverse:ClearAllPoints()
raceTimeOverviewFrame.goldSilverTimeChallenge = raceTimeOverviewFrame:CreateFontString(nil, "ARTWORK", "GameFontWhite")
raceTimeOverviewFrame.goldSilverTimeChallenge:ClearAllPoints()
raceTimeOverviewFrame.goldSilverTimeChallengeReverse = raceTimeOverviewFrame:CreateFontString(nil, "ARTWORK", "GameFontWhite")
raceTimeOverviewFrame.goldSilverTimeChallengeReverse:ClearAllPoints()
raceTimeOverviewFrame.goldSilverTimeStormGryphon = raceTimeOverviewFrame:CreateFontString(nil, "ARTWORK", "GameFontWhite")
raceTimeOverviewFrame.goldSilverTimeStormGryphon:ClearAllPoints()

---------------------
--- Main funtions ---
---------------------

function skyridingRaceTimerFrame:OnEvent(event, ...)
	self[event](self, event, ...)
end

function skyridingRaceTimerFrame:ADDON_LOADED(_, addOnName)
    if addOnName == "SkyridingRaceTimer" then
        raceTimeOverviewFrame:Hide()

        SRT:LoadOptions()
        SRT:PrintDebug("Addon fully loaded.")
    end
end

function skyridingRaceTimerFrame:UNIT_AURA(_, unitTarget, updateInfo)
    if unitTarget == "player" then
        if SRT.options["display"] and CheckRaceAura() then
            if not isRaceActive then
                isRaceActive = true
                SRT:StartRaceTimer(raceQuestID, GetTime(), raceGoldTime, raceSilverTime, racePersonalTime)
            end
        else
            if isRaceActive then
                isRaceActive = false
                SRT:HideRaceTimer()
            end
        end
    end
end

function skyridingRaceTimerFrame:QUEST_ACCEPTED(_, questID)
    local result = GetRaceData(questID)

    if result ~= nil then
        SRT:PrintDebug("Event 'QUEST_ACCEPTED' fired. Payload: " .. C_QuestLog.GetTitleForQuestID(questID) .. " (" .. questID ..")")

        if SRT.options["display"] then
            raceQuestID = result.questID
            raceGoldTime = result.goldTime
            raceSilverTime = result.silverTime

            if result.raceTime ~= 0 then
                racePersonalTime = C_CurrencyInfo.GetCurrencyInfo(result.raceTime).quantity / 1000
            end

            SRT:ShowRaceTimer(raceQuestID, raceGoldTime, racePersonalTime)
        else
            SRT:PrintDebug("No race display requested.")
        end
    end
end

function skyridingRaceTimerFrame:QUEST_REMOVED(_, questID, wasReplayQuest)
    if CheckRaceQuest(questID) then
        SRT:PrintDebug("Event 'QUEST_REMOVED' fired. Payload: " .. C_QuestLog.GetTitleForQuestID(questID) .. " (" .. questID ..")")
        raceQuestID = -1
        raceGoldTime = -1
        raceSilverTime = -1
        racePersonalTime = -1
    end
end

GossipFrame:HookScript("OnShow",function()
    if UnitExists("target") and SRT.options["overview"] then
		local npcID = select(6, strsplit("-", tostring(UnitGUID("target"))))
        npcID = tonumber(npcID)

        SRT:PrintDebug("npcID: " .. npcID)

        if CheckRaceNPC(npcID) then
            local hight = -25
            local count = 0

            local name = C_QuestLog.GetTitleForQuestID(raceDataTable[npcID].NORMAL[1])
            raceTimeOverviewFrame.name:SetText(name)

            if raceDataTable[npcID].NORMAL ~= nil then
                count = count + 1

                local racePersonalTime = -1
                local raceGoldTime = raceDataTable[npcID].NORMAL[3]
                local raceSilverTime = raceDataTable[npcID].NORMAL[4]

                if raceDataTable[npcID].NORMAL[2] ~= 0 then
                    racePersonalTime = C_CurrencyInfo.GetCurrencyInfo(raceDataTable[npcID].NORMAL[2]).quantity / 1000
                end

                hight = hight - 40
                raceTimeOverviewFrame.modeNormal:SetPoint("TOPLEFT", 10, hight)
                raceTimeOverviewFrame.modeNormal:SetText(L["race-normal"])

                hight = hight - 20
                raceTimeOverviewFrame.bestTimeNormal:SetPoint("TOPLEFT", 10, hight)

                if racePersonalTime == -1 then
                    raceTimeOverviewFrame.bestTimeNormal:SetText(L["personal-best-time-not-available"])
                elseif racePersonalTime == 0 then
                    raceTimeOverviewFrame.bestTimeNormal:SetText(L["personal-best-time-no-race"])
                else
                    raceTimeOverviewFrame.bestTimeNormal:SetText(L["personal-best-time"]:format(racePersonalTime))
                end

                hight = hight - 20
                raceTimeOverviewFrame.goldSilverTimeNormal:SetPoint("TOPLEFT", 10, hight)
                raceTimeOverviewFrame.goldSilverTimeNormal:SetText(L["gold-time"]:format(raceGoldTime) .. " - " .. L["silver-time"]:format(raceSilverTime))
            end

            if raceDataTable[npcID].ADVANCED ~= nil then
                count = count + 1

                local racePersonalTime = -1
                local raceGoldTime = raceDataTable[npcID].ADVANCED[3]
                local raceSilverTime = raceDataTable[npcID].ADVANCED[4]

                if raceDataTable[npcID].ADVANCED[2] ~= 0 then
                    racePersonalTime = C_CurrencyInfo.GetCurrencyInfo(raceDataTable[npcID].ADVANCED[2]).quantity / 1000
                end

                hight = hight - 40
                raceTimeOverviewFrame.modeAdvanced:SetPoint("TOPLEFT", 10, hight)
                raceTimeOverviewFrame.modeAdvanced:SetText(L["race-advanced"])

                hight = hight - 20
                raceTimeOverviewFrame.bestTimeAdvanced:SetPoint("TOPLEFT", 10, hight)

                if racePersonalTime == -1 then
                    raceTimeOverviewFrame.bestTimeAdvanced:SetText(L["personal-best-time-not-available"])
                elseif racePersonalTime == 0 then
                    raceTimeOverviewFrame.bestTimeAdvanced:SetText(L["personal-best-time-no-race"])
                else
                    raceTimeOverviewFrame.bestTimeAdvanced:SetText(L["personal-best-time"]:format(racePersonalTime))
                end

                hight = hight - 20
                raceTimeOverviewFrame.goldSilverTimeAdvanced:SetPoint("TOPLEFT", 10, hight)
                raceTimeOverviewFrame.goldSilverTimeAdvanced:SetText(L["gold-time"]:format(raceGoldTime) .. " - " .. L["silver-time"]:format(raceSilverTime))

                raceTimeOverviewFrame.modeAdvanced:Show()
                raceTimeOverviewFrame.bestTimeAdvanced:Show()
                raceTimeOverviewFrame.goldSilverTimeAdvanced:Show()
            else
                raceTimeOverviewFrame.modeAdvanced:Hide()
                raceTimeOverviewFrame.bestTimeAdvanced:Hide()
                raceTimeOverviewFrame.goldSilverTimeAdvanced:Hide()
            end

            if raceDataTable[npcID].REVERSE ~= nil then
                count = count + 1

                local racePersonalTime = -1
                local raceGoldTime = raceDataTable[npcID].REVERSE[3]
                local raceSilverTime = raceDataTable[npcID].REVERSE[4]

                if raceDataTable[npcID].REVERSE[2] ~= 0 then
                    racePersonalTime = C_CurrencyInfo.GetCurrencyInfo(raceDataTable[npcID].REVERSE[2]).quantity / 1000
                end

                hight = hight - 40
                raceTimeOverviewFrame.modeReverse:SetPoint("TOPLEFT", 10, hight)
                raceTimeOverviewFrame.modeReverse:SetText(L["race-reverse"])

                hight = hight - 20
                raceTimeOverviewFrame.bestTimeReverse:SetPoint("TOPLEFT", 10, hight)

                if racePersonalTime == -1 then
                    raceTimeOverviewFrame.bestTimeReverse:SetText(L["personal-best-time-not-available"])
                elseif racePersonalTime == 0 then
                    raceTimeOverviewFrame.bestTimeReverse:SetText(L["personal-best-time-no-race"])
                else
                    raceTimeOverviewFrame.bestTimeReverse:SetText(L["personal-best-time"]:format(racePersonalTime))
                end

                hight = hight - 20
                raceTimeOverviewFrame.goldSilverTimeReverse:SetPoint("TOPLEFT", 10, hight)
                raceTimeOverviewFrame.goldSilverTimeReverse:SetText(L["gold-time"]:format(raceGoldTime) .. " - " .. L["silver-time"]:format(raceSilverTime))

                raceTimeOverviewFrame.modeReverse:Show()
                raceTimeOverviewFrame.bestTimeReverse:Show()
                raceTimeOverviewFrame.goldSilverTimeReverse:Show()
            else
                raceTimeOverviewFrame.modeReverse:Hide()
                raceTimeOverviewFrame.bestTimeReverse:Hide()
                raceTimeOverviewFrame.goldSilverTimeReverse:Hide()
            end

            if raceDataTable[npcID].CHALLENGE ~= nil then
                count = count + 1

                local racePersonalTime = -1
                local raceGoldTime = raceDataTable[npcID].CHALLENGE[3]
                local raceSilverTime = raceDataTable[npcID].CHALLENGE[4]

                if raceDataTable[npcID].CHALLENGE[2] ~= 0 then
                    racePersonalTime = C_CurrencyInfo.GetCurrencyInfo(raceDataTable[npcID].CHALLENGE[2]).quantity / 1000
                end

                hight = hight - 40
                raceTimeOverviewFrame.modeChallenge:SetPoint("TOPLEFT", 10, hight)
                raceTimeOverviewFrame.modeChallenge:SetText(L["race-challenge"])

                hight = hight - 20
                raceTimeOverviewFrame.bestTimeChallenge:SetPoint("TOPLEFT", 10, hight)

                if racePersonalTime == -1 then
                    raceTimeOverviewFrame.bestTimeChallenge:SetText(L["personal-best-time-not-available"])
                elseif racePersonalTime == 0 then
                    raceTimeOverviewFrame.bestTimeChallenge:SetText(L["personal-best-time-no-race"])
                else
                    raceTimeOverviewFrame.bestTimeChallenge:SetText(L["personal-best-time"]:format(racePersonalTime))
                end

                hight = hight - 20
                raceTimeOverviewFrame.goldSilverTimeChallenge:SetPoint("TOPLEFT", 10, hight)
                raceTimeOverviewFrame.goldSilverTimeChallenge:SetText(L["gold-time"]:format(raceGoldTime) .. " - " .. L["silver-time"]:format(raceSilverTime))

                raceTimeOverviewFrame.modeChallenge:Show()
                raceTimeOverviewFrame.bestTimeChallenge:Show()
                raceTimeOverviewFrame.goldSilverTimeChallenge:Show()
            else
                raceTimeOverviewFrame.modeChallenge:Hide()
                raceTimeOverviewFrame.bestTimeChallenge:Hide()
                raceTimeOverviewFrame.goldSilverTimeChallenge:Hide()
            end

            if raceDataTable[npcID].CHALLENGE_REVERSE ~= nil then
                count = count + 1

                local racePersonalTime = -1
                local raceGoldTime = raceDataTable[npcID].CHALLENGE_REVERSE[3]
                local raceSilverTime = raceDataTable[npcID].CHALLENGE_REVERSE[4]

                if raceDataTable[npcID].CHALLENGE_REVERSE[2] ~= 0 then
                    racePersonalTime = C_CurrencyInfo.GetCurrencyInfo(raceDataTable[npcID].CHALLENGE_REVERSE[2]).quantity / 1000
                end

                hight = hight - 40
                raceTimeOverviewFrame.modeChallengeReverse:SetPoint("TOPLEFT", 10, hight)
                raceTimeOverviewFrame.modeChallengeReverse:SetText(L["race-challenge-reverse"])

                hight = hight - 20
                raceTimeOverviewFrame.bestTimeChallengeReverse:SetPoint("TOPLEFT", 10, hight)

                if racePersonalTime == -1 then
                    raceTimeOverviewFrame.bestTimeChallengeReverse:SetText(L["personal-best-time-not-available"])
                elseif racePersonalTime == 0 then
                    raceTimeOverviewFrame.bestTimeChallengeReverse:SetText(L["personal-best-time-no-race"])
                else
                    raceTimeOverviewFrame.bestTimeChallengeReverse:SetText(L["personal-best-time"]:format(racePersonalTime))
                end

                hight = hight - 20
                raceTimeOverviewFrame.goldSilverTimeChallengeReverse:SetPoint("TOPLEFT", 10, hight)
                raceTimeOverviewFrame.goldSilverTimeChallengeReverse:SetText(L["gold-time"]:format(raceGoldTime) .. " - " .. L["silver-time"]:format(raceSilverTime))
                
                raceTimeOverviewFrame.modeChallengeReverse:Show()
                raceTimeOverviewFrame.bestTimeChallengeReverse:Show()
                raceTimeOverviewFrame.goldSilverTimeChallengeReverse:Show()
            else
                raceTimeOverviewFrame.modeChallengeReverse:Hide()
                raceTimeOverviewFrame.bestTimeChallengeReverse:Hide()
                raceTimeOverviewFrame.goldSilverTimeChallengeReverse:Hide()
            end

            if raceDataTable[npcID].STORM_GRYPHON ~= nil then
                count = count + 1

                local racePersonalTime = -1
                local raceGoldTime = raceDataTable[npcID].STORM_GRYPHON[3]
                local raceSilverTime = raceDataTable[npcID].STORM_GRYPHON[4]

                if raceDataTable[npcID].STORM_GRYPHON[2] ~= 0 then
                    racePersonalTime = C_CurrencyInfo.GetCurrencyInfo(raceDataTable[npcID].STORM_GRYPHON[2]).quantity / 1000
                end

                hight = hight - 40
                raceTimeOverviewFrame.modeStormGryphon:SetPoint("TOPLEFT", 10, hight)
                raceTimeOverviewFrame.modeStormGryphon:SetText(L["race-storm-gryphon"])

                hight = hight - 20
                raceTimeOverviewFrame.bestTimeStormGryphon:SetPoint("TOPLEFT", 10, hight)

                if racePersonalTime == -1 then
                    raceTimeOverviewFrame.bestTimeStormGryphon:SetText(L["personal-best-time-not-available"])
                elseif racePersonalTime == 0 then
                    raceTimeOverviewFrame.bestTimeStormGryphon:SetText(L["personal-best-time-no-race"])
                else
                    raceTimeOverviewFrame.bestTimeStormGryphon:SetText(L["personal-best-time"]:format(racePersonalTime))
                end

                hight = hight - 20
                raceTimeOverviewFrame.goldSilverTimeStormGryphon:SetPoint("TOPLEFT", 10, hight)
                raceTimeOverviewFrame.goldSilverTimeStormGryphon:SetText(L["gold-time"]:format(raceGoldTime) .. " - " .. L["silver-time"]:format(raceSilverTime))

                raceTimeOverviewFrame.modeStormGryphon:Show()
                raceTimeOverviewFrame.bestTimeStormGryphon:Show()
                raceTimeOverviewFrame.goldSilverTimeStormGryphon:Show()
            else
                raceTimeOverviewFrame.modeStormGryphon:Hide()
                raceTimeOverviewFrame.bestTimeStormGryphon:Hide()
                raceTimeOverviewFrame.goldSilverTimeStormGryphon:Hide()
            end

            local frameHight = 220 + ((count - 2) * 80)

            raceTimeOverviewFrame:SetSize(325, frameHight)
            raceTimeOverviewFrame:Show()
        end
    end
end)

GossipFrame:HookScript("OnHide",function()
    raceTimeOverviewFrame.name:SetText("")
	raceTimeOverviewFrame:Hide()
end)

skyridingRaceTimerFrame:RegisterEvent("ADDON_LOADED")
skyridingRaceTimerFrame:RegisterEvent("UNIT_AURA")
skyridingRaceTimerFrame:RegisterEvent("QUEST_ACCEPTED")
skyridingRaceTimerFrame:RegisterEvent("QUEST_REMOVED")
skyridingRaceTimerFrame:SetScript("OnEvent", skyridingRaceTimerFrame.OnEvent)
