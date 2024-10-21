local _, SRT = ...

local L = SRT.localization
local questList = SRT.data.questList
local raceTimes = SRT.data.raceTimes

local raceStartTime = nil
local isRaceActive = false
local timerFrame

local raceTimer
local raceSpellId = 369968

local targetQuestID = 0
local tagetGoldTime = 0
local tagetSilverTime = 0

local function ShowRaceTime()
    timerFrame = CreateFrame("Frame", nil, UIParent)
    timerFrame:SetSize(200, 50)
    timerFrame:SetPoint("CENTER", 0, 200)

    local timerText = timerFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    timerText:SetPoint("CENTER", 0, 10)
    timerFrame.timerText = timerText

    local targetText = timerFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    targetText:SetPoint("CENTER", 0, -10)
    timerFrame.targetText = targetText

    timerFrame.timerText:SetText(L["time"] .. ": 0.0 " .. L["seconds"])
    timerFrame.targetText:SetText(C_QuestLog.GetTitleForQuestID(targetQuestID))
    timerFrame:Show()
end

local function StartRaceTime()
    raceTimer = C_Timer.NewTicker(0.05, function()
        local elapsedTime = GetTime() - raceStartTime
        timerFrame.timerText:SetText(string.format(L["time"] .. ": %.1f " .. L["seconds"], elapsedTime))

        if targetQuestID == 0 then
            timerFrame.targetText:SetText(L["no-time"])
        else
            if elapsedTime <= tagetGoldTime then
                timerFrame.targetText:SetText(L["gold-time"]:format(tagetGoldTime))
            elseif elapsedTime <= tagetSilverTime then
                timerFrame.targetText:SetText(L["silver-time"]:format(tagetSilverTime))
            else
                timerFrame.targetText:SetText(L["bronze-time"])
            end
        end
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

local function isQuest (questID)
	for index, value in ipairs(questList) do
		if value == questID then
			return true
		end
	end
	return false
end

local function OnEvent(self, event, ...)
    if event == "UNIT_AURA" then
        local unit = ...

        if unit == "player" then
            if CheckRaceAura() then
                if not isRaceActive then
                    raceStartTime = GetTime()
                    isRaceActive = true
                    StartRaceTime()
                end
            else
                if isRaceActive then
                    isRaceActive = false
                    HideRaceTime()
                end
            end
        end
    elseif event == "QUEST_ACCEPTED" then
        local questID = ...

        if isQuest(questID) then
            targetQuestID = questID
            tagetGoldTime = raceTimes[targetQuestID][1]
            tagetSilverTime = raceTimes[targetQuestID][2]
            ShowRaceTime()
        end
    elseif event == "QUEST_REMOVED" then
        local questID = ...

        if isQuest(questID) then
            targetQuestID = 0
            tagetGoldTime = 0
            tagetSilverTime = 0
        end
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("UNIT_AURA")
frame:RegisterEvent("QUEST_ACCEPTED")
frame:RegisterEvent("QUEST_REMOVED")
frame:SetScript("OnEvent", OnEvent)
