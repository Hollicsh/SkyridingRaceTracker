local _, SRT = ...

local L = SRT.localization
local raceDataTable = SRT.raceDataTable

--------------
--- Frames ---
--------------

local raceTimeOverviewFrame = CreateFrame("Frame", "RaceTimeOverview", GossipFrame, "ButtonFrameTemplate")
raceTimeOverviewFrame:SetPoint("TOPLEFT", GossipFrame, "TOPRIGHT", 15, 0)
raceTimeOverviewFrame:SetTitle("Skyriding Race Tracker")

raceTimeOverviewFrame.portrait = raceTimeOverviewFrame:GetPortrait()
raceTimeOverviewFrame.portrait:SetPoint('TOPLEFT', -5, 8)
raceTimeOverviewFrame.portrait:SetTexture(SRT.MEDIA_PATH .. "iconRound.blp")

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

raceTimeOverviewFrame:Hide()

---------------------
--- Main funtions ---
---------------------

function SRT:ShowRaceTimeOverview(npcID)
    local left = 20
    local hight = -35
    local count = 0

    local questID = raceDataTable[npcID].NORMAL[1]

    QuestEventListener:AddCallback(questID, function()
        local name = C_QuestLog.GetTitleForQuestID(questID)
        raceTimeOverviewFrame.name:SetText(name)
    end)

    if raceDataTable[npcID].NORMAL ~= nil then
        count = count + 1

        local racePersonalTime = -1
        local raceGoldTime = raceDataTable[npcID].NORMAL[3]
        local raceSilverTime = raceDataTable[npcID].NORMAL[4]

        if raceDataTable[npcID].NORMAL[2] ~= 0 then
            racePersonalTime = C_CurrencyInfo.GetCurrencyInfo(raceDataTable[npcID].NORMAL[2]).quantity / 1000
        end

        hight = hight - 40
        raceTimeOverviewFrame.modeNormal:SetPoint("TOPLEFT", left, hight)
        raceTimeOverviewFrame.modeNormal:SetText(L["race-normal"])

        hight = hight - 20
        raceTimeOverviewFrame.bestTimeNormal:SetPoint("TOPLEFT", left, hight)

        if racePersonalTime == -1 then
            raceTimeOverviewFrame.bestTimeNormal:SetText(L["personal-best-time-not-available"])
        elseif racePersonalTime == 0 then
            raceTimeOverviewFrame.bestTimeNormal:SetText(L["personal-best-time-no-race"])
        else
            raceTimeOverviewFrame.bestTimeNormal:SetText(L["personal-best-time"]:format(racePersonalTime))
        end

        hight = hight - 20
        raceTimeOverviewFrame.goldSilverTimeNormal:SetPoint("TOPLEFT", left, hight)
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
        raceTimeOverviewFrame.modeAdvanced:SetPoint("TOPLEFT", left, hight)
        raceTimeOverviewFrame.modeAdvanced:SetText(L["race-advanced"])

        hight = hight - 20
        raceTimeOverviewFrame.bestTimeAdvanced:SetPoint("TOPLEFT", left, hight)

        if racePersonalTime == -1 then
            raceTimeOverviewFrame.bestTimeAdvanced:SetText(L["personal-best-time-not-available"])
        elseif racePersonalTime == 0 then
            raceTimeOverviewFrame.bestTimeAdvanced:SetText(L["personal-best-time-no-race"])
        else
            raceTimeOverviewFrame.bestTimeAdvanced:SetText(L["personal-best-time"]:format(racePersonalTime))
        end

        hight = hight - 20
        raceTimeOverviewFrame.goldSilverTimeAdvanced:SetPoint("TOPLEFT", left, hight)
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
        raceTimeOverviewFrame.modeReverse:SetPoint("TOPLEFT", left, hight)
        raceTimeOverviewFrame.modeReverse:SetText(L["race-reverse"])

        hight = hight - 20
        raceTimeOverviewFrame.bestTimeReverse:SetPoint("TOPLEFT", left, hight)

        if racePersonalTime == -1 then
            raceTimeOverviewFrame.bestTimeReverse:SetText(L["personal-best-time-not-available"])
        elseif racePersonalTime == 0 then
            raceTimeOverviewFrame.bestTimeReverse:SetText(L["personal-best-time-no-race"])
        else
            raceTimeOverviewFrame.bestTimeReverse:SetText(L["personal-best-time"]:format(racePersonalTime))
        end

        hight = hight - 20
        raceTimeOverviewFrame.goldSilverTimeReverse:SetPoint("TOPLEFT", left, hight)
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
        raceTimeOverviewFrame.modeChallenge:SetPoint("TOPLEFT", left, hight)
        raceTimeOverviewFrame.modeChallenge:SetText(L["race-challenge"])

        hight = hight - 20
        raceTimeOverviewFrame.bestTimeChallenge:SetPoint("TOPLEFT", left, hight)

        if racePersonalTime == -1 then
            raceTimeOverviewFrame.bestTimeChallenge:SetText(L["personal-best-time-not-available"])
        elseif racePersonalTime == 0 then
            raceTimeOverviewFrame.bestTimeChallenge:SetText(L["personal-best-time-no-race"])
        else
            raceTimeOverviewFrame.bestTimeChallenge:SetText(L["personal-best-time"]:format(racePersonalTime))
        end

        hight = hight - 20
        raceTimeOverviewFrame.goldSilverTimeChallenge:SetPoint("TOPLEFT", left, hight)
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
        raceTimeOverviewFrame.modeChallengeReverse:SetPoint("TOPLEFT", left, hight)
        raceTimeOverviewFrame.modeChallengeReverse:SetText(L["race-challenge-reverse"])

        hight = hight - 20
        raceTimeOverviewFrame.bestTimeChallengeReverse:SetPoint("TOPLEFT", left, hight)

        if racePersonalTime == -1 then
            raceTimeOverviewFrame.bestTimeChallengeReverse:SetText(L["personal-best-time-not-available"])
        elseif racePersonalTime == 0 then
            raceTimeOverviewFrame.bestTimeChallengeReverse:SetText(L["personal-best-time-no-race"])
        else
            raceTimeOverviewFrame.bestTimeChallengeReverse:SetText(L["personal-best-time"]:format(racePersonalTime))
        end

        hight = hight - 20
        raceTimeOverviewFrame.goldSilverTimeChallengeReverse:SetPoint("TOPLEFT", left, hight)
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
        raceTimeOverviewFrame.modeStormGryphon:SetPoint("TOPLEFT", left, hight)
        raceTimeOverviewFrame.modeStormGryphon:SetText(L["race-storm-gryphon"])

        hight = hight - 20
        raceTimeOverviewFrame.bestTimeStormGryphon:SetPoint("TOPLEFT", left, hight)

        if racePersonalTime == -1 then
            raceTimeOverviewFrame.bestTimeStormGryphon:SetText(L["personal-best-time-not-available"])
        elseif racePersonalTime == 0 then
            raceTimeOverviewFrame.bestTimeStormGryphon:SetText(L["personal-best-time-no-race"])
        else
            raceTimeOverviewFrame.bestTimeStormGryphon:SetText(L["personal-best-time"]:format(racePersonalTime))
        end

        hight = hight - 20
        raceTimeOverviewFrame.goldSilverTimeStormGryphon:SetPoint("TOPLEFT", left, hight)
        raceTimeOverviewFrame.goldSilverTimeStormGryphon:SetText(L["gold-time"]:format(raceGoldTime) .. " - " .. L["silver-time"]:format(raceSilverTime))

        raceTimeOverviewFrame.modeStormGryphon:Show()
        raceTimeOverviewFrame.bestTimeStormGryphon:Show()
        raceTimeOverviewFrame.goldSilverTimeStormGryphon:Show()
    else
        raceTimeOverviewFrame.modeStormGryphon:Hide()
        raceTimeOverviewFrame.bestTimeStormGryphon:Hide()
        raceTimeOverviewFrame.goldSilverTimeStormGryphon:Hide()
    end

    local frameHight = 250 + ((count - 2) * 80)

    raceTimeOverviewFrame:SetSize(325, frameHight)
    raceTimeOverviewFrame:Show()
end

function SRT:HideRaceTimeOverview()
	raceTimeOverviewFrame:Hide()
end
