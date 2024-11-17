local addonName, SRT = ...

SRT.raceTimer = {}
SRT.timerFrame = {}

SRT.MEDIA_PATH = "Interface\\AddOns\\" .. addonName .. "\\media\\"

local L = SRT.localization
local raceTimeTable = SRT.data.raceTimeTable

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

local function CheckRaceQuest(questID)
    local t = raceTimeTable[questID]

    if t == nil then
        return false
    else
        return true
    end
end

---------------------
--- Main funtions ---
---------------------

local frame = CreateFrame("Frame")

function frame:OnEvent(event, ...)
	self[event](self, event, ...)
end

function frame:ADDON_LOADED(_, addOnName)
    if addOnName == "SkyridingRaceTimer" then
        SRT:LoadOptions()
        SRT:PrintDebug("Addon fully loaded.")
    end
end

function frame:UNIT_AURA(_, unitTarget, updateInfo)
    if unitTarget == "player" then
        if CheckRaceAura() then
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

function frame:QUEST_ACCEPTED(_, questID)
    if CheckRaceQuest(questID) then
        SRT:PrintDebug("Race quest found for 'QUEST_ACCEPTED': " .. C_QuestLog.GetTitleForQuestID(questID) .. " (" .. questID ..")")

        raceQuestID = questID
        raceGoldTime = raceTimeTable[raceQuestID][2]
        raceSilverTime = raceTimeTable[raceQuestID][3]

        if raceTimeTable[raceQuestID][1] ~= 0 then
            racePersonalTime = C_CurrencyInfo.GetCurrencyInfo(raceTimeTable[raceQuestID][1]).quantity / 1000
        end

        SRT:ShowRaceTimer(raceQuestID, raceGoldTime, racePersonalTime)
    end
end

function frame:QUEST_REMOVED(_, questID, wasReplayQuest)
    if CheckRaceQuest(questID) then
        SRT:PrintDebug("Race quest found for 'QUEST_REMOVED': " .. C_QuestLog.GetTitleForQuestID(questID) .. " (" .. questID ..")")
        raceQuestID = -1
        raceGoldTime = -1
        raceSilverTime = -1
        racePersonalTime = -1
    end
end

frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("UNIT_AURA")
frame:RegisterEvent("QUEST_ACCEPTED")
frame:RegisterEvent("QUEST_REMOVED")
frame:SetScript("OnEvent", frame.OnEvent)
