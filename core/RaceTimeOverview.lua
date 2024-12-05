local _, SRT = ...

local L = SRT.localization
local raceDataTable = SRT.raceDataTable

--------------
--- Frames ---
--------------

local raceTimeOverviewFrame = CreateFrame("Frame", "RaceTimeOverview", GossipFrame, "ButtonFrameTemplate")
raceTimeOverviewFrame:SetPoint("TOPLEFT", GossipFrame, "TOPRIGHT", 15, 0)
raceTimeOverviewFrame:SetSize(325, 250)
raceTimeOverviewFrame:SetTitle("Skyriding Race Tracker")

raceTimeOverviewFrame:Hide()

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

raceTimeOverviewFrame.openButton = CreateFrame("Button", nil, raceTimeOverviewFrame, "UIPanelButtonTemplate")
raceTimeOverviewFrame.openButton:SetPoint("BOTTOM", raceTimeOverviewFrame, "BOTTOMRIGHT", -70, 4)
raceTimeOverviewFrame.openButton:SetSize(130, 21)
raceTimeOverviewFrame.openButton:SetText(L["button-zone-overview"] )

local zoneOverviewFrame = CreateFrame("Frame", "ZoneOverviewFrame", raceTimeOverviewFrame, "SimplePanelTemplate")
zoneOverviewFrame:SetPoint("TOPLEFT", raceTimeOverviewFrame, "TOPRIGHT", 15, 1)
zoneOverviewFrame:SetSize(325, 330)

zoneOverviewFrame:Hide()

zoneOverviewFrame.header = zoneOverviewFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
zoneOverviewFrame.header:SetPoint("TOP", 0, -11)
zoneOverviewFrame.header:SetText("???")

zoneOverviewFrame.scrollFrame = CreateFrame("ScrollFrame", nil, zoneOverviewFrame, "UIPanelScrollFrameTemplate")
zoneOverviewFrame.scrollFrame:SetPoint("TOPLEFT", 10, -30)
zoneOverviewFrame.scrollFrame:SetPoint("BOTTOMRIGHT", -30, 29)
zoneOverviewFrame.scrollFrame:EnableMouseWheel(true)
zoneOverviewFrame.scrollFrame:SetScript("OnMouseWheel", function(self, delta)
    local newValue = math.max(0, math.min(self:GetVerticalScroll() - delta * 20, self:GetVerticalScrollRange()))
    self:SetVerticalScroll(newValue)
end)

zoneOverviewFrame.closeButton = CreateFrame("Button", nil, zoneOverviewFrame, "UIPanelButtonTemplate")
zoneOverviewFrame.closeButton:SetPoint("BOTTOM", zoneOverviewFrame, "BOTTOMRIGHT", -55, 4)
zoneOverviewFrame.closeButton:SetSize(100, 21)
zoneOverviewFrame.closeButton:SetText(L["button-close"] )

zoneOverviewFrame.closeButton:SetScript("OnClick", function()
    zoneOverviewFrame:Hide()
end)

raceTimeOverviewFrame.openButton:SetScript("OnClick", function()
    zoneOverviewFrame:Show()
end)

---------------------
--- Main funtions ---
---------------------

function SRT:ShowRaceTimeOverview(npcID)
    local left = 20
    local hight = -35
    local count = 0

    local zoneID = raceDataTable[npcID][1]
    local questID = raceDataTable[npcID][2].NORMAL[1]

    QuestEventListener:AddCallback(questID, function()
        local name = C_QuestLog.GetTitleForQuestID(questID)
        raceTimeOverviewFrame.name:SetText(name)
    end)

    if raceDataTable[npcID][2].NORMAL ~= nil then
        count = count + 1

        local racePersonalTime = -1
        local raceGoldTime = raceDataTable[npcID][2].NORMAL[3]
        local raceSilverTime = raceDataTable[npcID][2].NORMAL[4]

        if raceDataTable[npcID][2].NORMAL[2] ~= 0 then
            racePersonalTime = C_CurrencyInfo.GetCurrencyInfo(raceDataTable[npcID][2].NORMAL[2]).quantity / 1000
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
            local time

            if racePersonalTime <= raceGoldTime then
                time = "|T616373:0|t |c" .. SRT.COLOR_GOLD_FONT .. racePersonalTime .. "|r"
            elseif racePersonalTime <= raceSilverTime then
                time = "|T616375:0|t |c" .. SRT.COLOR_SILVER_FONT .. racePersonalTime .. "|r"
            else
                time = "|T616372:0|t |c" .. SRT.COLOR_BRONZE_FONT .. racePersonalTime .. "|r"
            end

            raceTimeOverviewFrame.bestTimeNormal:SetText(L["personal-best-time"]:format(time))
        end

        hight = hight - 20
        raceTimeOverviewFrame.goldSilverTimeNormal:SetPoint("TOPLEFT", left, hight)
        raceTimeOverviewFrame.goldSilverTimeNormal:SetText(L["gold-time"]:format(raceGoldTime) .. " - " .. L["silver-time"]:format(raceSilverTime))
    end

    if raceDataTable[npcID][2].ADVANCED ~= nil then
        count = count + 1

        local racePersonalTime = -1
        local raceGoldTime = raceDataTable[npcID][2].ADVANCED[3]
        local raceSilverTime = raceDataTable[npcID][2].ADVANCED[4]

        if raceDataTable[npcID][2].ADVANCED[2] ~= 0 then
            racePersonalTime = C_CurrencyInfo.GetCurrencyInfo(raceDataTable[npcID][2].ADVANCED[2]).quantity / 1000
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
            local time

            if racePersonalTime <= raceGoldTime then
                time = "|T616373:0|t |c" .. SRT.COLOR_GOLD_FONT .. racePersonalTime .. "|r"
            elseif racePersonalTime <= raceSilverTime then
                time = "|T616375:0|t |c" .. SRT.COLOR_SILVER_FONT .. racePersonalTime .. "|r"
            else
                time = "|T616372:0|t |c" .. SRT.COLOR_BRONZE_FONT .. racePersonalTime .. "|r"
            end

            raceTimeOverviewFrame.bestTimeAdvanced:SetText(L["personal-best-time"]:format(time))
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

    if raceDataTable[npcID][2].REVERSE ~= nil then
        count = count + 1

        local racePersonalTime = -1
        local raceGoldTime = raceDataTable[npcID][2].REVERSE[3]
        local raceSilverTime = raceDataTable[npcID][2].REVERSE[4]

        if raceDataTable[npcID][2].REVERSE[2] ~= 0 then
            racePersonalTime = C_CurrencyInfo.GetCurrencyInfo(raceDataTable[npcID][2].REVERSE[2]).quantity / 1000
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
            local time

            if racePersonalTime <= raceGoldTime then
                time = "|T616373:0|t |c" .. SRT.COLOR_GOLD_FONT .. racePersonalTime .. "|r"
            elseif racePersonalTime <= raceSilverTime then
                time = "|T616375:0|t |c" .. SRT.COLOR_SILVER_FONT .. racePersonalTime .. "|r"
            else
                time = "|T616372:0|t |c" .. SRT.COLOR_BRONZE_FONT .. racePersonalTime .. "|r"
            end

            raceTimeOverviewFrame.bestTimeReverse:SetText(L["personal-best-time"]:format(time))
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

    if raceDataTable[npcID][2].CHALLENGE ~= nil then
        count = count + 1

        local racePersonalTime = -1
        local raceGoldTime = raceDataTable[npcID][2].CHALLENGE[3]
        local raceSilverTime = raceDataTable[npcID][2].CHALLENGE[4]

        if raceDataTable[npcID][2].CHALLENGE[2] ~= 0 then
            racePersonalTime = C_CurrencyInfo.GetCurrencyInfo(raceDataTable[npcID][2].CHALLENGE[2]).quantity / 1000
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
            local time

            if racePersonalTime <= raceGoldTime then
                time = "|T616373:0|t |c" .. SRT.COLOR_GOLD_FONT .. racePersonalTime .. "|r"
            elseif racePersonalTime <= raceSilverTime then
                time = "|T616375:0|t |c" .. SRT.COLOR_SILVER_FONT .. racePersonalTime .. "|r"
            else
                time = "|T616372:0|t |c" .. SRT.COLOR_BRONZE_FONT .. racePersonalTime .. "|r"
            end

            raceTimeOverviewFrame.bestTimeChallenge:SetText(L["personal-best-time"]:format(time))
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

    if raceDataTable[npcID][2].CHALLENGE_REVERSE ~= nil then
        count = count + 1

        local racePersonalTime = -1
        local raceGoldTime = raceDataTable[npcID][2].CHALLENGE_REVERSE[3]
        local raceSilverTime = raceDataTable[npcID][2].CHALLENGE_REVERSE[4]

        if raceDataTable[npcID][2].CHALLENGE_REVERSE[2] ~= 0 then
            racePersonalTime = C_CurrencyInfo.GetCurrencyInfo(raceDataTable[npcID][2].CHALLENGE_REVERSE[2]).quantity / 1000
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
            local time

            if racePersonalTime <= raceGoldTime then
                time = "|T616373:0|t |c" .. SRT.COLOR_GOLD_FONT .. racePersonalTime .. "|r"
            elseif racePersonalTime <= raceSilverTime then
                time = "|T616375:0|t |c" .. SRT.COLOR_SILVER_FONT .. racePersonalTime .. "|r"
            else
                time = "|T616372:0|t |c" .. SRT.COLOR_BRONZE_FONT .. racePersonalTime .. "|r"
            end

            raceTimeOverviewFrame.bestTimeChallengeReverse:SetText(L["personal-best-time"]:format(time))
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

    if raceDataTable[npcID][2].STORM_GRYPHON ~= nil then
        count = count + 1

		local racePersonalTime = -1
        local raceGoldTime = raceDataTable[npcID][2].STORM_GRYPHON[3]
        local raceSilverTime = raceDataTable[npcID][2].STORM_GRYPHON[4]

        if raceDataTable[npcID][2].STORM_GRYPHON[2] ~= 0 then
            racePersonalTime = C_CurrencyInfo.GetCurrencyInfo(raceDataTable[npcID][2].STORM_GRYPHON[2]).quantity / 1000
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
            local time

            if racePersonalTime <= raceGoldTime then
                time = "|T616373:0|t |c" .. SRT.COLOR_GOLD_FONT .. racePersonalTime .. "|r"
            elseif racePersonalTime <= raceSilverTime then
                time = "|T616375:0|t |c" .. SRT.COLOR_SILVER_FONT .. racePersonalTime .. "|r"
            else
                time = "|T616372:0|t |c" .. SRT.COLOR_BRONZE_FONT .. racePersonalTime .. "|r"
            end

            raceTimeOverviewFrame.bestTimeStormGryphon:SetText(L["personal-best-time"]:format(time))
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

    local frameHight = 330 + ((count - 3) * 80)

    raceTimeOverviewFrame:SetSize(325, frameHight)
    raceTimeOverviewFrame:Show()

    SRT:ShowZoneRaceTimeOverview(zoneID)
end

function SRT:HideRaceTimeOverview()
    zoneOverviewFrame:Hide()
	raceTimeOverviewFrame:Hide()
end

function SRT:ShowZoneRaceTimeOverview(zoneID)
    zoneOverviewFrame.header:SetText(C_Map.GetMapInfo(zoneID).name)

    if zoneOverviewFrame.scrollFrame:GetScrollChild() ~= nil then
        local oldContent = zoneOverviewFrame.scrollFrame:GetScrollChild()
        oldContent:Hide()
    end

    local content = CreateFrame("Frame", nil, zoneOverviewFrame.scrollFrame)
    content:SetSize(270, 250)
    zoneOverviewFrame.scrollFrame:SetScrollChild(content)

    local hight = -10

    for _, dataWrapper in pairs(raceDataTable) do
        local id, modes = unpack(dataWrapper)
        if id == zoneID then
            local modeOrder = {
                "NORMAL", "ADVANCED", "REVERSE", "CHALLENGE", "CHALLENGE_REVERSE", "STORM_GRYPHON"
            }

            local sortedModes = {}
            for _, mode in ipairs(modeOrder) do
                if modes[mode] then
                    table.insert(sortedModes, mode)
                end
            end

            local questID = modes.NORMAL[1]
            local header = content:CreateFontString(nil, "ARTWORK", "GameFontNormal")
            header:SetPoint("TOPLEFT", 10, hight)
            header:SetWidth(270)
            header:SetJustifyH("LEFT")

            QuestEventListener:AddCallback(questID, function()
                local name = C_QuestLog.GetTitleForQuestID(questID)
                header:SetText(name)
            end)

            hight = hight - 20

            for _, mode in ipairs(sortedModes) do
                local data = modes[mode]

                local time = "-"
                local difficulty
                local racePersonalTime = -1
                local raceGoldTime = data[3]
                local raceSilverTime = data[4]

                if data[2] ~= 0 then
                    racePersonalTime = C_CurrencyInfo.GetCurrencyInfo(data[2]).quantity / 1000
                end

                if mode == "NORMAL" then
                    difficulty = L["race-normal"]
                elseif mode == "ADVANCED" then
                    difficulty = L["race-advanced"]
                elseif mode == "REVERSE" then
                    difficulty = L["race-reverse"]
                elseif mode == "CHALLENGE" then
                    difficulty = L["race-challenge"]
                elseif mode == "CHALLENGE_REVERSE" then
                    difficulty = L["race-challenge-reverse"]
                elseif mode == "STORM_GRYPHON" then
                    difficulty = L["race-storm-gryphon"]
                end

                local text = content:CreateFontString(nil, "ARTWORK", "GameFontWhite")
                text:SetPoint("TOPLEFT", 10, hight)
                text:SetWidth(270)
                text:SetJustifyH("LEFT")

                if racePersonalTime > 0 then
                    if racePersonalTime <= raceGoldTime then
                        time = "|T616373:0|t |c" .. SRT.COLOR_GOLD_FONT .. racePersonalTime .. "|r"
                    elseif racePersonalTime <= raceSilverTime then
                        time = "|T616375:0|t |c" .. SRT.COLOR_SILVER_FONT .. racePersonalTime .. "|r"
                    else
                        time = "|T616372:0|t |c" .. SRT.COLOR_BRONZE_FONT .. racePersonalTime .. "|r"
                    end

                    text:SetText(difficulty .. ": " .. time .. " " .. L['seconds-short'])
                else
                    text:SetText(difficulty .. ": " .. time)
                end

                hight = hight - 15
            end

            hight = hight - 15
        end
    end

    content:SetSize(270, (hight * -1) - 10)
    content:Show()
end